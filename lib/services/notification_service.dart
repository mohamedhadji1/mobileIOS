import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/constants.dart';
import '../theme/app_widgets.dart';
import '../utils/decision_note.dart';
import '../utils/error_logger.dart';
import 'cypurge_grpc_service.dart';
import 'device_identity_service.dart';
import 'enrollment_service.dart';
import 'notification_inbox.dart';

/// Receives worker push notifications over Gotify and renders them.
///
/// TRANSPORT — path D (backend hand-off 2026-08-07 rev 2)
/// -----------------------------------------------------
/// Each worker gets their own Gotify **user**. The backend holds that user's
/// *application* token to send, and hands this app the user's *client* token,
/// which is receive-only — it can stream this worker's messages and cannot
/// originate one. So nothing forgeable ships on the device, and a worker can
/// only ever see their own notifications.
///
/// [initialize] takes that client token and opens a WebSocket to Gotify's
/// `/stream`, reconnecting with a backoff when the socket drops.
///
/// KNOWN LIMIT: the socket lives in this process, so nothing arrives *live*
/// while the app is killed — path D has no background wake path (that was
/// UnifiedPush's one advantage, and it needed a second app installed). Gotify
/// retains messages, so [_catchUp] pulls the recent page on every connect and
/// renders whatever came in while the socket was down. The worker still sees a
/// missed alert only when they next open the app, but they do see it.
///
/// Arriving messages are posted to the OS notification shade, and additionally
/// drawn as an in-app snackbar when the app happens to be in front. It used to
/// be in-app only, which meant a notification was shown exactly when the
/// worker was already looking at the app and dropped in every other case.
class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  /// Global key so notifications can navigate from anywhere in the app.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final _storage = const FlutterSecureStorage();

  final _local = FlutterLocalNotificationsPlugin();
  bool _localReady = false;

  WebSocket? _socket;
  StreamSubscription? _sub;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _started = false;
  bool _connecting = false;

  /// Highest Gotify message id already rendered. Mirrored to secure storage
  /// under [_kLastSeenId] so it survives the process, which is the whole point:
  /// the messages worth recovering are the ones sent while the app was dead.
  int _lastSeenId = 0;

  /// Notification type → in-app route. Every type the backend can send must
  /// appear here; [_routeFromTitle] is only a fallback for an unknown type and
  /// matches English words, so it stops working the moment titles are
  /// translated.
  static const Map<String, String> _routes = {
    // ── The backend dispatcher's 8 types (hand-off rev 2 §7) ──
    // UPPER_SNAKE, unlike the lower_snake keys below, and matched verbatim —
    // the map lookup is case-sensitive, so the existing lowercase entries never
    // matched anything the dispatcher actually sends.
    'TRUST_STATUS_CHANGED': '/status',
    'REVERIFICATION_DUE': '/reverify',
    'DOCUMENT_EXPIRING': '/documents',
    'CASE_OPENED': '/status',
    'APPEAL_DECIDED': '/status',
    'ENROLLMENT_REJECTED': '/status',
    // The hand-off listed these two as "defined but never sent". They ARE sent
    // now: HR approving an enrollment review emits ENROLLMENT_APPROVED, which
    // is the whole point of the dashboard no longer pushing directly.
    'ENROLLMENT_APPROVED': '/status',
    'SANCTIONS_CLEARED': '/status',
    // No /qualifications or /references screen yet, so /status — where the
    // resulting trust colour shows up.
    'QUALIFICATION_RESULT': '/status',
    'REFERENCE_RESULT': '/status',

    // ── Dashboard direct-send types (NextJs/src/lib/push.ts) and types the
    //    backend may add later. Kept lower_snake because that is what those
    //    senders emit. ──
    // Enrollment
    'enrollment_approved': '/status',
    'enrollment_rejected': '/status',
    'enrollment_incomplete': '/enroll',
    // Re-verification
    'reverification_required': '/reverify',
    'reverification_due_soon': '/reverify',
    'reverification_overdue': '/reverify',
    'reverification_passed': '/status',
    'reverification_failed': '/reverify',
    'face_reverification_required': '/verify-face',
    // Documents — these route to /documents, not /status: the Docs tab is a
    // real screen now, and it is where the worker fixes the problem.
    'document_expiring': '/documents',
    'document_expired': '/documents',
    'document_rejected': '/documents',
    'document_verified': '/documents',
    'document_required': '/documents',
    'document_upload_failed': '/documents',
    // Status, risk, account
    'traffic_light_changed': '/status',
    'status_changed': '/status',
    'account_suspended': '/status',
    'account_reinstated': '/status',
    'account_deletion_scheduled': '/status',
    'account_deletion_cancelled': '/status',
    'case_appeal_resolved': '/status',
    // Device and telemetry
    'telemetry_device_unbound': '/status',
    'telemetry_stalled': '/status',
    'telemetry_permission_lost': '/status',
    'device_registered_new': '/status',
    'device_removed': '/status',
    // Security
    'password_changed': '/profile',
    'password_reset_requested': '/profile',
    'login_new_device': '/status',
    'session_revoked': '/status',
    // Work
    'task_assigned': '/tasks',
    'task_due_soon': '/tasks',
    'task_overdue': '/tasks',
    'deployment_changed': '/tasks',
    'deployment_starting_soon': '/tasks',
    'deployment_cancelled': '/tasks',
    'site_access_revoked': '/tasks',
  };

  /// Priorities >= this land in the high-importance channel: heads-up banner,
  /// sound, vibration. Below it the notification arrives quietly.
  ///
  /// 7, not 8. The backend's catalogue (hand-off §8) puts `Re-verification due`
  /// and `Document expiring` at exactly 7 and asks for >= 7 to interrupt; at a
  /// threshold of 8 both of those — the two the worker is on a deadline for —
  /// arrived silently.
  static const int _highPriorityThreshold = 7;

  // Android fixes a channel's importance when it is created; a user can lower
  // it but the app cannot raise it. Renaming these ids resets that preference,
  // so treat them as permanent.
  static const String _channelHigh = 'cypurge_urgent';
  static const String _channelNormal = 'cypurge_updates';

  /// Connect to local Gotify and start receiving push notifications.
  ///
  /// Safe to call from every authenticated screen — the [_started] guard makes
  /// repeat calls free. It is deliberately NOT called at app startup any more:
  /// a per-worker client token cannot exist before the worker has logged in.
  Future<void> initialize() async {
    if (_started) {
      // Already running, but the socket may be down with a backoff pending —
      // up to 120s of it. A worker who just opened a screen is here NOW, so
      // connect now rather than making them wait the timer out.
      if (_socket == null && !_connecting) unawaited(_connectLocalGotify());
      return;
    }
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      debugPrint('🔔 Test environment detected — skipping push connection.');
      return;
    }
    _started = true;
    await _initLocalNotifications();
    await _connectLocalGotify();
  }

  /// Prepare the OS notification channels and ask for permission.
  ///
  /// Never throws: a worker who declines the permission prompt should still get
  /// the in-app snackbar and, more importantly, should still have a working app.
  Future<void> _initLocalNotifications() async {
    // Both bindBackgroundHandlers() and initialize() need the channels, and in
    // the foreground both run. Re-creating them is harmless but re-prompts for
    // permission, so do it once per isolate.
    if (_localReady) return;
    try {
      await _local.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          ),
        ),
        onDidReceiveNotificationResponse: _onNotificationTap,
      );

      // Android 13+ gates notifications behind a runtime grant. Without this
      // the post() call below succeeds and the system silently shows nothing.
      final android = _local.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      await android?.requestNotificationsPermission();

      // Two channels so a suspended account can interrupt while a task
      // assignment cannot. Importance is fixed at creation time on Android —
      // changing it later needs a new channel id, so get it right here.
      await android?.createNotificationChannel(const AndroidNotificationChannel(
        _channelHigh,
        'Urgent',
        description: 'Account, security and verification alerts.',
        importance: Importance.high,
      ));
      await android?.createNotificationChannel(const AndroidNotificationChannel(
        _channelNormal,
        'Updates',
        description: 'Documents, tasks and status updates.',
        importance: Importance.defaultImportance,
      ));

      _localReady = true;
    } catch (e, stack) {
      ErrorLogger.log(
          'NotificationService - local notifications init', e, stack);
    }
  }

  /// Worker tapped a notification in the shade. The payload is the route,
  /// or a JSON envelope carrying the route plus the screen's arguments — see
  /// [encodePayload].
  void _onNotificationTap(NotificationResponse response) {
    final payload = response.payload;
    if (payload == null || payload.isEmpty) return;
    final decoded = decodePayload(payload);
    _navigate(decoded.route, decoded.args);
  }

  static const _kClientToken = 'gotify_client_token';
  static const _kStreamUrl = 'gotify_stream_url';

  /// This worker's receive-only Gotify credential.
  ///
  /// Cached after the first successful provision, because
  /// `ProvisionPushTarget` is idempotent but still a network round trip on a
  /// screen the worker is waiting on. Returns null when push cannot be set up
  /// at all, which is a real state — ops may not have enabled provisioning yet
  /// (`FAILED_PRECONDITION`) — and the caller reports it rather than retrying
  /// forever.
  Future<({String clientToken, String streamUrl})?> _pushCredentials() async {
    final cached = await _storage.read(key: _kClientToken);
    if (cached != null && cached.isNotEmpty) {
      return (
        clientToken: cached,
        streamUrl: await _storage.read(key: _kStreamUrl) ?? '',
      );
    }

    final workerId = await _storage.read(key: 'worker_id');
    if (workerId == null || workerId.isEmpty) {
      debugPrint(
          '🔑 Cannot provision push: no worker_id yet (pre-enrollment).');
      return _devOverride();
    }

    final token = await EnrollmentService().getValidAccessToken() ??
        await _storage.read(key: 'access_token') ??
        '';
    if (token.isEmpty) {
      debugPrint('🔑 Cannot provision push: no access token yet.');
      return _devOverride();
    }

    // Same fingerprint RegisterDevice used — the backend matches on
    // `fingerprint_hash` and answers NOT_FOUND for anything else.
    final deviceId = await DeviceIdentityService().getDeviceId();

    final grpc = CypurgeGrpcService()..init(useGateway: true);
    final provisioned = await grpc.provisionPushTarget(
      token: token,
      workerId: workerId,
      deviceId: deviceId,
    );
    if (provisioned == null) return _devOverride();

    await _storage.write(key: _kClientToken, value: provisioned.clientToken);
    await _storage.write(key: _kStreamUrl, value: provisioned.streamUrl);
    return provisioned;
  }

  /// Dev-only escape hatch: `--dart-define=GOTIFY_CLIENT_TOKEN=gtfyc.…`.
  ///
  /// Empty by default and deliberately so. This used to carry a baked-in
  /// default belonging to Gotify's **admin** user, which could read every
  /// worker's messages — the exact leak path D exists to close. A token now
  /// only reaches the device by being provisioned for that one worker.
  ({String clientToken, String streamUrl})? _devOverride() {
    const token = AppConfig.gotifyClientToken;
    if (token.isEmpty) return null;
    debugPrint(
        '🔑 Using the --dart-define dev client token (not provisioned).');
    return (clientToken: token, streamUrl: '');
  }

  Future<void> _connectLocalGotify() async {
    _connecting = true;
    try {
      // 1. This worker's receive-only client token, provisioned by the backend.
      final creds = await _pushCredentials();
      if (creds == null) {
        debugPrint('⚠️ No Gotify client token available — push is disabled. '
            'ProvisionPushTarget failed and no token was cached.');
        return;
      }

      // 2. Establish the WebSocket stream.
      //
      // The backend returns the canonical `wss://gotify.workertrust.local/…`,
      // which cannot be dialled from a handset: `.local` is the mDNS-reserved
      // TLD (RFC 6762) so the lookup goes to multicast DNS and hangs, and the
      // ingress cert is self-signed by "WorkerTrust Internal CA", which Dart's
      // WebSocket.connect rejects. Hand-off §8 leaves this workaround to us:
      // dial the node IP over ws:// and put the canonical hostname in the Host
      // header, which is what actually selects Gotify at the ingress (verified:
      // IP alone → 500, IP + header → 101).
      //
      // The Host value is taken from the URL the backend returned rather than
      // hardcoded, so moving Gotify to another hostname needs no app release.
      final base = Uri.parse(AppConfig.gotifyHttpEndpoint);
      final wsScheme = base.scheme == 'https' ? 'wss' : 'ws';
      final streamHost = Uri.tryParse(creds.streamUrl)?.host;
      final hostHeader = (streamHost == null || streamHost.isEmpty)
          ? AppConfig.gotifyIngressHost
          : streamHost;
      final url =
          '$wsScheme://${base.authority}/stream?token=${creds.clientToken}';

      // Log the host, never the full URL: Gotify takes its client token as a
      // query parameter, so printing $url puts that credential into logcat.
      debugPrint(
          '🔌 Connecting to Gotify stream: $wsScheme://${base.authority}/stream '
          '(Host: $hostHeader)');
      _socket = await WebSocket.connect(
        url,
        headers: {'Host': hostHeader},
      ).timeout(const Duration(seconds: 10));

      // Without this the socket is never proven alive. A carrier/NAT idle
      // timeout tears the TCP path down with no FIN, so `onDone` never fires
      // and the app sits "connected" to a dead pipe receiving nothing, forever
      // — no reconnect, no error, no log. Dart pings on this interval and
      // closes the socket when the pong does not come back, which is what
      // actually gets _scheduleReconnect called.
      _socket!.pingInterval = const Duration(seconds: 30);
      _reconnectAttempts = 0;
      debugPrint('✅ Gotify stream connected.');

      _sub = _socket!.listen(
        _onMessage,
        onDone: _scheduleReconnect,
        onError: (e) => _scheduleReconnect(),
        cancelOnError: true,
      );

      // The stream only carries what is published while it is open. Anything
      // sent while the app was killed, dozing, or behind that dead NAT binding
      // never reaches this socket, so pull it over HTTP.
      unawaited(_catchUp(creds.clientToken, hostHeader));
    } catch (e, stack) {
      ErrorLogger.log('NotificationService - Gotify connect', e, stack);
      _scheduleReconnect();
    } finally {
      _connecting = false;
    }
  }

  static const _kLastSeenId = 'gotify_last_seen_id';

  /// Render anything Gotify accepted while this app was not listening.
  ///
  /// `?since=` is NOT the parameter for this: in Gotify it means "id LESS than
  /// this", it pages backwards into history. So fetch the newest page and keep
  /// what is past the high-water mark.
  ///
  /// Dialled by IP with an explicit Host header for the same reason the
  /// WebSocket is — the ingress routes by name and answers 500 without it.
  Future<void> _catchUp(String clientToken, String hostHeader) async {
    final client = HttpClient();
    try {
      final base = Uri.parse(AppConfig.gotifyHttpEndpoint);
      final stored = int.tryParse(await _storage.read(key: _kLastSeenId) ?? '');
      if (stored != null && stored > _lastSeenId) _lastSeenId = stored;

      final req = await client
          .getUrl(
              base.replace(path: '/message', queryParameters: {'limit': '100'}))
          .timeout(const Duration(seconds: 10));
      req.headers.host = hostHeader;
      req.headers.set('X-Gotify-Key', clientToken);
      final res = await req.close().timeout(const Duration(seconds: 10));
      if (res.statusCode != HttpStatus.ok) {
        debugPrint('⚠️ Gotify catch-up got HTTP ${res.statusCode}; skipping.');
        await res.drain<void>();
        return;
      }

      final decoded = jsonDecode(await res.transform(utf8.decoder).join());
      final messages =
          ((decoded as Map<String, dynamic>)['messages'] as List<dynamic>? ??
              const []);
      if (messages.isEmpty) return;

      // Newest first, ids monotonic.
      final newest = (messages.first as Map<String, dynamic>)['id'] as num?;

      // First run on this device: adopt the high-water mark silently. Replaying
      // a hundred historic alerts into the shade is worse than missing them,
      // but the bell screen should still list them.
      if (stored == null) {
        for (final msg in messagesAfter(messages, 0)) {
          _dispatch(msg, silent: true);
        }
        if (newest != null) await _markSeen(newest.toInt());
        return;
      }

      final missed = messagesAfter(messages, _lastSeenId);
      for (final msg in missed) {
        _dispatch(msg);
      }
      if (missed.isNotEmpty) {
        debugPrint(
            '📬 Gotify catch-up replayed ${missed.length} missed message(s).');
      }
    } catch (e, stack) {
      ErrorLogger.log('NotificationService - catch-up fetch', e, stack);
    } finally {
      client.close();
    }
  }

  /// Pick the messages past [lastSeenId] out of a Gotify `/message` page and
  /// return them **oldest-first**, which is the order they should reach the
  /// shade in. Gotify serves the page newest-first.
  ///
  /// Split out from [_catchUp] so the filter and the ordering are testable
  /// without a socket, an HTTP server, or secure storage.
  @visibleForTesting
  static List<Map<String, dynamic>> messagesAfter(
      List<dynamic> newestFirst, int lastSeenId) {
    return newestFirst
        .whereType<Map<String, dynamic>>()
        .where((m) => ((m['id'] as num?)?.toInt() ?? 0) > lastSeenId)
        .toList()
        .reversed
        .toList();
  }

  /// Advance the high-water mark. Monotonic, so a live message arriving mid
  /// catch-up cannot make an older one replay.
  Future<void> _markSeen(int id) async {
    if (id <= _lastSeenId) return;
    _lastSeenId =
        id; // synchronous: the guard above holds for callers in a loop
    await _storage.write(key: _kLastSeenId, value: id.toString());
  }

  // _autoRegister() used to live here. It POSTed to /client with Gotify's admin
  // username and password compiled into the APK, so anyone who unzipped the
  // build owned the notification server. It had also been dead since the server
  // moved off its default password — every call came back 401, which is why the
  // log stopped at "attempting auto-registration" and push silently never ran.
  // Credentials come from ProvisionPushTarget now; see [_pushCredentials].

  /// Reconnect attempts before assuming the cached token is the problem.
  static const int _reprovisionAfterAttempts = 3;

  void _scheduleReconnect() {
    _sub?.cancel();
    _socket = null;
    if (_reconnectTimer?.isActive ?? false) return;
    _reconnectAttempts++;

    // A revoked or rotated client token fails the handshake every time, and a
    // pure backoff would retry it until the app is killed. After a few failures
    // drop the cached copy so the next attempt re-provisions — the backend RPC
    // is idempotent, so a still-valid token simply comes back unchanged.
    if (_reconnectAttempts == _reprovisionAfterAttempts) {
      debugPrint('🔁 Discarding the cached client token after '
          '$_reconnectAttempts failed connects — will re-provision.');
      unawaited(_storage.delete(key: _kClientToken));
      unawaited(_storage.delete(key: _kStreamUrl));
    }

    final delay = Duration(seconds: (5 * _reconnectAttempts).clamp(5, 120));
    debugPrint('🔁 Gotify reconnecting in ${delay.inSeconds}s…');
    _reconnectTimer = Timer(delay, _connectLocalGotify);
  }

  void _onMessage(dynamic data) {
    try {
      _dispatch(jsonDecode(data as String) as Map<String, dynamic>);
    } catch (e, stack) {
      ErrorLogger.log('NotificationService - parse message', e, stack);
    }
  }

  /// Render one decoded notification, and keep it for the bell screen.
  /// [silent] only keeps it: no shade, no banner, no side effects.
  void _dispatch(Map<String, dynamic> msg, {bool silent = false}) {
    // Mark before rendering, so the next connect's catch-up does not replay a
    // message this one already showed.
    final id = (msg['id'] as num?)?.toInt();
    if (id != null) unawaited(_markSeen(id));

    final title = (msg['title'] as String?) ?? 'Notification';
    // `message` is deliberately PII-free (hand-off §6) — it is what Android
    // renders on the lock screen. The identifying detail is in `cypurge::data`
    // and must only ever be shown behind the app's own screens.
    final body = (msg['message'] as String?) ?? '';

    final extras = (msg['extras'] as Map<String, dynamic>?) ?? const {};
    final type =
        (extras['cypurge::type'] ?? extras['type'] ?? msg['type'])?.toString();

    final priority = (msg['priority'] as num?)?.toInt() ?? 0;

    final route = _routes[type] ?? _routeFromTitle(title);

    // Flatten `cypurge::data` into the route arguments so a screen reads
    // `args['reason']` rather than digging through a nested map. Kept out of
    // [_postToShade], which only ever gets title/body.
    final data = extras['cypurge::data'];
    final Map<String, dynamic> detail =
        data is Map ? Map<String, dynamic>.from(data) : const {};
    final args = <String, dynamic>{
      'type': type ?? 'push',
      ...extras,
      ...detail
    };

    unawaited(NotificationInbox.instance.add(InboxItem(
      id: id,
      title: title,
      body: body,
      route: route,
      args: args,
      // Gotify's own timestamp, so a message replayed later keeps its time.
      receivedAt:
          DateTime.tryParse('${msg['date']}')?.toLocal() ?? DateTime.now(),
    )));
    if (silent) return;

    // A block's reason exists only inside this push. Keep it where the
    // suspended screen can show it, whether or not this notification is tapped.
    unawaited(const DecisionNoteStore().apply(type, detail));

    // The backend now sends ENROLLMENT_REJECTED at priority 8; this floor keeps
    // a block on the urgent channel for older deployments that still send 5.
    // Losing access to your job is not a quiet update.
    final effectivePriority =
        isBlockDecision(type, detail) && priority < _highPriorityThreshold
            ? _highPriorityThreshold
            : priority;

    _show(title, body, route, args, priority: effectivePriority);
  }

  /// Post to the OS notification shade, so the worker sees this whether or not
  /// the app is in front.
  Future<void> _postToShade(
      String title, String body, String? route, int priority,
      {Map<String, dynamic> args = const {}}) async {
    if (!_localReady) return;
    final high = priority >= _highPriorityThreshold;
    try {
      await _local.show(
        // Gotify ids are server-side and monotonic; the low 31 bits keep this
        // inside Android's int id and stop a new alert replacing an older one.
        DateTime.now().millisecondsSinceEpoch & 0x7fffffff,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            high ? _channelHigh : _channelNormal,
            high ? 'Urgent' : 'Updates',
            importance: high ? Importance.high : Importance.defaultImportance,
            priority: high ? Priority.high : Priority.defaultPriority,
            // The body is often a full sentence and the shade truncates it.
            styleInformation: BigTextStyleInformation(body),
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentSound: high,
            interruptionLevel: high
                ? InterruptionLevel.timeSensitive
                : InterruptionLevel.active,
          ),
        ),
        payload: encodePayload(route, args),
      );
    } catch (e, stack) {
      ErrorLogger.log('NotificationService - post to shade', e, stack);
    }
  }

  /// Route a notification by its title.
  ///
  /// This is the PRIMARY path, not a fallback. The backend dispatcher sends no
  /// `extras`, so [_routes] never matches on anything it emits and every one of
  /// its messages lands here. Each case below maps one title from the backend's
  /// catalogue (hand-off §8); before they were added, 6 of its 8 notification
  /// types opened nothing when tapped.
  ///
  /// It matches English words, so it breaks the moment titles are translated.
  /// The real fix is `cypurge::type` in extras — raised with the backend.
  String? _routeFromTitle(String title) {
    final t = title.toLowerCase();

    // "Action required: re-verification"
    if (t.contains('re-verif') || t.contains('reverif')) return '/reverify';
    // "Document expiring"
    if (t.contains('document')) return '/documents';
    // "Enrollment needs attention"
    if (t.contains('enrollment')) return '/status';
    // "A case was opened" / "Appeal decision"
    if (t.contains('case') || t.contains('appeal')) return '/status';
    // "Qualification update" / "Reference update" — no dedicated screen yet, so
    // /status, which is where a worker sees the resulting trust colour.
    if (t.contains('qualification') || t.contains('reference')) {
      return '/status';
    }
    if (t.contains('task')) return '/tasks';
    // "Trust status: RED"
    if (t.contains('status') || t.contains('suspend')) return '/status';
    return null;
  }

  void _show(
      String title, String body, String? route, Map<String, dynamic> extras,
      {int priority = 0}) {
    // Shade first, and unconditionally. The snackbar below needs a live
    // Navigator context, which does not exist while the app is backgrounded —
    // returning early on a null context is what used to swallow every message.
    // The screen arguments ride along in the shade payload too, so a tap on a
    // notification hours later still opens /reverify with its reason and
    // deadline rather than the generic defaults.
    unawaited(_postToShade(title, body, route, priority, args: extras));

    final context = navigatorKey.currentContext;
    if (context == null) return;
    wtInfoBar(
      context,
      title,
      message: body,
      actionLabel: route == null ? null : 'Open',
      onAction: route == null ? null : () => _navigate(route, extras),
    );
  }

  /// Shade payload: the bare route when there are no arguments (what every
  /// older notification already carries), else a JSON envelope. Anything that
  /// cannot be encoded degrades to the bare route rather than losing the tap.
  @visibleForTesting
  static String? encodePayload(String? route, Map<String, dynamic> args) {
    if (route == null || args.isEmpty) return route;
    try {
      return jsonEncode({'route': route, 'args': args});
    } catch (_) {
      return route;
    }
  }

  /// Inverse of [encodePayload]. A payload that is not our envelope — including
  /// malformed JSON — is treated as a plain route.
  @visibleForTesting
  static ({String route, Map<String, dynamic> args}) decodePayload(
      String payload) {
    if (payload.startsWith('{')) {
      try {
        final m = jsonDecode(payload);
        if (m is Map && m['route'] is String) {
          final a = m['args'];
          return (
            route: m['route'] as String,
            args: a is Map ? Map<String, dynamic>.from(a) : const {},
          );
        }
      } catch (_) {
        // fall through — not our envelope
      }
    }
    return (route: payload, args: const {});
  }

  /// Worker-facing in-app security warning (airplane mode, WiFi/SIM change).
  /// Shows only when the app UI is up — background changes are still reported
  /// to the backend by BackgroundSignalService regardless.
  void showSecurityAlert(String title, String body) {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    wtInfoBar(context, title, message: body, severity: WTSeverity.warning);
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
      if (context != null && context.mounted) {
        wtInfoBar(context, 'Push Notification Received!',
            message: 'Routing to $routeName…', severity: WTSeverity.info);
        Future.delayed(const Duration(milliseconds: 1500), () {
          navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
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
