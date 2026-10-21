import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import '../widgets/step_indicator.dart';
import '../utils/error_logger.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class FingerprintScanScreen extends StatefulWidget {
  const FingerprintScanScreen({super.key});

  @override
  State<FingerprintScanScreen> createState() => _FingerprintScanScreenState();
}

class _FingerprintScanScreenState extends State<FingerprintScanScreen>
    with TickerProviderStateMixin {
  final LocalAuthentication auth = LocalAuthentication();

  late AnimationController _scanController;
  late Animation<double> _scanLineAnimation;
  late AnimationController _pulseController;
  late AnimationController _successController;

  bool _isHolding = false;
  double _progress = 0.0;
  bool _isSuccess = false;
  String _statusText = 'READY FOR SCAN';
  List<String> _scanLogs = [];

  @override
  void initState() {
    super.initState();
    _scanController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _scanLineAnimation = Tween<double>(begin: -100, end: 100).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.easeInOut),
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _successController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reduce-motion freezes the pulse (build reads 0.5), so stop its ticker.
    if (AppTheme.reduceMotion(context)) {
      _pulseController.stop();
    } else if (!_pulseController.isAnimating) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _scanController.dispose();
    _pulseController.dispose();
    _successController.dispose();
    super.dispose();
  }

  void _addLog(String msg) {
    setState(() {
      _scanLogs.insert(0, '> $msg');
      if (_scanLogs.length > 3) _scanLogs.removeLast();
      _statusText = msg.toUpperCase();
    });
  }

  void _startScanning() async {
    if (_isSuccess) return;
    _scanController.repeat(reverse: true);
    setState(() {
      _isHolding = true;
      _progress = 0.0;
      _scanLogs = [];
    });

    final stages = [
      {'p': 0.2, 'm': 'Initializing scanner...'},
      {'p': 0.4, 'm': 'Capturing minutiae...'},
      {'p': 0.7, 'm': 'Extracting identity vector...'},
      {'p': 0.9, 'm': 'Encrypting biometric hash...'},
      {'p': 1.0, 'm': 'Verifying hardware token...'},
    ];

    for (var stage in stages) {
      if (!_isHolding) return;
      _addLog(stage['m'] as String);

      double target = stage['p'] as double;
      double start = _progress;
      int steps = 15;
      for (int i = 1; i <= steps; i++) {
        if (!_isHolding) return;
        await Future.delayed(const Duration(milliseconds: 40));
        setState(() {
          _progress = start + (target - start) * (i / steps);
        });
        if (i % 5 == 0) HapticFeedback.selectionClick();
      }
    }

    _verifyWithSystem();
  }

  void _stopScanning() {
    if (_isSuccess) return;
    _scanController.stop();
    setState(() {
      _isHolding = false;
      if (!_isSuccess) {
        _progress = 0.0;
        _statusText = 'SCAN INTERRUPTED';
        _scanLogs = ['> SCAN FAILED', '> PLEASE HOLD STEADY'];
      }
    });
  }

  Future<void> _verifyWithSystem() async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason: 'Secure Biometric Enrollment',
      );

      if (authenticated) {
        HapticFeedback.heavyImpact();
        setState(() {
          _isSuccess = true;
          _isHolding = false;
          _statusText = 'ENROLLMENT SUCCESS';
        });
        _successController.forward();

        Future.delayed(const Duration(milliseconds: 2000), () {
          if (mounted) Navigator.pop(context, true);
        });
      } else {
        _stopScanning();
      }
    } catch (e, stack) {
      ErrorLogger.log('Biometric Fingerprint Verification', e, stack);
      _stopScanning();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: Container(
        decoration: BoxDecoration(color: AppTheme.bg),
        child: SafeArea(
          // Scrolls on short screens: the scanner alone is 240dp tall.
          child: WTFormBody(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
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

                const SizedBox(height: 20),

                // Security Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shield_rounded,
                        color: AppTheme.accent, size: 14),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'SECURE BIOMETRIC SUBSYSTEM',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppTheme.faint,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Scanner Area
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer glow/ring.
                    // Boxed into its own layer: _pulseController repeats for the
                    // screen's whole lifetime and drives spreadRadius, so this
                    // 40px blur is re-rendered every frame and can never be
                    // cached. Unboxed it dragged the whole enclosing layer —
                    // progress ring, icon, log panel — into that repaint.
                    RepaintBoundary(
                      child: AnimatedBuilder(
                        animation: _pulseController,
                        builder: (context, child) {
                          final pulse = AppTheme.reduceMotion(context)
                              ? 0.5
                              : _pulseController.value;
                          return Container(
                            width: 240,
                            height: 240,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: (_isSuccess
                                          ? AppTheme.success
                                          : AppTheme.accent)
                                      .withValues(
                                          alpha: _isHolding ? 0.2 : 0.05),
                                  blurRadius: 40,
                                  spreadRadius: pulse * 10,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // Progress Ring
                    SizedBox(
                      width: 220,
                      height: 220,
                      child: WTSpinner(
                        value: _progress * 100,
                        strokeWidth: 6,
                        activeColor:
                            _isSuccess ? AppTheme.success : AppTheme.accent,
                        backgroundColor: AppTheme.border,
                      ),
                    ),

                    // Main Scanner Circle
                    Semantics(
                        button: true,
                        enabled: !_isSuccess,
                        label: 'Scan fingerprint',
                        hint: 'Double-tap to scan',
                        onTap: _startScanning,
                        excludeSemantics: true,
                        child: GestureDetector(
                          onTapDown: (_) => _startScanning(),
                          onTapUp: (_) => _stopScanning(),
                          onTapCancel: () => _stopScanning(),
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceAlt,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _isSuccess
                                    ? AppTheme.success
                                    : AppTheme.border2,
                                width: 2,
                              ),
                            ),
                            child: ClipOval(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.fingerprint_rounded,
                                    size: 100,
                                    color: _isSuccess
                                        ? AppTheme.success
                                        : (_isHolding
                                            ? AppTheme.accent
                                            : AppTheme.faint),
                                  ),

                                  // Scan Line
                                  if (_isHolding &&
                                      !AppTheme.reduceMotion(context))
                                    AnimatedBuilder(
                                      animation: _scanLineAnimation,
                                      builder: (context, child) {
                                        return Positioned(
                                          top: 90 + _scanLineAnimation.value,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 3,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppTheme.accent
                                                      .withValues(alpha: 0.8),
                                                  blurRadius: 10,
                                                  spreadRadius: 2,
                                                )
                                              ],
                                              gradient: LinearGradient(
                                                colors: [
                                                  AppTheme.accent
                                                      .withValues(alpha: 0),
                                                  AppTheme.accent,
                                                  AppTheme.accent
                                                      .withValues(alpha: 0),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),

                                  // Success Overlay
                                  ScaleTransition(
                                    scale: _successController,
                                    child: Container(
                                      width: 180,
                                      height: 180,
                                      color: AppTheme.success
                                          .withValues(alpha: 0.2),
                                      child: const Icon(Icons.check_rounded,
                                          color: Colors.white, size: 60),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),

                const Spacer(),

                // Status and Logs
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: AppTheme.card(radius: AppTheme.rLg),
                  child: Column(
                    children: [
                      Text(
                        _statusText,
                        style: TextStyle(
                          color: _isSuccess
                              ? AppTheme.success
                              : (_isHolding ? AppTheme.accent : AppTheme.ink),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ..._scanLogs.map((log) => Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text(
                              log,
                              style: TextStyle(
                                color: AppTheme.faint,
                                fontSize: 12,
                                fontFamily: 'monospace',
                              ),
                            ),
                          )),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  'PRESS AND HOLD TO SCAN',
                  style: TextStyle(
                    color: AppTheme.faint,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
