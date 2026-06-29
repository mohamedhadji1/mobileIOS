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

import '../utils/error_logger.dart';
import 'device_key_service.dart';
import 'device_identity_service.dart';
import 'enrollment_service.dart';
import 'cypurge_grpc_service.dart';

/// Service responsible for gathering continuous device telemetry in the background.
/// Aligned with specifications US-016-1, US-016-2, and US-016-3.
///
/// All telemetry values are read from REAL device hardware/radios:
///   - network type + online state  -> connectivity_plus
///   - airplane mode (Android)       -> platform channel (Settings.Global)
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

  /// Foreground realtime monitor subscription (connectivity changes).
  StreamSubscription<ConnectivityResult>? _connSub;

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

      final sendSuccess = await _sendPayloadToServer(payload, signature, workerId);
      if (sendSuccess) {
        debugPrint('✅ Ingest Service Response: SignalBatch accepted.');
        await _flushBuffer(workerId);
        await _flushSecurityEvents(workerId);
        return true;
      } else {
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
  }

  void stopRealtimeMonitoring() {
    _connSub?.cancel();
    _connSub = null;
  }

  /// Requests the dangerous permissions telemetry depends on. Safe to call
  /// repeatedly — already-granted perms are no-ops.
  Future<void> _ensureRuntimePermissions() async {
    try {
      final needed = <Permission>[
        Permission.locationWhenInUse, // WiFi SSID + GPS
        Permission.phone, // READ_PHONE_STATE -> SIM/carrier
      ];
      for (final p in needed) {
        if (!await p.isGranted) {
          await p.request();
        }
      }
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: permission request failed ($e)');
    }
  }

  // ------------------------------------------------------------------
  // Change detection + secure event reporting
  // ------------------------------------------------------------------

  /// Radio-state subset that defines a "security-relevant" fingerprint.
  Map<String, String?> _fingerprint(Map<String, dynamic> p) => {
        'network_type': p['network_type']?.toString(),
        'is_airplane_mode': p['is_airplane_mode']?.toString(),
        'wifi_ssid': p['wifi_ssid']?.toString(),
        'wifi_bssid': p['wifi_bssid']?.toString(),
        'sim_carrier_name': p['sim_carrier_name']?.toString(),
        'sim_mcc': p['sim_mcc']?.toString(),
        'sim_mnc': p['sim_mnc']?.toString(),
        'cell_id': p['cell_id']?.toString(),
      };

  String _severityFor(String field, String? from, String? to) {
    switch (field) {
      case 'sim_carrier_name':
      case 'sim_mcc':
      case 'sim_mnc':
        return 'CRITICAL'; // SIM swap
      case 'is_airplane_mode':
        return to == 'true' ? 'HIGH' : 'INFO'; // going dark
      case 'network_type':
        return to == 'none' ? 'HIGH' : 'MEDIUM'; // connection cut vs switch
      case 'wifi_ssid':
      case 'wifi_bssid':
        return 'MEDIUM'; // network switch
      case 'cell_id':
        return 'MEDIUM'; // cell-tower change = movement
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

    // 3. Airplane mode (real, Android only)
    bool isAirplaneMode = false;
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        isAirplaneMode =
            await _deviceChannel.invokeMethod<bool>('isAirplaneModeOn') ?? false;
      }
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

    // 5b. Cellular cell-tower ID (real, Android only — iOS does not expose it)
    String? cellId, cellTac, cellLac, cellRadio, cellMcc, cellMnc;
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final cell =
            await _deviceChannel.invokeMapMethod<String, dynamic>('getCellInfo');
        if (cell != null) {
          cellId = cell['cell_id']?.toString();
          cellTac = cell['cell_tac']?.toString();
          cellLac = cell['cell_lac']?.toString();
          cellRadio = cell['cell_radio']?.toString();
          cellMcc = cell['cell_mcc']?.toString();
          cellMnc = cell['cell_mnc']?.toString();
        }
      }
    } catch (e) {
      debugPrint('⚠️ Telemetry Warning: cell info read failed ($e)');
    }

    // 6. GPS (real)
    double lat = 0.0;
    double lon = 0.0;
    double accuracy = 0.0;
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position? pos;
        try {
          pos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low,
            timeLimit: const Duration(seconds: 5),
          );
        } on TimeoutException {
          // No fresh fix in time (common indoors) — fall back to last known.
          pos = await Geolocator.getLastKnownPosition();
        }
        if (pos != null) {
          lat = pos.latitude;
          lon = pos.longitude;
          accuracy = pos.accuracy;
        }
      }
    } catch (e) {
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

    return {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'device_model': model,
      'os_version': osVersion,
      'network_type': networkType,
      'is_online': isOnline,
      'is_airplane_mode': isAirplaneMode,
      'wifi_ssid': wifiSsid,
      'wifi_bssid': wifiBssid,
      'wifi_ip': wifiIp,
      'sim_carrier_name': simCarrier,
      'sim_mcc': simMcc,
      'sim_mnc': simMnc,
      'mobile_network_generation': mobileGeneration,
      'sim_state': simState,
      'cell_id': cellId,
      'cell_tac': cellTac,
      'cell_lac': cellLac,
      'cell_radio': cellRadio,
      'cell_mcc': cellMcc,
      'cell_mnc': cellMnc,
      'gps_latitude': lat,
      'gps_longitude': lon,
      'gps_accuracy': accuracy,
      'accel_x': accelX,
      'accel_y': accelY,
      'accel_z': accelZ,
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
      final info = await CarrierInfo.getIosInfo();
      final c = info.carrierData.isNotEmpty ? info.carrierData.first : null;
      final gen = (info.carrierRadioAccessTechnologyTypeList.isNotEmpty)
          ? info.carrierRadioAccessTechnologyTypeList.first
          : null;
      return {
        'carrier': c?.carrierName,
        'mcc': c?.mobileCountryCode,
        'mnc': c?.mobileNetworkCode,
        'generation': gen,
        'simState': info.isSIMInserted ? 'READY' : 'ABSENT',
      };
    }
    return const {};
  }


  /// Send a SignalBatch via gRPC WorkerService.IngestTelemetry. Returns true
  /// only when the backend accepts (and persists to `device_signal_batches`).
  /// Any network/gRPC error => false => caller buffers offline.
  Future<bool> _sendPayloadToServer(
    Map<String, dynamic> payload,
    String signature,
    String workerId,
  ) async {
    try {
      // Fast offline gate to avoid pointless socket attempts.
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity == ConnectivityResult.none) {
        debugPrint('📡 Ingest Send: Offline (no network connectivity).');
        return false;
      }

      final deviceId = await DeviceIdentityService().getDeviceId();
      final token = await EnrollmentService().getValidAccessToken() ??
          await _storage.read(key: 'access_token') ??
          '';
      final grpc = CypurgeGrpcService()..init(useGateway: true);
      return await grpc.ingestTelemetry(
        token: token,
        workerId: workerId,
        deviceId: deviceId,
        signature: signature,
        payload: payload,
      );
    } catch (e) {
      debugPrint('⚠️ Ingest Send failed: $e');
      return false;
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

      // Enforce 24h retention policy: discard batches older than 24 hours.
      final cutoff =
          DateTime.now().subtract(const Duration(hours: 24)).millisecondsSinceEpoch;
      buffer.removeWhere((item) => (item['timestamp'] as num) < cutoff);

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

      final cutoff =
          DateTime.now().subtract(const Duration(hours: 24)).millisecondsSinceEpoch;
      buffer.removeWhere((item) => (item['timestamp'] as num) < cutoff);

      List<dynamic> remaining = [];
      bool stopFlushing = false;

      for (var item in buffer) {
        if (stopFlushing) {
          remaining.add(item);
          continue;
        }

        final payload = Map<String, dynamic>.from(item['payload']);
        final signature = item['signature'] as String;

        final success = await _sendPayloadToServer(payload, signature, workerId);
        if (success) {
          debugPrint('✅ Flushed buffered telemetry batch from timestamp: ${item['timestamp']}');
        } else {
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
