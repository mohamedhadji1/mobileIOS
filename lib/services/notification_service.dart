import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../utils/error_logger.dart';

/// Local Gotify push client (UnifiedPush transport) with auto-provisioning.
///
/// On [initialize] the app attempts to auto-register a client token against the
/// local Gotify instance using default credentials, then opens a WebSocket stream.
class NotificationService {
  static final NotificationService _instance =
      NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  /// Global key so notifications can navigate from anywhere in the app.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _storage = const FlutterSecureStorage();

  WebSocket? _socket;
  StreamSubscription? _sub;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _started = false;

  /// Notification type → in-app route.
  static const Map<String, String> _routes = {
    'task_assigned': '/tasks',
    'status_changed': '/status',
    'document_expiring': '/status',
    'reverification_required': '/reverify',
  };

  /// Connect to local Gotify and start receiving push notifications.
  Future<void> initialize() async {
    if (_started) return;
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      debugPrint('🔔 Test environment detected — skipping push connection.');
      return;
    }
    _started = true;
    await _connectLocalGotify();
  }

  Future<void> _connectLocalGotify() async {
    try {
      // 1. Get or auto-provision the client token from local Gotify
      String? token = await _storage.read(key: 'gotify_client_token');
      if (token == null || token.isEmpty) {
        debugPrint('🔑 Gotify token not found. Attempting auto-registration at ${AppConfig.gotifyHttpEndpoint}...');
        token = await _autoRegister();
        if (token == null || token.isEmpty) {
          debugPrint('⚠️ Gotify auto-registration failed. Push notifications are disabled (use the dashboard simulator button to test).');
          return;
        }
        await _storage.write(key: 'gotify_client_token', value: token);
        debugPrint('✅ Gotify client token auto-provisioned successfully.');
      }

      // 2. Establish WebSocket stream connection
      final base = Uri.parse(AppConfig.gotifyHttpEndpoint);
      final wsScheme = base.scheme == 'https' ? 'wss' : 'ws';
      final url = '$wsScheme://${base.authority}/stream?token=$token';

      debugPrint('🔌 Connecting to local Gotify stream: $url');
      _socket = await WebSocket.connect(url).timeout(const Duration(seconds: 10));
      _reconnectAttempts = 0;
      debugPrint('✅ Gotify stream connected.');

      _sub = _socket!.listen(
        _onMessage,
        onDone: _scheduleReconnect,
        onError: (e) => _scheduleReconnect(),
        cancelOnError: true,
      );
    } catch (e, stack) {
      ErrorLogger.log('NotificationService - Gotify connect', e, stack);
      _scheduleReconnect();
    }
  }

  /// Automatically requests a client token from Gotify using default credentials.
  Future<String?> _autoRegister() async {
    try {
      // Default credentials are admin / admin
      const credentials = 'admin:admin';
      final bytes = utf8.encode(credentials);
      final base64Credentials = base64.encode(bytes);

      const url = '${AppConfig.gotifyHttpEndpoint}/client';
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Basic $base64Credentials',
        },
        body: jsonEncode({
          'name': 'cypurge-mobile-app',
          'description': 'Auto-registered cypurge client',
        }),
      ).timeout(const Duration(seconds: 5));

      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        return data['token'] as String?;
      } else {
        debugPrint('⚠️ Gotify registration returned status code: ${res.statusCode}');
      }
    } catch (e) {
      debugPrint('⚠️ Gotify auto-registration endpoint unreachable: $e');
    }
    return null;
  }

  void _scheduleReconnect() {
    _sub?.cancel();
    _socket = null;
    if (_reconnectTimer?.isActive ?? false) return;
    _reconnectAttempts++;
    final delay = Duration(seconds: (5 * _reconnectAttempts).clamp(5, 120));
    debugPrint('🔁 Gotify reconnecting in ${delay.inSeconds}s…');
    _reconnectTimer = Timer(delay, _connectLocalGotify);
  }

  void _onMessage(dynamic data) {
    try {
      final msg = jsonDecode(data as String) as Map<String, dynamic>;
      final title = (msg['title'] as String?) ?? 'Notification';
      final body = (msg['message'] as String?) ?? '';
      
      final extras = (msg['extras'] as Map<String, dynamic>?) ?? const {};
      final type = (extras['cypurge::type'] ?? extras['type'] ?? msg['type'])?.toString();

      final route = _routes[type] ?? _routeFromTitle(title);
      _show(title, body, route, {'type': type ?? 'push', ...extras});
    } catch (e, stack) {
      ErrorLogger.log('NotificationService - parse message', e, stack);
    }
  }

  String? _routeFromTitle(String title) {
    final t = title.toLowerCase();
    if (t.contains('re-verif') || t.contains('reverif')) return '/reverify';
    if (t.contains('task')) return '/tasks';
    if (t.contains('status') || t.contains('suspend')) return '/status';
    return null;
  }

  void _show(
      String title, String body, String? route, Map<String, dynamic> extras) {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    displayInfoBar(
      context,
      builder: (context, close) => InfoBar(
        title: Text(title),
        content: Text(body),
        severity: InfoBarSeverity.info,
        action: route == null
            ? IconButton(icon: const Icon(FluentIcons.clear), onPressed: close)
            : Button(
                onPressed: () {
                  close();
                  _navigate(route, extras);
                },
                child: const Text('Open'),
              ),
      ),
    );
  }

  void _navigate(String route, Map<String, dynamic> extras) {
    navigatorKey.currentState?.pushNamed(route, arguments: {
      'type': extras['cypurge::type'] ?? extras['type'] ?? 'push',
      ...extras,
    });
  }

  Future<void> disconnect() async {
    _reconnectTimer?.cancel();
    await _sub?.cancel();
    await _socket?.close();
    _socket = null;
    _started = false;
  }

  // ── Local simulation helpers (dev/testing; kept for the Home screen) ──

  /// Simulates an incoming push that routes to a specific screen.
  void simulateIncomingNotification(String routeName,
      {Map<String, dynamic>? arguments}) {
    Future.delayed(const Duration(seconds: 1), () {
      debugPrint('🔔 (Sim) Incoming push → $routeName');
      final context = navigatorKey.currentContext;
      if (context != null) {
        displayInfoBar(
          context,
          builder: (context, close) => InfoBar(
            title: const Text('Push Notification Received!'),
            content: Text('Routing to $routeName…'),
            severity: InfoBarSeverity.info,
            action: IconButton(
                icon: const Icon(FluentIcons.clear), onPressed: close),
          ),
        );
        Future.delayed(const Duration(milliseconds: 1500), () {
          navigatorKey.currentState
              ?.pushNamed(routeName, arguments: arguments);
        });
      } else {
        debugPrint('Cannot route: Navigator context is null.');
      }
    });
  }

  /// Simulates a document re-verification task (US-031-2): the analyst flagged
  /// specific expired/bad documents and the worker must re-upload them before a
  /// deadline.
  void simulateFaceCheckRequest() {
    simulateIncomingNotification('/reverify', arguments: {
      'type': 'reverification_required',
      'message':
          'Your Passport and National ID were flagged as expired. Please '
          're-upload them before the deadline.',
      'deadline_days': 3,
      'flagged_documents': ['Passport', 'National ID (Front)'],
    });
  }
}
