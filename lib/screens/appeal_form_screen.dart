import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/enrollment_service.dart';
import '../services/cypurge_grpc_service.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class AppealFormScreen extends StatefulWidget {
  const AppealFormScreen({super.key});

  @override
  State<AppealFormScreen> createState() => _AppealFormScreenState();
}

class _AppealFormScreenState extends State<AppealFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _explanationController = TextEditingController();
  final _storage = const FlutterSecureStorage();

  String _selectedReason = 'wrong_biometric_match';
  bool _isLoading = false;

  final List<Map<String, String>> _reasons = [
    {'id': 'wrong_biometric_match', 'name': 'Incorrect face/fingerprint match'},
    {'id': 'incorrect_sanctions_match', 'name': 'Incorrect sanctions list hit'},
    {'id': 'tampered_document_error', 'name': 'Document scan quality alert'},
    {'id': 'other', 'name': 'Other / Special circumstances'},
  ];

  @override
  void dispose() {
    // ChangeNotifier with a listener list — leaked the screen on every pop.
    _explanationController.dispose();
    super.dispose();
  }

  Future<void> _submitAppeal() async {
    if (!_formKey.currentState!.validate()) return;

    final explanation = _explanationController.text.trim();
    if (explanation.length < 50) {
      wtInfoBar(context, 'Validation Warning',
          message: 'Please explain your dispute in at least 50 characters.',
          severity: WTSeverity.warning);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final token = await EnrollmentService().getValidAccessToken();
      final workerId =
          await _storage.read(key: 'worker_id') ?? 'pending-worker';
      final tenantId = await _storage.read(key: 'tenant_id') ??
          '00000000-0000-0000-0000-000000000001';

      // The appeal is recorded for analyst review; only an authenticated session
      // is required. A missing worker_id must not block the dispute.
      if (token == null) {
        throw Exception(
            'User authentication session has expired. Please log in again.');
      }

      // Real call to case.v1.CaseService.SubmitAppeal through the gateway.
      // This used to be `await Future.delayed(Duration(seconds: 2))` followed by
      // an unconditional "Appeal Submitted" banner — the worker's dispute was
      // silently discarded while they were told an analyst would review it.
      final grpc = CypurgeGrpcService();
      grpc.init(useGateway: true);
      final res = await grpc.submitAppeal(
        token: token,
        tenantId: tenantId,
        workerId: workerId,
        reason: _selectedReason,
        description: explanation,
      );
      debugPrint('Appeal filed: case=${res.caseId}');

      if (mounted) {
        wtInfoBar(context, 'Appeal Submitted',
            message:
                'Your dispute has been logged. A security analyst will review within 2 business days.',
            severity: WTSeverity.success);

        await Future.delayed(const Duration(seconds: 1));
        if (mounted) {
          Navigator.pop(context, true);
        }
      }
    } catch (e, stack) {
      ErrorLogger.log('Worker Appeal Submission Process', e, stack);
      if (mounted) {
        wtInfoBar(context, 'Submission Failed',
            message: humanizeError(e, action: 'submit your appeal'),
            severity: WTSeverity.error);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      // Edge to edge: the status bar draws over the app, so the header keeps
      // clear of it; the page colour fills the space behind the bars.
      color: AppTheme.bg,
      child: SafeArea(
        child: WTPage(
          appBar: AppBar(title: const Text('Submit Appeal')),
          content: Container(
            color: AppTheme.bg,
            child: WTFormBody(
              padding: const EdgeInsets.all(AppTheme.s4),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Danger alert (matches .alert.ad)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.s4, vertical: AppTheme.s3),
                      decoration: BoxDecoration(
                        color: AppTheme.tint(AppTheme.error),
                        borderRadius: BorderRadius.circular(AppTheme.rSm),
                        border: Border.all(
                            color: AppTheme.error.withValues(alpha: 0.35)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: AppTheme.error, size: 16),
                          const SizedBox(width: AppTheme.s2),
                          Expanded(
                            child: Text(
                              'Explain the discrepancy to request a manual review by a security analyst.',
                              style: TextStyle(
                                  color: AppTheme.error,
                                  fontSize: 13,
                                  height: 1.45),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppTheme.s5),

                    Text('APPEAL REASON', style: AppTheme.label),
                    const SizedBox(height: AppTheme.s2),
                    Container(
                      decoration: AppTheme.card(radius: AppTheme.rSm),
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppTheme.s3),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedReason,
                        items: _reasons
                            .map((r) => DropdownMenuItem<String>(
                                  value: r['id'],
                                  child: Text(r['name']!,
                                      style: TextStyle(color: AppTheme.ink)),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            setState(() => _selectedReason = val);
                          }
                        },
                        hint: const Text('Select a reason'),
                        // The card around it is the field's outline.
                        underline: const SizedBox.shrink(),
                        dropdownColor: AppTheme.surface,
                        borderRadius: BorderRadius.circular(AppTheme.rSm),
                      ),
                    ),
                    const SizedBox(height: AppTheme.s4),

                    WTFloatField(
                      controller: _explanationController,
                      label: 'Details (min 50 characters)',
                      maxLines: 6,
                      validator: (val) {
                        if (val == null || val.isEmpty) return 'Required';
                        if (val.trim().length < 50) {
                          return 'Must be at least 50 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppTheme.s6),

                    // Submit (matches .btn-r — red appeal action)
                    Semantics(
                        button: true,
                        enabled: !_isLoading,
                        label:
                            _isLoading ? 'Submitting appeal' : 'Submit appeal',
                        excludeSemantics: true,
                        child: GestureDetector(
                          onTap: _isLoading ? null : _submitAppeal,
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppTheme.tint(AppTheme.error),
                              borderRadius: BorderRadius.circular(AppTheme.rMd),
                              border: Border.all(
                                  color: AppTheme.error.withValues(alpha: 0.4)),
                            ),
                            child: Center(
                              child: _isLoading
                                  ? WTSpinner(
                                      strokeWidth: 2,
                                      activeColor: AppTheme.error)
                                  : Text(
                                      'Submit Appeal',
                                      style: TextStyle(
                                        color: AppTheme.error,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ),
                        )),
                    const SizedBox(height: AppTheme.s4),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
