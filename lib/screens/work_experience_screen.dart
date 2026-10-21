import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../generated/worker/v1/worker.pbenum.dart';
import '../services/work_history_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/error_humanizer.dart';
import '../utils/error_logger.dart';
import '../widgets/step_indicator.dart';
import 'document_capture_screen.dart';
import 'document_upload_screen.dart';
import 'enrollment_flow_screen.dart';

/// Step 3 of enrolment: where the worker has worked, and what they are
/// qualified to do.
///
/// Both sections are optional — a first job is a real answer, and a worker who
/// blocks here never reaches the biometric step. Anything left blank is simply
/// not sent.
///
/// Certificates live here rather than on the documents step: a degree is
/// something you hold, not an identity paper, and the worker may have several.
/// They still upload as QUALIFICATION_CERT and are then registered as
/// qualifications, so nothing downstream changes.
class WorkExperienceScreen extends StatefulWidget {
  const WorkExperienceScreen({
    super.key,
    this.initialJobs = const [],
    this.initialQualifications = const [],
    this.notice,
  });

  /// Suggestions read from the worker's CV. Every one is editable — nothing is
  /// submitted until they press Continue.
  final List<EmploymentRecord> initialJobs;
  final List<QualificationRecord> initialQualifications;

  /// What the CV step found, in one line, so the worker knows whether the form
  /// below was filled in for them or is theirs to complete.
  final String? notice;

  @override
  State<WorkExperienceScreen> createState() => _WorkExperienceScreenState();
}

/// Live editing state for one employment card. The controllers stay with the
/// widget; [toRecord] is what gets sent.
class _JobDraft {
  _JobDraft();

  /// Pre-fills a card from a CV suggestion.
  factory _JobDraft.from(EmploymentRecord r) {
    final d = _JobDraft()
      ..start = r.startDate
      ..end = r.endDate
      ..needsCheck = r.needsCheck;
    d.employer.text = r.employer;
    d.title.text = r.title;
    d.description.text = r.description;
    return d;
  }

  final employer = TextEditingController();
  final title = TextEditingController();
  final description = TextEditingController();
  DateTime? start;
  DateTime? end;

  /// Already sent as a reference request. See [_WorkExperienceScreenState._continue].
  bool sent = false;

  /// The CV reader was unsure about this one, so the card says so.
  bool needsCheck = false;

  EmploymentRecord toRecord() => EmploymentRecord(
        employer: employer.text,
        title: title.text,
        description: description.text,
        startDate: start,
        endDate: end,
        needsCheck: needsCheck,
      );

  void dispose() {
    employer.dispose();
    title.dispose();
    description.dispose();
  }
}

class _CertDraft {
  _CertDraft();

  factory _CertDraft.from(QualificationRecord r) {
    final d = _CertDraft()
      ..type = r.type
      ..filePath = r.filePath
      ..needsCheck = r.needsCheck;
    d.institution.text = r.institution;
    return d;
  }

  final institution = TextEditingController();
  QualificationType type = QualificationType.QUALIFICATION_TYPE_DEGREE;
  String filePath = '';
  bool sent = false;

  /// The CV reader was unsure about this one, so the card says so.
  bool needsCheck = false;

  QualificationRecord toRecord() => QualificationRecord(
        type: type,
        institution: institution.text,
        filePath: filePath,
        needsCheck: needsCheck,
      );

  void dispose() => institution.dispose();
}

class _WorkExperienceScreenState extends State<WorkExperienceScreen> {
  final _jobs = <_JobDraft>[];
  final _certs = <_CertDraft>[];
  final _service = WorkHistoryService();

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    for (final j in widget.initialJobs) {
      _jobs.add(_JobDraft.from(j));
    }
    for (final q in widget.initialQualifications) {
      _certs.add(_CertDraft.from(q));
    }
    // Always leave one empty job card to type into, so the section never looks
    // closed to a worker whose CV listed nothing.
    if (_jobs.isEmpty) _jobs.add(_JobDraft());
  }

  @override
  void dispose() {
    for (final j in _jobs) {
      j.dispose();
    }
    for (final c in _certs) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickDate(_JobDraft job, {required bool isStart}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final now = DateTime.now();
    final current = isStart ? job.start : job.end;
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? (isStart ? DateTime(now.year - 2) : now),
      firstDate: DateTime(now.year - 60),
      lastDate: now,
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        job.start = picked;
      } else {
        job.end = picked;
      }
    });
  }

  Future<void> _captureCertificate(_CertDraft cert) async {
    final label = kQualificationLabels[cert.type] ?? 'Certificate';
    final path = await Navigator.push<String>(
      context,
      platformRoute(
        builder: (_) => DocumentCaptureScreen(
          documentType: '$label certificate',
          returnOnly: true,
        ),
      ),
    );
    if (path != null && path.isNotEmpty && mounted) {
      setState(() => cert.filePath = path);
    }
  }

  /// The certificate may already be a picture on the phone (a scan the school
  /// sent, a photo taken earlier). JPG/PNG only: the upload URL is issued per
  /// extension and the backend accepts no other image type.
  Future<void> _pickCertificateFromGallery(_CertDraft cert) async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 90);
    if (image == null || !mounted) return;
    final ext = image.path.split('.').last.toLowerCase();
    if (!const {'jpg', 'jpeg', 'png'}.contains(ext)) {
      _info('Unsupported image',
          'Choose a JPG or PNG photo of the certificate.', WTSeverity.warning);
      return;
    }
    setState(() => cert.filePath = image.path);
  }

  /// Blocks only on a card the worker half-filled — a blank card is fine.
  String? _firstProblem() {
    for (final j in _jobs) {
      final r = j.toRecord();
      if (r.problem != null) return r.problem;
      if (datesOutOfOrder(j.start, j.end)) {
        return 'A job cannot end before it started';
      }
    }
    for (final c in _certs) {
      final p = c.toRecord().problem;
      if (p != null) return p;
    }
    return null;
  }

  Future<void> _continue() async {
    final problem = _firstProblem();
    if (problem != null) {
      _info('Almost there', problem, WTSeverity.warning);
      return;
    }

    // Only what has not gone out yet. The worker may be back from a later step
    // to add something they forgot, and resending a job emails that employer a
    // second time and spends another of the ten reference requests.
    final jobs =
        _jobs.where((j) => !j.sent && j.toRecord().isComplete).toList();
    final certs =
        _certs.where((c) => !c.sent && c.toRecord().isComplete).toList();
    if (jobs.isEmpty && certs.isEmpty) {
      _goToDocuments();
      return;
    }

    setState(() => _saving = true);
    try {
      final outcome = await _service.submit(
        jobs: jobs.map((j) => j.toRecord()).toList(),
        qualifications: certs.map((c) => c.toRecord()).toList(),
      );
      if (!mounted) return;

      // Only rows that went through are locked. A failed row — a dropped
      // connection, a refused call — stays editable, so Continue retries just
      // that row instead of losing it or resending the ones that worked.
      setState(() {
        for (var i = 0; i < jobs.length; i++) {
          jobs[i].sent = !outcome.failedJobs.contains(i);
        }
        for (var i = 0; i < certs.length; i++) {
          certs[i].sent = !outcome.failedCerts.contains(i);
        }
        _saving = false;
      });

      // Nothing got through and it was not the reference cap: almost always
      // no connection. Moving on would leave the worker thinking it was saved.
      if (outcome.sent == 0 && !outcome.referenceLimitReached) {
        _info(
          'Nothing was sent',
          'We could not reach the server. Check that you are connected to the '
              'internet, then tap Continue to try again.',
          WTSeverity.error,
        );
        return;
      }

      // Say what actually happened. A partial save still moves the worker on,
      // but they are told, not quietly assured.
      if (outcome.referenceLimitReached) {
        _info(
          'Reference limit reached',
          'You already have 10 reference requests waiting for a reply, so '
              '${outcome.jobsFailed} ${outcome.jobsFailed == 1 ? 'job was' : 'jobs were'} '
              'not sent. You can add them once some employers have answered.',
          WTSeverity.warning,
        );
      } else if (outcome.refusals.isNotEmpty) {
        // A refused certificate is the worker's to fix, so stay here: the card
        // is still editable and Continue retries only it.
        _info('Certificate not accepted', outcome.refusals.first,
            WTSeverity.warning);
        return;
      } else if (!outcome.allOk) {
        _info(
          'Some entries were not saved',
          '${outcome.sent} saved, ${outcome.failed} could not be sent. '
              'Go back to this step to try them again.',
          WTSeverity.warning,
        );
      }
      _goToDocuments();
    } catch (e, stack) {
      ErrorLogger.log('Work Experience Step', e, stack);
      if (!mounted) return;
      setState(() => _saving = false);
      _info('Could not save', humanizeError(e, action: 'save your experience'),
          WTSeverity.error);
    }
  }

  void _goToDocuments() {
    final flow = EnrollmentFlowScreen.maybeOf(context);
    if (flow != null) {
      flow.next();
      return;
    }
    Navigator.pushReplacement(
      context,
      platformRoute(
          builder: (_) => const DocumentUploadScreen(enrollmentMode: true)),
    );
  }

  void _info(String title, String body, WTSeverity severity) {
    wtInfoBar(context, title, message: body, severity: severity);
  }

  /// Deleting a card throws away everything typed into it and there is no
  /// undo, so it asks first.
  Future<bool> _confirmRemove(String what) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Remove $what?'),
        content: const Text('Anything typed into it will be lost.'),
        actions: [
          TextButton(
              child: const Text('Keep'),
              onPressed: () => Navigator.pop(ctx, false)),
          FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.error,
                foregroundColor: AppTheme.onError,
              ),
              child: const Text('Remove'),
              onPressed: () => Navigator.pop(ctx, true)),
        ],
      ),
    );
    return ok ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      content: SafeArea(
        child: WTFormBody(
          padding: const EdgeInsets.all(AppTheme.s5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EnrollmentBackButton('Back to CV', enabled: !_saving),
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
              Text('Work & experience', style: AppTheme.display),
              const SizedBox(height: AppTheme.s2),
              Text(
                'Tell us where you have worked and what you are qualified to '
                'do. Leave anything you do not have — you can add it later.',
                style: AppTheme.bodyMuted,
              ),
              const SizedBox(height: AppTheme.s5),
              if (widget.notice != null) ...[
                WTAlert(
                  widget.notice!,
                  kind: widget.initialJobs.isEmpty &&
                          widget.initialQualifications.isEmpty
                      ? WTAlertKind.warning
                      : WTAlertKind.info,
                ),
                const SizedBox(height: AppTheme.s2),
              ],
              const WTSectionLabel('Previous employment'),
              const SizedBox(height: AppTheme.s3),
              for (int i = 0; i < _jobs.length; i++) ...[
                _jobCard(i),
                const SizedBox(height: AppTheme.s3),
              ],
              WTButton(
                label: 'Add another job',
                icon: Icons.add_rounded,
                kind: WTButtonKind.subtle,
                small: true,
                onPressed: _saving
                    ? null
                    : () => setState(() => _jobs.add(_JobDraft())),
              ),
              const SizedBox(height: AppTheme.s6),
              const WTSectionLabel('Degrees & certificates'),
              const SizedBox(height: AppTheme.s2),
              Text(
                'Add each qualification you hold, with a photo of the '
                'certificate.',
                style: AppTheme.caption.copyWith(color: AppTheme.muted),
              ),
              const SizedBox(height: AppTheme.s3),
              for (int i = 0; i < _certs.length; i++) ...[
                _certCard(i),
                const SizedBox(height: AppTheme.s3),
              ],
              WTButton(
                label: _certs.isEmpty
                    ? 'Add a degree or certificate'
                    : 'Add another qualification',
                icon: Icons.add_rounded,
                kind: WTButtonKind.subtle,
                small: true,
                onPressed: _saving
                    ? null
                    : () => setState(() => _certs.add(_CertDraft())),
              ),
              const SizedBox(height: AppTheme.s7),
              WTButton(
                label: 'Continue',
                trailingIcon: Icons.chevron_right_rounded,
                loading: _saving,
                onPressed: _saving ? null : _continue,
              ),
              const SizedBox(height: AppTheme.s3),
              Center(
                child: WTButton(
                  label: 'I have none of these',
                  kind: WTButtonKind.subtle,
                  small: true,
                  onPressed: _saving ? null : _goToDocuments,
                ),
              ),
              const SizedBox(height: AppTheme.s4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _jobCard(int index) {
    final job = _jobs[index];
    // A sent row is read-only: an edit to it would never reach the employer.
    return AbsorbPointer(
      absorbing: job.sent,
      child: WTCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Job ${index + 1}',
                      style: AppTheme.label.copyWith(color: AppTheme.muted)),
                ),
                // The CV reader flagged this one, so the worker knows which
                // cards to read twice instead of checking all of them.
                if (job.needsCheck && !job.sent)
                  const Padding(
                    padding: EdgeInsets.only(right: AppTheme.s2),
                    child: WTTag('Check this', kind: WTTagKind.amber),
                  ),
                if (job.sent)
                  const WTTag('Sent', kind: WTTagKind.green)
                else if (_jobs.length > 1)
                  WTIconButton(
                    icon: Icons.delete_rounded,
                    label: 'Remove job ${index + 1}',
                    size: 16,
                    onPressed: _saving
                        ? null
                        : () async {
                            if (!await _confirmRemove('job ${index + 1}')) {
                              return;
                            }
                            setState(() => _jobs.removeAt(index).dispose());
                          },
                  ),
              ],
            ),
            const SizedBox(height: AppTheme.s2),
            WTFloatField(
                label: 'Employer',
                controller: job.employer,
                icon: Icons.apartment_rounded,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next),
            const SizedBox(height: AppTheme.s3),
            WTFloatField(
                label: 'Job title',
                controller: job.title,
                icon: Icons.person_rounded,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next),
            const SizedBox(height: AppTheme.s3),
            Row(
              children: [
                Expanded(
                  child: _dateField(
                    label: 'Start date',
                    value: job.start,
                    onTap: _saving ? null : () => _pickDate(job, isStart: true),
                  ),
                ),
                const SizedBox(width: AppTheme.s3),
                Expanded(
                  child: _dateField(
                    label: 'End date',
                    value: job.end,
                    hint: 'Still here',
                    onTap:
                        _saving ? null : () => _pickDate(job, isStart: false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.s3),
            WTFloatField(
              label: 'What you did there',
              controller: job.description,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _certCard(int index) {
    final cert = _certs[index];
    final hasPhoto = cert.filePath.isNotEmpty;
    return AbsorbPointer(
      absorbing: cert.sent,
      child: WTCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text('Qualification ${index + 1}',
                      style: AppTheme.label.copyWith(color: AppTheme.muted)),
                ),
                if (cert.needsCheck && !cert.sent)
                  const Padding(
                    padding: EdgeInsets.only(right: AppTheme.s2),
                    child: WTTag('Check this', kind: WTTagKind.amber),
                  ),
                if (cert.sent)
                  const WTTag('Sent', kind: WTTagKind.green)
                else
                  WTIconButton(
                    icon: Icons.delete_rounded,
                    label: 'Remove qualification ${index + 1}',
                    size: 16,
                    onPressed: _saving
                        ? null
                        : () async {
                            if (!await _confirmRemove(
                                'qualification ${index + 1}')) {
                              return;
                            }
                            setState(() => _certs.removeAt(index).dispose());
                          },
                  ),
              ],
            ),
            const SizedBox(height: AppTheme.s2),
            DropdownButton<QualificationType>(
              value: cert.type,
              isExpanded: true,
              items: [
                for (final entry in kQualificationLabels.entries)
                  DropdownMenuItem<QualificationType>(
                    value: entry.key,
                    child: Text(entry.value),
                  ),
              ],
              onChanged: _saving
                  ? null
                  : (v) => setState(() => cert.type = v ?? cert.type),
              dropdownColor: AppTheme.surface,
              borderRadius: BorderRadius.circular(AppTheme.rSm),
            ),
            const SizedBox(height: AppTheme.s3),
            WTFloatField(
              label: 'School or awarding body',
              controller: cert.institution,
              icon: Icons.school_rounded,
            ),
            const SizedBox(height: AppTheme.s3),
            Row(
              children: [
                Expanded(
                  child: WTButton(
                    label: hasPhoto ? 'Retake photo' : 'Take a photo',
                    icon: Icons.photo_camera_rounded,
                    kind: hasPhoto ? WTButtonKind.subtle : WTButtonKind.primary,
                    small: true,
                    onPressed: _saving ? null : () => _captureCertificate(cert),
                  ),
                ),
                const SizedBox(width: AppTheme.s2),
                Expanded(
                  child: WTButton(
                    label: 'Choose a photo',
                    icon: Icons.image_rounded,
                    kind: WTButtonKind.subtle,
                    small: true,
                    onPressed: _saving
                        ? null
                        : () => _pickCertificateFromGallery(cert),
                  ),
                ),
              ],
            ),
            if (hasPhoto) ...[
              const SizedBox(height: AppTheme.s2),
              Row(
                children: [
                  Icon(Icons.check_rounded, size: 14, color: AppTheme.success),
                  const SizedBox(width: AppTheme.s1),
                  Expanded(
                    child: Text('Photo added',
                        style:
                            AppTheme.caption.copyWith(color: AppTheme.success)),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _dateField({
    required String label,
    required DateTime? value,
    required VoidCallback? onTap,
    String hint = 'Select',
  }) {
    final text = value == null ? hint : DateFormat('MMM yyyy').format(value);
    return GestureDetector(
      onTap: onTap,
      child: Semantics(
        button: true,
        label: '$label, ${value == null ? 'not set' : text}',
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.s3, vertical: AppTheme.s3),
          decoration: BoxDecoration(
            color: AppTheme.surfaceAlt,
            borderRadius: BorderRadius.circular(AppTheme.rSm),
            border: Border.all(color: AppTheme.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: AppTheme.caption.copyWith(color: AppTheme.muted)),
              const SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.calendar_today_rounded,
                      size: 14, color: AppTheme.muted),
                  const SizedBox(width: AppTheme.s2),
                  Expanded(
                    child: Text(
                      text,
                      style: AppTheme.body.copyWith(
                          color: value == null ? AppTheme.faint : AppTheme.ink),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
