import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:http/http.dart' as http;

// Import generated gRPC files
import '../generated/platform/v1/platform.pbgrpc.dart';
import '../generated/worker/v1/worker.pbgrpc.dart';
import '../generated/biometric/v1/biometric.pbgrpc.dart';
import '../generated/risk/v1/risk.pbgrpc.dart';
import '../generated/document/v1/document.pbgrpc.dart';
import '../generated/case/v1/case.pbgrpc.dart';
import '../config/constants.dart';
import '../utils/error_logger.dart';
import 'device_key_service.dart';

/// How long the app waits for VerifyDocumentUpload. Always longer than the
/// backend's own ML timeout (DOCUMENT_CHECK_TIMEOUT_SECONDS, 130 s), so a slow
/// ML comes back as the backend's "busy, try again" instead of the app giving
/// up first with a bare DEADLINE_EXCEEDED.
Duration documentCheckDeadline({required bool twoSided}) =>
    Duration(seconds: twoSided ? 190 : 150);

/// Comprehensive gRPC and OIDC Client for the WorkerTrust Identity Flow.
///
/// Implements the following sequence:
/// 1. Direct OIDC token retrieval (Keycloak password grant) or PKCE.
/// 2. Profile Sync via [PlatformService.SyncUser].
/// 3. Worker Enrollment via [WorkerService.EnrollWorker] to obtain a worker_id.
/// 4. Face Enrollment via [BiometricService.EnrollFace] using local face hash.
/// 5. Biometric Sign-in/Verification via [BiometricService.SearchCollisions].
class CypurgeGrpcService {
  static final CypurgeGrpcService _instance = CypurgeGrpcService._internal();
  factory CypurgeGrpcService() => _instance;
  CypurgeGrpcService._internal();

  // Channels
  ClientChannel? _gatewayChannel;
  ClientChannel? _platformDirectChannel;
  ClientChannel? _workerDirectChannel;
  ClientChannel? _biometricDirectChannel;

  // Clients
  PlatformServiceClient? _platformClient;
  WorkerServiceClient? _workerClient;
  BiometricServiceClient? _biometricClient;
  RiskServiceClient? _riskClient;
  DocumentServiceClient? _documentClient;
  // Case service is gateway-only — there is no direct-dial port for it, and the
  // gateway proxies SubmitAppeal / ListReverificationRequests.
  CaseServiceClient? _caseClient;
  QualificationServiceClient? _qualificationClient;
  EmploymentServiceClient? _employmentClient;

  bool _isInitialized = false;

  /// VM configuration values
  static const String defaultGatewayHost = '192.168.51.33';
  static const int defaultGatewayPort = 30050;
  static const int defaultPlatformPort = 50051;
  static const int defaultWorkerPort = 50053;
  static const int defaultBiometricPort = 50059;

  /// Initialize gRPC channels and clients.
  ///
  /// Set [useGateway] to true to point all services to the Unified Gateway (port 30050).
  /// Set [useGateway] to false to talk directly to the microservices on their respective ports.
  // Last-applied config — lets init() no-op when nothing changed.
  String? _initHost;
  bool? _initUseGateway;

  void init({
    String? host,
    int gatewayPort = defaultGatewayPort,
    int platformPort = defaultPlatformPort,
    int workerPort = defaultWorkerPort,
    int biometricPort = defaultBiometricPort,
    bool useGateway = true,
  }) {
    final activeHost = host ?? AppConfig.host;

    // Idempotent: every call site runs init() before each RPC. Recreating
    // channels each time scheduled a shutdown of the channel a concurrent
    // caller's RPC was still in flight on → "Connection shutting down"
    // (UNAVAILABLE). Same host+mode = keep the existing channels; dart-grpc
    // reconnects dropped transports on its own.
    if (_isInitialized &&
        _initHost == activeHost &&
        _initUseGateway == useGateway) {
      return;
    }
    _initHost = activeHost;
    _initUseGateway = useGateway;

    if (_isInitialized) {
      final oldGateway = _gatewayChannel;
      final oldPlatform = _platformDirectChannel;
      final oldWorker = _workerDirectChannel;
      final oldBiometric = _biometricDirectChannel;

      Future.microtask(() async {
        try {
          await oldGateway?.shutdown();
          await oldPlatform?.shutdown();
          await oldWorker?.shutdown();
          await oldBiometric?.shutdown();
        } catch (e) {
          debugPrint('⚠️ Error shutting down old channels: $e');
        }
      });
    }

    const channelOptions = ChannelOptions(
      credentials:
          ChannelCredentials.insecure(), // Plaintext used in development
    );

    if (useGateway) {
      debugPrint(
          '⚓ Initializing gRPC via Unified Gateway → $activeHost:$gatewayPort');
      _gatewayChannel = ClientChannel(
        activeHost,
        port: gatewayPort,
        options: channelOptions,
      );

      // All services share the same gateway channel
      _platformClient = PlatformServiceClient(_gatewayChannel!);
      _workerClient = WorkerServiceClient(_gatewayChannel!);
      _biometricClient = BiometricServiceClient(_gatewayChannel!);
      _riskClient = RiskServiceClient(_gatewayChannel!);
      _documentClient = DocumentServiceClient(_gatewayChannel!);
      _caseClient = CaseServiceClient(_gatewayChannel!);
      _qualificationClient = QualificationServiceClient(_gatewayChannel!);
      _employmentClient = EmploymentServiceClient(_gatewayChannel!);
    } else {
      debugPrint('📡 Initializing direct gRPC channels:');
      debugPrint('  - Platform Service: $activeHost:$platformPort');
      debugPrint('  - Worker Service: $activeHost:$workerPort');
      debugPrint('  - Biometric Service: $activeHost:$biometricPort');

      _gatewayChannel =
          ClientChannel(activeHost, port: gatewayPort, options: channelOptions);
      _platformDirectChannel = ClientChannel(activeHost,
          port: platformPort, options: channelOptions);
      _workerDirectChannel =
          ClientChannel(activeHost, port: workerPort, options: channelOptions);
      _biometricDirectChannel = ClientChannel(activeHost,
          port: biometricPort, options: channelOptions);

      _platformClient = PlatformServiceClient(_platformDirectChannel!);
      _workerClient = WorkerServiceClient(_workerDirectChannel!);
      _biometricClient = BiometricServiceClient(_biometricDirectChannel!);
      _riskClient = RiskServiceClient(_gatewayChannel!);
      _documentClient = DocumentServiceClient(_gatewayChannel!);
      // Case has no direct-dial port; always via the gateway.
      _caseClient = CaseServiceClient(_gatewayChannel!);
      _qualificationClient = QualificationServiceClient(_gatewayChannel!);
      _employmentClient = EmploymentServiceClient(_gatewayChannel!);
    }

    _isInitialized = true;
  }

  /// Runs [action], retrying once after a transient transport failure.
  ///
  /// A rolling deploy makes every replica send GOAWAY and drop its in-flight
  /// HTTP/2 streams, which reaches the client as UNAVAILABLE or as UNKNOWN
  /// carrying "Connection is being forcefully terminated" (CONNECT_ERROR). The
  /// request itself was fine, so a single retry rides out the restart instead of
  /// stranding the worker mid-enrollment.
  ///
  /// Safe for CreateKeycloakUser specifically, even though it is a write: if the
  /// first attempt did reach Keycloak before the connection died, the retry
  /// simply conflicts (409) and the password the first attempt set is already in
  /// place, so the subsequent login still succeeds.
  Future<T> _retryOnceOnTransport<T>(
      String label, Future<T> Function() action) async {
    try {
      return await action();
    } on GrpcError catch (e) {
      final isTransient = e.code == StatusCode.unavailable ||
          (e.code == StatusCode.unknown &&
              (e.message ?? '').contains('Connection'));
      if (!isTransient) rethrow;
      debugPrint('🔁 $label hit a transient transport error '
          '(${e.codeName}) — retrying once in 2s…');
      await Future.delayed(const Duration(seconds: 2));
      return await action();
    }
  }

  /// Helper to generate call options with JWT Authorization metadata.
  /// [timeout] overrides the 15s default for large-payload calls
  /// (VerifyLiveness ships a ~36MB clip + frames — needs minutes, not seconds).
  CallOptions _getCallOptions(String token,
      {Duration timeout = const Duration(seconds: 15)}) {
    final id = deviceId;
    final hasId = id != null && id.isNotEmpty;
    return CallOptions(
      metadata: {
        'authorization': 'Bearer $token',
        // One login per phone: the backend refuses a worker call from a phone
        // that is not the worker's active one. Ignored until it enforces it.
        if (hasId) 'x-device-id': id,
      },
      providers: hasId ? const [_signDevice] : null,
      timeout: timeout,
    );
  }

  /// This phone's device id, set by DeviceIdentityService.getDeviceId().
  static String? deviceId;

  static ({String id, int ts, String sig})? _deviceSig;

  /// Proves x-device-id came from this phone: the device key signs
  /// canonical JSON {"device_id","ts"} (same key and format as telemetry,
  /// which RegisterDevice already stored). Reused for a minute — one ECDSA
  /// sign per call is wasted work and the backend allows ±5 min.
  static Future<void> _signDevice(Map<String, String> metadata, String uri) async {
    final id = metadata['x-device-id'];
    if (id == null) return;
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      var cached = _deviceSig;
      if (cached == null || cached.id != id || now - cached.ts > 60000) {
        final sig = await DeviceKeyService().signCanonicalHex({'device_id': id, 'ts': now});
        cached = _deviceSig = (id: id, ts: now, sig: sig);
      }
      metadata['x-device-ts'] = '${cached.ts}';
      metadata['x-device-sig'] = cached.sig;
    } catch (e) {
      // Never fail the call over it; the backend decides what an unsigned
      // request is worth.
      debugPrint('⚠️ Device signature skipped: $e');
    }
  }

  /// 1. Keycloak Direct Password Login Helper (Resource Owner Password Credentials Grant)
  ///
  /// Designed for fast, headless authentication in development/testing.
  /// Bypasses interactive OIDC PKCE redirect loops.
  Future<String> loginDirect({
    required String username,
    required String password,
    String tokenEndpoint =
        '${AppConfig.keycloakHttpEndpoint}/realms/workertrust/protocol/openid-connect/token',
    String clientId = 'workertrust-mobile',
  }) async {
    try {
      debugPrint('🔐 Attempting direct token retrieval from Keycloak...');
      final response = await http.post(
        Uri.parse(tokenEndpoint),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'password',
          'client_id': clientId,
          'username': username,
          'password': password,
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['access_token'] as String;
        debugPrint('✅ JWT Access Token acquired successfully.');
        return token;
      } else {
        throw Exception(
            'Failed to authenticate: ${response.statusCode} - ${response.body}');
      }
    } catch (e, stack) {
      ErrorLogger.log('Keycloak Direct Login', e, stack);
      rethrow;
    }
  }

  /// 2. Sync Profile
  ///
  /// Calls [PlatformService.SyncUser] to ensure that the Keycloak identity is registered
  /// and synchronized with the backend database.
  Future<SyncUserResponse> syncUser({required String token}) async {
    _checkInit();
    try {
      debugPrint('🔄 Calling PlatformService.SyncUser...');
      final request = SyncUserRequest();
      final response = await _platformClient!.syncUser(
        request,
        options: _getCallOptions(token),
      );
      debugPrint(
          '✅ SyncUser Succeeded. User ID: ${response.userId}, Created: ${response.created}');
      return response;
    } catch (e, stack) {
      ErrorLogger.log('PlatformService.SyncUser', e, stack);
      rethrow;
    }
  }

  /// 2.5 Validate Invitation
  ///
  /// Calls [WorkerService.ValidateInvitation] to validate a scanned invitation token or short code.
  Future<ValidateInvitationResponse> validateInvitation({
    required String token,
    required String tenant,
  }) async {
    _checkInit();
    try {
      // Tenant only. The invitation token is a credential, and debugPrint
      // survives into release builds — logging it puts it in logcat.
      debugPrint(
          '👤 Calling WorkerService.ValidateInvitation (Tenant: $tenant)...');
      final request = ValidateInvitationRequest()
        ..token = token
        ..tenant = tenant;

      final response = await _retryOnceOnTransport(
        'ValidateInvitation',
        () => _workerClient!.validateInvitation(request),
      );
      debugPrint(
          '✅ ValidateInvitation Succeeded. Invitation ID: ${response.invitationId}');
      return response;
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.ValidateInvitation', e, stack);
      rethrow;
    }
  }

  /// 3. Enroll Worker
  ///
  /// Calls [WorkerService.EnrollWorker] to register the worker profile inside the PostgreSQL database.
  /// Returns the newly generated [worker_id] needed for biometric face enrollment.
  Future<EnrollWorkerResponse> enrollWorker({
    required String token,
    required String tenantId,
    required String surname,
    required String givenNames,
    required String nationality,
    required ProfileType profileType,
    // YYYY-MM-DD. The backend enforces 18–60 whenever it is sent; empty leaves
    // it unset.
    String dateOfBirth = '',
  }) async {
    _checkInit();
    try {
      debugPrint(
          '👤 Calling WorkerService.EnrollWorker (Tenant: $tenantId)...');
      final request = EnrollWorkerRequest()
        ..tenantId = tenantId
        ..surname = surname
        ..givenNames = givenNames
        ..nationality = nationality
        ..profileType = profileType
        ..dateOfBirth = dateOfBirth;

      final response = await _workerClient!.enrollWorker(
        request,
        options: _getCallOptions(token),
      );
      debugPrint('✅ EnrollWorker Succeeded. Worker ID: ${response.workerId}');
      return response;
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.EnrollWorker', e, stack);
      rethrow;
    }
  }

  /// Binds this device to the worker via [WorkerService.RegisterDevice].
  /// First-time bind is auto-accepted; a [changeReason] (device swap) puts the
  /// worker into MANUAL_REVIEW. Returns true when the backend accepted it.
  Future<bool> registerDevice({
    required String token,
    required String workerId,
    required String deviceId,
    required String publicKeyPem,
    required String deviceModel,
    required String osVersion,
    required String platform,
    String? changeReason,
  }) async {
    _checkInit();
    try {
      debugPrint(
          '📱 Calling WorkerService.RegisterDevice (Worker: $workerId)...');
      final request = RegisterDeviceRequest()
        ..workerId = workerId
        ..deviceId = deviceId
        ..publicKey = publicKeyPem
        ..deviceModel = deviceModel
        ..osVersion = osVersion
        ..platform = platform;
      if (changeReason != null && changeReason.isNotEmpty) {
        request.changeReason = changeReason;
      }
      final response = await _workerClient!.registerDevice(
        request,
        options: _getCallOptions(token),
      );
      debugPrint('✅ RegisterDevice accepted=${response.accepted}');
      return response.accepted;
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.RegisterDevice', e, stack);
      rethrow;
    }
  }

  /// Asks HR for a new phone, from the phone bound now
  /// ([WorkerService.RequestDeviceSwap]). UNIMPLEMENTED until the backend
  /// ships it.
  Future<RequestDeviceSwapResponse> requestDeviceSwap({
    required String token,
    required String workerId,
    required String deviceId,
    required String reason,
  }) {
    _checkInit();
    return _workerClient!.requestDeviceSwap(
      RequestDeviceSwapRequest(
          workerId: workerId, deviceId: deviceId, reason: reason),
      options: _getCallOptions(token),
    );
  }

  /// What the backend holds for this phone ([WorkerService.GetMyDeviceStatus]):
  /// ACTIVE | PENDING | REJECTED | REPLACED | NONE. UNIMPLEMENTED until the
  /// backend ships it.
  Future<GetMyDeviceStatusResponse> getMyDeviceStatus({
    required String token,
    required String workerId,
    required String deviceId,
  }) {
    _checkInit();
    return _workerClient!.getMyDeviceStatus(
      GetMyDeviceStatusRequest(workerId: workerId, deviceId: deviceId),
      options: _getCallOptions(token),
    );
  }

  /// Starts a shift ([WorkerService.StartShift]). Call right after a passed
  /// face check: the backend wants a fresh PASS. UNIMPLEMENTED until built.
  Future<StartShiftResponse> startShift({
    required String token,
    required String workerId,
    required String deviceId,
    required double latitude,
    required double longitude,
  }) {
    _checkInit();
    return _workerClient!.startShift(
      StartShiftRequest(
          workerId: workerId,
          deviceId: deviceId,
          latitude: latitude,
          longitude: longitude),
      options: _getCallOptions(token),
    );
  }

  /// Ends the shift [shiftId] ([WorkerService.EndShift]).
  Future<EndShiftResponse> endShift({
    required String token,
    required String workerId,
    required String shiftId,
    required double latitude,
    required double longitude,
  }) {
    _checkInit();
    return _workerClient!.endShift(
      EndShiftRequest(
          workerId: workerId,
          shiftId: shiftId,
          latitude: latitude,
          longitude: longitude),
      options: _getCallOptions(token),
    );
  }

  /// Provisions (or returns) this worker's Gotify receive credential via
  /// [WorkerService.ProvisionPushTarget] — the live push path.
  ///
  /// The backend creates a Gotify **user** per worker, keeps that user's
  /// application token server-side to send, and returns only the **client**
  /// token, which can stream this worker's messages and cannot originate one.
  /// So the device holds nothing forgeable, and a worker cannot see another
  /// worker's notifications.
  ///
  /// Idempotent: an already-provisioned device gets its existing identity back,
  /// so this is safe to call on every login.
  ///
  /// [deviceId] must be the same fingerprint passed to [registerDevice] — the
  /// backend matches on `fingerprint_hash` and answers NOT_FOUND otherwise.
  ///
  /// Returns null instead of throwing; every failure here is non-fatal, and the
  /// caller falls back to whatever token it already had:
  /// - `FAILED_PRECONDITION` — ops has not enabled server provisioning
  /// - `NOT_FOUND` — RegisterDevice has not run for this device
  /// - `PERMISSION_DENIED` — token targets another worker
  Future<({String clientToken, String streamUrl})?> provisionPushTarget({
    required String token,
    required String workerId,
    required String deviceId,
  }) async {
    _checkInit();
    try {
      debugPrint('🔑 Calling WorkerService.ProvisionPushTarget...');
      final response = await _workerClient!.provisionPushTarget(
        ProvisionPushTargetRequest()
          ..workerId = workerId
          ..deviceId = deviceId,
        options: _getCallOptions(token),
      );
      if (response.clientToken.isEmpty) {
        debugPrint('⚠️ ProvisionPushTarget returned an empty client token.');
        return null;
      }
      // Never log the token itself — it grants read access to this worker's
      // whole notification stream.
      debugPrint('✅ Push target provisioned (stream: ${response.streamUrl}).');
      return (
        clientToken: response.clientToken,
        streamUrl: response.streamUrl,
      );
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.ProvisionPushTarget', e, stack);
      return null;
    }
  }

  /// Registers this device's push destination via
  /// [WorkerService.RegisterPushToken] so the backend's dispatcher can reach it.
  ///
  /// ponytail: NOT on the live path. Path D provisions a per-worker Gotify
  /// identity that this app streams directly, so nothing calls this today. Kept
  /// because the backend documents it as the supported fallback ingest
  /// (hand-off rev 2 §11), and re-adding it would mean regenerating the proto
  /// stubs again. Delete it if that fallback is ever dropped.
  ///
  /// [deviceId] must be the same fingerprint passed to [registerDevice] — the
  /// backend resolves it to the device row and answers NOT_FOUND otherwise, so
  /// RegisterDevice has to have succeeded first.
  ///
  /// [endpointUrl] is the UnifiedPush endpoint, which is the path we use. The
  /// backend POSTs each notification straight there, which is why nothing on
  /// this device ever holds a Gotify send credential. [gotifyToken] is the
  /// app-token fallback from the backend hand-off §6 and stays empty here; the
  /// backend prefers the endpoint when both are set, and rejects the call with
  /// INVALID_ARGUMENT when neither is.
  ///
  /// Returns true when the backend accepted it. Never throws — failing to
  /// register for push must not stop a worker using the app.
  Future<bool> registerPushToken({
    required String token,
    required String workerId,
    required String deviceId,
    String endpointUrl = '',
    String gotifyToken = '',
    String source = 'MOBILE',
  }) async {
    _checkInit();
    try {
      if (endpointUrl.isEmpty && gotifyToken.isEmpty) {
        debugPrint('⚠️ RegisterPushToken skipped: no endpoint and no token.');
        return false;
      }
      // Log the host only. A UnifiedPush endpoint carries the distributor's
      // per-device secret in its path/query, so printing the full URL would put
      // a delivery credential into logcat.
      final host = Uri.tryParse(endpointUrl)?.host ?? '(none)';
      debugPrint('📮 Calling WorkerService.RegisterPushToken (host: $host)...');
      final request = RegisterPushTokenRequest()
        ..workerId = workerId
        ..deviceId = deviceId
        ..endpointUrl = endpointUrl
        ..gotifyToken = gotifyToken
        ..source = source;
      final response = await _workerClient!.registerPushToken(
        request,
        options: _getCallOptions(token),
      );
      debugPrint('✅ RegisterPushToken accepted=${response.accepted}');
      return response.accepted;
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.RegisterPushToken', e, stack);
      return false;
    }
  }

  /// Sends a signed telemetry SignalBatch. Backend persists to
  /// `device_signal_batches` (sig validity recorded as a flag, not a gate).
  /// Requires an ACTIVE device for the worker (same [deviceId] as RegisterDevice).
  Future<bool> ingestTelemetry({
    required String token,
    required String workerId,
    required String deviceId,
    required String signature,
    required Map<String, dynamic> payload,
  }) async {
    _checkInit();
    try {
      final req = IngestTelemetryRequest()
        ..workerId = workerId
        ..deviceId = deviceId
        ..signature = signature
        ..timestampMs = Int64((payload['timestamp'] as num).toInt())
        ..deviceModel = (payload['device_model'] ?? '').toString()
        ..osVersion = (payload['os_version'] ?? '').toString()
        ..networkType = (payload['network_type'] ?? '').toString()
        ..isOnline = payload['is_online'] == true
        ..isAirplaneMode = payload['is_airplane_mode'] == true
        ..wifiSsid = (payload['wifi_ssid'] ?? '').toString()
        ..wifiBssid = (payload['wifi_bssid'] ?? '').toString()
        ..wifiIp = (payload['wifi_ip'] ?? '').toString()
        ..simCarrierName = (payload['sim_carrier_name'] ?? '').toString()
        ..simMcc = (payload['sim_mcc'] ?? '').toString()
        ..simMnc = (payload['sim_mnc'] ?? '').toString()
        ..mobileNetworkGeneration =
            (payload['mobile_network_generation'] ?? '').toString()
        ..simState = (payload['sim_state'] ?? '').toString()
        ..gpsLatitude = (payload['gps_latitude'] as num?)?.toDouble() ?? 0.0
        ..gpsLongitude = (payload['gps_longitude'] as num?)?.toDouble() ?? 0.0
        ..gpsAccuracy = (payload['gps_accuracy'] as num?)?.toDouble() ?? 0.0
        ..accelX = (payload['accel_x'] as num?)?.toDouble() ?? 0.0
        ..accelY = (payload['accel_y'] as num?)?.toDouble() ?? 0.0
        ..accelZ = (payload['accel_z'] as num?)?.toDouble() ?? 0.0;
      final res = await _workerClient!
          .ingestTelemetry(req, options: _getCallOptions(token));
      debugPrint('📡 IngestTelemetry accepted=${res.accepted}');
      return res.accepted;
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.IngestTelemetry', e, stack);
      rethrow;
    }
  }

  /// Sends a signed security event (SIM swap, airplane toggle, etc.).
  /// Backend persists + opens a RISK_ALERT case. Same active-device requirement.
  Future<bool> raiseSecurityEvent({
    required String token,
    required String workerId,
    required String deviceId,
    required String signature,
    required Map<String, dynamic> event,
  }) async {
    _checkInit();
    try {
      final changes = (event['changes'] as List<dynamic>? ?? [])
          .map((c) => RaiseTelemetrySecurityEventRequest_Change()
            ..field_1 = (c['field'] ?? '').toString()
            ..from = (c['from'] ?? '').toString()
            ..to = (c['to'] ?? '').toString()
            ..severity = (c['severity'] ?? '').toString())
          .toList();
      final req = RaiseTelemetrySecurityEventRequest()
        ..workerId = workerId
        ..deviceId = deviceId
        ..signature = signature
        ..timestampMs = Int64((event['timestamp'] as num).toInt())
        ..deviceModel = (event['device_model'] ?? '').toString()
        ..osVersion = (event['os_version'] ?? '').toString()
        ..gpsLatitude = (event['gps_latitude'] as num?)?.toDouble() ?? 0.0
        ..gpsLongitude = (event['gps_longitude'] as num?)?.toDouble() ?? 0.0
        ..changes.addAll(changes);
      final res = await _workerClient!
          .raiseTelemetrySecurityEvent(req, options: _getCallOptions(token));
      debugPrint('🚨 RaiseTelemetrySecurityEvent accepted=${res.accepted}');
      return res.accepted;
    } catch (e, stack) {
      ErrorLogger.log('WorkerService.RaiseTelemetrySecurityEvent', e, stack);
      rethrow;
    }
  }

  /// 4. Enroll Face
  ///
  /// Generates the SHA-256 hash of the local face embedding float list,
  /// and calls [BiometricService.EnrollFace] to link the biometric identity with the [workerId].
  Future<EnrollFaceResponse> enrollFace({
    required String token,
    required String workerId,
    required String tenantId,
    required List<double> embedding,
  }) async {
    _checkInit();
    try {
      debugPrint('🤖 Commencing Biometric Face Enrollment locally...');
      final embeddingHash = computeEmbeddingHash(embedding);
      debugPrint('🧬 Face Hash generated locally (SHA-256): $embeddingHash');

      final request = EnrollFaceRequest()
        ..workerId = workerId
        ..tenantId = tenantId
        ..embeddingHash = embeddingHash;

      debugPrint('📤 Calling BiometricService.EnrollFace...');
      final response = await _biometricClient!.enrollFace(
        request,
        options: _getCallOptions(token),
      );
      debugPrint(
          '✅ EnrollFace Response: ID=${response.id}, IsNew=${response.isNew}, IsCollision=${response.isCollision}');
      return response;
    } catch (e, stack) {
      ErrorLogger.log('BiometricService.EnrollFace', e, stack);
      rethrow;
    }
  }

  /// 5. Sign-in / Biometric Face Verification (Search Collisions)
  ///
  /// In the new identity verification flow, sign-in uses [SearchCollisions] instead of a direct 1:1 match.
  /// Computes the hash of the live-captured face embedding on-device, then queries the biometric registry.
  Future<SearchCollisionsResponse> searchCollisions({
    required String token,
    required List<double> embedding,
  }) async {
    _checkInit();
    try {
      debugPrint('🔍 Sign-In: Initiating local biometric hash calculation...');
      final embeddingHash = computeEmbeddingHash(embedding);
      debugPrint('🧬 Live Face Hash (SHA-256): $embeddingHash');

      final request = SearchCollisionsRequest()..embeddingHash = embeddingHash;

      debugPrint('📡 Querying BiometricService.SearchCollisions...');
      final response = await _biometricClient!.searchCollisions(
        request,
        options: _getCallOptions(token),
      );

      debugPrint(
          '✅ SearchCollisions Returned ${response.results.length} matches.');
      for (var result in response.results) {
        debugPrint(
            '   - Match Found: WorkerID=${result.workerId}, Status/Label=${result.label}');
      }
      return response;
    } catch (e, stack) {
      ErrorLogger.log('BiometricService.SearchCollisions', e, stack);
      rethrow;
    }
  }

  /// 5b. Sign-in using a pre-stored enrollment hash (exact match).
  ///
  /// The backend stores embeddings by their exact SHA-256 hash. Since two photos of the same
  /// person produce different hashes, we store the enrollment hash at registration time and
  /// replay it here during sign-in. Liveness is still verified by the camera in the UI layer.
  Future<SearchCollisionsResponse> searchCollisionsByHash({
    required String token,
    required String embeddingHash,
  }) async {
    _checkInit();
    try {
      debugPrint(
          '🔍 Sign-In: Using stored enrollment hash for identity lookup...');
      debugPrint('🧬 Stored Enrollment Hash (SHA-256): $embeddingHash');

      final request = SearchCollisionsRequest()..embeddingHash = embeddingHash;

      debugPrint(
          '📡 Querying BiometricService.SearchCollisions (stored hash)...');
      final response = await _biometricClient!.searchCollisions(
        request,
        options: _getCallOptions(token),
      );

      debugPrint(
          '✅ SearchCollisions Returned ${response.results.length} matches.');
      for (var result in response.results) {
        debugPrint(
            '   - Match Found: WorkerID=${result.workerId}, Status/Label=${result.label}');
      }
      return response;
    } catch (e, stack) {
      ErrorLogger.log('BiometricService.SearchCollisions', e, stack);
      rethrow;
    }
  }

  /// Fetches a fresh liveness challenge (challenge_id + ordered steps) from the
  /// backend. Call this before starting the on-device gesture sequence so the
  /// captured frames can be tied to a server-issued challenge (anti-replay).
  Future<GetChallengeResponse> getChallenge({required String token}) async {
    _checkInit();
    // 60s, not the shared 15s default. GetChallenge fans out to three hops
    // (platform CheckPermission -> ML gateway /m5/challenge -> Valkey) and at
    // 15s a merely-slow path and an unreachable one present as an identical
    // DEADLINE_EXCEEDED. The elapsed log below is the discriminator: under 15s
    // means it now works, 15-60s means slow-but-reachable, a 60s failure means
    // genuinely blackholed. Revisit once the offending hop is known.
    final sw = Stopwatch()..start();
    try {
      final res = await _biometricClient!.getChallenge(GetChallengeRequest(),
          options:
              _getCallOptions(token, timeout: const Duration(seconds: 60)));
      debugPrint('🎲 GetChallenge OK in ${sw.elapsedMilliseconds}ms '
          'id=${res.challengeId} steps=${res.steps}');
      return res;
    } catch (e, stack) {
      debugPrint('🎲 GetChallenge FAILED after ${sw.elapsedMilliseconds}ms');
      ErrorLogger.log('BiometricService.GetChallenge', e, stack);
      rethrow;
    }
  }

  /// Presigned GET URL for the selfie the backend retained in MinIO.
  ///
  /// The biometric service copies the session's `doc_face.jpg` to a durable
  /// `biometric-evidence/{tenant}/{worker}/{session}.jpg` key that survives
  /// session cleanup, and this hands back a short-lived GET for it. It is the
  /// only server-side source of the worker's own face the app can reach.
  ///
  /// Returns null rather than throwing on every failure path — including
  /// PERMISSION_DENIED, which is what a mobile WORKER token gets today
  /// (the handler requires `worker:view`; the WORKER role holds only
  /// `worker:view_self`). The avatar falls back to initials, so a missing
  /// picture must never surface as an error.
  Future<String?> getBiometricEvidenceUrl({
    required String token,
    required String tenantId,
    required String workerId,
  }) async {
    _checkInit();
    try {
      final res = await _biometricClient!.getBiometricEvidenceURL(
        GetBiometricEvidenceURLRequest(tenantId: tenantId, workerId: workerId),
        options: _getCallOptions(token),
      );
      return res.url.isEmpty ? null : res.url;
    } catch (e) {
      debugPrint('🖼️ evidence URL unavailable: $e');
      return null;
    }
  }

  /// Opens the interactive sequential-liveness bidi stream (replaces the
  /// retired VerifyLiveness + GetLivenessResult upload/poll pair).
  ///
  /// Caller sends one LivenessClientMsg.start first, then a continuous flow of
  /// LivenessClientMsg.frame (~6 fps JPEG) on [messages]; the server pushes
  /// step / step_passed / step_timeout transitions and terminates the stream
  /// right after the final result message.
  ResponseStream<LivenessServerMsg> streamLiveness({
    required String token,
    required Stream<LivenessClientMsg> messages,
  }) {
    _checkInit();
    return _biometricClient!.streamLiveness(messages,
        options: _getCallOptions(token, timeout: const Duration(minutes: 5)));
  }

  /// Creates the worker's Keycloak account server-side via
  /// [PlatformService.CreateKeycloakUser].
  ///
  /// Deliberately UNAUTHENTICATED: at this point in enrollment the worker has no
  /// token yet. Platform whitelists this RPC out of auth and, on the
  /// unauthenticated path, restricts the role it will mint to
  /// worker/subcontractor_admin — so this cannot be used to create an ADMIN.
  ///
  /// This replaces a flow that shipped Keycloak MASTER ADMIN credentials inside
  /// the APK and drove the Keycloak admin REST API straight from the device.
  Future<CreateKeycloakUserResponse> createKeycloakUser({
    required String tenantId,
    required String email,
    required String password,
    String firstName = '',
    String lastName = '',
    String appRole = 'WORKER',
  }) async {
    _checkInit();
    try {
      final req = CreateKeycloakUserRequest()
        ..tenantId = tenantId
        ..email = email
        ..password = password
        ..firstName = firstName
        ..lastName = lastName
        ..appRole = appRole;
      // No CallOptions: this call carries no bearer token by design.
      final res = await _retryOnceOnTransport(
        'CreateKeycloakUser',
        () => _platformClient!.createKeycloakUser(req,
            options: CallOptions(timeout: const Duration(seconds: 20))),
      );
      // An empty id means the backend reported success without creating
      // anything: its Keycloak adapter returns ("", nil) when the POST hit a
      // 409 and the follow-up username lookup then found nothing. Left
      // unchecked this surfaces later as an unexplainable "Invalid user
      // credentials" at login, so fail here where the cause is still legible.
      if (res.keycloakUserId.isEmpty) {
        throw Exception(
            'Account provisioning reported success but returned no Keycloak '
            'user id — the account was not created.');
      }
      debugPrint(
          '👤 CreateKeycloakUser OK (role=$appRole, id=${res.keycloakUserId})');
      return res;
    } catch (e, stack) {
      ErrorLogger.log('PlatformService.CreateKeycloakUser', e, stack);
      rethrow;
    }
  }

  /// Resolves the tenant's Keycloak realm without needing its slug, via the
  /// auth-whitelisted [PlatformService.ResolveRealm]. Returns an empty response
  /// rather than an error for an unknown tenant — the backend deliberately does
  /// not leak existence.
  Future<ResolveRealmResponse> resolveRealm({
    String email = '',
    String tenantId = '',
  }) async {
    _checkInit();
    try {
      final req = ResolveRealmRequest()
        ..email = email
        ..tenantId = tenantId;
      final res = await _retryOnceOnTransport(
        'ResolveRealm',
        () => _platformClient!.resolveRealm(req,
            options: CallOptions(timeout: const Duration(seconds: 20))),
      );
      debugPrint('🏷️ ResolveRealm → realm=${res.keycloakRealmId}');
      return res;
    } catch (e, stack) {
      ErrorLogger.log('PlatformService.ResolveRealm', e, stack);
      rethrow;
    }
  }

  /// Triggers Keycloak's password-reset email via the auth-whitelisted
  /// [PlatformService.ForgotPassword]. Carries no bearer token by design — the
  /// worker has no session yet, which is the whole reason they need this.
  /// [tenantId] is optional; the backend resolves it from the email when empty.
  Future<ForgotPasswordResponse> forgotPassword({
    required String email,
    String tenantId = '',
  }) async {
    _checkInit();
    try {
      final req = ForgotPasswordRequest()
        ..email = email
        ..tenantId = tenantId;
      final res = await _platformClient!.forgotPassword(req,
          options: CallOptions(timeout: const Duration(seconds: 20)));
      debugPrint('📧 ForgotPassword requested (success=${res.success})');
      return res;
    } catch (e, stack) {
      ErrorLogger.log('PlatformService.ForgotPassword', e, stack);
      rethrow;
    }
  }

  /// Files a worker's dispute against an adverse decision via
  /// [CaseService.SubmitAppeal]. The backend opens a case and (usually) an
  /// accompanying re-verification request, returning both ids.
  Future<SubmitAppealResponse> submitAppeal({
    required String token,
    required String tenantId,
    required String workerId,
    required String reason,
    required String description,
  }) async {
    _checkInit();
    try {
      final req = SubmitAppealRequest()
        ..tenantId = tenantId
        ..workerId = workerId
        ..reason = reason
        ..description = description;
      final res =
          await _caseClient!.submitAppeal(req, options: _getCallOptions(token));
      debugPrint('📤 SubmitAppeal OK: case=${res.caseId}');
      return res;
    } catch (e, stack) {
      ErrorLogger.log('CaseService.SubmitAppeal', e, stack);
      rethrow;
    }
  }

  /// Lists re-verification requests via [CaseService.ListReverificationRequests].
  ///
  /// The RPC is scoped to a TENANT, not a worker — it has no worker_id filter —
  /// so callers showing a worker their own tasks must filter the result by
  /// worker_id themselves. See the note in BACKEND_HANDOFF_GETCHALLENGE.md: this
  /// RPC also skips rbac.Require server-side, so a WORKER token can read it.
  Future<ListReverificationRequestsResponse> listReverificationRequests({
    required String token,
    required String tenantId,
  }) async {
    _checkInit();
    try {
      final req = ListReverificationRequestsRequest()..tenantId = tenantId;
      final res = await _caseClient!
          .listReverificationRequests(req, options: _getCallOptions(token));
      debugPrint('📋 ListReverificationRequests: ${res.items.length} item(s)');
      return res;
    } catch (e, stack) {
      ErrorLogger.log('CaseService.ListReverificationRequests', e, stack);
      rethrow;
    }
  }

  /// 6. Get Risk Assessment
  ///
  /// Calls [RiskService.GetRiskAssessment] to retrieve the current risk factors, status, and traffic light level.
  Future<GetRiskAssessmentResponse> getRiskAssessment({
    required String token,
    required String workerId,
    required String tenantId,
  }) async {
    _checkInit();
    try {
      debugPrint(
          '🛡️ Calling RiskService.GetRiskAssessment (WorkerID: $workerId, TenantID: $tenantId)...');
      final request = GetRiskAssessmentRequest()
        ..workerId = workerId
        ..tenantId = tenantId;

      final response = await _riskClient!.getRiskAssessment(
        request,
        options: _getCallOptions(token),
      );
      debugPrint(
          '✅ GetRiskAssessment Succeeded. Traffic Light: ${response.trafficLight}, Status: ${response.status}');
      return response;
    } on GrpcError catch (e) {
      // A timeout or an unreachable server is an ordinary phone condition, not
      // a defect: log one line instead of a full error banner with a stack
      // trace. The caller still gets the exception and decides what to show.
      if (e.code == StatusCode.deadlineExceeded ||
          e.code == StatusCode.unavailable) {
        debugPrint('🛡️ GetRiskAssessment unreachable (${e.codeName})');
        rethrow;
      }
      ErrorLogger.log('RiskService.GetRiskAssessment', e, StackTrace.current);
      rethrow;
    } catch (e, stack) {
      ErrorLogger.log('RiskService.GetRiskAssessment', e, stack);
      rethrow;
    }
  }

  /// Local Cryptographic Utility: SHA-256 face embedding hash.
  ///
  /// High-reliability stringification and standard SHA-256 hashing to ensure
  /// identical double arrays map to the exact same hash across platforms.
  String computeEmbeddingHash(List<double> embedding) {
    // 1. Serialize the list of doubles to a strict JSON format
    final jsonStr = jsonEncode(embedding);
    // 2. Encode string into UTF-8 bytes
    final bytes = utf8.encode(jsonStr);
    // 3. Compute SHA-256 hash
    final digest = sha256.convert(bytes);
    // 4. Return as standard lower-case hexadecimal string
    return digest.toString();
  }

  Future<GenerateUploadURLResponse> generateUploadURL({
    required String token,
    required String tenantId,
    required String workerId,
    required String fileExt,
    // Real doc type (PASSPORT/ID/...) so the processing workflow starts with
    // it and M4 gets the right doc_format instead of slow auto-classify.
    // Empty -> backend falls back to generic DOCUMENT.
    String docType = '',
  }) async {
    _checkInit();
    if (_documentClient == null) {
      throw StateError('DocumentServiceClient is not initialized.');
    }
    try {
      final req = GenerateUploadURLRequest(
        tenantId: tenantId,
        workerId: workerId,
        fileExt: fileExt,
        docType: docType,
      );
      return await _documentClient!
          .generateUploadURL(req, options: _getCallOptions(token));
    } catch (e, stack) {
      ErrorLogger.log('DocumentService.GenerateUploadURL', e, stack);
      rethrow;
    }
  }

  Future<ConfirmUploadResponse> confirmUpload({
    required String token,
    required String objectKey,
    required String docType,
  }) async {
    _checkInit();
    if (_documentClient == null) {
      throw StateError('DocumentServiceClient is not initialized.');
    }
    try {
      final req = ConfirmUploadRequest(
        objectKey: objectKey,
        docType: docType,
      );
      return await _documentClient!
          .confirmUpload(req, options: _getCallOptions(token));
    } catch (e, stack) {
      // The processing workflow can finalize on its own (MinIO upload webhook)
      // before this explicit confirm arrives. Signalling an already-finished
      // workflow is harmless — the document is uploaded + persisted — so treat
      // it as success instead of failing the whole upload.
      if (e is GrpcError &&
          (e.message?.contains('already completed') ?? false)) {
        debugPrint(
            'ℹ️ ConfirmUpload: workflow already finalized — treating as success.');
        return ConfirmUploadResponse();
      }
      ErrorLogger.log('DocumentService.ConfirmUpload', e, stack);
      rethrow;
    }
  }

  /// DocumentService.VerifyDocumentUpload: checks an uploaded file against the
  /// button it was uploaded under (passport, cv, diploma…). Every upload must
  /// go through it — the backend holds the file in AWAITING_CHECK, deletes it
  /// after 30 minutes otherwise, and ParseCv / SubmitQualification refuse an
  /// unchecked file. Blocks while the ML gateway reads the file: ID cards read
  /// by OCR take up to ~1.5 minutes, hence the longer deadline for them.
  ///
  /// [selfie]: the worker's selfie, for an identity document. The gateway then
  /// also compares the face on the document with it, and the backend stores
  /// the result for HR (DocumentReviewItem.face_band). It never refuses a
  /// document on its own.
  Future<VerifyDocumentUploadResponse> verifyDocumentUpload({
    required String token,
    required String objectKey,
    required String expectedType,
    String backObjectKey = '',
    List<int>? selfie,
  }) async {
    _checkInit();
    if (_documentClient == null) {
      throw StateError('DocumentServiceClient is not initialized.');
    }
    final twoSided =
        expectedType == 'national_id' || expectedType == 'driving_licence';
    try {
      return await _documentClient!.verifyDocumentUpload(
        VerifyDocumentUploadRequest(
          objectKey: objectKey,
          backObjectKey: backObjectKey,
          expectedType: expectedType,
          selfie: (selfie == null || selfie.isEmpty) ? null : selfie,
        ),
        options: _getCallOptions(token,
            timeout: documentCheckDeadline(twoSided: twoSided)),
      );
    } catch (e, stack) {
      ErrorLogger.log('DocumentService.VerifyDocumentUpload', e, stack);
      rethrow;
    }
  }

  /// DocumentService.ListWorkerDocuments: the caller's own documents with the
  /// status the backend set on each (VERIFIED, NEEDS_REVIEW, REJECTED, …) and
  /// the expiry date read from the document.
  Future<ListWorkerDocumentsResponse> listWorkerDocuments({
    required String token,
    required String tenantId,
  }) {
    _checkInit();
    if (_documentClient == null) {
      throw StateError('DocumentServiceClient is not initialized.');
    }
    return _documentClient!.listWorkerDocuments(
      ListWorkerDocumentsRequest(tenantId: tenantId),
      options: _getCallOptions(token),
    );
  }

  /// DocumentService.DisplayDocument: a short-lived link to read one stored
  /// file, and its content_type. Only ever called with the signed-in worker's
  /// own keys (see withRememberedKeys); the server also refuses another
  /// worker's file.
  Future<DisplayDocumentResponse> displayDocument({
    required String token,
    required String objectKey,
  }) {
    _checkInit();
    if (_documentClient == null) {
      throw StateError('DocumentServiceClient is not initialized.');
    }
    return _documentClient!
        .displayDocument(
          DisplayDocumentRequest(objectKey: objectKey),
          options: _getCallOptions(token),
        )
        .timeout(const Duration(seconds: 15));
  }

  /// Registers a previous job so the compliance team can ask that employer
  /// for a reference. One call per job the worker listed.
  Future<RequestEmployerReferenceResponse> requestEmployerReference({
    required String token,
    required String tenantId,
    required String workerId,
    required String employerName,
    required String contactEmail,
    required String position,
    required String startDate,
    required String endDate,
  }) async {
    _checkInit();
    if (_employmentClient == null) {
      throw StateError('EmploymentServiceClient is not initialized.');
    }
    try {
      final req = RequestEmployerReferenceRequest(
        tenantId: tenantId,
        workerId: workerId,
        employerName: employerName,
        contactEmail: contactEmail,
        position: position,
        startDate: startDate,
        endDate: endDate,
      );
      return await _employmentClient!
          .requestEmployerReference(req, options: _getCallOptions(token));
    } catch (e, stack) {
      ErrorLogger.log('EmploymentService.RequestEmployerReference', e, stack);
      rethrow;
    }
  }

  /// Registers a degree or certificate the worker uploaded, so it can be
  /// verified against the awarding body.
  ///
  /// `documentId` is the id GenerateUploadURL issued for the file; the backend
  /// also accepts it empty. `storedPath` must be the object key issued to this
  /// worker.
  Future<SubmitQualificationResponse> submitQualification({
    required String token,
    required String tenantId,
    required String workerId,
    required QualificationType type,
    required String institution,
    required String storedPath,
    String contactEmail = '',
    String documentId = '',
  }) async {
    _checkInit();
    if (_qualificationClient == null) {
      throw StateError('QualificationServiceClient is not initialized.');
    }
    try {
      final req = SubmitQualificationRequest(
        tenantId: tenantId,
        workerId: workerId,
        documentId: documentId,
        qualificationType: type,
        institution: institution,
        storedPath: storedPath,
        contactEmail: contactEmail,
      );
      return await _qualificationClient!
          .submitQualification(req, options: _getCallOptions(token));
    } catch (e, stack) {
      ErrorLogger.log('QualificationService.SubmitQualification', e, stack);
      rethrow;
    }
  }

  /// Reads an uploaded, confirmed CV PDF and suggests jobs and qualifications.
  /// Nothing is saved server-side. `workerId` stays empty for the worker's own
  /// token — the backend uses the caller; the bucket is fixed server-side.
  Future<ParseCvResponse> parseCv({
    required String token,
    required String storedPath,
  }) async {
    _checkInit();
    if (_qualificationClient == null) {
      throw StateError('QualificationServiceClient is not initialized.');
    }
    try {
      return await _qualificationClient!.parseCv(
        ParseCvRequest(storedPath: storedPath),
        options: _getCallOptions(token),
      );
    } catch (e, stack) {
      ErrorLogger.log('QualificationService.ParseCv', e, stack);
      rethrow;
    }
  }

  void _checkInit() {
    if (!_isInitialized) {
      throw StateError(
          'The connection is not ready yet. Please try again.');
    }
  }

  /// Release resources and shutdown open channels
  Future<void> shutdown() async {
    await _gatewayChannel?.shutdown();
    await _platformDirectChannel?.shutdown();
    await _workerDirectChannel?.shutdown();
    await _biometricDirectChannel?.shutdown();

    _gatewayChannel = null;
    _platformDirectChannel = null;
    _workerDirectChannel = null;
    _biometricDirectChannel = null;

    _platformClient = null;
    _workerClient = null;
    _biometricClient = null;
    _documentClient = null;

    _isInitialized = false;
    debugPrint('🔌 Cypurge gRPC Service Shutdown Complete.');
  }
}
