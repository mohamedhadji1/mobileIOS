import 'dart:async';
import 'package:app_links/app_links.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../utils/error_logger.dart';
import 'cypurge_grpc_service.dart';
import '../generated/risk/v1/risk.pb.dart';
import '../generated/risk/v1/risk.pbenum.dart';
import '../generated/worker/v1/worker.pbenum.dart';

class EnrollmentService {
  static final EnrollmentService _instance = EnrollmentService._internal();
  factory EnrollmentService() => _instance;
  EnrollmentService._internal();

  final _storage = const FlutterSecureStorage();
  final _appAuth = const FlutterAppAuth();
  final _appLinks = AppLinks();

  String get _apiBaseUrl => AppConfig.apiBaseUrl; 
  String get apiBaseUrl => _apiBaseUrl;
  static const _keycloakClientId = 'workertrust-mobile';
  static const _keycloakRedirectUri = 'com.workertrust.app://oauth2redirect';

  StreamSubscription? _sub;

  void initDeepLinkListener(Function(String token, String tenant) onTokenReceived) async {
    // 1. Check initial link (cold start)
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleUri(initialUri, onTokenReceived);
      }
    } catch (e, stack) {
      ErrorLogger.log('Enrollment Service - Get Initial Deep Link', e, stack);
    }

    // 2. Listen for incoming links (resume)
    _sub = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleUri(uri, onTokenReceived);
      }
    }, onError: (err, stack) {
      ErrorLogger.log('Enrollment Service - Deep Link Stream Error', err, stack);
    });
  }

  void _handleUri(Uri uri, Function(String token, String tenant) onTokenReceived) {
    if (uri.scheme == 'workertrust' && uri.host == 'enroll') {
      final token = uri.queryParameters['token'];
      final tenant = uri.queryParameters['tenant'];
      if (token != null && tenant != null) {
        onTokenReceived(token, tenant);
      }
    }
  }

  Future<void> clearLocalStorage() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'id_token');
    await _storage.delete(key: 'worker_id');
    await _storage.delete(key: 'tenant_id');
    await _storage.delete(key: 'tenant_slug');
    await _storage.delete(key: 'cypurge_worker_name');
    await _storage.delete(key: 'cypurge_enrolled');
    await _storage.delete(key: 'doc_uploaded_passport');
    await _storage.delete(key: 'doc_uploaded_id_front');
    await _storage.delete(key: 'doc_uploaded_id_back');
    await _storage.delete(key: 'doc_uploaded_license_front');
    await _storage.delete(key: 'doc_uploaded_license_back');
    debugPrint('🧹 Local secure storage cleared.');
  }

  Future<Map<String, dynamic>> validateToken(String token, String tenant) async {
    try {
      debugPrint('👤 gRPC: Validating token via CypurgeGrpcService.validateInvitation');
      final grpcService = CypurgeGrpcService();

      // Ensure grpc service is initialized targeting the VM gateway
      grpcService.init(
        host: AppConfig.host,
        gatewayPort: 30050,
        useGateway: true,
      );

      final response = await grpcService.validateInvitation(
        token: token,
        tenant: tenant,
      ).timeout(const Duration(seconds: 15));

      return {
        'invitation_id': response.invitationId,
        // Keycloak realms are named by tenant SLUG (workertrust-{slug}), not the
        // tenant UUID. `response.tenantId` is the UUID, so keep the slug that
        // arrived on the QR/deep link for realm resolution.
        'tenant_slug': tenant,
        'status': response.status,
        'email': response.email,
      };
    } catch (e, stack) {
      ErrorLogger.log('Invitation Validation gRPC', e, stack);
      // Surface the real error so we can diagnose connection vs server issues
      if (e is Exception) {
        debugPrint('❌ Invitation validation failed: $e');
      }
      rethrow;
    }
  }

  /// Dynamically resolves the Keycloak realm from the tenant slug or ID
  /// that came with the invitation. No hardcoded mappings — every tenant
  /// gets its own realm: workertrust-{tenantSlug}.
  String _resolveRealm(String tenantSlugOrId) {
    return 'workertrust-$tenantSlugOrId';
  }

  static final _uuidRe = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
      caseSensitive: false);

  /// Resolves the real Keycloak realm for enrollment. The QR's `tenant` param
  /// is often the tenant UUID, which is NOT a realm name — building
  /// `workertrust-<uuid>` yields "Realm not found". Since the invited worker is
  /// auto-provisioned into the tenant's realm, discover that realm by finding
  /// the one whose users contain [email]. Non-UUID slugs keep the fast path.
  Future<String> _resolveRealmForEnrollment(
      String tenantSlugOrId, String email, String adminToken) async {
    if (!_uuidRe.hasMatch(tenantSlugOrId)) {
      return _resolveRealm(tenantSlugOrId);
    }
    const ep = AppConfig.keycloakHttpEndpoint;
    final realmsRes = await http.get(
      Uri.parse('$ep/admin/realms'),
      headers: {'Authorization': 'Bearer $adminToken'},
    );
    if (realmsRes.statusCode != 200) {
      throw Exception('Cannot list realms to resolve tenant: ${realmsRes.body}');
    }
    final realms = (jsonDecode(realmsRes.body) as List)
        .map((r) => (r as Map)['realm'] as String)
        .where((r) => r.startsWith('workertrust-'))
        .toList();
    for (final r in realms) {
      final u = await http.get(
        Uri.parse(
            '$ep/admin/realms/$r/users?email=${Uri.encodeQueryComponent(email)}&exact=true'),
        headers: {'Authorization': 'Bearer $adminToken'},
      );
      if (u.statusCode == 200 && (jsonDecode(u.body) as List).isNotEmpty) {
        debugPrint('🌐 Resolved tenant realm by email: $r');
        return r;
      }
    }
    throw Exception(
        'No Keycloak realm contains $email — invitation not provisioned?');
  }

  /// Builds the full Keycloak service configuration for the given tenant.
  AuthorizationServiceConfiguration _buildKeycloakConfig(
      String tenantSlugOrId) {
    final realm = _resolveRealm(tenantSlugOrId);
    const keycloakEndpoint = AppConfig.keycloakEndpoint;
    const keycloakHttpEndpoint = AppConfig.keycloakHttpEndpoint;

    debugPrint('🌐 Keycloak realm resolved: $realm');

    return AuthorizationServiceConfiguration(
      authorizationEndpoint:
          '$keycloakEndpoint/realms/$realm/protocol/openid-connect/auth',
      tokenEndpoint:
          '$keycloakHttpEndpoint/realms/$realm/protocol/openid-connect/token',
      endSessionEndpoint:
          '$keycloakEndpoint/realms/$realm/protocol/openid-connect/logout',
    );
  }

  Future<void> loginAndCreateWorker(String invitationId, String tenantSlug) async {
    String? accessToken;
    String? refreshToken;
    String? idToken;
    String? keycloakUserId;
    // The real tenant UUID from the id_token's tenant_id claim. `tenantSlug` is
    // only the Keycloak realm slug — token refresh needs the slug, but downstream
    // gRPC services require the UUID, so both are persisted separately.
    String? tenantIdClaim;

    try {
      debugPrint('🔐 Starting Keycloak OIDC PKCE for tenant: $tenantSlug');

      // Realm and URLs are fully derived from the tenant in the invitation
      final serviceConfig = _buildKeycloakConfig(tenantSlug);

      final result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          _keycloakClientId,
          _keycloakRedirectUri,
          serviceConfiguration: serviceConfig,
          scopes: ['openid', 'profile', 'email'],
          promptValues: const ['login'],
          additionalParameters: {
            'invitation_id': invitationId,
          },
          allowInsecureConnections: true,
        ),
      );

      accessToken = result.accessToken;
      refreshToken = result.refreshToken;
      idToken = result.idToken;

      // Extract keycloak_user_id (sub claim) from id_token
      if (idToken != null) {
        final parts = idToken.split('.');
        if (parts.length == 3) {
          final payload = parts[1];
          final normalized = base64Url.normalize(payload);
          final decoded = utf8.decode(base64Url.decode(normalized));
          final claims = jsonDecode(decoded);
          keycloakUserId = claims['sub'];
          final tid = claims['tenant_id'];
          if (tid != null) {
            tenantIdClaim = tid is List ? tid.first.toString() : tid.toString();
            debugPrint('✅ Tenant ID (from token): $tenantIdClaim');
          }
          debugPrint('✅ Keycloak user ID: $keycloakUserId');
        }
      }

      keycloakUserId ??= 'unknown-keycloak-id';
      debugPrint('✅ Keycloak OIDC PKCE succeeded. Access token obtained.');

    } catch (e, stack) {
      ErrorLogger.log('Keycloak Authentication (PKCE Flow)', e, stack);
      throw Exception('Identity verification failed: $e');
    }

    // ── STEP 2: Secure token storage ──
    try {
      await _storage.delete(key: 'worker_id'); // Clear any old worker ID
      await _storage.write(
          key: 'tenant_id', value: tenantIdClaim ?? tenantSlug);
      // Persist the realm slug separately — token refresh needs the slug, not
      // the tenant UUID, to resolve the correct Keycloak realm.
      await _storage.write(key: 'tenant_slug', value: tenantSlug);
      if (accessToken != null) {
        await _storage.write(key: 'access_token', value: accessToken);
      }
      if (refreshToken != null) {
        await _storage.write(key: 'refresh_token', value: refreshToken);
      }
      if (idToken != null) {
        await _storage.write(key: 'id_token', value: idToken);
      }
      debugPrint('✅ OIDC Tokens and tenant stored securely. Worker creation deferred to enrollment.');
    } catch (e, stack) {
      ErrorLogger.log('Enrollment Service - Token Storage Failure', e, stack);
    }
  }

  /// Returns a valid bearer token for backend gRPC calls.
  ///
  /// Deliberately returns the **id_token**, not the access_token: the backend
  /// OIDC verifier requires the token audience to contain "workertrust-mobile",
  /// and Keycloak only puts the client id in the id_token's `aud` (access tokens
  /// get `aud: ["account"]`, which fails verification).
  Future<String?> getValidAccessToken() async {
    final idToken = await _storage.read(key: 'id_token');
    if (idToken == null) {
      // Legacy sessions with no id_token: fall back to the access token.
      return await _storage.read(key: 'access_token');
    }

    try {
      final parts = idToken.split('.');
      if (parts.length == 3) {
        final payload = parts[1];
        final normalized = base64Url.normalize(payload);
        final decoded = utf8.decode(base64Url.decode(normalized));
        final claims = jsonDecode(decoded);
        debugPrint('🎟️ Current OIDC Token Claims: app_role=${claims['app_role']}, worker_id=${claims['worker_id']}, sub=${claims['sub']}');
        
        // Self-healing: if worker is enrolled locally but worker_id claim is missing/mismatched,
        // trigger syncUser and refresh the token to retrieve the claim.
        final localWorkerId = await _storage.read(key: 'worker_id');
        if (claims['worker_id'] == null && localWorkerId != null) {
          debugPrint('⚠️ Token is missing worker_id claim but worker is enrolled locally ($localWorkerId). Running self-healing sync...');
          try {
            final grpcService = CypurgeGrpcService();
            grpcService.init(useGateway: true);
            await grpcService.syncUser(token: idToken);
            // Do NOT overwrite worker_id with syncUser.userId — that is the
            // app_users id, NOT the worker-service worker_id that RegisterDevice
            // and document upload query (using it causes "worker not found").
            // The worker_id is owned solely by the enroll flow (EnrollWorker).
            await refreshAccessToken();
            // Read the newly refreshed token
            final refreshedToken = await _storage.read(key: 'id_token');
            if (refreshedToken != null) {
              return refreshedToken;
            }
          } catch (syncErr) {
            debugPrint('⚠️ Self-healing sync failed: $syncErr');
          }
        }

        final exp = claims['exp'] as int?;
        if (exp != null) {
          final expMs = exp * 1000;
          final nowMs = DateTime.now().millisecondsSinceEpoch;
          // Refresh if expired or expiring within 10 seconds
          if (nowMs >= expMs - 10000) {
            debugPrint('🔑 ID token expired or expiring soon. Refreshing...');
            await refreshAccessToken();
            // refreshAccessToken persists the new id_token; return it.
            return await _storage.read(key: 'id_token');
          }
        }
      }
    } catch (e, stack) {
      ErrorLogger.log('Enrollment Service - Decode ID Token Failure', e, stack);
    }

    return idToken;
  }

  /// Extracts the `worker_id` claim from a JWT (no network calls).
  ///
  /// The backend's document self-confirm check compares the worker segment of
  /// the upload object key against this exact claim. Building the object key
  /// from the locally stored worker_id (issued by EnrollWorker) can diverge
  /// from the token's worker_id (app_users.id), which causes ConfirmUpload to
  /// fall through to the `document:confirm` RBAC check and fail. Always derive
  /// the upload worker id from this claim so the two values match.
  String? workerIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final payload =
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      final claims = jsonDecode(payload) as Map<String, dynamic>;
      final workerId = claims['worker_id'];
      if (workerId is String && workerId.isNotEmpty) return workerId;
      return null;
    } on FormatException {
      return null;
    }
  }

  /// Returns the best bearer token for document gRPC calls.
  ///
  /// The backend reads `claims.WorkerID` from whichever token is sent as the
  /// bearer, and its document self-confirm check requires that claim. The
  /// id_token does not always carry `worker_id`, but the OAuth access_token
  /// does (the Keycloak mapper sets `access.token.claim=true`). So prefer a
  /// token that actually contains the `worker_id` claim: try the (self-healed)
  /// id_token first, then the access_token, and fall back to the id_token.
  Future<String?> getDocumentBearerToken() async {
    final idToken = await getValidAccessToken();
    final accessToken = await _storage.read(key: 'access_token');

    // Diagnostic: show exactly what worker_id each token carries.
    debugPrint('🔎 [doc-token] id_token.worker_id='
        '${idToken != null ? _claimsDebug(idToken) : "<no id_token>"}');
    debugPrint('🔎 [doc-token] access_token.worker_id='
        '${accessToken != null ? _claimsDebug(accessToken) : "<no access_token>"}');

    if (idToken != null && workerIdFromToken(idToken) != null) return idToken;
    if (accessToken != null && workerIdFromToken(accessToken) != null) {
      return accessToken;
    }

    return idToken;
  }

  /// Returns a short string of the auth-relevant claims in a JWT for logging.
  String _claimsDebug(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return '<not-a-jwt>';
      final payload =
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      final claims = jsonDecode(payload) as Map<String, dynamic>;
      return 'worker_id=${claims['worker_id']}, app_role=${claims['app_role']}, '
          'aud=${claims['aud']}, azp=${claims['azp']}';
    } on FormatException {
      return '<decode-failed>';
    }
  }

  Future<String?> refreshAccessToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) {
      debugPrint('⚠️ Refresh token not found. Cannot refresh.');
      return null;
    }

    // A persisted session is required to refresh. (The realm slug is also kept
    // in storage for per-tenant realm resolution where applicable.)
    final tenantSlug = await _storage.read(key: 'tenant_slug') ??
        await _storage.read(key: 'tenant_id');
    if (tenantSlug == null) {
      debugPrint('⚠️ tenant slug not found in storage. Cannot refresh token.');
      return null;
    }

    try {
      final serviceConfig = _buildKeycloakConfig(tenantSlug);

      final result = await _appAuth.token(
        TokenRequest(
          _keycloakClientId,
          _keycloakRedirectUri,
          serviceConfiguration: serviceConfig,
          refreshToken: refreshToken,
          scopes: ['openid', 'profile', 'email'],
          allowInsecureConnections: true,
        ),
      );

      if (result.accessToken != null) {
        await _storage.write(key: 'access_token', value: result.accessToken);
        if (result.refreshToken != null) {
          await _storage.write(key: 'refresh_token', value: result.refreshToken);
        }
        if (result.idToken != null) {
          await _storage.write(key: 'id_token', value: result.idToken);
        }
        debugPrint('✅ Access token successfully refreshed.');
        return result.accessToken;
      }
    } catch (e, stack) {
      ErrorLogger.log('Token Refresh', e, stack);
      await clearLocalStorage();
    }
    return null;
  }

  Future<void> logVerification({
    required String type,
    required String status,
    required double score,
    required double lat,
    required double lon,
  }) async {
    debugPrint('📝 Verification Log (Local Only): type=$type, status=$status, score=$score, lat=$lat, lon=$lon');
  }

  /// Single source of truth for the worker_id. Returns the stored id, else
  /// resolves it via PlatformService.SyncUser (for a worker, the returned
  /// user_id IS the worker_id) and caches it. Used by document upload + device
  /// registration so they never fall back to a bogus id.
  Future<String?> resolveWorkerId() async {
    final stored = await _storage.read(key: 'worker_id');
    if (stored != null && stored.isNotEmpty) return stored;

    final token = await getValidAccessToken();
    if (token == null) return null;
    try {
      final grpc = CypurgeGrpcService()..init(useGateway: true);
      await grpc.syncUser(token: token);
      // EnrollWorker returns the worker-service worker_id (idempotent on the
      // keycloak identity). SyncUser's user_id is the app_users id and is NOT
      // valid for RegisterDevice / document upload.
      final tenantId = await _storage.read(key: 'tenant_id') ??
          '00000000-0000-0000-0000-000000000001';
      final res = await grpc.enrollWorker(
        token: token,
        tenantId: tenantId,
        surname: 'Hadji',
        givenNames: 'Mohamed',
        nationality: 'Algerian',
        profileType: ProfileType.PROFILE_TYPE_PERMANENT,
      );
      final id = res.workerId;
      if (id.isNotEmpty) {
        await _storage.write(key: 'worker_id', value: id);
        return id;
      }
    } catch (e) {
      debugPrint('⚠️ resolveWorkerId failed: $e');
    }
    return null;
  }

  Future<Map<String, dynamic>> getWorkerStatus() async {
    final token = await getValidAccessToken();
    // Prefer the worker_id from the token claim. The locally stored worker_id
    // (from EnrollWorker) can diverge from the token's worker_id (app_users.id)
    // that documents/biometrics are recorded under, so querying the stored one
    // reads a different worker and shows a stale/PENDING status.
    final workerId =
        (token != null ? workerIdFromToken(token) : null) ??
            await _storage.read(key: 'worker_id');
    final tenantId = await _storage.read(key: 'tenant_id') ?? '00000000-0000-0000-0000-000000000001';

    if (token == null) throw 'Not logged in';
    if (workerId == null) {
      return {
        'status_title': 'NOT ENROLLED',
        'status_color': 'amber',
        'scanned_at': DateTime.now().toIso8601String(),
        'factors': [
          'MISSING: Face liveness scan',
          'PENDING: Identity document upload'
        ],
      };
    }

    final grpcService = CypurgeGrpcService();
    grpcService.init(useGateway: true);

    try {
      final res = await grpcService.getRiskAssessment(
        token: token,
        workerId: workerId,
        tenantId: tenantId,
      );

      String color = 'amber';
      if (res.trafficLight == TrafficLight.TRAFFIC_LIGHT_GREEN) {
        color = 'green';
      } else if (res.trafficLight == TrafficLight.TRAFFIC_LIGHT_RED) {
        color = 'red';
      }

      String title = res.status;
      if (res.trafficLight == TrafficLight.TRAFFIC_LIGHT_GREEN) {
        title = 'VERIFIED';
      } else if (res.trafficLight == TrafficLight.TRAFFIC_LIGHT_RED) {
        title = 'SUSPENDED';
      } else if (title.isEmpty) {
        title = 'PENDING';
      }

      final factorsList = res.factors.map((f) {
        final isNegative = f.signal == 'INVALID' || f.signal == 'MISSING' || f.signal == 'PENDING';
        final prefix = isNegative ? 'PENDING' : 'VERIFIED';
        return '$prefix: ${f.description}';
      }).toList();

      if (factorsList.isEmpty) {
        factorsList.add('VERIFIED: Profile synchronized with Keycloak');
      }

      // Append document upload status
      const docIds = {
        'passport': 'Passport',
        'id_front': 'National ID (Front)',
        'id_back': 'National ID (Back)',
        'license_front': "Driver's License (Front)",
        'license_back': "Driver's License (Back)",
      };
      for (final entry in docIds.entries) {
        final uploaded = await _storage.read(key: 'doc_uploaded_${entry.key}');
        if (uploaded == 'true') {
          factorsList.add('VERIFIED: ${entry.value} uploaded');
        } else {
          factorsList.add('MISSING: ${entry.value} not uploaded');
        }
      }

      return {
        'status_title': title,
        'status_color': color,
        'scanned_at': DateTime.now().toIso8601String(),
        'factors': factorsList,
      };
    } catch (e, stack) {
      ErrorLogger.log('Get Worker Risk Status', e, stack);
      return {
        'status_title': 'PENDING',
        'status_color': 'amber',
        'scanned_at': DateTime.now().toIso8601String(),
        'factors': [
          'PENDING: Risk calculation in progress',
          'PENDING: Real-time checks'
        ],
      };
    }
  }

  Future<void> registerAndLoginWorkerNatively({
    required String invitationId,
    required String tenantSlug,
    required String email,
    required String password,
  }) async {
    // 1. Get Keycloak Admin Access Token
    final adminToken = await _getKeycloakAdminToken();
    
    // 2. Create the user in the tenant's Keycloak realm. The QR may carry the
    // tenant UUID (not a realm) — resolve the real realm by the invited email.
    final realm = await _resolveRealmForEnrollment(tenantSlug, email, adminToken);
    final realmSlug = realm.startsWith('workertrust-')
        ? realm.substring('workertrust-'.length)
        : realm;
    const keycloakHttpEndpoint = AppConfig.keycloakHttpEndpoint;
    
    final createUserUrl = Uri.parse('$keycloakHttpEndpoint/admin/realms/$realm/users');
    debugPrint('Native Keycloak: Creating user at $createUserUrl');
    
    // Use the full email as the username so it matches both the ROPC login
    // below (which sends `email`) and the invitation auto-provisioned user.
    final username = email;
    final createUserResponse = await http.post(
      createUserUrl,
      headers: {
        'Authorization': 'Bearer $adminToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'enabled': true,
        'emailVerified': true,
        'credentials': [
          {
            'type': 'password',
            'value': password,
            'temporary': false,
          }
        ],
      }),
    );

    if (createUserResponse.statusCode != 201 && createUserResponse.statusCode != 409) {
      throw Exception('Failed to create Keycloak user: ${createUserResponse.body}');
    }

    // If the user already exists (auto-provisioned when the invitation was
    // created, with a default password), reset their password to the one the
    // worker just chose — otherwise the ROPC login below fails with
    // "invalid_grant: Invalid user credentials".
    if (createUserResponse.statusCode == 409) {
      final lookupUrl = Uri.parse(
          '$keycloakHttpEndpoint/admin/realms/$realm/users?email=${Uri.encodeQueryComponent(email)}&exact=true');
      final lookupRes = await http.get(lookupUrl,
          headers: {'Authorization': 'Bearer $adminToken'});
      if (lookupRes.statusCode == 200) {
        final users = jsonDecode(lookupRes.body) as List;
        if (users.isNotEmpty) {
          final userId = users.first['id'];
          final resetRes = await http.put(
            Uri.parse(
                '$keycloakHttpEndpoint/admin/realms/$realm/users/$userId/reset-password'),
            headers: {
              'Authorization': 'Bearer $adminToken',
              'Content-Type': 'application/json',
            },
            body: jsonEncode(
                {'type': 'password', 'value': password, 'temporary': false}),
          );
          if (resetRes.statusCode == 204) {
            debugPrint('✅ Native Keycloak: reset password for existing user $userId');
          } else {
            debugPrint('⚠️ Native Keycloak: password reset returned ${resetRes.statusCode}: ${resetRes.body}');
          }
        }
      }
    }

    // 3. Resolve OIDC token via Resource Owner Password Credentials (ROPC) grant
    final tokenUrl = Uri.parse('$keycloakHttpEndpoint/realms/$realm/protocol/openid-connect/token');
    debugPrint('Native Keycloak: Obtaining OIDC tokens from $tokenUrl');
    
    final tokenResponse = await http.post(
      tokenUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'client_id': _keycloakClientId,
        'grant_type': 'password',
        'username': email,
        'password': password,
        'scope': 'openid profile email',
      },
    );

    if (tokenResponse.statusCode != 200) {
      throw Exception('Failed to authenticate natively with Keycloak: ${tokenResponse.body}');
    }

    final tokenData = jsonDecode(tokenResponse.body);
    final accessToken = tokenData['access_token'] as String?;
    final refreshToken = tokenData['refresh_token'] as String?;
    final idToken = tokenData['id_token'] as String?;
    
    String? tenantIdClaim;

    // Extract claims from id_token
    if (idToken != null) {
      final parts = idToken.split('.');
      if (parts.length == 3) {
        final payload = parts[1];
        final normalized = base64Url.normalize(payload);
        final decoded = utf8.decode(base64Url.decode(normalized));
        final claims = jsonDecode(decoded);
        final tid = claims['tenant_id'];
        if (tid != null) {
          tenantIdClaim = tid is List ? tid.first.toString() : tid.toString();
        }
      }
    }

    // Save tokens securely
    await _storage.delete(key: 'worker_id');
    await _storage.write(key: 'tenant_id', value: tenantIdClaim ?? realmSlug);
    // Persist the RESOLVED realm suffix (not the raw QR value, which may be the
    // tenant UUID) so token refresh rebuilds the correct realm.
    await _storage.write(key: 'tenant_slug', value: realmSlug);
    
    if (accessToken != null) {
      await _storage.write(key: 'access_token', value: accessToken);
    }
    if (refreshToken != null) {
      await _storage.write(key: 'refresh_token', value: refreshToken);
    }
    if (idToken != null) {
      await _storage.write(key: 'id_token', value: idToken);
    }
    
    debugPrint('✅ Native credentials registered and OIDC tokens securely saved.');
  }

  Future<String> _getKeycloakAdminToken() async {
    const keycloakHttpEndpoint = AppConfig.keycloakHttpEndpoint;
    final url = Uri.parse('$keycloakHttpEndpoint/realms/master/protocol/openid-connect/token');
    
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'password',
        'client_id': 'admin-cli',
        'username': AppConfig.keycloakUsername,
        'password': AppConfig.keycloakPassword,
      },
    );
    
    if (response.statusCode != 200) {
      throw Exception('Failed to obtain Keycloak admin token: ${response.body}');
    }
    
    final data = jsonDecode(response.body);
    return data['access_token'] as String;
  }

  void dispose() {
    _sub?.cancel();
  }
}
