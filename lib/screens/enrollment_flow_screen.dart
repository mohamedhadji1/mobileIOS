import 'package:flutter/material.dart';

import '../services/work_history_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'biometrics_enrollment_screen.dart';
import 'cv_upload_screen.dart';
import 'document_upload_screen.dart';
import 'signup_form_screen.dart';
import 'work_experience_screen.dart';

/// Details → CV → Experience → Documents → Biometrics, as one screen.
///
/// Each step used to pushReplacement the next, so there was no way back: a
/// worker who remembered a job while on the documents step had to carry on.
///
/// Plain push/pop is not enough either. Popping disposes the later screen, and
/// every step here writes to the backend with no way to read it back — no
/// update RPC for details, no list RPC for jobs or documents. A rebuilt step
/// starts empty and re-sends everything, which emails each employer twice and
/// spends the ten-reference cap.
///
/// So the steps sit side by side in an IndexedStack and are never disposed
/// while the flow is open. Going back only changes the index; every step keeps
/// what was typed and remembers what it already sent.
class EnrollmentFlowScreen extends StatefulWidget {
  const EnrollmentFlowScreen({super.key, this.stepBuilder});

  /// Replaces the real steps in tests, which need a live backend.
  @visibleForTesting
  final Widget Function(int step)? stepBuilder;

  static const stepCount = 5;

  /// The flow a step is running in, or null when that screen was opened on its
  /// own (the documents tab, the /enroll/documents resume route). Steps keep
  /// their old navigation in that case.
  static EnrollmentFlowState? maybeOf(BuildContext context) =>
      context.findAncestorStateOfType<EnrollmentFlowState>();

  @override
  State<EnrollmentFlowScreen> createState() => EnrollmentFlowState();
}

class EnrollmentFlowState extends State<EnrollmentFlowScreen> {
  int _step = 0;
  int _reached = 0;
  CvSuggestions _suggestions = const CvSuggestions();
  String? _notice;

  int get step => _step;

  /// Taken during this enrollment, at the documents step, so the ID check can
  /// compare the document photo with it. Biometrics then skips its own selfie.
  /// Per flow, never read from storage: a selfie left on the phone by an
  /// earlier enrollment may be somebody else's.
  bool selfieTaken = false;

  void next() => _go(_step + 1);
  void back() => _go(_step - 1);

  /// The CV step hands what it read to Experience through here.
  void openExperience(CvSuggestions suggestions, {String? notice}) {
    // ponytail: first reading wins. If the worker comes back and uploads a
    // different CV, Experience keeps their own edits rather than being wiped.
    // Merge the new suggestions in if that turns out to matter.
    if (_reached < 2) {
      _suggestions = suggestions;
      _notice = notice;
    }
    _go(2);
  }

  void _go(int to) {
    if (to < 0 || to >= EnrollmentFlowScreen.stepCount) return;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _step = to;
      if (to > _reached) _reached = to;
    });
  }

  Widget _realStep(int i) => switch (i) {
        0 => const SignUpFormScreen(),
        1 => const CvUploadScreen(),
        2 => WorkExperienceScreen(
            initialJobs: _suggestions.jobs,
            initialQualifications: _suggestions.qualifications,
            notice: _notice,
          ),
        3 => const DocumentUploadScreen(enrollmentMode: true),
        _ => const BiometricsEnrollmentScreen(),
      };

  @override
  Widget build(BuildContext context) {
    final buildStep = widget.stepBuilder ?? _realStep;
    return PopScope(
      // The system back gesture walks the steps too; only the first step
      // leaves the flow.
      canPop: _step == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) back();
      },
      child: IndexedStack(
        index: _step,
        // Full-screen tight constraints, exactly what each step got as a route.
        sizing: StackFit.expand,
        children: [
          for (var i = 0; i < EnrollmentFlowScreen.stepCount; i++)
            // Hidden steps stay built but must not animate: Biometrics runs a
            // pulse forever, and it would keep repainting off screen.
            TickerMode(
              enabled: i == _step,
              child: i <= _reached ? buildStep(i) : const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }
}

/// Chevron back to the previous step. Renders nothing outside the flow, so a
/// step opened on its own does not offer a back step it cannot take.
class EnrollmentBackButton extends StatelessWidget {
  const EnrollmentBackButton(this.label, {super.key, this.enabled = true});

  /// Spoken name, e.g. 'Back to details'.
  final String label;

  /// False while the step is sending something.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final flow = EnrollmentFlowScreen.maybeOf(context);
    if (flow == null) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.centerLeft,
      child: WTIconButton(
        icon: Icons.chevron_left_rounded,
        label: label,
        color: enabled ? AppTheme.ink : AppTheme.disabled,
        size: 18,
        onPressed: enabled ? flow.back : null,
      ),
    );
  }
}
