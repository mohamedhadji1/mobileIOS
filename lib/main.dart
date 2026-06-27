import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:cypurge_mobile/screens/login_screen.dart';
import 'package:cypurge_mobile/screens/task_centre_screen.dart';
import 'package:cypurge_mobile/screens/status_screen.dart';
import 'package:cypurge_mobile/screens/document_upload_screen.dart';
import 'package:cypurge_mobile/screens/documents_screen.dart';
import 'package:cypurge_mobile/screens/verify_face_screen.dart';
import 'package:cypurge_mobile/services/notification_service.dart';
import 'package:cypurge_mobile/screens/face_liveness_screen.dart';
import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import 'package:cypurge_mobile/screens/enrollment_qr_screen.dart';
import 'package:cypurge_mobile/screens/appeal_form_screen.dart';
import 'package:cypurge_mobile/screens/re_verification_screen.dart';
import 'package:cypurge_mobile/screens/profile_screen.dart';
import 'package:cypurge_mobile/screens/worker_nav.dart';
import 'package:cypurge_mobile/services/enrollment_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:workmanager/workmanager.dart';
import 'package:cypurge_mobile/services/background_signal_service.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

/// Parses a re-verification compliance deadline from a push payload.
/// Accepts either `deadline` (ISO-8601 string) or `deadline_days` (number of
/// days from now). Returns null when neither is present/parsable.
DateTime? _parseDeadline(Map<String, dynamic>? args) {
  if (args == null) return null;
  final raw = args['deadline'];
  if (raw is String && raw.isNotEmpty) {
    final parsed = DateTime.tryParse(raw);
    if (parsed != null) return parsed;
  }
  final days = args['deadline_days'];
  final daysInt = days is int ? days : int.tryParse('${days ?? ''}');
  if (daysInt != null) return DateTime.now().add(Duration(days: daysInt));
  return null;
}

/// Parses the list of flagged document titles from a push payload. Accepts a
/// `List` or a comma-separated `String` under `flagged_documents`/`documents`.
/// Falls back to a single generic identity document when none are provided.
List<String> _parseFlaggedDocuments(Map<String, dynamic>? args) {
  final raw = args?['flagged_documents'] ?? args?['documents'];
  if (raw is List) {
    final list = raw.map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toList();
    if (list.isNotEmpty) return list;
  }
  if (raw is String && raw.trim().isNotEmpty) {
    final list = raw.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (list.isNotEmpty) return list;
  }
  return const ['Identity Document'];
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case 'device-signal-collector':
        final success = await BackgroundSignalService().collectAndSendTelemetry();
        return success;
      default:
        return true;
    }
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: kDebugMode,
  );

  Workmanager().registerPeriodicTask(
    'device-signal-collector-task',
    'device-signal-collector',
    frequency: const Duration(minutes: 15),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );

  // Instant foreground detection of WiFi switch/drop + airplane toggle.
  BackgroundSignalService().startRealtimeMonitoring();

  runApp(const CypurgeApp());
}

class CypurgeApp extends StatefulWidget {
  const CypurgeApp({super.key});

  static final ValueNotifier<Brightness> themeNotifier =
      ValueNotifier<Brightness>(Brightness.dark);
  static Map<String, dynamic>? pendingEnrollmentArgs;

  @override
  State<CypurgeApp> createState() => _CypurgeAppState();
}

class _CypurgeAppState extends State<CypurgeApp> {
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
    // Start the Gotify push client (no-op until a client token is provisioned).
    unawaited(NotificationService().initialize());
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
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
        return FluentApp(
          debugShowCheckedModeBanner: false,
          title: 'Cypurge',
          navigatorKey: _navigatorKey,
          theme: AppTheme.theme(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/': (context) => const SecureLoginScreen(),
            '/enroll': (context) => const EnrollmentQRScreen(),
            '/enroll/face': (context) => const FaceLivenessScreen(userId: 'temp-enroll'),
            '/enroll/fingerprint': (context) => const FingerprintScanScreen(),
            '/enroll/documents': (context) => const DocumentUploadScreen(),
            '/documents': (context) => const DocumentsScreen(),
            '/enroll/appeal': (context) => const AppealFormScreen(),
            '/verify-face': (context) {
              final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
              return VerifyFaceScreen(verificationType: args?['type'] ?? 'random_alert');
            },
            '/reverify': (context) {
              final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
              final reason = (args?['message'] ?? args?['reason']) as String?;
              return ReVerificationScreen(
                reason: reason ??
                    'Some of your documents need to be re-submitted.',
                deadline: _parseDeadline(args),
                flaggedDocuments: _parseFlaggedDocuments(args),
              );
            },
            '/home': (context) => const HomeScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/tasks': (context) => const TaskCentreScreen(),
            '/status': (context) => const StatusScreen(),
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
    return ScaffoldPage(
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
              onPressed: () => Navigator.pushNamed(context, '/enroll/documents'),
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
    return ScaffoldPage(
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
    return ScaffoldPage(
      padding: EdgeInsets.zero,
      content: Container(
        color: Colors.white,
        child: _isInitialized
            ? Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              )
            : Center(
                child: ProgressRing(
                  activeColor: AppTheme.accent,
                ),
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

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final name = await _storage.read(key: 'cypurge_worker_name');
    final id = await _storage.read(key: 'worker_id');
    final tenant = await _storage.read(key: 'tenant_slug') ?? await _storage.read(key: 'tenant_id');
    if (mounted) {
      setState(() {
        if (name != null && name.trim().isNotEmpty) _name = name.trim();
        if (id != null && id.isNotEmpty) _workerId = id;
        if (tenant != null && tenant.isNotEmpty) _tenant = tenant;
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
      });
    } on Exception {
      if (mounted) setState(() => _loading = false);
    }
  }

  WTTagKind get _sealKind => _statusKind == WTTagKind.blue ? WTTagKind.amber : _statusKind;
  String get _sealLabel => switch (_sealKind) {
        WTTagKind.green => 'VERIFIED',
        WTTagKind.red => 'BLOCKED',
        _ => 'PENDING',
      };

  @override
  Widget build(BuildContext context) {
    final hasDocsBadge = _factors.isNotEmpty;
    return ScaffoldPage(
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
                        Row(
                          children: [
                            Expanded(child: Text('WorkerTrust', style: AppTheme.display)),
                            IconButton(
                              icon: Icon(AppTheme.light ? FluentIcons.clear_night : FluentIcons.sunny,
                                  color: AppTheme.muted, size: 20),
                              onPressed: () {
                                AppTheme.light = !AppTheme.light;
                                CypurgeApp.themeNotifier.value = AppTheme.brightness;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        WTCredentialCard(
                          name: _name,
                          role: '$_tenant · Worker ',
                          statusKind: _sealKind,
                          statusLabel: _sealLabel,
                          validityText: _loading ? 'Checking…' : _statusTitle,
                        ),
                        const SizedBox(height: 8),
                        ..._buildActionSection(),
                        const WTSectionLabel('Quick access'),
                        _navTile('My status', 'Live verification result', FluentIcons.shield,
                            AppTheme.success, () => Navigator.pushNamed(context, '/status')),
                        const SizedBox(height: 10),
                        _navTile('My documents', 'Upload & manage certificates', FluentIcons.documentation,
                            AppTheme.accent, () => Navigator.pushNamed(context, '/documents')),
                        const SizedBox(height: 10),
                        _navTile('Task centre', 'Active objectives', FluentIcons.bulleted_list,
                            AppTheme.warn, () => Navigator.pushNamed(context, '/tasks')),
                    ]),
                  ),
                ),
              ),
              WTBottomNav(items: workerNavItems(context, 0, docsBadge: hasDocsBadge), activeIndex: 0),
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
    final clean = factor.replaceFirst(RegExp(r'^(MISSING|PENDING):\s*'), '').trim();
    final isFace = factor.toLowerCase().contains('face') || factor.toLowerCase().contains('liveness');
    final route = isFace ? '/enroll/face' : '/enroll/documents';
    return WTCard(
      leftAccent: AppTheme.warn,
      onTap: () => Navigator.pushNamed(context, route),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: AppTheme.tint(AppTheme.warn), borderRadius: BorderRadius.circular(AppTheme.rMd)),
            child: Icon(isFace ? FluentIcons.contact : FluentIcons.document, color: AppTheme.warn, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clean.isEmpty ? 'Action required' : clean, style: AppTheme.h2),
                const SizedBox(height: 3),
                Text(isFace ? 'Tap to complete face scan' : 'Tap to upload', style: AppTheme.caption),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const WTTag('Action', kind: WTTagKind.amber),
        ],
      ),
    );
  }

  Widget _navTile(String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return WTCard(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: AppTheme.tint(color), borderRadius: BorderRadius.circular(AppTheme.rMd)),
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
          Icon(FluentIcons.chevron_right, color: AppTheme.faint, size: 14),
        ],
      ),
    );
  }
}
