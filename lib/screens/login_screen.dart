import 'package:fluent_ui/fluent_ui.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'face_liveness_screen.dart';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../utils/error_logger.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class SecureLoginScreen extends StatefulWidget {
  const SecureLoginScreen({super.key});

  @override
  State<SecureLoginScreen> createState() => _SecureLoginScreenState();
}

class _SecureLoginScreenState extends State<SecureLoginScreen> with SingleTickerProviderStateMixin {
  final LocalAuthentication _auth = LocalAuthentication();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  late AnimationController _logoAnimController;
  late Animation<double> _logoScaleAnim;

  final TextEditingController _idController = TextEditingController();
  String? _manualUserId;

  bool _isEnrolled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkEnrollmentStatus();

    _logoAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _logoScaleAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _logoAnimController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _logoAnimController.dispose();
    super.dispose();
  }

  /// Check if the user has already signed up
  Future<void> _checkEnrollmentStatus() async {
    try {
      final legacyToken = await _storage.read(key: 'cypurge_enrolled');
      final workerId = await _storage.read(key: 'worker_id');
      
      if (mounted) {
        setState(() => _isEnrolled = (legacyToken != null && legacyToken.isNotEmpty) || (workerId != null && workerId.isNotEmpty));
      }
    } catch (e, stack) {
      ErrorLogger.log('Login Screen - Enrollment Check', e, stack);
    }
  }

  /// Trigger the OS fingerprint prompt
  Future<bool> _authenticateFingerprint() async {
    try {
      final bool canAuth = await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
      if (!canAuth) {
        _showSnackBar('Biometrics not available on this device.', Colors.red.normal);
        return false;
      }

      final bool didAuth = await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to continue',
      );
      return didAuth;
    } catch (e, stack) {
      ErrorLogger.log('Login Screen - Fingerprint Auth Failure', e, stack);
      _showSnackBar('Fingerprint error: ${e.toString()}', Colors.red.normal);
      return false;
    }
  }

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  //  SIGN UP FLOW
  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

  Future<void> _signUp() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
    await _storage.delete(key: 'id_token');
    await _storage.delete(key: 'worker_id');
    await _storage.delete(key: 'tenant_id');
    await _storage.delete(key: 'cypurge_worker_name');
    await _storage.delete(key: 'cypurge_enrolled');
    if (mounted) {
      Navigator.pushNamed(context, '/enroll');
    }
  }

  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  //  SIGN IN FLOW (Face ID first, then Fingerprint)
  // â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

  Future<void> _signIn() async {
    setState(() => _isLoading = true);

    // 1. Refresh enrollment status check immediately
    final storedLegacyId = await _storage.read(key: 'cypurge_user_id');
    final storedWorkerId = await _storage.read(key: 'worker_id');
    final userId = _manualUserId ?? storedWorkerId ?? storedLegacyId ?? 'temp-login';

    if (!mounted) return;

    // Step 1: Face ID (Liveness + Backend Matching)
    final dynamic faceOk = await Navigator.push(
      context,
      FluentPageRoute(builder: (_) => FaceLivenessScreen(fullLiveness: false, userId: userId)),
    );

    if (!mounted) return;

    if (faceOk != true) {
      // Error message is already shown on the FaceLivenessScreen
      setState(() => _isLoading = false);
      return;
    }

    _showSnackBar('Identity Verified. Now scan your fingerprint...', const Color(0xFF448AFF));

    // Step 2: Fingerprint
    final bool fingerOk = await _authenticateFingerprint();
    if (!mounted) return;

    if (!fingerOk) {
      _showSnackBar('Fingerprint verification failed.', Colors.red.normal);
      setState(() => _isLoading = false);
      return;
    }

    // Both Passed
    _showSnackBar('Login Successful! Welcome back.', const Color(0xFF4CAF50));
    Navigator.pushReplacementNamed(context, '/home');

    setState(() => _isLoading = false);
  }

  void _showSnackBar(String message, Color color) {
    if (!mounted) return;
    displayInfoBar(
      context,
      builder: (context, close) => InfoBar(
        title: const Text('Notification'),
        content: Text(message, style: const TextStyle(fontWeight: FontWeight.w500)),
        severity: color == Colors.red.normal
            ? InfoBarSeverity.error
            : color == const Color(0xFF4CAF50)
                ? InfoBarSeverity.success
                : InfoBarSeverity.info,
        action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo / Icon
              ScaleTransition(
                scale: _logoScaleAnim,
                child: SizedBox(
                  width: 140,
                  height: 140,
                  child: Image.asset(
                    'assets/Logo Maritime Trust.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // Title
              Text(
                _isEnrolled ? 'Welcome Back' : 'Create Account',
                style: AppTheme.display,
              ),
              const SizedBox(height: 8),
              Text(
                _isEnrolled
                    ? 'Sign in with fingerprint and face verification'
                    : 'Register your fingerprint and face to get started',
                textAlign: TextAlign.center,
                style: AppTheme.bodyMuted,
              ),
              const SizedBox(height: 20),

              // Manual ID Entry (Dev)
              WTFloatField(
                controller: _idController,
                label: 'User ID (optional)',
                icon: FluentIcons.contact,
                onChanged: (v) => _manualUserId = v,
              ),

              const Spacer(flex: 2),

              // â”€â”€ SIGN UP MODE â”€â”€
              if (!_isEnrolled) ...[
                _buildButton(
                  onPressed: _isLoading ? null : _signUp,
                  icon: FluentIcons.contact,
                  label: 'Sign Up',
                  isPrimary: true,
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStepChip(FluentIcons.fingerprint, 'Fingerprint'),
                    const SizedBox(width: 8),
                    Icon(FluentIcons.chevron_right, color: AppTheme.faint, size: 18),
                    const SizedBox(width: 8),
                    _buildStepChip(FluentIcons.contact, 'Face ID'),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Both fingerprint and face scan required',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppTheme.faint),
                ),
              ],

              // â”€â”€ SIGN IN MODE â”€â”€
              if (_isEnrolled) ...[
                 _buildButton(
                   onPressed: _isLoading ? null : _signIn,
                   icon: FluentIcons.unlock,
                   label: 'Sign In',
                   isPrimary: true,
                 ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStepChip(FluentIcons.contact, 'Face ID'),
                    const SizedBox(width: 8),
                    Icon(FluentIcons.chevron_right, color: AppTheme.faint, size: 18),
                    const SizedBox(width: 8),
                    _buildStepChip(FluentIcons.fingerprint, 'Fingerprint'),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Face verification followed by fingerprint',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppTheme.faint),
                ),
              ],

              const Spacer(flex: 1),

              // Toggle between Sign Up / Sign In
              HyperlinkButton(
                onPressed: () => setState(() => _isEnrolled = !_isEnrolled),
                child: Text(
                  _isEnrolled ? "Don't have an account? Sign Up" : 'Already enrolled? Sign In',
                  style: TextStyle(color: AppTheme.accent, fontSize: 14),
                ),
              ),
              
              // Dev Tool: Status Info
              FutureBuilder<String?>(
                future: _storage.read(key: 'cypurge_user_id'),
                builder: (context, snapshot) {
                  return Text(
                    'Debug: ID Found = ${snapshot.data ?? "NONE"}',
                    style: TextStyle(color: AppTheme.faint, fontSize: 10),
                  );
                },
              ),
              const SizedBox(height: 8),

              // Dev Tool: Reset Cache
              HyperlinkButton(
                onPressed: () async {
                  await _storage.deleteAll();
                  setState(() => _isEnrolled = false);
                  try {
                    final response = await http.post(
                      Uri.parse('${AppConfig.apiBaseUrl}/v1/dev/reset'),
                    );
                    if (response.statusCode == 200) {
                      if (mounted) _showSnackBar('App cache & database cleared!', Colors.orange.normal);
                    } else {
                      if (mounted) _showSnackBar('Cleared cache, database reset failed.', Colors.red.normal);
                    }
                  } catch (e, stack) {
                    ErrorLogger.log('Login Screen - Reset App Data Dev Endpoint', e, stack);
                    if (mounted) _showSnackBar('App cache cleared locally.', Colors.orange.normal);
                  }
                },
                child: Text(
                  'Reset App Data',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback? onPressed,
    required IconData icon,
    required String label,
    required bool isPrimary,
  }) {
    return WTButton(
      label: label,
      icon: icon,
      kind: isPrimary ? WTButtonKind.primary : WTButtonKind.subtle,
      loading: _isLoading,
      onPressed: onPressed,
    );
  }

  Widget _buildStepChip(IconData icon, String label) {
    return WTTag(label, kind: WTTagKind.blue, icon: icon);
  }
}
