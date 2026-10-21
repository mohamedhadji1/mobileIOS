class AppConfig {
  // false = connect directly to the VM node over the network (phone must be on
  // the same LAN/WiFi as the node). true = route via 127.0.0.1 + adb reverse.
  static const bool useLocalhostProxy = false;

  /// The active host address for services on VM.
  static const String host = useLocalhostProxy ? '127.0.0.1' : '192.168.51.30';

  // Core API & gRPC Endpoints
  static const String apiBaseUrl =
      'http://$host:30050'; // Kong Gateway / Direct HTTP
  static const String grpcHost = host;
  static const int grpcPort = 30050; // Points to Unified Gateway

  // Unified VM Endpoints
  static const String gatewayEndpoint = '$host:30050';

  // Infrastructure credentials (Postgres/MinIO/Valkey/OpenBao/Neo4j/
  // OpenSearch/Jenkins) were removed 2026-07: the app never used them, and an
  // APK is trivially unzipped — never ship server credentials in mobile code.

  // Gotify Push Notifications (UnifiedPush transport — no Firebase)
  // M17 dispatches push via Gotify; the mobile app opens a /stream WebSocket.
  //
  // Reached through the cluster ingress, NOT the NodePort: 30084 is not
  // listening. The ingress is where Gotify actually answers (verified
  // 2026-08-07 — /version returns 3.0.0 over :80 and :443).
  //
  // Dialled by IP, exactly like the gRPC gateway above. Connecting by hostname
  // times out on device: `.local` is the mDNS-reserved TLD (RFC 6762), so
  // Android sends the lookup to multicast DNS, nothing answers, and the socket
  // hangs until the 10s timeout instead of failing fast. There is no hosts file
  // on Android — the entry that makes the name work on a dev laptop does not
  // exist on the phone.
  //
  // http, not https, on purpose: the ingress cert is self-signed by
  // "WorkerTrust Internal CA" and Dart's WebSocket.connect rejects it with a
  // HandshakeException. NotificationService derives ws:// from an http:// base.
  // ponytail: move to https once that CA is installed on the device.
  static const String gotifyHttpEndpoint = 'http://$host';

  /// Host header sent with every Gotify request. The ingress routes by name and
  /// answers 500 to an unknown Host, so dialling the IP without this reaches the
  /// right machine and the wrong (no) backend.
  static const String gotifyIngressHost = 'gotify.workertrust.local';

  // ntfy.sh public push notification service (replaces Gotify locally)
  static const String ntfyTopic = 'cypurge_alerts_dev_68492';
  static const String ntfyWsEndpoint = 'wss://ntfy.sh';
  static const String ntfyHttpEndpoint = 'https://ntfy.sh';

  /// Dev-only override for the Gotify `/stream` client token.
  ///
  /// **Empty by default, and it must stay that way.** The live path is
  /// `WorkerService.ProvisionPushTarget`, which issues a receive-only client
  /// token belonging to a Gotify user created for one worker. Nothing is
  /// compiled into the binary any more.
  ///
  /// The previous default was a real token belonging to Gotify's **admin**
  /// user, so every build could read every worker's notifications — the leak
  /// path D was adopted to close. Before that it was `_autoRegister()`, which
  /// shipped the admin username and password outright. Do not restore either:
  /// an APK unzips in seconds.
  ///
  /// For a build against an environment where provisioning is not enabled yet:
  ///   flutter run --dart-define=GOTIFY_CLIENT_TOKEN=gtfyc.xxxxx
  static const String gotifyClientToken =
      String.fromEnvironment('GOTIFY_CLIENT_TOKEN');

  // Keycloak & Identity Realmed URL (OIDC Issuer prefix)
  // Browser-based OIDC authorization opens in a system browser tab, which
  // resolves the hostname and handles the HTTP→HTTPS redirect + cert (Keycloak
  // redirects IP requests to this canonical hostname anyway).
  static const String keycloakEndpoint = 'https://keycloak.workertrust.local:32675';
  // Programmatic token exchange / direct login uses Dart's HTTP client, which
  // rejects the self-signed cert — so use plain HTTP to the node IP.
  static const String keycloakHttpEndpoint = 'http://$host:30082';
  static const String keycloakIssuer = '$keycloakEndpoint/realms';
  // The Keycloak MASTER ADMIN username/password that used to live here are GONE.
  // They were compiled into every APK, so unzipping the app yielded realm-admin
  // over every tenant.
  //
  // EnrollmentService.registerAndLoginWorkerNatively() now provisions the worker
  // account through platform.v1.CreateKeycloakUser and resolves the realm
  // through platform.v1.ResolveRealm, with the backend refusing to mint anything
  // above a worker role on the unauthenticated path. The device never holds admin
  // credentials again.
  //
  // BLOCKED until the backend ships the gateway fix: the PLATFORM service accepts
  // a token-less CreateKeycloakUser, but the GATEWAY (the only endpoint the phone
  // can reach) does not whitelist it, so enrollment fails with UNAUTHENTICATED
  // "authorization header is missing". ResolveRealm IS whitelisted at the gateway,
  // so only the account-creation call is affected. One-line fix + rationale:
  // BACKEND_HANDOFF_GETCHALLENGE.md §5 BLOCKING.
  //
  // ROTATE the old password if that has not already been done: it is in this
  // repository's git history and in every APK ever built from it.
}
