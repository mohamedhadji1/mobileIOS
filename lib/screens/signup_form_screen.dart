import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/screens/cv_upload_screen.dart';
import 'package:cypurge_mobile/screens/enrollment_flow_screen.dart';
import 'package:cypurge_mobile/screens/pending_approval_screen.dart';
import '../widgets/step_indicator.dart';
import '../services/cypurge_grpc_service.dart';
import '../generated/worker/v1/worker.pbenum.dart';
import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/countries.dart';
import '../widgets/country_picker_dialog.dart';

class SignUpFormScreen extends StatefulWidget {
  final String? manualUserId;
  const SignUpFormScreen({super.key, this.manualUserId});

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _surnameController = TextEditingController();
  final _givenNamesController = TextEditingController();
  final _nationalityController = TextEditingController();
  DateTime? _selectedDate;
  // ponytail: device-side gate only — the backend has no consent field to
  // record it in. Add it to EnrollWorker once one exists.
  bool _consented = false;

  bool _isLoading = false;

  /// Set once EnrollWorker succeeds. The worker can come back to this step
  /// from later ones, and there is no RPC to change a profile once created, so
  /// from then on the form is read-only and Continue sends nothing.
  String? _savedWorkerId;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  bool _isCountryValid = false;

  @override
  void initState() {
    super.initState();
    _nationalityController.addListener(_onNationalityChanged);
  }

  /// Modal country picker (all countries, searchable).
  ///
  /// Replaces an inline suggestion flyout that anchored BELOW the field. Since
  /// the field sits low in a scrolling form, opening it raised the keyboard and
  /// the flyout rendered straight into it — present but unreachable. Scrolling
  /// the field upward first was tried and still lost the race with the keyboard
  /// animation. A modal owns the whole screen, so there is no geometry to lose.
  Future<void> _pickNationality() async {
    final picked =
        await showCountryPicker(context, selected: _nationalityController.text);
    if (picked == null || !mounted) return;
    // The controller's listener recomputes _isCountryValid and calls setState.
    _nationalityController.text = picked;
  }

  void _onNationalityChanged() {
    final text = _nationalityController.text.trim().toLowerCase();
    final valid = kCountries.keys.any((name) => name.toLowerCase() == text);
    // The rebuild reaches the whole form (step indicator, logo, card, every
    // field), so only rebuild when validity actually flips.
    if (valid == _isCountryValid) return;
    setState(() => _isCountryValid = valid);
  }

  // Snappy native calendar, year-first for fast DOB entry. Its colours come
  // from the app theme.
  Future<void> _pickDob() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(now.year - 25, now.month, now.day),
      firstDate: DateTime(now.year - 60, now.month, now.day),
      lastDate: DateTime(now.year - 18, now.month, now.day),
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  @override
  void dispose() {
    _nationalityController.removeListener(_onNationalityChanged);
    // Every TextEditingController holds a listener list and is a ChangeNotifier;
    // leaving them undisposed leaks the whole form on each pop of this screen.
    _surnameController.dispose();
    _givenNamesController.dispose();
    _nationalityController.dispose();
    super.dispose();
  }

  Future<void> _proceedToBiometrics() async {
    // Came back to a step already saved: calling EnrollWorker again would try
    // to create a second worker for the same account.
    if (_savedWorkerId != null) {
      EnrollmentFlowScreen.maybeOf(context)?.next();
      return;
    }
    if (!_formKey.currentState!.validate()) return;
    // Nationality is a modal picker, not a FormField, so the form's own
    // validate() pass cannot see it — check it explicitly, like the date below.
    // Guarding on _isCountryValid rather than "is non-empty" keeps the old
    // validator's guarantee that the value is one of the known countries.
    if (!_isCountryValid) {
      wtInfoBar(context, 'Required Field',
          message: 'Please select your nationality',
          severity: WTSeverity.warning);
      return;
    }
    if (_selectedDate == null) {
      wtInfoBar(context, 'Required Field',
          message: 'Please select your date of birth',
          severity: WTSeverity.warning);
      return;
    }

    final dob = _selectedDate!;
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    if (age < 18 || age > 60) {
      wtInfoBar(context, 'Age Verification Failed',
          message: 'You must be between 18 and 60 years old to enroll.',
          severity: WTSeverity.warning);
      return;
    }

    if (!_consented) {
      wtInfoBar(context, 'Consent required',
          message: 'Tick the box to agree to the checks before you continue.',
          severity: WTSeverity.warning);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final accessToken = await EnrollmentService().getValidAccessToken();
      if (accessToken == null) {
        throw 'Missing OIDC authentication token. Please re-authenticate.';
      }

      final tenantId = await _storage.read(key: 'tenant_id') ??
          '00000000-0000-0000-0000-000000000001';

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
        // Checked 18–60 above; the backend checks it again.
        dateOfBirth: DateFormat('yyyy-MM-dd').format(dob),
      );

      final realWorkerId = enrollRes.workerId;
      _savedWorkerId = realWorkerId;
      debugPrint('âœ… Worker profile enrolled with Worker ID: $realWorkerId');

      // Save details to secure storage
      await _storage.write(key: 'worker_id', value: realWorkerId);
      // Fresh enrollment: reset the HR-acceptance gate for this new worker.
      await _storage.delete(key: 'hr_accepted');
      ApprovalGate.reset();
      await _storage.write(
          key: 'cypurge_worker_name',
          value: '${_givenNamesController.text} ${_surnameController.text}');

      // â”€â”€ STEP 2.5: Force OIDC Token Refresh â”€â”€
      // This retrieves a fresh ID/access token from Keycloak containing the newly
      // assigned `worker_id` claim, ensuring document uploads and confirmations bypass RBAC correctly.
      debugPrint(
          'ðŸ”„ Refreshing authentication token to fetch new worker_id claim...');
      try {
        await EnrollmentService().refreshAccessToken();
        debugPrint('âœ… Token refresh complete.');
      } catch (tokenRefreshError) {
        debugPrint('âš ï¸ Token refresh failed: $tokenRefreshError');
      }

      if (!mounted) return;
      final flow = EnrollmentFlowScreen.maybeOf(context);
      if (flow != null) {
        flow.next();
      } else {
        Navigator.pushReplacement(
          context,
          platformRoute(builder: (context) => const CvUploadScreen()),
        );
      }
    } catch (e, stack) {
      ErrorLogger.log('Sign Up Form Process', e, stack);
      if (mounted) {
        wtInfoBar(context, 'Error',
            message: humanizeError(e, action: 'create your account'),
            severity: WTSeverity.error);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: GestureDetector(
        // Tap anywhere outside a field to drop the keyboard instantly.
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: WTFormBody(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Scan was replaced by this screen, so there is nothing to
                  // pop. The scan screen clears the local session when it
                  // opens: stepping back restarts from the invitation QR.
                  //
                  // Hidden once the details are saved: restarting then would
                  // wipe the new account's session and leave the worker with an
                  // invitation that is already spent.
                  if (_savedWorkerId == null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: WTIconButton(
                        icon: Icons.chevron_left_rounded,
                        label: 'Back to scan',
                        color: AppTheme.ink,
                        size: 18,
                        onPressed: _isLoading
                            ? null
                            : () => Navigator.pushReplacementNamed(
                                context, '/enroll'),
                      ),
                    )
                  else
                    // Keeps the step indicator from jumping up by 48dp.
                    const SizedBox(height: 48),
                  const StepIndicator(
                    currentStep: 1,
                    stepLabels: [
                      'Scan',
                      'Details',
                      'Experience',
                      'Documents',
                      'Biometrics'
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Logo — flat and still: no glow ring, no pulse.
                  Center(
                    child: SizedBox(
                      width: 72,
                      height: 72,
                      child: Image.asset(AppTheme.logoAsset, fit: BoxFit.contain),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Header
                  Text('Personal Details', style: AppTheme.h1),
                  const SizedBox(height: 6),
                  Text(
                    'Enter your legal information for maritime identity verification.',
                    style: AppTheme.bodyMuted,
                  ),

                  const SizedBox(height: 28),

                  if (_savedWorkerId != null)
                    const WTAlert(
                      'Your details are saved. They cannot be changed here — '
                      'ask your HR team if something is wrong.',
                    ),

                  // Form card. Locked once saved; see _savedWorkerId.
                  AbsorbPointer(
                    absorbing: _savedWorkerId != null,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: AppTheme.card(radius: AppTheme.rLg),
                      child: Column(
                        children: [
                          _buildTextField(
                            controller: _givenNamesController,
                            label: 'Given Names',
                            icon: Icons.person_rounded,
                            autofillHints: const [AutofillHints.givenName],
                            validator: (val) =>
                                val == null || val.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: _surnameController,
                            label: 'Surname',
                            icon: Icons.contact_page_rounded,
                            autofillHints: const [AutofillHints.familyName],
                            textInputAction: TextInputAction.done,
                            validator: (val) =>
                                val == null || val.isEmpty ? 'Required' : null,
                          ),
                          const SizedBox(height: 16),
                          // Nationality — tap opens the searchable country picker.
                          MergeSemantics(
                              child: Semantics(
                                  button: true,
                                  label: 'Nationality',
                                  hint: 'Opens the country list',
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: _pickNationality,
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: AppTheme.surfaceAlt,
                                        borderRadius:
                                            BorderRadius.circular(AppTheme.rSm),
                                        border: Border.all(
                                            color: _isCountryValid
                                                ? AppTheme.accent
                                                : AppTheme.border),
                                      ),
                                      child: Row(
                                        children: [
                                          _isCountryValid
                                              ? Text(
                                                  countryFlag(kCountries[
                                                          _nationalityController
                                                              .text] ??
                                                      ''),
                                                  style: const TextStyle(
                                                      fontSize: 18))
                                              : Icon(Icons.flag_rounded,
                                                  color: AppTheme.accent,
                                                  size: 18),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              _isCountryValid
                                                  ? _nationalityController.text
                                                  : 'Select nationality',
                                              style: TextStyle(
                                                color: _isCountryValid
                                                    ? AppTheme.ink
                                                    : AppTheme.faint,
                                                fontWeight: _isCountryValid
                                                    ? FontWeight.w600
                                                    : FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          Icon(Icons.expand_more_rounded,
                                              color: AppTheme.muted, size: 12),
                                        ],
                                      ),
                                    ),
                                  ))),
                          const SizedBox(height: 16),

                          // Date of Birth — tap opens a snappy year-first calendar
                          MergeSemantics(
                              child: Semantics(
                                  button: true,
                                  label: 'Date of birth',
                                  hint: 'Opens a calendar',
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: _pickDob,
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: AppTheme.surfaceAlt,
                                        borderRadius:
                                            BorderRadius.circular(AppTheme.rSm),
                                        border: Border.all(
                                            color: _selectedDate == null
                                                ? AppTheme.border
                                                : AppTheme.accent),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today_rounded,
                                              color: AppTheme.accent, size: 18),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Date of Birth',
                                                    style: TextStyle(
                                                        color: AppTheme.faint,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 11,
                                                        letterSpacing: 0.4)),
                                                const SizedBox(height: 3),
                                                Text(
                                                  _selectedDate == null
                                                      ? 'Tap to select'
                                                      : DateFormat.yMMMd()
                                                          .format(
                                                              _selectedDate!),
                                                  style: TextStyle(
                                                    color: _selectedDate == null
                                                        ? AppTheme.faint
                                                        : AppTheme.ink,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(Icons.expand_more_rounded,
                                              color: AppTheme.faint, size: 14),
                                        ],
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Consent — nothing is checked until the worker agrees.
                  _consentRow(),

                  const SizedBox(height: 28),

                  // Submit button
                  WTButton(
                    // Was 'Continue to Biometrics' — the next step is the CV.
                    label: 'Continue',
                    trailingIcon: Icons.chevron_right_rounded,
                    loading: _isLoading,
                    onPressed: _isLoading ? null : _proceedToBiometrics,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// The consent checkbox and its explanation, one tappable surface.
  ///
  /// The fill, border and ink belong to one Material: a coloured Container
  /// between a ListTile and its Material hid the ink ("ink splashes may be
  /// invisible"). And it is a Row, not a CheckboxListTile, because ListTile
  /// measures a wrapped subtitle as though the checkbox took no width;
  /// WTFormBody measures this form, so the column came out 23dp short and
  /// overflowed. MergeSemantics reads the label and the explanation together
  /// with the checked state; a tap anywhere on the row toggles it.
  Widget _consentRow() {
    final enabled = !_isLoading && _savedWorkerId == null;
    void toggle() => setState(() => _consented = !_consented);
    return MergeSemantics(
      child: Material(
        color: AppTheme.surfaceAlt,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.rSm),
          side:
              BorderSide(color: _consented ? AppTheme.accent : AppTheme.border),
        ),
        child: InkWell(
          onTap: enabled ? toggle : null,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 4, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox.adaptive(
                  value: _consented,
                  onChanged: enabled ? (_) => toggle() : null,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Padding(
                    // Lines the title up with the 48dp checkbox's centre.
                    padding: const EdgeInsets.only(top: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('I agree to these checks',
                            style: TextStyle(
                                color: AppTheme.ink,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 4),
                        Text(
                          'The company that invited me will verify my ID '
                          'documents, match my face with a live scan, '
                          'contact my past employers and schools, and '
                          'screen me against sanctions lists.',
                          style: AppTheme.bodyMuted,
                        ),
                      ],
                    ),
                  ),
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
    List<String>? autofillHints,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return WTFloatField(
      controller: controller,
      label: label,
      icon: icon,
      validator: validator,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      textCapitalization: TextCapitalization.words,
    );
  }
}
