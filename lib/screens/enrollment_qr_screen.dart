import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:cypurge_mobile/services/enrollment_service.dart';
import 'package:cypurge_mobile/screens/enrollment_flow_screen.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

/// WorkerService.ValidateInvitation rejects a consumed invitation with
/// "invitation already accepted or invalid status: ACCEPTED". Match on the
/// status word rather than the whole sentence so a reworded prefix still hits.
bool isSpentInvitation(Object e) {
  final msg = e.toString().toLowerCase();
  return msg.contains('already accepted') || msg.contains('status: accepted');
}

class EnrollmentQRScreen extends StatefulWidget {
  const EnrollmentQRScreen({super.key});

  @override
  State<EnrollmentQRScreen> createState() => _EnrollmentQRScreenState();
}

class _EnrollmentQRScreenState extends State<EnrollmentQRScreen>
    with CameraFullScreen {
  final _service = EnrollmentService();
  bool _isValidating = false;
  String? _errorMessage;

  /// An invitation is single-use: EnrollWorker flips it SENT -> ACCEPTED once the
  /// worker finishes the signup form. Re-scanning that same QR (signed out, phone
  /// reinstalled) is a dead end — the worker already has an account and needs to
  /// sign in, not enrol again. Offer that route instead of a raw gRPC error.
  bool _alreadyEnrolled = false;
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
      // clearLocalStorage() is 13 sequential secure-storage deletes — a wide
      // window in which this screen can be popped. Touching context after it
      // without this guard throws.
      if (!mounted) return;
      // Check for deep link arguments passed from main.dart
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
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
      } catch (e, stack) {
        // Silently logging this left the worker staring at a dead viewfinder
        // still captioned "Searching for QR code".
        ErrorLogger.log('Enrollment QR - Scanner Start', e, stack);
        if (mounted) {
          setState(() => _errorMessage =
              'The camera could not be started. Use "Enter code manually" below, '
                  'or close and reopen this screen.');
        }
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
      // Never log the token itself: it IS the enrollment credential, and
      // debugPrint is not stripped from release builds, so it lands in logcat
      // where any app holding READ_LOGS (or anyone with adb) can lift it.
      debugPrint('Starting validation at ${_service.apiBaseUrl}');
      // Step 3: Validate Invitation
      debugPrint('â³ Validating token with backend...');
      final invitation = await _service.validateToken(token, tenant);
      debugPrint(
          'âœ… Token valid! Invitation ID: ${invitation['invitation_id']}');

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

      // Three async gaps have passed since entry (validate -> camera stop -> a
      // deliberate 2s delay). The analyzer can't see the context use below
      // because it happens inside _showPasswordRegistrationDialog, so this guard
      // has to be manual.
      if (!mounted) return;

      // Hide the validation overlay to allow interacting with the credentials dialog
      setState(() {
        _isValidating = false;
      });

      // Show native password registration dialog
      _showPasswordRegistrationDialog(invitation, tenant);
    } catch (e, stackTrace) {
      ErrorLogger.log('QR Code Scan/Validation Process', e, stackTrace);
      if (!mounted) return;

      // A spent invitation can never validate again, so re-arming the scanner
      // just loops the worker through the same failure. Send them to sign-in.
      if (isSpentInvitation(e)) {
        setState(() {
          _alreadyEnrolled = true;
          _isValidating = false;
          _errorMessage =
              'This invitation has already been used. Your account exists — sign in instead.';
        });
        return; // scanner stays stopped, _isLocked stays true
      }

      setState(() {
        _errorMessage = humanizeError(e, action: 'validate this invitation');
        _isValidating = false;
      });
      _isLocked = false; // Unlock so user can try again
      _scannerController.start();
    }
  }

  void _showPasswordRegistrationDialog(
      Map<String, dynamic> invitation, String tenant) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    bool isRegistering = false;
    // Shown inside the dialog: a snackbar would land on the page underneath,
    // dimmed by the dialog's barrier and half hidden by the keyboard.
    String? formError;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Create Security Credentials',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create a password for your account linked to:\n${invitation['email']}',
                  style: TextStyle(
                      color: AppTheme.muted, fontSize: 13, height: 1.4),
                ),
                const SizedBox(height: 20),
                WTFloatField(
                  controller: passwordController,
                  label: 'Password',
                  icon: Icons.lock_rounded,
                  obscureText: true,
                  autofillHints: const [AutofillHints.newPassword],
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                WTFloatField(
                  controller: confirmPasswordController,
                  label: 'Confirm password',
                  icon: Icons.lock_rounded,
                  autofillHints: const [AutofillHints.newPassword],
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                if (formError != null) ...[
                  const SizedBox(height: 16),
                  Semantics(
                    liveRegion: true,
                    child: WTAlert(formError!, kind: WTAlertKind.danger),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            if (!isRegistering)
              TextButton(
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
              onPressed: isRegistering
                  ? null
                  : () async {
                      final password = passwordController.text;
                      if (password.length < 8) {
                        setDialogState(() => formError =
                            'Use at least 8 characters for the password.');
                        return;
                      }
                      if (password != confirmPasswordController.text) {
                        setDialogState(() => formError =
                            'The two passwords are different. Type the same one twice.');
                        return;
                      }

                      setDialogState(() {
                        isRegistering = true;
                        formError = null;
                      });

                      try {
                        debugPrint('Creating user natively in Keycloak...');
                        await _service.registerAndLoginWorkerNatively(
                          invitationId: invitation['invitation_id'],
                          // Authoritative UUID from ValidateInvitation. The QR's
                          // `tenant` param may be a slug OR a UUID, so it can't be
                          // passed to RPCs that key on tenant_id.
                          tenantId: invitation['tenant_id'] ?? tenant,
                          tenantSlug: invitation['tenant_slug'] ?? tenant,
                          email: invitation['email'],
                          password: password,
                        );

                        // `context` here is the DIALOG's — shadowed twice, by
                        // showDialog's builder and StatefulBuilder's. The State's
                        // `mounted` says nothing about whether that dialog element
                        // survived, and barrierDismissible:false does not stop the
                        // Android back button popping it mid-await. So guard the
                        // dialog with context.mounted and the screen with mounted.
                        if (context.mounted) {
                          Navigator.pop(context); // Close dialog
                        }

                        // Navigate on the State's own context, which outlives the dialog.
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          this.context,
                          platformRoute(
                              builder: (_) => const EnrollmentFlowScreen()),
                        );
                      } on AccountPasswordNotAppliedException catch (e) {
                        // Recoverable: the account exists but holds a password the
                        // worker does not know. Offer the reset rather than dumping a
                        // Keycloak error blob they can do nothing with.
                        if (!context.mounted) return;
                        setDialogState(() {
                          isRegistering = false;
                        });
                        await _showAccountExistsRecovery(e);
                      } catch (e, stackTrace) {
                        ErrorLogger.log(
                            'Native Keycloak Register', e, stackTrace);
                        if (!context.mounted) return;
                        setDialogState(() {
                          isRegistering = false;
                          formError =
                              humanizeError(e, action: 'complete registration');
                        });
                      }
                    },
              child: isRegistering
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: WTSpinner(
                          strokeWidth: 2, activeColor: AppTheme.onAccent),
                    )
                  : const Text('Register & Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  /// Shown when the account exists but the chosen password never reached it.
  ///
  /// Deliberately offers only actions the worker can actually complete without
  /// an administrator: email themselves a reset link, or sign in if they happen
  /// to know the existing password. Retrying registration would fail
  /// identically, so it is not offered.
  Future<void> _showAccountExistsRecovery(
      AccountPasswordNotAppliedException e) async {
    // Uses the State's own context, not the registration dialog's — that dialog
    // is still on the stack here and its element is about to be replaced.
    if (!mounted) return;
    var sending = false;
    var sent = false;
    String? resetError;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setRecoveryState) => AlertDialog(
          title: const Text('Account already exists'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sent
                    ? 'We sent a password reset link to ${e.email}. Open it, set '
                        'a new password, then come back and sign in.'
                    : 'An account for ${e.email} already exists, and the password '
                        'you just chose was not applied to it.\n\nReset the '
                        'password to take control of the account, or sign in if '
                        'you already know it.',
              ),
              if (resetError != null) ...[
                const SizedBox(height: 16),
                Semantics(
                  liveRegion: true,
                  child: WTAlert(resetError!, kind: WTAlertKind.danger),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: sending
                  ? null
                  : () {
                      Navigator.pop(dialogContext);
                      if (!mounted) return;
                      // Same route the spent-invitation path uses below —
                      // clears the enrollment stack so Back cannot return to a
                      // half-finished registration.
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
              child: const Text('Go to sign in'),
            ),
            FilledButton(
              onPressed: sending || sent
                  ? null
                  : () async {
                      setRecoveryState(() {
                        sending = true;
                        resetError = null;
                      });
                      try {
                        await _service.sendPasswordReset(
                            email: e.email, tenantId: e.tenantId);
                        setRecoveryState(() {
                          sending = false;
                          sent = true;
                        });
                      } catch (err, stack) {
                        ErrorLogger.log(
                            'ForgotPassword (enrollment)', err, stack);
                        if (!dialogContext.mounted) return;
                        setRecoveryState(() {
                          sending = false;
                          resetError = humanizeError(err,
                              action: 'send the reset email');
                        });
                      }
                    },
              child: sending
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: WTSpinner(
                          strokeWidth: 2, activeColor: AppTheme.onAccent),
                    )
                  : Text(sent ? 'Email sent' : 'Reset password'),
            ),
          ],
        ),
      ),
    );
  }

  /// Tallest the page needs to give the scanner a usable size.
  static const double _minPageHeight = 760;

  @override
  Widget build(BuildContext context) {
    return WTPage(
      topGap: 0,
      fullBleed: true,
      content: Stack(
        fit: StackFit.expand,
        children: [
          // Background UI
          SafeArea(
            // The scanner takes whatever height is left, so on a short phone
            // (or with large text) it was squeezed to nothing and the page
            // overflowed. Below _minPageHeight the page scrolls instead.
            child: LayoutBuilder(
              builder: (context, box) => SingleChildScrollView(
                child: SizedBox(
                  height: box.maxHeight < _minPageHeight
                      ? _minPageHeight
                      : box.maxHeight,
                  child: _buildPage(),
                ),
              ),
            ),
          ),

          // Loading Overlay
          if (_isValidating) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  /// Header, scanner and actions. Laid out at a fixed height from
  /// [build]: the scanner is Expanded, so it needs a bounded page.
  Widget _buildPage() {
    return Padding(
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
              style: TextStyle(
                // A spent invitation isn't a failure the worker can fix
                // by retrying, so don't dress it up as an error.
                color:
                    _alreadyEnrolled ? AppTheme.muted : const Color(0xFFEF4444),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          const SizedBox(height: 24),
          if (_alreadyEnrolled)
            FilledButton(
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false),
              child: const Text('Go to sign in',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )
          else
            _buildManualEntryButton(),
          const SizedBox(height: 40),
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
          child: Icon(Icons.qr_code_rounded, color: AppTheme.accent, size: 40),
        ),
        const SizedBox(height: 24),
        Text(
          'Welcome to Tridoma',
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
                debugPrint(
                    'âŒ MobileScanner Camera Error: ${error.errorCode} - ${error.errorDetails}');
                final friendly = switch (error.errorCode) {
                  MobileScannerErrorCode.permissionDenied =>
                    'Camera access is off. Enable the camera for Tridoma in your device settings, then try again.',
                  MobileScannerErrorCode.unsupported =>
                    "This device's camera can't scan QR codes. Use the manual short code from your invitation instead.",
                  _ =>
                    "We couldn't start the camera. Close other apps using it and try again.",
                };
                return Container(
                  color: Colors.black,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline_rounded,
                              color: AppTheme.cameraError, size: 40),
                          const SizedBox(height: 16),
                          Text(friendly,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
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
                      // Tenant is safe to log; the token is not (see _handleToken).
                      debugPrint(
                          'SUCCESS: scanned invitation for tenant=$tenant');
                      _scannerController.stop(); // Stop camera immediately
                      _handleToken(token, tenant);
                      break;
                    } else {
                      debugPrint(
                          'âš ï¸ Ignored raw scan (missing token or tenant param): $code');
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.54),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Searching for QR code...',
                      style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 12)),
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
        TextButton(
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
      builder: (context) => AlertDialog(
        title: const Text('Manual Entry',
            style: TextStyle(fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter the code and tenant ID from your invitation message.',
                style: TextStyle(color: AppTheme.muted, fontSize: 14),
              ),
              const SizedBox(height: 24),
              _buildTextField(codeController, 'Invitation Code (e.g. 123456)',
                  Icons.numbers_rounded),
              const SizedBox(height: 16),
              _buildTextField(
                  tenantController, 'Tenant ID (e.g. dhl)', Icons.work_rounded),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              _handleToken(
                  codeController.text.trim(), tenantController.text.trim());
            },
            child: const Text('Verify Code',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, IconData icon) {
    // The invitation code is digits; the tenant id is a short slug.
    return WTFloatField(
      controller: controller,
      label: hint,
      icon: icon,
      keyboardType: hint.startsWith('Invitation')
          ? TextInputType.number
          : TextInputType.text,
      autofillHints: hint.startsWith('Invitation')
          ? const [AutofillHints.oneTimeCode]
          : null,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _buildLoadingOverlay() {
    return Container(
      color: AppTheme.bg.withValues(alpha: 0.94),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WTSpinner(activeColor: AppTheme.accent),
            const SizedBox(height: 24),
            Text(
              'Validating Invitation...',
              style: TextStyle(
                  color: AppTheme.ink,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
