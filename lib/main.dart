import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:cypurge_mobile/screens/login_screen.dart';
import 'package:cypurge_mobile/screens/task_centre_screen.dart';
import 'package:cypurge_mobile/screens/status_screen.dart';
import 'package:cypurge_mobile/screens/document_upload_screen.dart';
import 'package:cypurge_mobile/screens/documents_screen.dart';
import 'package:cypurge_mobile/services/notification_service.dart';
import 'package:cypurge_mobile/screens/face_liveness_screen.dart';
import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import 'package:cypurge_mobile/screens/enrollment_qr_screen.dart';
import 'package:cypurge_mobile/screens/appeal_form_screen.dart';
import 'package:cypurge_mobile/screens/reverify_entry.dart';
import 'package:cypurge_mobile/screens/profile_screen.dart';
import 'package:cypurge_mobile/screens/pending_approval_screen.dart';
import 'package:cypurge_mobile/screens/face_relock_screen.dart';
import 'package:cypurge_mobile/screens/shift_card.dart';
import 'package:cypurge_mobile/services/device_identity_service.dart';
import 'package:cypurge_mobile/screens/worker_nav.dart';
import 'package:cypurge_mobile/screens/notifications_screen.dart';
import 'package:cypurge_mobile/screens/document_debug_screens.dart';
import 'package:cypurge_mobile/utils/document_debug_report.dart'
    show documentDebugReport;
import 'package:cypurge_mobile/services/enrollment_service.dart';
import 'package:cypurge_mobile/services/notification_inbox.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:cypurge_mobile/theme/theme_refresh.dart';
import 'package:cypurge_mobile/theme/theme_preference.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:cypurge_mobile/utils/profile_photo.dart';
import 'package:workmanager/workmanager.dart';
import 'package:cypurge_mobile/services/background_signal_service.dart';
import 'package:flutter/foundation.dart'
    show kDebugMode, defaultTargetPlatform, TargetPlatform;
import 'utils/error_humanizer.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case 'device-signal-collector':
        return await BackgroundSignalService().collectAndSendTelemetry();
      default:
        return true;
    }
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Edge to edge: the status bar (time, battery, notifications) and the
  // navigation bar stay on screen, and every screen keeps its content clear of
  // them with SafeArea. Camera screens go full screen themselves
  // (CameraFullScreen) and hand the bars back when they close.
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // The phone's light/dark setting, or the worker's own pick — read before the
  // first frame so the app never opens in the other theme.
  await ThemePreference.load();
  // No global orientation lock: screens turn with the phone and lay out for a
  // tablet. Camera screens hold portrait themselves (CameraFullScreen).

  runApp(const CypurgeApp());

  // Background plumbing (WorkManager registration, connectivity/location
  // listeners, the launch telemetry batch) is not needed for the first frame, so
  // it starts on the next event-loop turn instead of delaying runApp. An event
  // turn, not a post-frame callback: an iOS background relaunch may never draw.
  Timer.run(() {
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: kDebugMode,
    );

    // Android honors a true 15-min periodic poll. iOS BGAppRefresh is OS-paced
    // and won't fire faster than ~1h reliably, so ask for 1h there.
    final pollFrequency = defaultTargetPlatform == TargetPlatform.iOS
        ? const Duration(hours: 1)
        : const Duration(minutes: 15);
    Workmanager().registerPeriodicTask(
      'device-signal-collector-task',
      'device-signal-collector',
      frequency: pollFrequency,
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );

    // Push is deliberately NOT started here. Under path D the stream needs a
    // per-worker client token that only exists after login, so ApprovalGate
    // starts it. There is no background entrypoint to bind either: without a
    // UnifiedPush distributor nothing wakes this isolate, so the stream is
    // foreground-only until the backend provides a wake path.

    // Instant foreground detection of WiFi switch/drop + airplane toggle.
    BackgroundSignalService().startRealtimeMonitoring();

    // Fire one collection on every launch — including iOS background relaunches
    // triggered by significant-location-change after a force-quit — so telemetry
    // is sent immediately instead of waiting for the next periodic poll.
    unawaited(BackgroundSignalService().collectAndSendTelemetry());
  });
}

class CypurgeApp extends StatefulWidget {
  const CypurgeApp({super.key});

  /// Repaints the app on a theme change — see [ThemePreference].
  static final ValueNotifier<Brightness> themeNotifier =
      ThemePreference.notifier;
  static Map<String, dynamic>? pendingEnrollmentArgs;

  @override
  State<CypurgeApp> createState() => _CypurgeAppState();
}

class _CypurgeAppState extends State<CypurgeApp> with WidgetsBindingObserver {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  /// When the app last went to the background; null while it is in front.
  DateTime? _backgroundedAt;
  bool _relocking = false;

  /// The phone switched light/dark. Followed until the worker picks a theme.
  @override
  void didChangePlatformBrightness() => ThemePreference.systemChanged();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      _backgroundedAt ??= DateTime.now();
    } else if (state == AppLifecycleState.resumed) {
      final away = _backgroundedAt;
      _backgroundedAt = null;
      if (away != null && DateTime.now().difference(away) >= faceRelockAfter) {
        unawaited(_relock());
      }
    }
  }

  /// Asks for the worker's face before a signed-in screen shows again.
  Future<void> _relock() async {
    final nav = _navigatorKey.currentState;
    if (_relocking || nav == null || !ApprovalGate.isShowing) return;
    _relocking = true;
    try {
      await nav.push(platformRoute(builder: (_) => const FaceRelockScreen()));
    } finally {
      _relocking = false;
    }
  }

  /// The app and NotificationService MUST share one key. This was a second,
  /// private GlobalKey, which left the service holding a key attached to no
  /// Navigator — so `navigatorKey.currentContext` was always null and every
  /// push was discarded before it could be shown or routed.
  GlobalKey<NavigatorState> get _navigatorKey =>
      NotificationService().navigatorKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    CypurgeApp.themeNotifier.addListener(_repaintForTheme);
    // Sets the x-device-id every worker call carries.
    unawaited(DeviceIdentityService().getDeviceId());
    _initDeepLinks();
    // Push deliberately does NOT start here: a per-worker Gotify token cannot
    // exist before the worker logs in. ApprovalGate starts it on every
    // authenticated screen, and initialize() is idempotent.
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    CypurgeApp.themeNotifier.removeListener(_repaintForTheme);
    _linkSubscription?.cancel();
    super.dispose();
  }

  /// The screen on show reads AppTheme's static colours, so it must be told
  /// the theme changed — see [rebuildDescendants].
  void _repaintForTheme() {
    final navigator = _navigatorKey.currentContext;
    if (navigator != null) rebuildDescendants(navigator);
  }

  void _initDeepLinks() {
    _appLinks = AppLinks();

    // Handle links when app is already running
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      _handleDeepLink(uri);
    });

    // Handle links that opened the app
    _appLinks.getInitialLink().then((uri) {
      if (uri != null) _handleDeepLink(uri);
    });
  }

  void _handleDeepLink(Uri uri) {
    debugPrint('ðŸ›°ï¸ Deep Link Received: $uri');
    // We handle both workertrust://enroll and potential https links if configured later
    if (uri.host == 'enroll' || uri.path.contains('enroll')) {
      final token = uri.queryParameters['token'];
      final tenant = uri.queryParameters['tenant'];

      if (token != null && tenant != null) {
        debugPrint('âœ… Valid Enrollment Link: Tenant=$tenant');
        final args = {
          'token': token,
          'tenant': tenant,
          'auto_start': true,
        };

        if (_navigatorKey.currentState == null) {
          CypurgeApp.pendingEnrollmentArgs = args;
        } else {
          _navigatorKey.currentState?.pushNamed('/enroll', arguments: args);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Brightness>(
      valueListenable: CypurgeApp.themeNotifier,
      builder: (context, brightness, child) {
        final overlay = SystemUiOverlayStyle(
          statusBarColor: const Color(0x00000000),
          systemNavigationBarColor: const Color(0x00000000),
          systemNavigationBarDividerColor: const Color(0x00000000),
          // Android 10+ enforces its own translucent scrim behind the gesture
          // bar whenever an app asks for a transparent one. That scrim is the
          // pale strip along the bottom that made the app look letterboxed
          // rather than edge to edge; a transparent colour alone cannot remove
          // it.
          systemNavigationBarContrastEnforced: false,
          systemStatusBarContrastEnforced: false,
          statusBarIconBrightness:
              AppTheme.light ? Brightness.dark : Brightness.light,
          statusBarBrightness:
              AppTheme.light ? Brightness.light : Brightness.dark,
          systemNavigationBarIconBrightness:
              AppTheme.light ? Brightness.dark : Brightness.light,
        );
        SystemChrome.setSystemUIOverlayStyle(overlay);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tridoma',
          navigatorKey: _navigatorKey,
          theme: AppTheme.theme(),
          // AppTheme's tokens switch instantly; a Material theme lerp would
          // fade only the Material widgets while everything else snapped.
          themeAnimationDuration: Duration.zero,
          // Tester builds add the document-check debug reports ("Docs n" pill).
          builder: documentDebugReport
              ? (context, child) =>
                  DebugDock(child: child ?? const SizedBox.shrink())
              : null,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/splash',
          // Every named route gets the platform's own page transition — the
          // iOS slide with edge-swipe back, Android's predictive back.
          onGenerateRoute: (settings) {
            final page = <String, WidgetBuilder>{
              '/splash': (context) => const SplashScreen(),
              '/': (context) => const SecureLoginScreen(),
              '/enroll': (context) => const EnrollmentQRScreen(),
              '/enroll/face': (context) =>
                  const FaceLivenessScreen(userId: 'temp-enroll'),
              '/enroll/fingerprint': (context) => const FingerprintScanScreen(),
              '/enroll/documents': (context) =>
                  const DocumentUploadScreen(enrollmentMode: true),
              '/documents': (context) =>
                  const ApprovalGate(child: DocumentsScreen()),
              '/enroll/appeal': (context) => const AppealFormScreen(),
              '/verify-face': (context) {
                // Re-verification goes through the video liveness flow (no
                // on-device embedding). Backend M5 computes the embedding.
                return const FaceLivenessScreen(
                    fullLiveness: false, userId: 'temp-enroll');
              },
              '/reverify': (context) {
                final args = ModalRoute.of(context)!.settings.arguments
                    as Map<String, dynamic>?;
                // allowPending: a worker sent back from enrollment review is, by
                // definition, not yet accepted — the gate must still let them
                // reach the re-upload screen. Signed-out callers stay denied.
                return ApprovalGate(
                  allowPending: true,
                  // A push carries its request; the tab carries nothing, so it
                  // looks up the newest request this phone was sent.
                  child: args == null
                      ? const ReverifyFromInbox()
                      : reverifyScreenFor(args),
                );
              },
              // Daily app is gated until HR accepts the enrollment (first GREEN).
              '/home': (context) => const ApprovalGate(child: HomeScreen()),
              '/profile': (context) =>
                  const ApprovalGate(child: ProfileScreen()),
              '/tasks': (context) =>
                  const ApprovalGate(child: TaskCentreScreen()),
              '/status': (context) => const ApprovalGate(child: StatusScreen()),
              // Open to a worker still waiting for HR: the bell is one of the
              // three tabs they have.
              '/notifications': (context) => const ApprovalGate(
                  allowPending: true, child: NotificationsScreen()),
            }[settings.name];
            return page == null
                ? null
                : platformRoute<dynamic>(builder: page, settings: settings);
          },
        );
      },
    );
  }
}

class PlaceholderProfileScreen extends StatelessWidget {
  const PlaceholderProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Screen 2: Profile Type Selection',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 40),
            FilledButton(
              onPressed: () =>
                  Navigator.pushNamed(context, '/enroll/documents'),
              child: const Text('Continue to Documents'),
            ),
          ],
        ),
      ),
    );
  }
}

class PlaceholderBiometricsScreen extends StatelessWidget {
  const PlaceholderBiometricsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: Center(
        child: Text(
          'Screen 4: Biometric Enrollment\n(Face & Fingerprint Coming Next)',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasNavigated = false;
  Timer? _fallbackTimer;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/splashscreen.mp4');

    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
        _controller.addListener(_videoListener);
      }
    }).catchError((error) {
      debugPrint('Failed to initialize video player: $error');
      _navigateToNext();
    });

    // Fallback timer: navigate after 6 seconds anyway so user is never stuck
    _fallbackTimer = Timer(const Duration(seconds: 6), () {
      _navigateToNext();
    });
  }

  void _videoListener() {
    if (_isInitialized &&
        !_controller.value.isPlaying &&
        _controller.value.position > Duration.zero &&
        _controller.value.position >= _controller.value.duration) {
      _navigateToNext();
    }
  }

  void _navigateToNext() {
    if (_hasNavigated) return;
    _hasNavigated = true;
    _fallbackTimer?.cancel();
    _controller.removeListener(_videoListener);

    if (mounted) {
      if (CypurgeApp.pendingEnrollmentArgs != null) {
        final args = CypurgeApp.pendingEnrollmentArgs;
        CypurgeApp.pendingEnrollmentArgs = null;
        Navigator.pushReplacementNamed(context, '/enroll', arguments: args);
      } else {
        Navigator.pushReplacementNamed(context, '/');
      }
    }
  }

  @override
  void dispose() {
    _fallbackTimer?.cancel();
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ground matched to the video's own edge colour (#D8D7DA), so the
    // cover-crop seam is invisible on any aspect ratio and the fallback looks
    // like the first frame rather than a different screen.
    const ground = Color(0xFFD8D7DA);
    // The logo's navy, fixed like the ground: the theme's accent turns pale
    // blue in dark mode and would vanish on this light grey.
    const brand = Color(0xFF244878);
    return WTPage(
      topGap: 0,
      fullBleed: true,
      content: ColoredBox(
        color: ground,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_isInitialized)
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              )
            else
              // Before the video decodes, hold the brand still rather than
              // showing a spinner on a blank field.
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.52,
                  child: Image.asset(
                    'assets/tridoma.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            // No wordmark overlay: the video already carries the lockup, and
            // a second one said a different brand name on top of it.
            Align(
              alignment: const Alignment(0, 0.82),
              // Own layer: the indeterminate bar repaints every frame, and
              // must not drag the video's layer along with it.
              child: RepaintBoundary(
                child: SizedBox(
                  width: 92,
                  child: LinearProgressIndicator(
                    minHeight: 2.5,
                    color: brand,
                    backgroundColor: brand.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(2),
                    semanticsLabel: 'Loading',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Home — the worker's credential dashboard (HTML mockup's Home tab).
/// Loads identity from secure storage and live status from the risk service,
/// then renders the gradient credential, real action items derived from status
/// factors, and a quick-access deployment/info card. Bottom nav lives here.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _storage = const FlutterSecureStorage();
  final _service = EnrollmentService();

  String _name = 'Worker';
  String _workerId = '—';
  String _tenant = 'Maritime Trust';
  WTTagKind _statusKind = WTTagKind.amber;
  String _statusTitle = 'PENDING';
  List<String> _factors = const [];
  bool _loading = true;
  String? _statusError;
  Uint8List? _photo;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final name = await _storage.read(key: 'cypurge_worker_name');
    final id = await _storage.read(key: 'worker_id');
    final tenant = await _storage.read(key: 'tenant_slug') ??
        await _storage.read(key: 'tenant_id');
    final photo = await loadProfileSelfie();
    if (mounted) {
      setState(() {
        if (name != null && name.trim().isNotEmpty) _name = name.trim();
        if (id != null && id.isNotEmpty) _workerId = id;
        if (tenant != null && tenant.isNotEmpty) _tenant = tenant;
        _photo = photo;
      });
    }
    try {
      final s = await _service.getWorkerStatus();
      if (!mounted) return;
      setState(() {
        _statusTitle = (s['status_title'] ?? 'PENDING').toString();
        _statusKind = switch (s['status_color']) {
          'green' => WTTagKind.green,
          'red' => WTTagKind.red,
          'amber' => WTTagKind.amber,
          _ => WTTagKind.blue,
        };
        _factors = ((s['factors'] as List?) ?? const [])
            .map((e) => e.toString())
            .where((f) => f.startsWith('MISSING') || f.startsWith('PENDING'))
            .toList();
        _loading = false;
        _statusError = null;
      });
    } on Exception catch (e) {
      if (mounted) {
        setState(() {
          _loading = false;
          _statusError = humanizeError(e, action: 'check your status');
        });
      }
    }
  }

  WTTagKind get _sealKind =>
      _statusKind == WTTagKind.blue ? WTTagKind.amber : _statusKind;
  String get _sealLabel => switch (_sealKind) {
        WTTagKind.green => 'VERIFIED',
        WTTagKind.red => 'BLOCKED',
        _ => 'PENDING',
      };

  @override
  Widget build(BuildContext context) {
    final hasDocsBadge = _factors.isNotEmpty;
    return WTPage(
      nav: WTBottomNav(
          items: workerNavItems(context, 0, docsBadge: hasDocsBadge),
          activeIndex: 0),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(18, 8, 18, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: wtStagger([
                      if (_statusError != null)
                        WTAlert(_statusError!, kind: WTAlertKind.warning),
                      Row(
                        children: [
                          Expanded(
                              child:
                                  Text('Tridoma', style: AppTheme.display)),
                          const _BellButton(),
                          WTIconButton(
                            icon: AppTheme.light
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_rounded,
                            label: AppTheme.light
                                ? 'Switch to dark theme'
                                : 'Switch to light theme',
                            color: AppTheme.muted,
                            onPressed: () =>
                                unawaited(ThemePreference.toggle()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // The seal says "checking" until the status lands, then
                      // fades to the result; the line under the name appears
                      // only when the status title adds to the seal.
                      WTCredentialCard(
                        name: _name,
                        role: '$_tenant · Worker ',
                        statusKind: _loading ? WTTagKind.neutral : _sealKind,
                        statusLabel: _loading ? 'CHECKING…' : _sealLabel,
                        validityText: _loading ? null : _statusTitle,
                        photo: _photo,
                      ),
                      const SizedBox(height: 8),
                      ..._buildActionSection(),
                      const ShiftCard(),
                      const SizedBox(height: 8),
                      const WTSectionLabel('Quick access'),
                      _navTile(
                          'My status',
                          'Live verification result',
                          Icons.shield_rounded,
                          AppTheme.success,
                          () => Navigator.pushNamed(context, '/status')),
                      const SizedBox(height: 10),
                      _navTile(
                          'My documents',
                          'Upload & manage certificates',
                          Icons.folder_rounded,
                          AppTheme.accent,
                          () => Navigator.pushNamed(context, '/documents')),
                      const SizedBox(height: 10),
                      _navTile(
                          'Task centre',
                          'Active objectives',
                          Icons.checklist_rounded,
                          AppTheme.warn,
                          () => Navigator.pushNamed(context, '/tasks')),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Action items derived from real status factors (MISSING/PENDING). When the
  /// worker is fully verified there is nothing to show, so the section is hidden.
  List<Widget> _buildActionSection() {
    if (_factors.isEmpty) return const [];
    return [
      const WTSectionLabel('Action needed'),
      for (final f in _factors) ...[_actionCard(f), const SizedBox(height: 10)],
    ];
  }

  Widget _actionCard(String factor) {
    final clean =
        factor.replaceFirst(RegExp(r'^(MISSING|PENDING):\s*'), '').trim();
    final isFace = factor.toLowerCase().contains('face') ||
        factor.toLowerCase().contains('liveness');
    final route = isFace ? '/enroll/face' : '/enroll/documents';
    return WTCard(
      leftAccent: AppTheme.warn,
      onTap: () => Navigator.pushNamed(context, route),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppTheme.tint(AppTheme.warn),
                borderRadius: BorderRadius.circular(AppTheme.rMd)),
            child: Icon(
                isFace ? Icons.person_rounded : Icons.description_rounded,
                color: AppTheme.warn,
                size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clean.isEmpty ? 'Action required' : clean,
                    style: AppTheme.h2),
                const SizedBox(height: 3),
                Text(isFace ? 'Tap to complete face scan' : 'Tap to upload',
                    style: AppTheme.caption),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const WTTag('Action', kind: WTTagKind.amber),
        ],
      ),
    );
  }

  Widget _navTile(String title, String subtitle, IconData icon, Color color,
      VoidCallback onTap) {
    return WTCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: AppTheme.tint(color),
                borderRadius: BorderRadius.circular(AppTheme.rMd)),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.h2),
                const SizedBox(height: 3),
                Text(subtitle, style: AppTheme.caption),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: AppTheme.faint, size: 14),
        ],
      ),
    );
  }
}

/// Home header bell: opens the notifications list, with a dot while anything
/// is unread.
class _BellButton extends StatelessWidget {
  const _BellButton();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<InboxItem>>(
      valueListenable: NotificationInbox.instance.items,
      builder: (context, items, _) {
        final unread = items.where((i) => !i.read).length;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            WTIconButton(
              icon: Icons.notifications_rounded,
              label:
                  unread == 0 ? 'Notifications' : 'Notifications, $unread new',
              color: AppTheme.muted,
              onPressed: () => Navigator.pushNamed(context, '/notifications'),
            ),
            if (unread > 0)
              Positioned(
                right: 11,
                top: 11,
                child: IgnorePointer(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.error,
                      border: Border.all(color: AppTheme.bg, width: 1.5),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
