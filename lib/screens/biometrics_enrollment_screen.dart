import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/screens/face_liveness_screen.dart';
import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import 'package:cypurge_mobile/screens/selfie_capture_screen.dart';
import 'enrollment_flow_screen.dart';
import '../widgets/step_indicator.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class BiometricsEnrollmentScreen extends StatefulWidget {
  const BiometricsEnrollmentScreen({super.key});

  @override
  State<BiometricsEnrollmentScreen> createState() =>
      _BiometricsEnrollmentScreenState();
}

class _BiometricsEnrollmentScreenState extends State<BiometricsEnrollmentScreen>
    with TickerProviderStateMixin {
  final _storage = const FlutterSecureStorage();
  bool _faceDone = false;
  bool _fingerprintDone = false;
  String _workerId = '';

  late AnimationController _shieldPulseController;
  late Animation<double> _shieldPulseAnim;

  @override
  void initState() {
    super.initState();
    _loadWorkerId();

    _shieldPulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);
    _shieldPulseAnim = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _shieldPulseController, curve: Curves.easeInOut),
    );
    // Removed: a second "_scanLine" controller on ..repeat() whose animation was
    // never read by build(). A running Ticker keeps SchedulerBinding asking for
    // frames forever, so the screen never went idle — it produced (and rastered)
    // frames at the panel's refresh rate to drive nothing at all.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reduce-motion freezes the pulse (build reads 0.55), so stop its ticker.
    if (AppTheme.reduceMotion(context)) {
      _shieldPulseController.stop();
    } else if (!_shieldPulseController.isAnimating) {
      _shieldPulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _shieldPulseController.dispose();
    super.dispose();
  }

  Future<void> _loadWorkerId() async {
    final id = await _storage.read(key: 'worker_id');
    if (id != null) {
      setState(() => _workerId = id);
    }
  }

  Future<void> _proceed() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (mounted) {
      // Biometrics is the final enrollment step now (documents come first).
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  int get _completedCount => (_faceDone ? 1 : 0) + (_fingerprintDone ? 1 : 0);

  bool get _selfieTaken =>
      EnrollmentFlowScreen.maybeOf(context)?.selfieTaken ?? false;

  @override
  Widget build(BuildContext context) {
    final allDone = _faceDone && _fingerprintDone;

    return WTPage(
      content: SafeArea(
        // Scrolls when the page is taller than the screen (short phones, large
        // text); the Spacer still pins the button to the bottom otherwise.
        child: WTFormBody(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const EnrollmentBackButton('Back to documents'),
              const StepIndicator(
                currentStep: 4,
                stepLabels: [
                  'Scan',
                  'Details',
                  'Experience',
                  'Documents',
                  'Biometrics'
                ],
              ),

              const SizedBox(height: 8),

              // Animated shield icon.
              // RepaintBoundary here is load-bearing, not decoration: this pulse
              // runs forever at the display refresh rate, and without its own
              // layer it marks the enclosing layer dirty every frame — forcing
              // every other (static) BoxShadow blur on this screen to
              // re-rasterize 120x/sec. Boxed, only these 90x90 pixels repaint.
              Center(
                child: RepaintBoundary(
                  child: AnimatedBuilder(
                    animation: _shieldPulseAnim,
                    builder: (context, child) {
                      final pulse = AppTheme.reduceMotion(context)
                          ? 0.55
                          : _shieldPulseAnim.value;
                      return Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppTheme.accent.withValues(alpha: 0.15),
                              AppTheme.accentLight.withValues(alpha: 0.08),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.accent
                                  .withValues(alpha: pulse * 0.2),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                          border: Border.all(
                            color: AppTheme.accent.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Icon(
                          allDone
                              ? Icons.check_circle_rounded
                              : Icons.shield_rounded,
                          color: allDone ? AppTheme.success : AppTheme.accent,
                          size: 36,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Header text
              Text('Biometric Identity',
                  style: AppTheme.h1, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(
                'High-security biometrics prevent identity fraud in maritime security zones.',
                textAlign: TextAlign.center,
                style: AppTheme.bodyMuted,
              ),

              const SizedBox(height: 16),

              // Progress badge
              Center(
                child: WTTag(
                  allDone
                      ? 'All scans complete'
                      : '$_completedCount of 2 complete',
                  kind: allDone ? WTTagKind.green : WTTagKind.amber,
                ),
              ),

              const SizedBox(height: 28),

              // Biometric cards
              _buildBiometricCard(
                title: 'Facial Liveness',
                subtitle: _selfieTaken
                    ? 'Pass the live check'
                    : 'Take a reference selfie, then pass the live check',
                icon: Icons.person_rounded,
                isDone: _faceDone,
                onTap: () async {
                  // In the enrollment flow the selfie was taken at the
                  // documents step, where the ID check compared it with the
                  // document photo; a second one would only overwrite it.
                  // Opened on its own, take it here as before.
                  if (!_selfieTaken) {
                    final selfieOk = await Navigator.push(
                      context,
                      platformRoute(
                          builder: (context) => const SelfieCaptureScreen()),
                    );
                    if (selfieOk != true || !context.mounted) return;
                  }
                  final result = await Navigator.push(
                    context,
                    platformRoute(
                        builder: (context) =>
                            FaceLivenessScreen(userId: _workerId)),
                  );
                  if (result == true) setState(() => _faceDone = true);
                },
              ),

              const SizedBox(height: 14),

              _buildBiometricCard(
                title: 'Fingerprint Identity',
                subtitle: 'Register secure hardware token',
                icon: Icons.fingerprint_rounded,
                isDone: _fingerprintDone,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    platformRoute(
                        builder: (context) => const FingerprintScanScreen()),
                  );
                  if (result == true) setState(() => _fingerprintDone = true);
                },
              ),

              const Spacer(),

              // Submit button
              WTButton(
                label: allDone
                    ? 'Finish Enrollment'
                    : 'Complete both scans to continue',
                trailingIcon: allDone ? Icons.chevron_right_rounded : null,
                onPressed: allDone ? _proceed : null,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBiometricCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isDone,
    required VoidCallback onTap,
  }) {
    return MergeSemantics(
        child: Semantics(
            button: true,
            enabled: !isDone,
            value: isDone ? 'Completed' : 'Not started',
            child: GestureDetector(
              onTap: isDone ? null : onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(AppTheme.rMd),
                  // Uniform border (a rounded BoxDecoration can't use a non-uniform one);
                  // state is conveyed by tinting the whole outline.
                  border: Border.all(
                    color: isDone ? AppTheme.success : AppTheme.accent,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    // Icon container
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: isDone
                            ? LinearGradient(
                                colors: [AppTheme.success, AppTheme.success],
                              )
                            : LinearGradient(
                                colors: [AppTheme.accent, AppTheme.accentLight],
                              ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: (isDone ? AppTheme.success : AppTheme.accent)
                                .withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: isDone
                            ? const Icon(Icons.check_rounded,
                                color: Colors.white, size: 24)
                            : Icon(icon, color: Colors.white, size: 24),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: AppTheme.ink,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isDone
                                      ? AppTheme.success
                                      : AppTheme.faint,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  isDone ? 'Verified' : subtitle,
                                  style: TextStyle(
                                    color: isDone
                                        ? AppTheme.success
                                        : AppTheme.faint,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (!isDone)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceAlt,
                          borderRadius: BorderRadius.circular(AppTheme.rSm),
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: AppTheme.faint,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ),
            )));
  }
}
