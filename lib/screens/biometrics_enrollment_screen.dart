import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/screens/face_liveness_screen.dart';
import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import '../widgets/step_indicator.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class BiometricsEnrollmentScreen extends StatefulWidget {
  const BiometricsEnrollmentScreen({super.key});

  @override
  State<BiometricsEnrollmentScreen> createState() => _BiometricsEnrollmentScreenState();
}

class _BiometricsEnrollmentScreenState extends State<BiometricsEnrollmentScreen>
    with TickerProviderStateMixin {
  final _storage = const FlutterSecureStorage();
  bool _faceDone = false;
  bool _fingerprintDone = false;
  String _workerId = 'test-worker';

  late AnimationController _shieldPulseController;
  late Animation<double> _shieldPulseAnim;
  late AnimationController _scanLineController;
  late Animation<double> _scanLineAnim;

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

    _scanLineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
    _scanLineAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scanLineController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _shieldPulseController.dispose();
    _scanLineController.dispose();
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
      Navigator.pushReplacementNamed(context, '/enroll/documents');
    }
  }

  int get _completedCount => (_faceDone ? 1 : 0) + (_fingerprintDone ? 1 : 0);

  @override
  Widget build(BuildContext context) {
    final allDone = _faceDone && _fingerprintDone;

    return ScaffoldPage(
      content: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const StepIndicator(
                currentStep: 2,
                stepLabels: ['Scan', 'Details', 'Biometrics', 'Documents'],
              ),

              const SizedBox(height: 8),

              // Animated shield icon
              Center(
                child: AnimatedBuilder(
                  animation: _shieldPulseAnim,
                  builder: (context, child) {
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
                                .withValues(alpha: _shieldPulseAnim.value * 0.2),
                            blurRadius: 30,
                            spreadRadius: 5,
                          ),
                        ],
                        border: Border.all(
                          color: AppTheme.accent.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Icon(
                        allDone ? FluentIcons.completed_solid : FluentIcons.shield,
                        color: allDone
                            ? AppTheme.success
                            : AppTheme.accent,
                        size: 36,
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Header text
              Text('Biometric Identity', style: AppTheme.h1, textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(
                'High-security biometrics prevent identity fraud\nin maritime security zones.',
                textAlign: TextAlign.center,
                style: AppTheme.bodyMuted,
              ),

              const SizedBox(height: 16),

              // Progress badge
              Center(
                child: WTTag(
                  allDone ? 'All scans complete' : '$_completedCount of 2 complete',
                  kind: allDone ? WTTagKind.green : WTTagKind.amber,
                ),
              ),

              const SizedBox(height: 28),

              // Biometric cards
              _buildBiometricCard(
                title: 'Facial Liveness',
                subtitle: 'Scan face and perform blink test',
                icon: FluentIcons.contact,
                isDone: _faceDone,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    FluentPageRoute(builder: (context) => FaceLivenessScreen(userId: _workerId)),
                  );
                  if (result == true) setState(() => _faceDone = true);
                },
              ),

              const SizedBox(height: 14),

              _buildBiometricCard(
                title: 'Fingerprint Identity',
                subtitle: 'Register secure hardware token',
                icon: FluentIcons.fingerprint,
                isDone: _fingerprintDone,
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    FluentPageRoute(builder: (context) => const FingerprintScanScreen()),
                  );
                  if (result == true) setState(() => _fingerprintDone = true);
                },
              ),

              const Spacer(),

              // Submit button
              WTButton(
                label: allDone ? 'Continue to Documents' : 'Complete both scans to continue',
                trailingIcon: allDone ? FluentIcons.chevron_right : null,
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
    return GestureDetector(
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
                    ? const Icon(FluentIcons.check_mark, color: Colors.white, size: 24)
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
                          color: isDone ? AppTheme.success : AppTheme.faint,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isDone ? 'Verified' : subtitle,
                        style: TextStyle(
                          color: isDone ? AppTheme.success : AppTheme.faint,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
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
                  FluentIcons.chevron_right,
                  color: AppTheme.faint,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
