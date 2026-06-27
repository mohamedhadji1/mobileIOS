import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cypurge_mobile/services/enrollment_service.dart';
import 'package:cypurge_mobile/screens/signup_form_screen.dart';
import '../utils/error_logger.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class EnrollmentQRScreen extends StatefulWidget {
  const EnrollmentQRScreen({super.key});

  @override
  State<EnrollmentQRScreen> createState() => _EnrollmentQRScreenState();
}

class _EnrollmentQRScreenState extends State<EnrollmentQRScreen> {
  final _service = EnrollmentService();
  bool _isValidating = false;
  String? _errorMessage;
  final MobileScannerController _scannerController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  @override
  void initState() {
    super.initState();
    // Safe start: Attempt to start and catch AlreadyInitialized exceptions
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       await _service.clearLocalStorage();
       // Check for deep link arguments passed from main.dart
       final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
       if (args != null && args['auto_start'] == true) {
         final token = args['token'];
         final tenant = args['tenant'];
         if (token != null && tenant != null) {
           _handleToken(token, tenant);
           return; // Don't start scanner if we are auto-processing
         }
       }

       try {
         await _scannerController.start();
       } catch (e) {
         debugPrint('Scanner already running or failed to start: $e');
       }
    });
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  bool _isLocked = false; // Synchronous lock

  void _handleToken(String token, String tenant) async {
    if (_isLocked || _isValidating) return;
    _isLocked = true; // Lock immediately
    
    setState(() {
      _isValidating = true;
      _errorMessage = null;
    });

    try {
      debugPrint('ðŸš€ Starting validation for token=$token at ${_service.apiBaseUrl}');
      // Step 3: Validate Invitation
      debugPrint('â³ Validating token with backend...');
      final invitation = await _service.validateToken(token, tenant);
      debugPrint('âœ… Token valid! Invitation ID: ${invitation['invitation_id']}');

      // Step 5: STOP AND DISPOSE THE CAMERA COMPLETELY
      debugPrint('ðŸ“¸ Releasing camera hardware...');
      try {
        await _scannerController.stop();
      } catch (e) {
        debugPrint('âš ï¸ Camera stop warning: $e');
      }
      
      // Step 6: Wait for OS to breathe (2 seconds for Xiaomi/MIUI)
      debugPrint('â³ Waiting for system to stabilize...');
      await Future.delayed(const Duration(milliseconds: 2000));
      
      // Hide the validation overlay to allow interacting with the credentials dialog
      setState(() {
        _isValidating = false;
      });

      // Show native password registration dialog
      _showPasswordRegistrationDialog(invitation, tenant);

    } catch (e, stackTrace) {
      ErrorLogger.log('QR Code Scan/Validation Process', e, stackTrace);
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceAll('Exception: ', '');
          _isValidating = false;
        });
        _isLocked = false; // Unlock so user can try again
        _scannerController.start(); 
      }
    }
  }

  void _showPasswordRegistrationDialog(Map<String, dynamic> invitation, String tenant) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    bool isRegistering = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => ContentDialog(
          title: const Text('Create Security Credentials', style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Create a password for your account linked to:\n${invitation['email']}',
                style: TextStyle(color: AppTheme.muted, fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 20),
              WTFloatField(
                controller: passwordController,
                label: 'Password',
                icon: FluentIcons.lock,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              WTFloatField(
                controller: confirmPasswordController,
                label: 'Confirm password',
                icon: FluentIcons.lock,
                obscureText: true,
              ),
            ],
          ),
          actions: [
            if (!isRegistering)
              Button(
                onPressed: () {
                  Navigator.pop(context);
                  // Restart scanner
                  setState(() {
                    _isValidating = false;
                  });
                  _isLocked = false;
                  _scannerController.start();
                },
                child: const Text('Cancel'),
              ),
            FilledButton(
              onPressed: isRegistering ? null : () async {
                final password = passwordController.text;
                if (password.length < 8) {
                  displayInfoBar(
                    context,
                    builder: (context, close) => InfoBar(
                      title: const Text('Invalid Password'),
                      content: const Text('Password must be at least 8 characters long'),
                      severity: InfoBarSeverity.warning,
                      action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
                    ),
                  );
                  return;
                }
                if (password != confirmPasswordController.text) {
                  displayInfoBar(
                    context,
                    builder: (context, close) => InfoBar(
                      title: const Text('Mismatch'),
                      content: const Text('Passwords do not match'),
                      severity: InfoBarSeverity.warning,
                      action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
                    ),
                  );
                  return;
                }

                setDialogState(() {
                  isRegistering = true;
                });

                try {
                  debugPrint('Creating user natively in Keycloak...');
                  await _service.registerAndLoginWorkerNatively(
                    invitationId: invitation['invitation_id'],
                    tenantSlug: invitation['tenant_slug'] ?? tenant,
                    email: invitation['email'],
                    password: password,
                  );

                  Navigator.pop(context); // Close dialog

                  // Go to details screen
                  if (mounted) {
                    Navigator.pushReplacement(
                      context,
                      FluentPageRoute(builder: (context) => const SignUpFormScreen()),
                    );
                  }
                } catch (e, stackTrace) {
                  ErrorLogger.log('Native Keycloak Register', e, stackTrace);
                  setDialogState(() {
                    isRegistering = false;
                  });
                  displayInfoBar(
                    context,
                    builder: (context, close) => InfoBar(
                      title: const Text('Registration Failed'),
                      content: Text(e.toString().replaceAll('Exception: ', '')),
                      severity: InfoBarSeverity.error,
                      action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
                    ),
                  );
                }
              },
              child: isRegistering
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: ProgressRing(strokeWidth: 2, activeColor: Colors.white),
                    )
                  : const Text('Register & Sign In', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Stack(
        fit: StackFit.expand,
        children: [
          // Background UI
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildScannerUI(),
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Color(0xFFEF4444), fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                  const SizedBox(height: 24),
                  _buildManualEntryButton(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          
          // Loading Overlay
          if (_isValidating) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppTheme.accentSoft,
            shape: BoxShape.circle,
          ),
          child: Icon(FluentIcons.q_r_code, color: AppTheme.accent, size: 40),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome to WorkerTrust',
          style: TextStyle(
            color: AppTheme.ink,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Scan the QR code in your invitation to begin your secure identity enrollment.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppTheme.muted, fontSize: 15, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildScannerUI() {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            MobileScanner(
              controller: _scannerController,
              errorBuilder: (context, error, child) {
                debugPrint('âŒ MobileScanner Camera Error: ${error.errorCode} - ${error.errorDetails}');
                return Container(
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(FluentIcons.error, color: Colors.red.normal, size: 40),
                        const SizedBox(height: 16),
                        Text('Scanner Error: ${error.errorCode}', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                );
              },
              onDetect: (capture) {
                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  final String? code = barcode.rawValue;
                  debugPrint('ðŸ” RAW SCAN: $code');
                  if (code != null) {
                    HapticFeedback.vibrate(); // Stronger feedback
                    
                    String? token;
                    String? tenant;
                    
                    if (code.contains('workertrust://')) {
                      final uri = Uri.parse(code);
                      token = uri.queryParameters['token'];
                      tenant = uri.queryParameters['tenant'];
                    } else if (code.contains('token=')) {
                      // Fallback for messy scans
                      final parts = code.split('?').last.split('&');
                      for (var p in parts) {
                        if (p.startsWith('token=')) token = p.split('=')[1];
                        if (p.startsWith('tenant=')) tenant = p.split('=')[1];
                      }
                    }
                    
                    if (token != null && tenant != null) {
                      debugPrint('ðŸŽ¯ SUCCESS: Found token=$token, tenant=$tenant');
                      _scannerController.stop(); // Stop camera immediately
                      _handleToken(token, tenant);
                      break;
                    } else {
                      debugPrint('âš ï¸ Ignored raw scan (missing token or tenant param): $code');
                    }
                  }
                }
              },
            ),
            _buildScannerOverlay(),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.54), borderRadius: BorderRadius.circular(20)),
                  child: const Text('Searching for QR code...', style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannerOverlay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
      ),
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.accent, width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _buildManualEntryButton() {
    return Column(
      children: [
        HyperlinkButton(
          onPressed: _showManualEntryDialog,
          child: Text(
            'Enter invitation code manually',
            style: TextStyle(
              color: AppTheme.accent,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  void _showManualEntryDialog() {
    final TextEditingController codeController = TextEditingController();
    final TextEditingController tenantController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => ContentDialog(
        title: const Text('Manual Entry', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter the code and tenant ID from your invitation message.',
              style: TextStyle(color: AppTheme.muted, fontSize: 14),
            ),
            const SizedBox(height: 24),
            _buildTextField(codeController, 'Invitation Code (e.g. 123456)', FluentIcons.number_sequence),
            const SizedBox(height: 16),
            _buildTextField(tenantController, 'Tenant ID (e.g. dhl)', FluentIcons.business_center_logo),
          ],
        ),
        actions: [
          Button(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _handleToken(codeController.text.trim(), tenantController.text.trim());
            },
            child: const Text('Verify Code', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon) {
    return WTFloatField(controller: controller, label: hint, icon: icon);
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: AppTheme.bg.withValues(alpha: 0.94),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProgressRing(activeColor: AppTheme.accent),
            const SizedBox(height: 24),
            Text(
              'Validating Invitation...',
              style: TextStyle(color: AppTheme.ink, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Establishing secure connection to Keycloak',
              style: TextStyle(color: AppTheme.muted, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
