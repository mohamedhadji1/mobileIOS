import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:carrier_info/carrier_info.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:grpc/grpc.dart' show GrpcError, StatusCode;

import '../utils/error_logger.dart';
import 'device_key_service.dart';
import 'device_identity_service.dart';
import 'enrollment_service.dart';
import 'cypurge_grpc_service.dart';
import 'notification_service.dart';

/// Outcome of one ingest attempt.
///
/// The distinction that matters is [rejected] vs [retryable]: a batch the
/// server refused on its merits will be refused again byte-for-byte, so
/// buffering it only fills storage and stalls every later flush behind it.
enum _SendResult { ok, retryable, rejected }

/// Service responsible for gathering continuous device telemetry in the background.
/// Aligned with specifications US-016-1, US-016-2, and US-016-3.
///
/// All telemetry values are read from REAL device hardware/radios:
///   - network type + online state  -> connectivity_plus
///   - airplane mode                 -> platform channel (Android: Settings.Global,
///                                      iOS: CoreTelephony radio-off heuristic)
///   - WiFi SSID/BSSID/IP            -> network_info_plus (needs location perm + services ON)
///   - SIM carrier / generation      -> carrier_info (needs READ_PHONE_STATE)
///   - GPS                           -> geolocator
///   - motion                        -> sensors_plus
class BackgroundSignalService {
  static final BackgroundSignalService _instance =
      BackgroundSignalService._internal();
  factory BackgroundSignalService() => _instance;
  BackgroundSignalService._internal();

  final _storage = const FlutterSecureStorage();
  final _deviceInfo = DeviceInfoPlugin();
  final _networkInfo = NetworkInfo();

  /// Native channel for facts Flutter plugins don't expose (airplane mode).
  static const _deviceChannel = MethodChannel('com.cypurge.app/device');

  /// Mirrors the server's telemetry replay window (worker service
  /// `telemetryFreshnessWindow`, ±5 min): IngestTelemetry rejects any batch
  /// whose signed timestamp falls outside it. That timestamp is covered by the
  /// ECDSA signature, so a buffered batch can never be refreshed — re-signing
  /// with a new time would falsify when the telemetry was captured. Batches
  /// older than this are therefore unsendable and dropped instead of retried.
  static const _telemetryFreshness = Duration(minutes: 5);

  /// Signed capture time of a buffered batch, or null when absent/malformed
  /// (treated as unsendable).
  static int? _payloadTimestamp(dynamic item) {
    final ts = (item['payload'] as Map?)?['timestamp'];
    return ts is num ? ts.toInt() : null;
  }

  /// True when the batch's signed timestamp is still inside the server's
  /// freshness window and the send is therefore worth attempting.
  static bool isSendable(dynamic item, int nowMs) {
    final ts = _payloadTimestamp(item);
    if (ts == null) return false;
    return (nowMs - ts).abs() < _telemetryFreshness.inMilliseconds;
  }

  /// Foreground realtime monitor subscription (connectivity changes).
  StreamSubscription<ConnectivityResult>? _connSub;

  /// Keep-alive background location stream. Its only job is to hold the app
  /// process alive — Android foreground service, iOS background location — so
  /// the connectivity listener + accelerometer keep working while the app is
  /// backgrounded. We ignore the positions themselves.
  StreamSubscription<Position>? _locSub;

  /// Gathers real device metrics, signs the batch, and sends to the ingest gateway.
  Future<bool> collectAndSendTelemetry() async {
    try {
      debugPrint('📡 Background Signal Service: Commencing telemetry gathering...');

      final payload = await _collectRealTelemetry();
      debugPrint('📦 Compiled SignalBatch Payload: ${jsonEncode(payload)}');

      final signature = await DeviceKeyService().signCanonicalHex(payload);
      debugPrint('🔑 Cryptographic Signature Generated: $signature');

      // Only transmit for an enrolled worker.
      final workerId = await _storage.read(key: 'worker_id');
      if (workerId == null) {
        debugPrint('⚠️ Telemetry Blocked: Worker is not currently enrolled.');
        return false;
      }

      // Detect security-relevant state changes vs the last known snapshot and
      // raise priority alerts (SIM swap, airplane toggle, WiFi switch/drop).
      await _detectAndReportChanges(payload, workerId);

      debugPrint('🚀 Transmitting telemetry signature batch for Worker ID: $workerId...');

      switch (await _sendPayloadToServer(payload, signature, workerId)) {
        case _SendResult.ok:
          debugPrint('✅ Ingest Service Response: SignalBatch accepted.');
          await _flushBuffer(workerId);
          await _flushSecurityEvents(workerId);
          return true;
        case _SendResult.rejected:
          // Not a transport problem — the identical bytes will be refused
          // again, so buffering would grow storage without ever draining.
          debugPrint('🚫 SignalBatch refused by the server — not buffering.');
          return false;
        case _SendResult.retryable:
          debugPrint('⚠️ Network issue or transmission failed. Buffering telemetry offline...');
          await _bufferOffline(payload, signature);
          return false;
      }
    } catch (e, stack) {
      ErrorLogger.log('Background Signal Ingestion Process', e, stack);
      debugPrint('❌ Telemetry task failed: $e.');
      return false;
    }
  }

  // ------------------------------------------------------------------
  // Realtime foreground monitoring
  // ------------------------------------------------------------------

  /// Starts an instant foreground listener: any connectivity transition
  /// (WiFi switch, WiFi drop, airplane toggle) triggers an immediate collect
  /// + change-detection cycle instead of waiting for the 15-min poll.
  /// Background SIM-swap/airplane while the app is killed is still bounded by
  /// the WorkManager interval unless a native foreground service is added.
  void startRealtimeMonitoring() {
    // Runtime perms must be granted in the foreground — SSID/GPS need location,
    // SIM/carrier needs phone. WorkManager isolate cannot prompt for these.
    unawaited(_ensureRuntimePermissions());
    _connSub ??= Connectivity().onConnectivityChanged.listen((_) {
      debugPrint('📶 Connectivity transition detected — collecting telemetry now.');
      // Fire-and-forget; collect path already detects + reports changes.
      unawaited(collectAndSendTelemetry());
    });
    // Native radio/SIM change push (iOS CoreTelephony notifier). Catches a SIM
    // swap between polls even on WiFi, where connectivity never blips. No-op on
    // platforms that never invoke it.
    _deviceChannel.setMethodCallHandler((call) async {
      if (call.method == 'onRadioChanged') {
        debugPrint('📶 Native radio/SIM change — collecting telemetry now.');
        unawaited(collectAndSendTelemetry());
      }
      return null;
    });
    _startKeepAliveLocationStream();
  }

  /// How far the worker must move before the position stream emits and a
  /// telemetry batch is triggered. Movement below this is left to the periodic
  /// poll.
  ///
  /// ponytail: paired with [LocationAccuracy.medium] deliberately. A distance
  /// filter at or below the fix's own error margin fires on noise, and
  /// `LocationAccuracy.low` is roughly this coarse on Android — so lowering
  /// this threshold without also raising the accuracy just burns battery on
  /// phantom moves. Raise both together, or neither.
  static const _gpsTriggerDistanceMeters = 500.0;

  /// Floor between two GPS-triggered collections. The distance filter alone is
  /// not enough: at 100 km/h a worker crosses 500 m every ~18 s, which would be
  /// roughly 200 batches an hour.
  static const _gpsTriggerCooldown = Duration(minutes: 2);

  /// Last GPS-triggered collection, for the cooldown above. Seeded when the
  /// stream starts so the stream's initial emission — which reports the current
  /// position rather than a move — does not duplicate the launch collection
  /// main.dart already fires.
  DateTime? _lastGpsTriggerAt;

  /// Holds the app process alive in the background so the connectivity listener
  /// fires on WiFi change/cut and the accelerometer read succeeds even after the
  /// app is backgrounded. Android promotes the stream to a foreground service;
  /// iOS keeps background location updates running.
  ///
  /// It also carries movement detection: GPS is not part of the radio
  /// fingerprint [_detectAndReportChanges] diffs, so travel raises no security
  /// event, and without this a worker's position would only ever be sampled at
  /// the 15-min / 1-h poll — leaving the backend's impossible-travel check
  /// (`velocity_flag`) that coarse.
  ///
  /// Ceiling: iOS force-quit (user swipes the app away) still suspends this —
  /// Apple only relaunches for significant-location / region events, not
  /// continuous updates. Backgrounded (not force-quit) is fully covered.
  void _startKeepAliveLocationStream() {
    if (_locSub != null) return;
    late final LocationSettings settings;
    if (defaultTargetPlatform == TargetPlatform.android) {
      settings = AndroidSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: _gpsTriggerDistanceMeters.round(),
        foregroundNotificationConfig: const ForegroundNotificationConfig(
          notificationTitle: 'Security monitoring active',
          notificationText: 'Tridoma is verifying your device signals.',
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      settings = AppleSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: _gpsTriggerDistanceMeters.round(),
        allowBackgroundLocationUpdates: true,
        showBackgroundLocationIndicator: true,
        pauseLocationUpdatesAutomatically: false,
      );
    } else {
      settings = LocationSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: _gpsTriggerDistanceMeters.round(),
      );
    }
    try {
      _lastGpsTriggerAt = DateTime.now();
      _locSub = Geolocator.getPositionStream(locationSettings: settings).listen(
        _onSignificantMove,
        onError: (e) => debugPrint('⚠️ keep-alive location stream error: $e'),
      );
    } catch (e) {
      debugPrint('⚠️ Failed to start keep-alive location stream: $e');
    }
  }

  /// The stream only emits once the worker has moved
  /// [_gpsTriggerDistanceMeters], so the event itself IS the movement signal.
  /// The position is discarded: `collectAndSendTelemetry` takes its own fix, and
  /// only a fix inside the signed payload is worth anything to the backend.
  void _onSignificantMove(Position _) {
    final now = DateTime.now();
    if (!shouldTriggerOnMove(_lastGpsTriggerAt, now)) return;
    _lastGpsTriggerAt = now;
    debugPrint('📍 Moved ≥${_gpsTriggerDistanceMeters.round()}m — '
        'collecting telemetry now.');
    unawaited(collectAndSendTelemetry());
  }

  /// True when a movement event is far enough past [lastTriggerAt] to be worth
  /// a collection. Null means nothing has fired yet, which always passes.
  static bool shouldTriggerOnMove(DateTime? lastTriggerAt, DateTime now) =>
      lastTriggerAt == null ||
      now.difference(lastTriggerAt) >= _gpsTriggerCooldown;

  void stopRealtimeMonitoring() {
    _connSub?.cancel();
    _connSub = null;
    _locSub?.cancel();
    _locSub = null;
  }

  // Bounce-to-settings happens at most once per app session so a denied user
  // isn't thrown into Settings on every telemetry cycle.
  static bool _settingsBounced = false;

  /// Forces the dangerous permissions telemetry depends on to "Always" on both
  /// Android and iOS. Safe to call repeatedly — granted perms are no-ops. The
  /// OS forbids silent/auto grants, so on a hard deny we drive the user to the
  /// app's settings page (the strongest "force" an app is permitted).
  /// ponytail: OS ceiling — can't auto-grant; settings redirect is the cap.
  Future<void> _ensureRuntimePermissions() async {
    try {
      // GPS radio must be ON, else GPS + Wi-Fi SSID resolve to null/0.
      if (!await Geolocator.isLocationServiceEnabled()) {
        await Geolocator.openLocationSettings();
      }

      var needsSettings = false;

      // Foreground location (Wi-Fi SSID + GPS) and phone state first.
      var loc = await Permission.locationWhenInUse.status;
      if (!loc.isGranted) {
        loc = await Permission.locationWhenInUse.request();
        if (loc.isPermanentlyDenied || loc.isDenied) needsSettings = true;
      }
      if (!await Permission.phone.isGranted) {
        final ph = await Permission.phone.request();
        if (ph.isPermanentlyDenied) needsSettings = true;
      }

      // Background ("Always") location — only after whenInUse is granted
      // (Android rejects ACCESS_BACKGROUND_LOCATION otherwise). On Android 11+
      // and iOS the "Allow all the time" option is reachable ONLY via app
      // settings, so a non-granted result forces the settings bounce. Required
      // so the 15-min WorkManager poll reads GPS + SSID while the app is killed.
      if (await Permission.locationWhenInUse.isGranted &&
          !await Permission.locationAlways.isGranted) {
        final always = await Permission.locationAlways.request();
        if (!always.isGranted) needsSettings = true;
      }

      // Exempt from Doze/battery optimization so the poll isn't throttled.
      if (!await Permission.ignoreBatteryOptimizations.isGranted) {
        await Permission.ignoreBatteryOptimizations.request();
      }

      // Drive the user to enable what they denied — once per session.
      if (needsSettings && !_settingsBounced) {
        _settingsBounced = true;
        await openAppSettings();
      }
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: permission request failed ($e)');
    }
  }

  // ------------------------------------------------------------------
  // Change detection + secure event reporting
  // ------------------------------------------------------------------

  /// Radio-state subset that defines a "security-relevant" fingerprint.
  /// sim_state is the only SIM field that survives iOS 16+ (carrier identity is
  /// dummied out by Apple), so it carries SIM-swap detection there: a physical
  /// swap toggles present<->absent. On Android all SIM fields are real.
  Map<String, String?> _fingerprint(Map<String, dynamic> p) => {
        'network_type': p['network_type']?.toString(),
        'is_airplane_mode': p['is_airplane_mode']?.toString(),
        'wifi_ssid': p['wifi_ssid']?.toString(),
        'wifi_bssid': p['wifi_bssid']?.toString(),
        'sim_carrier_name': p['sim_carrier_name']?.toString(),
        'sim_mcc': p['sim_mcc']?.toString(),
        'sim_mnc': p['sim_mnc']?.toString(),
        'sim_state': p['sim_state']?.toString(),
      };

  String _severityFor(String field, String? from, String? to) {
    switch (field) {
      case 'sim_carrier_name':
      case 'sim_mcc':
      case 'sim_mnc':
        return 'CRITICAL'; // SIM swap (carrier identity changed)
      case 'sim_state':
        // present<->absent transition = SIM physically manipulated. Ignore
        // transitions through UNKNOWN/null (transient at boot) to cut noise.
        if (from == 'UNKNOWN' || to == 'UNKNOWN' || from == null || to == null) {
          return 'INFO';
        }
        return 'CRITICAL';
      case 'is_airplane_mode':
        return to == 'true' ? 'HIGH' : 'INFO'; // going dark
      case 'network_type':
        return to == 'none' ? 'HIGH' : 'MEDIUM'; // connection cut vs switch
      case 'wifi_ssid':
      case 'wifi_bssid':
        return 'MEDIUM'; // network switch
      default:
        return 'INFO';
    }
  }

  /// Compares the current fingerprint to the last stored one and, on any
  /// security-relevant change, sends a signed security event (priority).
  Future<void> _detectAndReportChanges(
      Map<String, dynamic> payload, String workerId) async {
    final current = _fingerprint(payload);

    final lastStr = await _storage.read(key: 'last_telemetry_snapshot');
    if (lastStr == null) {
      // First run: establish a baseline, no alerts.
      await _storage.write(
          key: 'last_telemetry_snapshot', value: jsonEncode(current));
      return;
    }

    final previous = Map<String, String?>.from(jsonDecode(lastStr) as Map);
    final changes = <Map<String, dynamic>>[];
    for (final field in current.keys) {
      final from = previous[field];
      final to = current[field];
      if (from != to) {
        changes.add({
          'field': field,
          'from': from,
          'to': to,
          'severity': _severityFor(field, from, to),
        });
      }
    }

    // Persist new baseline regardless of delivery outcome.
    await _storage.write(
        key: 'last_telemetry_snapshot', value: jsonEncode(current));

    if (changes.isEmpty) return;
    debugPrint('🚨 Security-relevant state change(s): ${jsonEncode(changes)}');

    _notifyWorker(changes);

    final event = {
      'worker_id': workerId,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'changes': changes,
      'device_model': payload['device_model'],
      'os_version': payload['os_version'],
      'gps_latitude': payload['gps_latitude'],
      'gps_longitude': payload['gps_longitude'],
    };
    final signature = await DeviceKeyService().signCanonicalHex(event);
    final ok = await _sendSecurityEvent(event, signature, workerId);
    if (!ok) {
      await _bufferSecurityEvent(event, signature);
    }
  }

  /// Warns the worker in-app about the detected change. No-op when the UI is
  /// not up (WorkManager isolate / killed app) — backend reporting still runs.
  void _notifyWorker(List<Map<String, dynamic>> changes) {
    const labels = {
      'is_airplane_mode': 'Airplane mode changed',
      'network_type': 'Network connection changed',
      'wifi_ssid': 'WiFi network changed',
      'wifi_bssid': 'WiFi network changed',
      'sim_carrier_name': 'SIM / carrier changed',
      'sim_mcc': 'SIM / carrier changed',
      'sim_mnc': 'SIM / carrier changed',
    };
    final messages = changes
        .map((c) => labels[c['field']])
        .whereType<String>()
        .toSet();
    if (messages.isEmpty) return;
    NotificationService().showSecurityAlert(
      'Security notice',
      '${messages.join(' · ')}. This event was reported for review.',
    );
  }

  /// Send a security event via gRPC WorkerService.RaiseTelemetrySecurityEvent.
  /// Backend persists to `device_signal_batches` + opens a RISK_ALERT case.
  Future<bool> _sendSecurityEvent(
      Map<String, dynamic> event, String signature, String workerId) async {
    try {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) return false;

      final deviceId = await DeviceIdentityService().getDeviceId();
      final token = await EnrollmentService().getValidAccessToken() ??
          await _storage.read(key: 'access_token') ??
          '';
      final grpc = CypurgeGrpcService()..init(useGateway: true);
      final ok = await grpc.raiseSecurityEvent(
        token: token,
        workerId: workerId,
        deviceId: deviceId,
        signature: signature,
        event: event,
      );
      if (ok) debugPrint('✅ Security event delivered.');
      return ok;
    } catch (e) {
      debugPrint('⚠️ Security event send failed: $e');
      return false;
    }
  }

  Future<void> _bufferSecurityEvent(
      Map<String, dynamic> event, String signature) async {
    try {
      final bufferStr = await _storage.read(key: 'offline_security_events');
      List<dynamic> buffer = [];
      if (bufferStr != null && bufferStr.isNotEmpty) {
        buffer = jsonDecode(bufferStr);
      }
      buffer.add({
        'event': event,
        'signature': signature,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });
      final cutoff = DateTime.now()
          .subtract(const Duration(hours: 24))
          .millisecondsSinceEpoch;
      buffer.removeWhere((item) => (item['timestamp'] as num) < cutoff);
      await _storage.write(
          key: 'offline_security_events', value: jsonEncode(buffer));
      debugPrint('💾 Security event buffered. Size: ${buffer.length}');
    } catch (e) {
      debugPrint('⚠️ Error buffering security event: $e');
    }
  }

  Future<void> _flushSecurityEvents(String workerId) async {
    try {
      final bufferStr = await _storage.read(key: 'offline_security_events');
      if (bufferStr == null || bufferStr.isEmpty) return;
      final List<dynamic> buffer = jsonDecode(bufferStr);
      if (buffer.isEmpty) return;

      final cutoff = DateTime.now()
          .subtract(const Duration(hours: 24))
          .millisecondsSinceEpoch;
      buffer.removeWhere((item) => (item['timestamp'] as num) < cutoff);

      final remaining = <dynamic>[];
      var stop = false;
      for (final item in buffer) {
        if (stop) {
          remaining.add(item);
          continue;
        }
        final event = Map<String, dynamic>.from(item['event']);
        final signature = item['signature'] as String;
        final ok = await _sendSecurityEvent(event, signature, workerId);
        if (!ok) {
          remaining.add(item);
          stop = true;
        }
      }

      if (remaining.isEmpty) {
        await _storage.delete(key: 'offline_security_events');
      } else {
        await _storage.write(
            key: 'offline_security_events', value: jsonEncode(remaining));
      }
    } catch (e) {
      debugPrint('⚠️ Error flushing security events: $e');
    }
  }

  /// Reads every telemetry field from real device sources. Each source is
  /// guarded independently so one denied permission never blocks the batch.
  Future<Map<String, dynamic>> _collectRealTelemetry() async {
    // 1. Device metadata
    String model = 'Unknown';
    String osVersion = 'Unknown';
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final info = await _deviceInfo.androidInfo;
        model = info.model;
        osVersion = 'Android ${info.version.release}';
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        final info = await _deviceInfo.iosInfo;
        model = info.utsname.machine;
        osVersion = 'iOS ${info.systemVersion}';
      }
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: device info read failed ($e)');
    }

    // 2. Network type + online state (real)
    String networkType = 'none';
    bool isOnline = false;
    try {
      final result = await Connectivity().checkConnectivity();
      networkType = _mapConnectivity(result);
      isOnline = result != ConnectivityResult.none;
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: connectivity check failed ($e)');
    }

    // 3. Airplane mode. Android: real Settings.Global read. iOS: CoreTelephony
    // heuristic (SIM present + cellular radio off) — Apple has no public API.
    // Other platforms throw MissingPluginException -> caught -> false.
    bool isAirplaneMode = false;
    try {
      isAirplaneMode =
          await _deviceChannel.invokeMethod<bool>('isAirplaneModeOn') ?? false;
      // Cellular data active means radios are on — overrides any heuristic
      // false positive (e.g. iOS reporting radio-off while attaching).
      if (networkType == 'mobile') isAirplaneMode = false;
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: airplane-mode read failed ($e)');
    }

    // 4. WiFi details (real) — only meaningful on WiFi; SSID needs location.
    String? wifiSsid;
    String? wifiBssid;
    String? wifiIp;
    if (networkType == 'wifi') {
      try {
        wifiSsid = _stripQuotes(await _networkInfo.getWifiName());
        wifiBssid = _normalizeBssid(await _networkInfo.getWifiBSSID());
        wifiIp = await _networkInfo.getWifiIP();
      } catch (e) {
        debugPrint('⚠️ Telemetry Warning: WiFi info read failed ($e)');
      }
    }

    // 5. SIM / carrier (real) — only meaningful when a SIM/cellular radio exists.
    String? simCarrier;
    String? simMcc;
    String? simMnc;
    String? mobileGeneration;
    String? simState;
    try {
      final sim = await _readCarrier();
      simCarrier = sim['carrier'];
      simMcc = sim['mcc'];
      simMnc = sim['mnc'];
      mobileGeneration = sim['generation'];
      simState = sim['simState'];
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: SIM/carrier read failed ($e)');
    }

    // 6. GPS (real)
    double lat = 0.0;
    double lon = 0.0;
    double accuracy = 0.0;
    try {
      final permission = await Geolocator.checkPermission();
      final granted = permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always;
      final serviceOn = await Geolocator.isLocationServiceEnabled();
      if (granted && serviceOn) {
        Position? pos;
        // Try a fresh fix (medium accuracy + longer window — low/5s often
        // times out indoors and returned nothing). Fall back to the last
        // known fix on ANY failure, not just timeout, so we still send a
        // coordinate instead of N/A.
        try {
          pos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.medium,
            timeLimit: const Duration(seconds: 12),
          );
        } on Exception {
          pos = await Geolocator.getLastKnownPosition();
        }
        pos ??= await Geolocator.getLastKnownPosition();
        if (pos != null) {
          lat = pos.latitude;
          lon = pos.longitude;
          accuracy = pos.accuracy;
        } else {
          debugPrint('⚠️ Telemetry Warning: GPS granted+on but no fix yet');
        }
      } else {
        debugPrint('⚠️ Telemetry Warning: GPS skipped '
            '(granted=$granted serviceOn=$serviceOn)');
      }
    } on Exception catch (e) {
      debugPrint('⚠️ Telemetry Warning: location read failed ($e)');
    }

    // 7. Motion (real)
    double accelX = 0.0, accelY = 0.0, accelZ = 0.0;
    try {
      final accel = await accelerometerEventStream()
          .first
          .timeout(const Duration(seconds: 1));
      accelX = accel.x;
      accelY = accel.y;
      accelZ = accel.z;
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: accelerometer read timed out ($e)');
    }

    // Numbers go through canonicalTelemetryNumber so this map serialises
    // byte-identically to the backend's Go json.Marshal of the same values —
    // see that function for the three ways the two languages disagree.
    // Strings are "" and never null, which is what the proto sends.
    return {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'device_model': model,
      'os_version': osVersion,
      'network_type': networkType,
      'is_online': isOnline,
      'is_airplane_mode': isAirplaneMode,
      'wifi_ssid': wifiSsid ?? '',
      'wifi_bssid': wifiBssid ?? '',
      'wifi_ip': wifiIp ?? '',
      'sim_carrier_name': simCarrier ?? '',
      'sim_mcc': simMcc ?? '',
      'sim_mnc': simMnc ?? '',
      'mobile_network_generation': mobileGeneration ?? '',
      'sim_state': simState ?? '',
      'gps_latitude': canonicalTelemetryNumber(lat),
      'gps_longitude': canonicalTelemetryNumber(lon),
      'gps_accuracy': canonicalTelemetryNumber(accuracy),
      'accel_x': canonicalTelemetryNumber(accelX),
      'accel_y': canonicalTelemetryNumber(accelY),
      'accel_z': canonicalTelemetryNumber(accelZ),
    };
  }

  String _mapConnectivity(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return 'wifi';
      case ConnectivityResult.mobile:
        return 'mobile';
      case ConnectivityResult.ethernet:
        return 'ethernet';
      case ConnectivityResult.vpn:
        return 'vpn';
      case ConnectivityResult.bluetooth:
        return 'bluetooth';
      case ConnectivityResult.other:
        return 'other';
      case ConnectivityResult.none:
        return 'none';
    }
  }

  /// network_info_plus returns the SSID wrapped in double quotes on some OEMs.
  String? _stripQuotes(String? value) {
    if (value == null) return null;
    var v = value;
    if (v.startsWith('"') && v.endsWith('"') && v.length >= 2) {
      v = v.substring(1, v.length - 1);
    }
    // <unknown ssid> means location is off or perm missing — treat as null.
    if (v.isEmpty || v.toLowerCase().contains('unknown ssid')) return null;
    return v;
  }

  /// 02:00:00:00:00:00 is the Android "no permission" placeholder MAC, not a
  /// real BSSID — treat it as unknown so it never fires a false change alert.
  String? _normalizeBssid(String? bssid) {
    if (bssid == null) return null;
    if (bssid.isEmpty || bssid == '02:00:00:00:00:00') return null;
    return bssid;
  }

  /// Reads real SIM/carrier data per platform. Returns nullable string fields.
  Future<Map<String, String?>> _readCarrier() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final info = await CarrierInfo.getAndroidInfo();
      final tel =
          (info?.telephonyInfo.isNotEmpty ?? false) ? info!.telephonyInfo.first : null;
      if (tel == null) return const {};
      return {
        'carrier': tel.carrierName.isEmpty ? null : tel.carrierName,
        'mcc': tel.mobileCountryCode.isEmpty ? null : tel.mobileCountryCode,
        'mnc': tel.mobileNetworkCode.isEmpty ? null : tel.mobileNetworkCode,
        'generation':
            tel.networkGeneration.isEmpty ? null : tel.networkGeneration,
        'simState': tel.simState.isEmpty ? null : tel.simState,
      };
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final ios = await _deviceInfo.iosInfo;
      final major = int.tryParse(ios.systemVersion.split('.').first) ?? 0;

      final info = await CarrierInfo.getIosInfo();
      final gen = (info.carrierRadioAccessTechnologyTypeList.isNotEmpty)
          ? info.carrierRadioAccessTechnologyTypeList.first
          : null;
      final simState = info.isSIMInserted ? 'READY' : 'ABSENT';

      // CTCarrier identity (name/MCC/MNC) is deprecated on iOS 16+ and returns
      // dummy values ("--", "65535"). Trust it only on iOS < 16; on 16+ drop the
      // identity fields so they never fire a false SIM-swap CRITICAL alert.
      if (major >= 16) {
        return {'generation': gen, 'simState': simState};
      }
      final c = info.carrierData.isNotEmpty ? info.carrierData.first : null;
      return {
        'carrier': _nullIfDummy(c?.carrierName),
        'mcc': _nullIfDummy(c?.mobileCountryCode),
        'mnc': _nullIfDummy(c?.mobileNetworkCode),
        'generation': gen,
        'simState': simState,
      };
    }
    return const {};
  }

  /// CTCarrier placeholder values that mean "no real SIM identity".
  static String? _nullIfDummy(String? v) {
    if (v == null || v.isEmpty) return null;
    if (v == '--' || v == '65535' || v == '0') return null;
    return v;
  }


  /// Send a SignalBatch via gRPC WorkerService.IngestTelemetry. Returns true
  /// only when the backend accepts (and persists to `device_signal_batches`).
  /// Any network/gRPC error => false => caller buffers offline.
  /// True only for the failure a resend can never fix: the backend holds a
  /// different public key for this device_id than the one we are signing with,
  /// so every batch is refused with the same message.
  ///
  /// Matched on the message rather than the code alone, because UNAUTHENTICATED
  /// is also what an expired bearer token returns — and that one IS retryable.
  static bool _isStaleDeviceKey(GrpcError e) =>
      e.code == StatusCode.unauthenticated &&
      (e.message ?? '').toLowerCase().contains('signature');

  /// Set once per process after a re-bind attempt, so a key that stays rotated
  /// cannot make every subsequent batch fire another RegisterDevice.
  static bool _rebindAttempted = false;

  Future<_SendResult> _sendPayloadToServer(
    Map<String, dynamic> payload,
    String signature,
    String workerId,
  ) async {
    final String deviceId;
    final String token;
    try {
      // Fast offline gate to avoid pointless socket attempts.
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        debugPrint('📡 Ingest Send: Offline (no network connectivity).');
        return _SendResult.retryable;
      }

      deviceId = await DeviceIdentityService().getDeviceId();
      token = await EnrollmentService().getValidAccessToken() ??
          await _storage.read(key: 'access_token') ??
          '';
    } on Exception catch (e) {
      debugPrint('⚠️ Ingest Send: could not prepare the request ($e)');
      return _SendResult.retryable;
    }

    Future<bool> attempt() async {
      final grpc = CypurgeGrpcService()..init(useGateway: true);
      return grpc.ingestTelemetry(
        token: token,
        workerId: workerId,
        deviceId: deviceId,
        signature: signature,
        payload: payload,
      );
    }

    try {
      return await attempt() ? _SendResult.ok : _SendResult.retryable;
    } on GrpcError catch (e) {
      if (!_isStaleDeviceKey(e)) {
        debugPrint('⚠️ Ingest Send failed: $e');
        return _SendResult.retryable;
      }
      // The device id and the ECDSA signing key live under two independent
      // secure-storage entries, so the key can be regenerated while the device
      // id survives — the backend then still finds an ACTIVE device row but
      // verifies against the superseded public key. Re-bind to publish the
      // current one, then retry this batch. The signature stays valid: what was
      // stale is the server's copy of the public key, not our signature over
      // the payload.
      if (_rebindAttempted) {
        debugPrint('🚫 Telemetry signature still refused after a re-bind this '
            'session — dropping the batch.');
        return _SendResult.rejected;
      }
      _rebindAttempted = true;
      debugPrint('🔑 Telemetry signature refused — re-binding this device key, '
          'then retrying once.');
      if (!await DeviceIdentityService().registerDevice(workerId)) {
        debugPrint('🚫 Device re-bind was not accepted — dropping the batch.');
        return _SendResult.rejected;
      }
      try {
        return await attempt() ? _SendResult.ok : _SendResult.retryable;
      } on GrpcError catch (retryErr) {
        debugPrint('🚫 Telemetry still refused after the re-bind: '
            '${retryErr.message}');
        return _SendResult.rejected;
      }
    } on Exception catch (e) {
      debugPrint('⚠️ Ingest Send failed: $e');
      return _SendResult.retryable;
    }
  }

  Future<void> _bufferOffline(
      Map<String, dynamic> payload, String signature) async {
    try {
      final bufferStr = await _storage.read(key: 'offline_signals_buffer');
      List<dynamic> buffer = [];
      if (bufferStr != null && bufferStr.isNotEmpty) {
        buffer = jsonDecode(bufferStr);
      }

      buffer.add({
        'payload': payload,
        'signature': signature,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      });

      // Retain only what the server would still accept — a batch past the
      // freshness window is rejected as a replay, so keeping it just grows
      // secure storage and burns a failed send on every future flush.
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      buffer.removeWhere((item) => !isSendable(item, nowMs));

      await _storage.write(
          key: 'offline_signals_buffer', value: jsonEncode(buffer));
      debugPrint('💾 Telemetry buffered locally. Current buffer size: ${buffer.length}');
    } catch (e) {
      debugPrint('⚠️ Error writing to offline telemetry buffer: $e');
    }
  }

  Future<void> _flushBuffer(String workerId) async {
    try {
      final bufferStr = await _storage.read(key: 'offline_signals_buffer');
      if (bufferStr == null || bufferStr.isEmpty) return;

      final List<dynamic> buffer = jsonDecode(bufferStr);
      if (buffer.isEmpty) return;

      debugPrint('🔄 Attempting to flush ${buffer.length} offline buffered telemetry batches...');

      // Drop batches the server can no longer accept BEFORE sending. Without
      // this a single stale batch fails, trips stopFlushing, and blocks every
      // newer batch behind it on each retry.
      final nowMs = DateTime.now().millisecondsSinceEpoch;
      final beforePrune = buffer.length;
      buffer.removeWhere((item) => !isSendable(item, nowMs));
      final dropped = beforePrune - buffer.length;
      if (dropped > 0) {
        debugPrint('🗑️ Dropped $dropped telemetry batch(es) past the '
            '${_telemetryFreshness.inMinutes}-min server freshness window.');
      }

      List<dynamic> remaining = [];
      bool stopFlushing = false;

      for (var item in buffer) {
        if (stopFlushing) {
          remaining.add(item);
          continue;
        }

        final payload = Map<String, dynamic>.from(item['payload']);
        final signature = item['signature'] as String;

        switch (await _sendPayloadToServer(payload, signature, workerId)) {
          case _SendResult.ok:
            debugPrint('✅ Flushed buffered telemetry batch from timestamp: ${item['timestamp']}');
          case _SendResult.rejected:
            // Drop it rather than re-queue: an unverifiable batch would fail
            // identically on every future flush and block the queue behind it.
            debugPrint('🚫 Dropping unverifiable buffered batch from timestamp: ${item['timestamp']}');
          case _SendResult.retryable:
            debugPrint('⚠️ Buffer flush failed for item. Suspending flush sequence.');
            remaining.add(item);
            stopFlushing = true;
        }
      }

      if (remaining.isEmpty) {
        await _storage.delete(key: 'offline_signals_buffer');
        debugPrint('✅ Telemetry offline buffer completely cleared.');
      } else {
        await _storage.write(
            key: 'offline_signals_buffer', value: jsonEncode(remaining));
        debugPrint('💾 Telemetry offline buffer updated. ${remaining.length} items remain.');
      }
    } catch (e) {
      debugPrint('⚠️ Error flushing offline telemetry buffer: $e');
    }
  }
}

/// Canonical numeric form for the signed telemetry payload.
///
/// The backend verifies the ECDSA signature over `json.Marshal` of the SAME
/// values as reconstructed from the proto, so Dart and Go must serialise every
/// number to identical bytes. They disagree in three ways, and all three occur
/// on `accel_x`/`accel_y` for a phone lying still on a desk:
///
/// | value     | Dart          | Go            |
/// |-----------|---------------|---------------|
/// | `-0.0`    | `0`           | `-0`          |
/// | `1.19e-7` | `1.19e-7`     | `1.19e-07`    |
/// | `20.0`    | `20.0`        | `20`          |
///
/// Go's encoder switches to exponent form below `1e-6` and pads the exponent to
/// two digits; Dart does neither. Rounding to 6dp first leaves every value
/// either exactly `0` or `>= 1e-6` — the range where both print plain decimals
/// — and collapses `-0.0` on the way. Whole values then serialise as ints,
/// which is what Go emits for a whole float64.
///
/// 6dp sits below the noise floor of these sensors (GPS ~0.11 m), so no real
/// signal is lost. Non-finite values become `0`: NaN/Infinity are not valid
/// JSON and would throw during signing.
Object canonicalTelemetryNumber(double v) {
  if (!v.isFinite) return 0;
  final rounded = double.parse(v.toStringAsFixed(6));
  final normalized = rounded == 0 ? 0.0 : rounded; // collapses -0.0
  return normalized == normalized.truncateToDouble()
      ? normalized.toInt()
      : normalized;
}
