import 'dart:async';
import 'package:app_links/app_links.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart' show GrpcError, StatusCode;
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../utils/error_logger.dart';
import 'cypurge_grpc_service.dart';
import 'notification_inbox.dart';
import '../generated/risk/v1/risk.pb.dart';
import '../generated/risk/v1/risk.pbenum.dart';

/// Raised when an operation needs a signed-in worker and there isn't one.
///
/// Exists so callers can separate "this device has no session" from "the backend
/// is unreachable". Those demand opposite responses: the first must deny access,
/// the second may safely degrade. Collapsing them into one bare `catch` is what
/// let ApprovalGate wave unauthenticated callers through.
class AuthRequiredException implements Exception {
  const AuthRequiredException([this.message = 'Not authenticated']);
  final String message;
  @override
  String toString() => message;
}

/// Account provisioning reported success, but signing in with the password the
/// worker just chose was rejected — the password never landed on the account.
///
/// The backend derives the Keycloak username from the email's LOCAL PART, so
/// `someone@a.com` and `someone@b.com` both become username `someone`. It then
/// treats the resulting HTTP 409 as success while discarding the credentials it
/// posted. A brand-new invitation therefore still lands here whenever that local
/// part is already taken in the tenant's realm: the account it "created" is
/// somebody else's, with somebody else's password.
///
/// The worker cannot guess that password and the app holds no admin rights to
/// change it, so the only honest move left is a self-service reset.
/// Keycloak refused the email + password. Also raised for an email with no
/// organisation, so a sign-in never reveals which emails have accounts.
class WrongCredentialsException implements Exception {
  const WrongCredentialsException();
  @override
  String toString() => 'Wrong email or password.';
}

/// Signed in, but the account is not a worker's (no worker_id in the token).
class NoWorkerAccountException implements Exception {
  const NoWorkerAccountException();
  @override
  String toString() =>
      'This account has no worker profile. Open your invitation link to sign up.';
}

class AccountPasswordNotAppliedException implements Exception {
  const AccountPasswordNotAppliedException({
    required this.email,
    required this.tenantId,
  });

  final String email;
  final String tenantId;

  @override
  String toString() =>
      'An account for $email already exists in this tenant and the password you '
      'chose was not applied to it. Reset the password to continue.';
}

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

  void initDeepLinkListener(
      Function(String token, String tenant) onTokenReceived) async {
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
      ErrorLogger.log(
          'Enrollment Service - Deep Link Stream Error', err, stack);
    });
  }

  void _handleUri(
      Uri uri, Function(String token, String tenant) onTokenReceived) {
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
    // Another worker may enroll on this phone next.
    await NotificationInbox.instance.clear();
    debugPrint('🧹 Local secure storage cleared.');
  }

  Future<Map<String, dynamic>> validateToken(
      String token, String tenant) async {
    try {
      debugPrint(
          '👤 gRPC: Validating token via CypurgeGrpcService.validateInvitation');
      final grpcService = CypurgeGrpcService();

      // Ensure grpc service is initialized targeting the VM gateway
      grpcService.init(
        host: AppConfig.host,
        gatewayPort: 30050,
        useGateway: true,
      );

      final response = await grpcService
          .validateInvitation(
            token: token,
            tenant: tenant,
          )
          .timeout(const Duration(seconds: 15));

      return {
        'invitation_id': response.invitationId,
        // Keycloak realms are named by tenant SLUG (workertrust-{slug}), not the
        // tenant UUID. `response.tenantId` is the UUID, so keep the slug that
        // arrived on the QR/deep link for realm resolution.
        'tenant_slug': tenant,
        // The authoritative tenant UUID. Required by CreateKeycloakUser and
        // ResolveRealm, which key on tenant_id — the QR's `tenant` param may be
        // either a slug or a UUID and cannot be trusted to be one.
        'tenant_id': response.tenantId,
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

  // _resolveRealmForEnrollment() was removed with the APK-embedded Keycloak
  // admin credentials — it enumerated every realm and searched each one's users
  // by email, which required realm-admin. platform.v1.ResolveRealm now answers
  // the same question server-side without leaking tenant existence.

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

  Future<void> loginAndCreateWorker(
      String invitationId, String tenantSlug) async {
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
      debugPrint(
          '✅ OIDC Tokens and tenant stored securely. Worker creation deferred to enrollment.');
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
        // Identifiers are diagnostic rather than secret, but debugPrint is not
        // stripped from release builds — keep them out of production logcat.
        if (kDebugMode) {
          debugPrint(
              '🎟️ Current OIDC Token Claims: app_role=${claims['app_role']}, worker_id=${claims['worker_id']}, sub=${claims['sub']}');
        }

        // Self-healing: if worker is enrolled locally but worker_id claim is missing/mismatched,
        // trigger syncUser and refresh the token to retrieve the claim.
        final localWorkerId = await _storage.read(key: 'worker_id');
        if (claims['worker_id'] == null && localWorkerId != null) {
          debugPrint(
              '⚠️ Token is missing worker_id claim but worker is enrolled locally ($localWorkerId). Running self-healing sync...');
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

    // Diagnostic: show exactly what worker_id each token carries. Debug-only —
    // debugPrint survives into release builds and these are real identifiers.
    if (kDebugMode) {
      debugPrint('🔎 [doc-token] id_token.worker_id='
          '${idToken != null ? _claimsDebug(idToken) : "<no id_token>"}');
      debugPrint('🔎 [doc-token] access_token.worker_id='
          '${accessToken != null ? _claimsDebug(accessToken) : "<no access_token>"}');
    }

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
          await _storage.write(
              key: 'refresh_token', value: result.refreshToken);
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
    debugPrint(
        '📝 Verification Log (Local Only): type=$type, status=$status, score=$score, lat=$lat, lon=$lon');
  }

  /// Single source of truth for the worker_id. Returns the stored id, else the
  /// worker_id claim from the access token. Does NOT re-enroll: enrollment
  /// happens once in the signup form with the worker's real identity. Used by
  /// document upload + device registration so they never fall back to a bogus id.
  Future<String?> resolveWorkerId() async {
    final stored = await _storage.read(key: 'worker_id');
    if (stored != null && stored.isNotEmpty) return stored;

    final token = await getValidAccessToken();
    if (token == null) return null;

    final claim = workerIdFromToken(token);
    if (claim != null && claim.isNotEmpty) {
      await _storage.write(key: 'worker_id', value: claim);
      return claim;
    }
    return null;
  }

  Future<Map<String, dynamic>> getWorkerStatus() async {
    final token = await getValidAccessToken();
    // Prefer the worker_id from the token claim. The locally stored worker_id
    // (from EnrollWorker) can diverge from the token's worker_id (app_users.id)
    // that documents/biometrics are recorded under, so querying the stored one
    // reads a different worker and shows a stale/PENDING status.
    final workerId = (token != null ? workerIdFromToken(token) : null) ??
        await _storage.read(key: 'worker_id');
    final tenantId = await _storage.read(key: 'tenant_id') ??
        '00000000-0000-0000-0000-000000000001';

    // Typed, not a bare String: ApprovalGate fails OPEN on transport errors so a
    // network blip doesn't lock a legitimate worker out. That is only safe if
    // "no session" is distinguishable from "backend unreachable" — otherwise an
    // unauthenticated caller is waved straight through the gate.
    if (token == null) throw const AuthRequiredException('Not logged in');
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

      // A worker with no risk_assessments row does NOT get a real assessment: the
      // backend answers with a synthetic default whose traffic light is GREEN and
      // whose status is "PENDING (Awaiting Signals)". Treating that as approved
      // waved an unassessed worker straight into the app — and ApprovalGate then
      // cached it — so trust GREEN only when the status is not still pending.
      // Trust PROVENANCE, not the status string. A real traffic-light decision
      // always carries who set it (ANALYST / RISK_ENGINE) and when. The backend
      // has two fail-open paths that both answer GREEN — no risk_assessments
      // row at all, and an assessment with no traffic_lights row — and both
      // leave set_by_module/set_at empty. Those two fields are therefore the
      // reliable "has anyone actually decided?" signal.
      //
      // The previous test was `!status.contains('PENDING')`, which conflated
      // that fail-open with a genuine decision whose status column simply was
      // never updated: AdjudicateWorker writes the colour but never touches
      // risk_assessments.status, so an approved worker reads GREEN + "PENDING"
      // forever and stayed locked out. See BACKEND_SYNC.md §17.
      final decided =
          res.setByModule.trim().isNotEmpty || res.setAt.trim().isNotEmpty;

      final light = res.trafficLight;
      final isRed = light == TrafficLight.TRAFFIC_LIGHT_RED;
      // GREEN clears outright. YELLOW is elevated risk, NOT a block — that
      // worker needs the app to reach their re-verification tasks, so gating
      // them behind this screen is the one thing that guarantees they can't
      // resolve it. RED is the block.
      final cleared = decided &&
          (light == TrafficLight.TRAFFIC_LIGHT_GREEN ||
              light == TrafficLight.TRAFFIC_LIGHT_YELLOW);

      String color = 'amber';
      if (cleared && light == TrafficLight.TRAFFIC_LIGHT_GREEN) {
        color = 'green';
      } else if (isRed) {
        color = 'red';
      }

      String title = res.status;
      if (isRed) {
        title = 'SUSPENDED';
      } else if (cleared) {
        title = light == TrafficLight.TRAFFIC_LIGHT_GREEN
            ? 'VERIFIED'
            : 'REVIEW REQUIRED';
      } else if (title.isEmpty) {
        title = 'PENDING';
      }

      final factorsList = res.factors.map((f) {
        final isNegative = f.signal == 'INVALID' ||
            f.signal == 'MISSING' ||
            f.signal == 'PENDING';
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
        // Whether the worker may use the app. Separate from status_color
        // because amber means two different things — "cleared but elevated"
        // and "no decision yet" — and only one of them should open the gate.
        'cleared': cleared,
        'scanned_at': DateTime.now().toIso8601String(),
        'factors': factorsList,
      };
    } catch (e, stack) {
      // An unreachable backend is not a status. Returning the PENDING block
      // below for a timeout made the app state, as fact, that a risk
      // calculation was running — when nothing had been reached at all. Report
      // it as what it is, and keep it out of the crash log: a timeout is an
      // expected condition on a phone, not a defect worth a stack trace.
      if (e is GrpcError &&
          (e.code == StatusCode.deadlineExceeded ||
              e.code == StatusCode.unavailable)) {
        debugPrint('getWorkerStatus: backend unreachable (${e.codeName})');
        return {
          'status_title': 'CANNOT REACH SERVER',
          'status_color': 'amber',
          'unreachable': true,
          'scanned_at': DateTime.now().toIso8601String(),
          'factors': [
            'PENDING: Your status could not be checked — no response from the server',
            'PENDING: Check your connection and try again',
          ],
        };
      }

      ErrorLogger.log('Get Worker Risk Status', e, stack);
      // A denial is not a pending approval. Reporting PERMISSION_DENIED as
      // "PENDING" made the app claim "Awaiting HR approval" for what was really
      // "this account may not read its own status" — the same screen for two
      // unrelated causes, which hid an RBAC gap for weeks. Keep them distinct.
      if (e is GrpcError && e.code == StatusCode.permissionDenied) {
        return {
          'status_title': 'STATUS UNAVAILABLE',
          'status_color': 'amber',
          'scanned_at': DateTime.now().toIso8601String(),
          'factors': [
            'BLOCKED: This account is not permitted to read its own status',
            'PENDING: Contact your compliance officer — approval cannot be confirmed here',
          ],
        };
      }
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

  /// Registers the worker in Keycloak and signs them in.
  ///
  /// SECURITY: this used to obtain a Keycloak MASTER ADMIN token using
  /// credentials compiled into the APK, then drive the Keycloak admin REST API
  /// (create user / search realms / reset password) directly from the device.
  /// Anyone who unzipped the APK got realm-admin over every tenant.
  ///
  /// Account creation and realm lookup are now both server-side RPCs:
  ///  * `platform.v1.CreateKeycloakUser` — auth-whitelisted, and on the
  ///    unauthenticated path the backend refuses to mint anything more
  ///    privileged than a worker/subcontractor_admin.
  ///  * `platform.v1.ResolveRealm` — auth-whitelisted realm lookup that does not
  ///    leak tenant existence.
  ///
  /// Only the ROPC login below still speaks to Keycloak directly, and that uses
  /// the worker's own credentials, never an admin's.
  ///
  /// Note this path is worker-only. `ValidateInvitation` provisions a Keycloak
  /// user for SUBCONTRACTOR invitations but deliberately not for worker ones
  /// ("the worker self-registers in Keycloak"), so there is no pre-existing
  /// account here and hence no password-reset branch to carry over.
  Future<void> registerAndLoginWorkerNatively({
    required String invitationId,
    required String tenantId,
    required String tenantSlug,
    required String email,
    required String password,
  }) async {
    final grpc = CypurgeGrpcService();
    grpc.init(useGateway: true);

    // 1. Create the account server-side. No admin credentials on the device.
    await grpc.createKeycloakUser(
      tenantId: tenantId,
      email: email,
      password: password,
      appRole: 'WORKER',
    );

    // 2. Resolve the realm for the ROPC login below. The QR's `tenant` param may
    // be a tenant UUID rather than a realm slug, so ask the backend.
    final realmRes = await grpc.resolveRealm(email: email, tenantId: tenantId);
    final realm = realmRes.keycloakRealmId.isNotEmpty
        ? realmRes.keycloakRealmId
        : _resolveRealm(tenantSlug);
    final realmSlug = realmRes.slug.isNotEmpty ? realmRes.slug : _slugOf(realm);

    // 3. Sign in with the chosen password.
    try {
      await _passwordLogin(
          realm: realm, realmSlug: realmSlug, email: email, password: password);
    } on WrongCredentialsException {
      // CreateKeycloakUser just reported success, so the account exists. If
      // Keycloak nonetheless rejects these exact credentials, the password was
      // never applied to it — see AccountPasswordNotAppliedException. Surface
      // that as a recoverable state, because there IS a way forward for the
      // worker (a password reset).
      throw AccountPasswordNotAppliedException(email: email, tenantId: tenantId);
    }
    debugPrint(
        '✅ Native credentials registered and OIDC tokens securely saved.');
  }

  /// Email + password sign-in for a worker who already has an account: a new
  /// phone, or a session that ran out. Throws [WrongCredentialsException] or
  /// [NoWorkerAccountException].
  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    final grpc = CypurgeGrpcService()..init(useGateway: true);
    final realmRes = await grpc.resolveRealm(email: email);
    // Unknown email: the backend answers empty, and so does this — never
    // "no such account".
    if (realmRes.keycloakRealmId.isEmpty) throw const WrongCredentialsException();
    await _passwordLogin(
      realm: realmRes.keycloakRealmId,
      realmSlug: realmRes.slug.isNotEmpty
          ? realmRes.slug
          : _slugOf(realmRes.keycloakRealmId),
      email: email,
      password: password,
    );
    if (await resolveWorkerId() == null) {
      await clearLocalStorage();
      throw const NoWorkerAccountException();
    }
  }

  static String _slugOf(String realm) => realm.startsWith('workertrust-')
      ? realm.substring('workertrust-'.length)
      : realm;

  /// Keycloak Resource Owner Password Credentials grant, then the session is
  /// stored the way every other sign-in stores it.
  Future<void> _passwordLogin({
    required String realm,
    required String realmSlug,
    required String email,
    required String password,
  }) async {
    const keycloakHttpEndpoint = AppConfig.keycloakHttpEndpoint;
    final tokenUrl = Uri.parse(
        '$keycloakHttpEndpoint/realms/$realm/protocol/openid-connect/token');
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
      if (tokenResponse.statusCode == 401 &&
          tokenResponse.body.contains('invalid_grant')) {
        throw const WrongCredentialsException();
      }
      throw Exception(
          'Failed to authenticate natively with Keycloak: ${tokenResponse.body}');
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
  }

  // _getKeycloakAdminToken() was removed with the APK-embedded Keycloak master
  // admin credentials. Account provisioning is now server-side via
  // platform.v1.CreateKeycloakUser — see registerAndLoginWorkerNatively.

  /// Asks Keycloak to email this address a password-reset link.
  ///
  /// The recovery for [AccountPasswordNotAppliedException]: the worker cannot
  /// sign in with the password they chose, and nothing on the device is allowed
  /// to overwrite the stored one, so hand control back to the account's owner
  /// via email. Requires no session — `ForgotPassword` is auth-whitelisted.
  Future<bool> sendPasswordReset({
    required String email,
    String tenantId = '',
  }) async {
    final grpc = CypurgeGrpcService();
    grpc.init(useGateway: true);
    final res = await grpc.forgotPassword(email: email, tenantId: tenantId);
    return res.success;
  }

  void dispose() {
    _sub?.cancel();
  }
}
