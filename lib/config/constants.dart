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

  // PostgreSQL Database
  static const String databaseEndpoint = '$host:31199'; // Protocol Port
  static const String databaseHttpConsole = 'http://$host:30081'; // Web console
  static const String databaseUsername = 'postgres';
  static const String databasePassword = 'Pass1234';
  static const String databaseName = 'postgres';

  // MinIO Storage
  static const String minioApiEndpoint = 'http://$host:30090';
  static const String minioConsoleEndpoint = 'http://$host:30091';
  static const String minioUsername = 'admin';
  static const String minioPassword = 'Pass1234';

  // Valkey Cache
  static const String valkeyHost = host;
  static const int valkeyPort = 30379;
  static const String valkeyPassword = 'Pass1234';
  static const String valkeyEndpoint = '$valkeyHost:$valkeyPort';

  // Gotify Push Notifications (UnifiedPush transport — no Firebase)
  // M17 dispatches push via Gotify; the mobile app opens a /stream WebSocket.
  static const String gotifyHttpEndpoint = 'http://$host:30084';
  // Per-device Gotify client token used to authenticate the /stream socket.
  // Provisioned at push registration; leave empty to disable push until set.
  static const String gotifyClientToken = '';

  // ntfy.sh public push notification service (replaces Gotify locally)
  static const String ntfyTopic = 'cypurge_alerts_dev_68492';
  static const String ntfyWsEndpoint = 'wss://ntfy.sh';
  static const String ntfyHttpEndpoint = 'https://ntfy.sh';

  // Keycloak & Identity Realmed URL (OIDC Issuer prefix)
  // Browser-based OIDC authorization opens in a system browser tab, which
  // resolves the hostname and handles the HTTP→HTTPS redirect + cert (Keycloak
  // redirects IP requests to this canonical hostname anyway).
  static const String keycloakEndpoint = 'https://keycloak.workertrust.local:32675';
  // Programmatic token exchange / direct login uses Dart's HTTP client, which
  // rejects the self-signed cert — so use plain HTTP to the node IP.
  static const String keycloakHttpEndpoint = 'http://$host:30082';
  static const String keycloakIssuer = '$keycloakEndpoint/realms';
  static const String keycloakUsername = 'admin';
  static const String keycloakPassword = 'KeycloakAdmin12345';

  // Security & Graph Database Endpoints
  static const String openBaoEndpoint = useLocalhostProxy
      ? 'http://127.0.0.1:30200'
      : 'http://192.168.51.30:30200';
  static const String openBaoToken = 's.LOk6WBTarqisihic3vJYj3By';

  // Neo4j Database
  static const String neo4jHttpEndpoint = 'http://192.168.51.37:30474';
  static const String neo4jBoltEndpoint = 'bolt://192.168.51.37:30687';
  static const String neo4jUsername = 'neo4j';
  static const String neo4jPassword = 'Pass1234';

  // OpenSearch Endpoint
  static const String opensearchEndpoint = 'https://$host:30920/';
  static const String opensearchUsername = 'admin';
  static const String opensearchPassword = 'OpenSearch_Admin123!';

  // Jenkins Credentials
  static const String jenkinsUsername = 'admin';
  static const String jenkinsPassword = 'ChangeMe_Jenkins12345';
}
