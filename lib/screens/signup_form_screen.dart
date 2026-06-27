import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/screens/biometrics_enrollment_screen.dart';
import '../widgets/step_indicator.dart';
import '../services/cypurge_grpc_service.dart';
import '../generated/worker/v1/worker.pbenum.dart';
import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class SignUpFormScreen extends StatefulWidget {
  final String? manualUserId;
  const SignUpFormScreen({super.key, this.manualUserId});

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _givenNamesController = TextEditingController();
  final _nationalityController = TextEditingController();
  DateTime? _selectedDate;

  bool _isLoading = false;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  late AnimationController _logoAnimController;
  late Animation<double> _logoScaleAnim;
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnim;

  final Map<String, String> _countryFlags = {
    'Algeria': 'ðŸ‡©ðŸ‡¿', 'France': 'ðŸ‡«ðŸ‡·', 'United Kingdom': 'ðŸ‡¬ðŸ‡§', 'United States': 'ðŸ‡ºðŸ‡¸',
    'Spain': 'ðŸ‡ªðŸ‡¸', 'Italy': 'ðŸ‡®ðŸ‡¹', 'Germany': 'ðŸ‡©ðŸ‡ª', 'Canada': 'ðŸ‡¨ðŸ‡¦', 'Japan': 'ðŸ‡¯ðŸ‡µ',
    'China': 'ðŸ‡¨ðŸ‡³', 'Brazil': 'ðŸ‡§ðŸ‡·', 'Morocco': 'ðŸ‡²ðŸ‡¦', 'Tunisia': 'ðŸ‡¹ðŸ‡³', 'Senegal': 'ðŸ‡¸ðŸ‡³',
    'Panama': 'ðŸ‡µðŸ‡¦', 'Liberia': 'ðŸ‡±ðŸ‡·', 'Marshall Islands': 'ðŸ‡²ðŸ‡­', 'Singapore': 'ðŸ‡¸ðŸ‡¬',
    'Norway': 'ðŸ‡³ðŸ‡´', 'Greece': 'ðŸ‡¬ðŸ‡·', 'Philippines': 'ðŸ‡µðŸ‡­', 'India': 'ðŸ‡®ðŸ‡³',
  };
  bool _isCountryValid = false;

  @override
  void initState() {
    super.initState();
    _nationalityController.addListener(_onNationalityChanged);
    _logoAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _logoScaleAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _logoAnimController, curve: Curves.easeInOut),
    );

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);
    _shimmerAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );
  }

  void _onNationalityChanged() {
    final text = _nationalityController.text.trim();
    String? foundFlag;

    _countryFlags.forEach((name, flag) {
      if (name.toLowerCase() == text.toLowerCase()) {
        foundFlag = flag;
      }
    });

    setState(() {
      _isCountryValid = foundFlag != null;
    });
  }

  @override
  void dispose() {
    _logoAnimController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  Future<void> _proceedToBiometrics() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      displayInfoBar(
        context,
        builder: (context, close) => InfoBar(
          title: const Text('Required Field'),
          content: const Text('Please select your date of birth'),
          severity: InfoBarSeverity.warning,
          action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
        ),
      );
      return;
    }

    final dob = _selectedDate!;
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    if (age < 18 || age > 60) {
      displayInfoBar(
        context,
        builder: (context, close) => InfoBar(
          title: const Text('Age Verification Failed'),
          content: const Text('You must be between 18 and 60 years old to enroll.'),
          severity: InfoBarSeverity.warning,
          action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final accessToken = await EnrollmentService().getValidAccessToken();
      if (accessToken == null) throw 'Missing OIDC authentication token. Please re-authenticate.';

      final tenantId = await _storage.read(key: 'tenant_id') ?? '00000000-0000-0000-0000-000000000001';

      final grpcService = CypurgeGrpcService();
      grpcService.init(useGateway: true);

      // â”€â”€ STEP 1: Sync User Profile â”€â”€
      debugPrint('ðŸ”„ Synchronizing user profile with platform registry...');
      await grpcService.syncUser(token: accessToken);

      // â”€â”€ STEP 2: Enroll Worker via gRPC (default profile: PERMANENT) â”€â”€
      const dbProfileType = ProfileType.PROFILE_TYPE_PERMANENT;
      debugPrint('ðŸ‘¤ Enrolling worker profile: $dbProfileType...');
      
      final enrollRes = await grpcService.enrollWorker(
        token: accessToken,
        tenantId: tenantId,
        surname: _surnameController.text,
        givenNames: _givenNamesController.text,
        nationality: _nationalityController.text,
        profileType: dbProfileType,
      );

      final realWorkerId = enrollRes.workerId;
      debugPrint('âœ… Worker profile enrolled with Worker ID: $realWorkerId');

      // Save details to secure storage
      await _storage.write(key: 'worker_id', value: realWorkerId);
      await _storage.write(key: 'cypurge_worker_name', value: '${_givenNamesController.text} ${_surnameController.text}');

      // â”€â”€ STEP 2.5: Force OIDC Token Refresh â”€â”€
      // This retrieves a fresh ID/access token from Keycloak containing the newly
      // assigned `worker_id` claim, ensuring document uploads and confirmations bypass RBAC correctly.
      debugPrint('ðŸ”„ Refreshing authentication token to fetch new worker_id claim...');
      try {
        await EnrollmentService().refreshAccessToken();
        debugPrint('âœ… Token refresh complete.');
      } catch (tokenRefreshError) {
        debugPrint('âš ï¸ Token refresh failed: $tokenRefreshError');
      }

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        FluentPageRoute(builder: (context) => const BiometricsEnrollmentScreen()),
      );
    } catch (e, stack) {
      ErrorLogger.log('Sign Up Form Process', e, stack);
      if (mounted) {
        displayInfoBar(context, builder: (context, close) => InfoBar(
          title: const Text('Error'),
          content: Text(e.toString()),
          severity: InfoBarSeverity.error,
          action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
        ));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }



  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const StepIndicator(
                  currentStep: 1,
                  stepLabels: ['Scan', 'Details', 'Biometrics', 'Documents'],
                ),

                const SizedBox(height: 8),

                // Animated logo with glow ring
                Center(
                  child: AnimatedBuilder(
                    animation: _shimmerAnim,
                    builder: (context, child) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.accent.withValues(alpha: _shimmerAnim.value * 0.25),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ScaleTransition(
                          scale: _logoScaleAnim,
                          child: Image.asset('assets/Logo Maritime Trust.png', fit: BoxFit.contain),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Header
                Text('Personal Details', style: AppTheme.h1),
                const SizedBox(height: 6),
                Text(
                  'Enter your legal information for maritime identity verification.',
                  style: AppTheme.bodyMuted,
                ),

                const SizedBox(height: 28),

                // Form card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: AppTheme.card(radius: AppTheme.rLg),
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _givenNamesController,
                        label: 'Given Names',
                        icon: FluentIcons.contact,
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _surnameController,
                        label: 'Surname',
                        icon: FluentIcons.contact_info,
                        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                      ),
                      const SizedBox(height: 16),
                      _buildTextField(
                        controller: _nationalityController,
                        label: 'Nationality (e.g. France)',
                        icon: FluentIcons.flag,
                        validator: (val) {
                          if (val == null || val.isEmpty) return 'Required';
                          if (!_isCountryValid) return 'Invalid country name';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Date of Birth
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceAlt,
                          borderRadius: BorderRadius.circular(AppTheme.rSm),
                          border: Border.all(color: AppTheme.border),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(FluentIcons.calendar, color: AppTheme.accent, size: 16),
                                const SizedBox(width: 8),
                                Text('Date of Birth', style: TextStyle(color: AppTheme.ink, fontWeight: FontWeight.w600, fontSize: 13)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            DatePicker(
                              selected: _selectedDate,
                              startDate: DateTime(DateTime.now().year - 60, DateTime.now().month, DateTime.now().day),
                              endDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
                              onChanged: (DateTime? newDate) {
                                setState(() => _selectedDate = newDate);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Submit button
                WTButton(
                  label: 'Continue to Biometrics',
                  trailingIcon: FluentIcons.chevron_right,
                  loading: _isLoading,
                  onPressed: _isLoading ? null : _proceedToBiometrics,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
  }) {
    return WTFloatField(
      controller: controller,
      label: label,
      icon: icon,
      validator: validator,
    );
  }
}
