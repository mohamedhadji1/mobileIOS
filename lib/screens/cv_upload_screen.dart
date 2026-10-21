import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';

import '../services/document_check.dart';
import '../services/work_history_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/error_humanizer.dart';
import '../utils/error_logger.dart';
import '../widgets/step_indicator.dart';
import 'enrollment_flow_screen.dart';
import 'work_experience_screen.dart';

/// First half of the Experience step: the worker hands us their CV, we read it,
/// and the next screen opens already filled in.
///
/// Deliberately skippable. A worker without a CV on their phone must still be
/// able to reach the biometric step, and reading a CV is a convenience, never a
/// gate.
class CvUploadScreen extends StatefulWidget {
  const CvUploadScreen({super.key});

  @override
  State<CvUploadScreen> createState() => _CvUploadScreenState();
}

/// Where we are in "pick, upload, read".
enum _Phase { idle, uploading, reading, failed }

class _CvUploadScreenState extends State<CvUploadScreen> {
  final _service = WorkHistoryService();

  _Phase _phase = _Phase.idle;
  String? _fileName;
  String? _filePath;
  String _error = '';

  /// The chosen file is already on record. Stepping back from Experience
  /// and pressing Continue again used to upload the same CV once more, and
  /// every copy stayed on the worker's file list.
  bool _sent = false;

  Future<void> _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: const ['pdf', 'docx', 'jpg', 'jpeg', 'png'],
        withData: false,
      );
      final picked = result?.files.single;
      final path = picked?.path;
      if (path == null || !mounted) return;
      setState(() {
        _filePath = path;
        _fileName = picked?.name ?? 'Your CV';
        _error = '';
        // A newly picked file must be sent, even under the same name.
        _sent = false;
      });
    } on Exception catch (e, stack) {
      ErrorLogger.log('CV Upload - pick file', e, stack);
      if (!mounted) return;
      setState(() => _error = 'Could not open that file. Please try again.');
    }
  }

  Future<void> _uploadAndRead() async {
    final path = _filePath;
    if (path == null) return;
    // Inside the flow, Experience already holds what was read the first
    // time (first reading wins), so moving on is all that is left to do.
    if (_sent) {
      _openExperience(const CvSuggestions());
      return;
    }

    setState(() {
      _phase = _Phase.uploading;
      _error = '';
    });

    try {
      final objectKey = await _service.uploadCv(path);
      _sent = true;
      if (!mounted) return;

      // Only a PDF is read (the parser refuses anything else). A Word file or
      // a photo is kept on file for HR, and the worker types the form.
      if (!path.toLowerCase().endsWith('.pdf')) {
        _openExperience(
          const CvSuggestions(),
          notice: 'Your CV is saved. We can only read a PDF automatically, so '
              'please add your jobs and qualifications below.',
        );
        return;
      }

      setState(() => _phase = _Phase.reading);
      final suggestions = await _service.parseCv(objectKey);
      if (!mounted) return;

      _openExperience(
        suggestions,
        // Told plainly, either way. Silence after a wait reads as failure.
        notice: suggestions.isEmpty
            ? 'Your CV is saved, but we could not read it automatically. '
                'Please add your jobs and qualifications below.'
            : 'We read ${suggestions.count} entr'
                '${suggestions.count == 1 ? 'y' : 'ies'} from your CV. '
                'Check each one and correct anything that is wrong.',
      );
    } catch (e, stack) {
      ErrorLogger.log('CV Upload - upload and read', e, stack);
      if (!mounted) return;
      setState(() {
        _phase = _Phase.failed;
        _error = e is DocumentRefused
            ? e.message
            : humanizeError(e, action: 'upload your CV');
      });
    }
  }

  void _openExperience(CvSuggestions suggestions, {String? notice}) {
    // Back to idle before leaving. Inside the flow this screen stays alive, and
    // a worker stepping back to it would otherwise find "Reading your CV…"
    // spinning forever with every button disabled.
    setState(() => _phase = _Phase.idle);
    final flow = EnrollmentFlowScreen.maybeOf(context);
    if (flow != null) {
      flow.openExperience(suggestions, notice: notice);
      return;
    }
    Navigator.pushReplacement(
      context,
      platformRoute(
        builder: (_) => WorkExperienceScreen(
          initialJobs: suggestions.jobs,
          initialQualifications: suggestions.qualifications,
          notice: notice,
        ),
      ),
    );
  }

  bool get _busy => _phase == _Phase.uploading || _phase == _Phase.reading;

  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: SafeArea(
        child: WTFormBody(
          padding: const EdgeInsets.all(AppTheme.s5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EnrollmentBackButton('Back to details', enabled: !_busy),
              const StepIndicator(
                currentStep: 2,
                stepLabels: [
                  'Scan',
                  'Details',
                  'Experience',
                  'Documents',
                  'Biometrics'
                ],
              ),
              const SizedBox(height: AppTheme.s4),
              Text('Your CV', style: AppTheme.display),
              const SizedBox(height: AppTheme.s2),
              Text(
                'Upload your CV and we will fill in the next screen for you. '
                'A PDF is read automatically; a Word file or a photo is kept '
                'on file. You can correct anything before it is sent.',
                style: AppTheme.bodyMuted,
              ),
              const SizedBox(height: AppTheme.s6),
              if (_busy) _busyCard() else _pickCard(),
              if (_error.isNotEmpty) ...[
                const SizedBox(height: AppTheme.s3),
                WTAlert(_error, kind: WTAlertKind.danger),
              ],
              const SizedBox(height: AppTheme.s5),
              WTButton(
                label: 'Upload and continue',
                trailingIcon: Icons.chevron_right_rounded,
                loading: _busy,
                onPressed: (_filePath == null || _busy) ? null : _uploadAndRead,
              ),
              const SizedBox(height: AppTheme.s3),
              Center(
                child: WTButton(
                  label: 'I do not have a CV',
                  kind: WTButtonKind.subtle,
                  small: true,
                  onPressed: _busy
                      ? null
                      : () => _openExperience(const CvSuggestions()),
                ),
              ),
              const SizedBox(height: AppTheme.s4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pickCard() {
    final chosen = _fileName != null;
    return WTCard(
      onTap: _pickFile,
      child: Column(
        children: [
          Icon(
            chosen ? Icons.article_rounded : Icons.cloud_upload_rounded,
            size: 32,
            color: chosen ? AppTheme.success : AppTheme.accent,
          ),
          const SizedBox(height: AppTheme.s3),
          Text(
            chosen ? _fileName! : 'Choose your CV',
            style: AppTheme.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.s1),
          Text(
            chosen
                ? 'Tap to choose a different file'
                : 'PDF (best), Word or a photo',
            style: AppTheme.caption.copyWith(color: AppTheme.muted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// The two waits are named separately: uploading is the worker's connection,
  /// reading is ours, and a stall means different things in each.
  Widget _busyCard() {
    final uploading = _phase == _Phase.uploading;
    return WTCard(
      child: Column(
        children: [
          const WTSpinner(),
          const SizedBox(height: AppTheme.s4),
          Text(
            uploading ? 'Uploading your CV…' : 'Reading your CV…',
            style: AppTheme.h2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.s1),
          Text(
            uploading
                ? 'Keep the app open.'
                : 'Looking for the jobs and qualifications listed on it.',
            style: AppTheme.caption.copyWith(color: AppTheme.muted),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
