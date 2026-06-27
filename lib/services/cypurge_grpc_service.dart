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
import '../config/constants.dart';
import '../utils/error_logger.dart';

/// Comprehensive gRPC and OIDC Client for the WorkerTrust Identity Flow.
///
/// Implements the following sequence:
/// 1. Direct OIDC token retrieval (Keycloak password grant) or PKCE.
/// 2. Profile Sync via [PlatformService.SyncUser].
/// 3. Worker Enrollment via [WorkerService.EnrollWorker] to obtain a worker_id.
/// 4. Face Enrollment via [BiometricService.EnrollFace] using local face hash.
/// 5. Biometric Sign-in/Verification via [BiometricService.SearchCollisions].
class CypurgeGrpcService {
  static final CypurgeGrpcService _instance =
      CypurgeGrpcService._internal();
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
  void init({
    String? host,
    int gatewayPort = defaultGatewayPort,
    int platformPort = defaultPlatformPort,
    int workerPort = defaultWorkerPort,
    int biometricPort = defaultBiometricPort,
    bool useGateway = true,
  }) {
    final activeHost = host ?? AppConfig.host;

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
    } else {
      debugPrint('📡 Initializing direct gRPC channels:');
      debugPrint('  - Platform Service: $activeHost:$platformPort');
      debugPrint('  - Worker Service: $activeHost:$workerPort');
      debugPrint('  - Biometric Service: $activeHost:$biometricPort');

      _gatewayChannel =
          ClientChannel(activeHost, port: gatewayPort, options: channelOptions);
      _platformDirectChannel =
          ClientChannel(activeHost, port: platformPort, options: channelOptions);
      _workerDirectChannel =
          ClientChannel(activeHost, port: workerPort, options: channelOptions);
      _biometricDirectChannel =
          ClientChannel(activeHost, port: biometricPort, options: channelOptions);

      _platformClient = PlatformServiceClient(_platformDirectChannel!);
      _workerClient = WorkerServiceClient(_workerDirectChannel!);
      _biometricClient = BiometricServiceClient(_biometricDirectChannel!);
      _riskClient = RiskServiceClient(_gatewayChannel!);
      _documentClient = DocumentServiceClient(_gatewayChannel!);
    }

    _isInitialized = true;
  }

  /// Helper to generate call options with JWT Authorization metadata
  CallOptions _getCallOptions(String token) {
    return CallOptions(
      metadata: {'authorization': 'Bearer $token'},
      timeout: const Duration(seconds: 15),
    );
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
      debugPrint('👤 Calling WorkerService.ValidateInvitation (Tenant: $tenant, Token: $token)...');
      final request = ValidateInvitationRequest()
        ..token = token
        ..tenant = tenant;

      final response = await _workerClient!.validateInvitation(
        request,
      );
      debugPrint('✅ ValidateInvitation Succeeded. Invitation ID: ${response.invitationId}');
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
        ..profileType = profileType;

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
      debugPrint('📱 Calling WorkerService.RegisterDevice (Worker: $workerId)...');
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
      debugPrint('🔍 Sign-In: Using stored enrollment hash for identity lookup...');
      debugPrint('🧬 Stored Enrollment Hash (SHA-256): $embeddingHash');

      final request = SearchCollisionsRequest()..embeddingHash = embeddingHash;

      debugPrint('📡 Querying BiometricService.SearchCollisions (stored hash)...');
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
      debugPrint('🛡️ Calling RiskService.GetRiskAssessment (WorkerID: $workerId, TenantID: $tenantId)...');
      final request = GetRiskAssessmentRequest()
        ..workerId = workerId
        ..tenantId = tenantId;

      final response = await _riskClient!.getRiskAssessment(
        request,
        options: _getCallOptions(token),
      );
      debugPrint('✅ GetRiskAssessment Succeeded. Traffic Light: ${response.trafficLight}, Status: ${response.status}');
      return response;
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
      );
      return await _documentClient!.generateUploadURL(req, options: _getCallOptions(token));
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
      return await _documentClient!.confirmUpload(req, options: _getCallOptions(token));
    } catch (e, stack) {
      // The processing workflow can finalize on its own (MinIO upload webhook)
      // before this explicit confirm arrives. Signalling an already-finished
      // workflow is harmless — the document is uploaded + persisted — so treat
      // it as success instead of failing the whole upload.
      if (e is GrpcError &&
          (e.message?.contains('already completed') ?? false)) {
        debugPrint('ℹ️ ConfirmUpload: workflow already finalized — treating as success.');
        return ConfirmUploadResponse();
      }
      ErrorLogger.log('DocumentService.ConfirmUpload', e, stack);
      rethrow;
    }
  }

  void _checkInit() {
    if (!_isInitialized) {
      throw StateError(
          'CypurgeGrpcService is not initialized. Please call init() first.');
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
