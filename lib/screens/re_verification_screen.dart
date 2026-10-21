import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../utils/worker_files.dart' show documentTypeIcon;
import 'document_capture_screen.dart';
import 'face_liveness_screen.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'worker_nav.dart';

/// US-031-2 — Document re-verification triggered by a `reverification_required`
/// push.
///
/// Workflow this screen serves: HR reviews a worker's documents (e.g. expiry
/// dates); the Analyst overrides the worker's status and flags, document by
/// document, which ones are bad/expired. The worker then receives a task with a
/// deadline and must **re-upload exactly the flagged documents**. There is no
/// liveness step here — that belongs to the separate random/face-check flow.
///
/// Each flagged document is captured and uploaded through [DocumentCaptureScreen],
/// which already performs on-device quality checks (US-013-1) and the full
class ReVerificationScreen extends StatefulWidget {
  const ReVerificationScreen({
    super.key,
    this.reason = 'Some of your documents need to be re-submitted.',
    this.deadline,
    this.flaggedDocuments = const ['Identity Document'],
  });

  /// Human-readable reason shown to the worker (from the analyst override / push).
  final String reason;

  /// Optional compliance deadline from the assigned task. When null the worker
  /// is simply asked to comply as soon as possible.
  final DateTime? deadline;

  /// Titles of the documents the analyst flagged for re-upload. These are passed
  /// straight to [DocumentCaptureScreen] as the document type / label.
  final List<String> flaggedDocuments;

  @override
  State<ReVerificationScreen> createState() => _ReVerificationScreenState();
}

enum _Step { intro, submitting, success, failed }

/// When this phone last submitted a re-verification (UTC, ISO-8601). The
/// Re-verify tab skips any request that arrived before it — that one has been
/// answered.
const reverifyCompletedKey = 'reverify_completed_at';

/// True when the analyst flagged a face/liveness re-check rather than a
/// document. The item arrives as a display label inside the same text-encoded
/// list as the documents (`Re-upload: Face scan (liveness). …`), so it is
/// recognised by wording — matching how NextJs labels FACE_LIVENESS.
bool isLivenessTask(String title) {
  final t = title.toLowerCase();
  return t.contains('liveness') ||
      t.contains('face scan') ||
      t.contains('face_liveness');
}

class _FlaggedDoc {
  _FlaggedDoc(this.title) : icon = _iconFor(title);
  final String title;
  final IconData icon;
  bool done = false;

  static IconData _iconFor(String title) {
    final t = title.toLowerCase();
    // Checked first: "Face scan (liveness)" carries no document keyword, and a
    // liveness re-check must not read as a document to photograph.
    if (isLivenessTask(t)) return Icons.fingerprint_rounded;
    // Same icon as the Docs tab and the upload screen for the same document.
    return documentTypeIcon(title);
  }
}

class _ReVerificationScreenState extends State<ReVerificationScreen> {
  final _service = EnrollmentService();

  late final List<_FlaggedDoc> _docs = widget.flaggedDocuments
      .where((d) => d.trim().isNotEmpty)
      .map((d) => _FlaggedDoc(d.trim()))
      .toList();

  _Step _step = _Step.intro;
  String _error = '';
  bool _running = false;

  bool get _allDone => _docs.isNotEmpty && _docs.every((d) => d.done);
  int get _doneCount => _docs.where((d) => d.done).length;

  /// HR asked only for a new face scan (the dashboard's one-click re-check):
  /// nothing here is a document, so the copy must not talk about uploads.
  bool get _faceOnly =>
      _docs.isNotEmpty && _docs.every((d) => isLivenessTask(d.title));

  /// Runs one flagged item. A liveness re-check opens [FaceLivenessScreen];
  /// everything else is a document capture. Returns true when it completed.
  Future<bool> _captureDoc(_FlaggedDoc doc) async {
    if (isLivenessTask(doc.title)) {
      // FaceLivenessScreen needs the worker id and pops true/false, where the
      // capture screen pops a file path.
      final workerId =
          await const FlutterSecureStorage().read(key: 'worker_id');
      if (!mounted) return false;
      if (workerId == null || workerId.isEmpty) {
        // Without an id the challenge would be raised against nobody. Fail
        // loudly in the log rather than opening a camera that can never pass.
        ErrorLogger.log(
            'Re-verification - Liveness',
            StateError('worker_id missing from secure storage'),
            StackTrace.current);
        wtInfoBar(context, 'Cannot start the face check',
            message: 'This device is not signed in to a worker account. '
                'Sign out and back in, then try again.',
            severity: WTSeverity.error);
        return false;
      }
      final ok = await Navigator.of(context).push<bool>(
        platformRoute(builder: (_) => FaceLivenessScreen(userId: workerId)),
      );
      if (ok != true) return false;
      if (mounted) setState(() => doc.done = true);
      return true;
    }

    final path = await Navigator.of(context).push<String>(
      platformRoute(
        builder: (_) => DocumentCaptureScreen(documentType: doc.title),
      ),
    );
    if (path == null) return false;
    if (mounted) setState(() => doc.done = true);
    return true;
  }

  /// Runs through every not-yet-uploaded flagged document in sequence, then
  /// submits. The worker can abort mid-way (backing out of a capture) and
  /// resume later without losing already-uploaded documents.
  Future<void> _runRemaining() async {
    if (_running) return;
    setState(() => _running = true);
    try {
      for (final doc in _docs) {
        if (doc.done) continue;
        final ok = await _captureDoc(doc);
        if (!mounted) return;
        if (!ok) {
          // Worker backed out — stay on the list so they can resume.
          setState(() => _running = false);
          return;
        }
        // Give the OS a moment to fully release the camera before the next
        // capture (avoids a camerax IllegalStateException on slow-release
        // devices/MIUI when documents are captured back-to-back).
        await Future.delayed(const Duration(milliseconds: 600));
        if (!mounted) return;
      }
    } finally {
      if (mounted) setState(() => _running = false);
    }
    if (_allDone) await _submit();
  }

  Future<void> _submit() async {
    setState(() => _step = _Step.submitting);
    try {
      // The documents themselves were uploaded + confirmed by the capture
      // screen. Record the re-verification completion for the audit trail; the
      // backend (M13/M15) re-evaluates the flags and resolves the case from the
      // fresh document records.
      await _service.logVerification(
        type: 're_verification',
        status: 'success',
        score: 1.0,
        lat: 0.0,
        lon: 0.0,
      );
      await _service.getWorkerStatus();
      // The request this answered stops showing on the Re-verify tab.
      await const FlutterSecureStorage().write(
          key: reverifyCompletedKey,
          value: DateTime.now().toUtc().toIso8601String());
      if (!mounted) return;
      setState(() => _step = _Step.success);
    } catch (e, stack) {
      ErrorLogger.log('Re-Verification - Submit', e, stack);
      if (mounted) {
        setState(() {
          _step = _Step.failed;
          _error = humanizeError(e, action: 'submit your re-verification');
        });
      }
    }
  }

  // â”€â”€ Deadline helpers â”€â”€

  String? get _deadlineLabel {
    final d = widget.deadline;
    if (d == null) return null;
    final now = DateTime.now();
    final days = d.difference(now).inDays;
    final hours = d.difference(now).inHours;
    if (d.isBefore(now)) return 'Overdue';
    if (days >= 1) return '$days day${days == 1 ? '' : 's'} remaining';
    if (hours >= 1) return '$hours hour${hours == 1 ? '' : 's'} remaining';
    return 'Due today';
  }

  bool get _overdue =>
      widget.deadline != null && widget.deadline!.isBefore(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return WTPage(
      nav: const WorkerNavBar(current: '/reverify'),
      appBar: AppBar(title: const Text('Re-verification')),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.s4),
                  child: switch (_step) {
                    _Step.intro => _buildIntro(),
                    _Step.submitting =>
                      _buildBusy('Submitting re-verification...'),
                    _Step.success => _faceOnly
                        ? _buildResult(
                            ok: true,
                            title: 'Face scan sent',
                            message: 'Thanks — your new face scan has been '
                                'sent. Your status will refresh once it is '
                                'checked.',
                          )
                        : _buildResult(
                            ok: true,
                            title: 'Documents re-submitted',
                            message:
                                'Thanks — your updated documents have been uploaded for '
                                'review. Your status will refresh once they are approved.',
                          ),
                    _Step.failed => _buildResult(
                        ok: false,
                        title: 'Re-verification failed',
                        message: _error.isNotEmpty
                            ? _error
                            : 'We could not submit your documents. Please try again or '
                                'contact HR.',
                      ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntro() {
    final deadlineLabel = _deadlineLabel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        WTAlert(
          widget.reason,
          kind: _overdue ? WTAlertKind.danger : WTAlertKind.warning,
        ),
        if (deadlineLabel != null) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: WTTag(
              deadlineLabel,
              kind: _overdue ? WTTagKind.red : WTTagKind.amber,
              icon: Icons.schedule_rounded,
            ),
          ),
          const SizedBox(height: AppTheme.s4),
        ],
        WTSectionLabel(_faceOnly
            ? 'Face scan'
            : 'Documents to re-upload ($_doneCount/${_docs.length})'),
        Expanded(
          child: ListView.separated(
            itemCount: _docs.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (_, i) => _buildDocRow(_docs[i]),
          ),
        ),
        const SizedBox(height: AppTheme.s3),
        WTButton(
          label: _faceOnly
              ? (_allDone ? 'Face scan done' : 'Start face scan')
              : _allDone
                  ? 'All documents uploaded'
                  : (_doneCount > 0
                      ? 'Continue re-uploading'
                      : 'Start re-uploading'),
          trailingIcon: _allDone ? null : Icons.chevron_right_rounded,
          onPressed: (_running || _allDone) ? null : _runRemaining,
          loading: _running,
        ),
        if (_allDone) ...[
          const SizedBox(height: AppTheme.s3),
          WTButton(
            label: 'Submit for review',
            kind: WTButtonKind.primary,
            icon: Icons.check_circle_outline_rounded,
            onPressed: _submit,
          ),
        ],
        const SizedBox(height: AppTheme.s3),
      ],
    );
  }

  Widget _buildDocRow(_FlaggedDoc doc) {
    final done = doc.done;
    return WTCard(
      leftAccent: done ? AppTheme.success : AppTheme.warn,
      onTap: _running ? null : () => _captureDoc(doc),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.tint(done ? AppTheme.success : AppTheme.accent),
              shape: BoxShape.circle,
            ),
            child: Icon(
              done ? Icons.check_rounded : doc.icon,
              color: done ? AppTheme.success : AppTheme.accent,
              size: 18,
            ),
          ),
          const SizedBox(width: AppTheme.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doc.title,
                    style: TextStyle(
                        color: AppTheme.ink,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(
                  isLivenessTask(doc.title)
                      ? (done ? 'Done' : 'Requested · tap to start')
                      : (done ? 'Uploaded' : 'Flagged · tap to re-upload'),
                  style: TextStyle(
                    color: done ? AppTheme.success : AppTheme.faint,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          WTTag(done ? 'Done' : 'Action',
              kind: done ? WTTagKind.green : WTTagKind.amber),
        ],
      ),
    );
  }

  Widget _buildBusy(String label) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WTSpinner(activeColor: AppTheme.accent),
          const SizedBox(height: AppTheme.s5),
          Text(label, style: AppTheme.h2),
        ],
      ),
    );
  }

  Widget _buildResult({
    required bool ok,
    required String title,
    required String message,
  }) {
    final color = ok ? AppTheme.success : AppTheme.error;
    // Scrolls when a long error message outgrows the screen.
    return WTFormBody(
      padding: EdgeInsets.zero,
      child: _resultColumn(ok, color, title, message),
    );
  }

  Widget _resultColumn(bool ok, Color color, String title, String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Center(
          child: Container(
            padding: const EdgeInsets.all(AppTheme.s4),
            decoration: BoxDecoration(
              color: AppTheme.tint(color),
              shape: BoxShape.circle,
            ),
            child: Icon(
                ok
                    ? Icons.check_circle_outline_rounded
                    : Icons.error_outline_rounded,
                color: color,
                size: 48),
          ),
        ),
        const SizedBox(height: AppTheme.s5),
        Text(title, textAlign: TextAlign.center, style: AppTheme.h1),
        const SizedBox(height: AppTheme.s3),
        Text(message, textAlign: TextAlign.center, style: AppTheme.bodyMuted),
        const Spacer(),
        if (!ok) ...[
          WTButton(
            label: 'Try again',
            icon: Icons.refresh_rounded,
            onPressed: () => setState(() => _step = _Step.intro),
          ),
          const SizedBox(height: AppTheme.s3),
        ],
        WTButton(
          label: 'View my status',
          kind: ok ? WTButtonKind.primary : WTButtonKind.subtle,
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop(ok);
            } else {
              Navigator.of(context).pushReplacementNamed('/status');
            }
          },
        ),
        const SizedBox(height: AppTheme.s3),
      ],
    );
  }
}
