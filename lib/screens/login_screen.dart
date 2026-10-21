import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'face_liveness_screen.dart';
import 'package:http/http.dart' as http;
import '../config/constants.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../services/enrollment_service.dart';
import 'device_status_screen.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class SecureLoginScreen extends StatefulWidget {
  const SecureLoginScreen({super.key});

  @override
  State<SecureLoginScreen> createState() => _SecureLoginScreenState();
}

class _SecureLoginScreenState extends State<SecureLoginScreen> {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _manualUserId;

  bool _isEnrolled = false;
  bool _isLoading = false;

  /// A worker session is stored on this phone, so the face alone unlocks it.
  /// Without one (new phone, signed out, session ran out) the worker signs in
  /// with email and password.
  bool _hasSession = false;
  bool _usePassword = true;

  @override
  void initState() {
    super.initState();
    _checkEnrollmentStatus();
  }

  @override
  void dispose() {
    // TextEditingController is a ChangeNotifier holding a listener list; without
    // this the whole screen leaked on every pop.
    _idController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Check if the user has already signed up
  Future<void> _checkEnrollmentStatus() async {
    try {
      final legacyToken = await _storage.read(key: 'cypurge_enrolled');
      final workerId = await _storage.read(key: 'worker_id');
      final token = await _storage.read(key: 'id_token') ??
          await _storage.read(key: 'access_token');
      final hasSession =
          workerId != null && workerId.isNotEmpty && token != null;

      if (mounted) {
        setState(() {
          _hasSession = hasSession;
          _usePassword = !hasSession;
          _isEnrolled = hasSession ||
              (legacyToken != null && legacyToken.isNotEmpty) ||
              (workerId != null && workerId.isNotEmpty);
        });
      }
    } catch (e, stack) {
      ErrorLogger.log('Login Screen - Enrollment Check', e, stack);
    }
  }

  /// Email + password, then the phone check, then the face.
  Future<void> _signInWithPassword() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Enter your email and password.', WTSeverity.error);
      return;
    }
    setState(() => _isLoading = true);
    try {
      await EnrollmentService()
          .signInWithPassword(email: email, password: password);
      if (!mounted) return;
      await continueAfterSignIn(context);
    } on WrongCredentialsException catch (e) {
      _showSnackBar(e.toString(), WTSeverity.error);
    } on NoWorkerAccountException catch (e) {
      _showSnackBar(e.toString(), WTSeverity.error);
    } catch (e, stack) {
      ErrorLogger.log('Login Screen - Password Sign-in', e, stack);
      _showSnackBar(humanizeError(e, action: 'sign in'), WTSeverity.error);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _forgotPassword() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      _showSnackBar('Enter your email first.', WTSeverity.error);
      return;
    }
    try {
      await EnrollmentService().sendPasswordReset(email: email);
    } catch (e, stack) {
      ErrorLogger.log('Login Screen - Forgot Password', e, stack);
    }
    // Same answer either way: never reveal whether an account exists.
    _showSnackBar('If an account uses $email, a reset link is on its way.',
        WTSeverity.success);
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
    final userId =
        _manualUserId ?? storedWorkerId ?? storedLegacyId ?? 'temp-login';

    if (!mounted) return;

    // Step 1: Face ID (Liveness + Backend Matching)
    final dynamic faceOk = await Navigator.push(
      context,
      platformRoute(
          builder: (_) =>
              FaceLivenessScreen(fullLiveness: false, userId: userId)),
    );

    if (!mounted) return;

    if (faceOk != true) {
      // Error message is already shown on the FaceLivenessScreen
      setState(() => _isLoading = false);
      return;
    }

    _showSnackBar('Login Successful! Welcome back.', WTSeverity.success);
    Navigator.pushReplacementNamed(context, '/home');

    setState(() => _isLoading = false);
  }

  /// Severity, not a colour: the message bar used to compare a passed colour
  /// against a hard-coded red to decide what kind of message it was.
  void _showSnackBar(String message, WTSeverity severity) {
    if (!mounted) return;
    wtInfoBar(
        context,
        switch (severity) {
          WTSeverity.error => 'Check this',
          WTSeverity.success => 'Done',
          _ => 'Note',
        },
        message: message,
        severity: severity);
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: SafeArea(
        child: WTFormBody(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo — flat and still: no pulse, no glow, restrained size.
              SizedBox(
                width: 88,
                height: 88,
                child: Image.asset(AppTheme.logoAsset, fit: BoxFit.contain),
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                _isEnrolled ? 'Welcome Back' : 'Create Account',
                style: AppTheme.display,
              ),
              const SizedBox(height: 8),
              // Says what the fields below actually ask for.
              Text(
                !_isEnrolled
                    ? 'Register your fingerprint and face to get started'
                    : _usePassword
                        ? 'Sign in with your email and password'
                        : 'Sign in with fingerprint and face verification',
                textAlign: TextAlign.center,
                style: AppTheme.bodyMuted,
              ),
              const SizedBox(height: 20),

              // Manual ID entry: debug builds only. In a release build it let
              // anyone type another worker's id into the face check.
              if (kDebugMode)
                WTFloatField(
                  controller: _idController,
                  label: 'User ID (debug)',
                  icon: Icons.person_rounded,
                  onChanged: (v) => _manualUserId = v,
                ),

              const Spacer(flex: 2),

              // â”€â”€ SIGN UP MODE â”€â”€
              if (!_isEnrolled) ...[
                _buildButton(
                  onPressed: _isLoading ? null : _signUp,
                  icon: Icons.person_rounded,
                  label: 'Sign Up',
                  isPrimary: true,
                ),
                const SizedBox(height: 14),
                // Wrap: the chips move to a second line when they don't fit.
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8,
                  children: [
                    _buildStepChip(Icons.fingerprint_rounded, 'Fingerprint'),
                    const SizedBox(width: 8),
                    Icon(Icons.chevron_right_rounded,
                        color: AppTheme.faint, size: 18),
                    const SizedBox(width: 8),
                    _buildStepChip(Icons.person_rounded, 'Face ID'),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Both fingerprint and face scan required',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppTheme.faint),
                ),
              ],

              // ── SIGN IN WITH EMAIL + PASSWORD ──
              if (_isEnrolled && _usePassword) ...[
                WTFloatField(
                  controller: _emailController,
                  label: 'Email',
                  icon: Icons.mail_rounded,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                WTFloatField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock_rounded,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _signInWithPassword(),
                ),
                const SizedBox(height: 16),
                _buildButton(
                  onPressed: _isLoading ? null : _signInWithPassword,
                  icon: Icons.lock_open_rounded,
                  label: 'Sign In',
                  isPrimary: true,
                ),
                TextButton(
                  onPressed: _isLoading ? null : _forgotPassword,
                  child: Text('Forgot password?',
                      style: TextStyle(color: AppTheme.accent, fontSize: 14)),
                ),
                if (_hasSession)
                  TextButton(
                    onPressed: () => setState(() => _usePassword = false),
                    child: Text('Sign in with my face instead',
                        style: TextStyle(color: AppTheme.accent, fontSize: 14)),
                  ),
              ],

              // â”€â”€ SIGN IN MODE â”€â”€
              if (_isEnrolled && !_usePassword) ...[
                _buildButton(
                  onPressed: _isLoading ? null : _signIn,
                  icon: Icons.lock_open_rounded,
                  label: 'Sign In',
                  isPrimary: true,
                ),
                const SizedBox(height: 14),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8,
                  children: [
                    _buildStepChip(Icons.person_rounded, 'Face ID'),
                    const SizedBox(width: 8),
                    Icon(Icons.chevron_right_rounded,
                        color: AppTheme.faint, size: 18),
                    const SizedBox(width: 8),
                    _buildStepChip(Icons.fingerprint_rounded, 'Fingerprint'),
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
              TextButton(
                onPressed: () => setState(() => _isEnrolled = !_isEnrolled),
                child: Text(
                  _isEnrolled
                      ? "Don't have an account? Sign Up"
                      : 'Already enrolled? Sign In',
                  style: TextStyle(color: AppTheme.accent, fontSize: 14),
                ),
              ),

              // DEV TOOLS — debug builds only.
              // Both shipped to production before: the readout prints a stored
              // user ID on the launch screen, and the button wipes local storage
              // then POSTs a destructive /v1/dev/reset that drops backend data.
              // kDebugMode is a compile-time constant, so this whole subtree is
              // tree-shaken out of release binaries rather than merely hidden.
              if (kDebugMode) ...[
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
                TextButton(
                  onPressed: () async {
                    await _storage.deleteAll();
                    setState(() => _isEnrolled = false);
                    try {
                      final response = await http.post(
                        Uri.parse('${AppConfig.apiBaseUrl}/v1/dev/reset'),
                      );
                      if (response.statusCode == 200) {
                        if (mounted) {
                          _showSnackBar('App cache & database cleared!',
                              WTSeverity.warning);
                        }
                      } else {
                        if (mounted) {
                          _showSnackBar('Cleared cache, database reset failed.',
                              WTSeverity.error);
                        }
                      }
                    } catch (e, stack) {
                      ErrorLogger.log(
                          'Login Screen - Reset App Data Dev Endpoint',
                          e,
                          stack);
                      if (mounted) {
                        _showSnackBar(
                            'App cache cleared locally.', WTSeverity.warning);
                      }
                    }
                  },
                  child: Text(
                    'Reset App Data',
                    style: TextStyle(color: AppTheme.error, fontSize: 12),
                  ),
                ),
              ],
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
