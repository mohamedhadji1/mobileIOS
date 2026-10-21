import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../theme/platform.dart';
import '../utils/error_humanizer.dart';
import '../utils/worker_files.dart';
import 'worker_file_viewer_screen.dart';

/// What a screen reader says for one file: "Passport, uploaded Oct 3, 2026,
/// Verified, double-tap to open".
String workerFileSemantics(
  WorkerFile file,
  String Function(DateTime) formatDate, {
  required bool canOpen,
}) {
  final uploaded = file.uploadedAt;
  final expires = file.expiresOn;
  return [
    file.typeLabel,
    if (uploaded != null) 'uploaded ${formatDate(uploaded)}',
    file.statusInfo.label,
    if (expires != null) 'expires ${formatDate(expires)}',
    if (file.reviewMessage.isNotEmpty) file.reviewMessage,
    canOpen ? 'double-tap to open' : 'preview not available in the app yet',
  ].join(', ');
}

/// "Your files": every document the worker has on record, with its type,
/// dates and verification status, as the server holds it (ListWorkerDocuments)
/// — not the local upload flags the Docs tab keeps.
///
/// Its own screen, pushed from Docs and from Profile, rather than a section of
/// Docs: Docs is where a document is sent, this is the record of what arrived,
/// and the two disagree whenever a local flag is stale.
class WorkerFilesScreen extends StatefulWidget {
  const WorkerFilesScreen({
    super.key,
    this.loadFiles = loadWorkerFiles,
    this.fetchFile,
    this.onUpload,
  });

  final Future<List<WorkerFile>> Function() loadFiles;

  /// Reads a file for the preview. When null, or for a row with no storage
  /// key, the row says why it cannot open, and a tap explains instead of
  /// failing.
  final WorkerFileFetcher? fetchFile;

  /// The empty state's "Upload a document". Defaults to going back.
  final VoidCallback? onUpload;

  @override
  State<WorkerFilesScreen> createState() => _WorkerFilesScreenState();
}

class _WorkerFilesScreenState extends State<WorkerFilesScreen> {
  List<WorkerFile>? _files;
  String? _error;

  /// Document types whose earlier copies are unfolded.
  Set<String> _unfolded = const {};

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  Future<void> _load() async {
    try {
      final files = await widget.loadFiles();
      if (!mounted) return;
      setState(() {
        _files = files;
        _error = null;
      });
    } on Exception catch (e) {
      if (!mounted) return;
      final message = humanizeError(e, action: 'load your files');
      // A failed pull-to-refresh keeps the list it already has.
      if (_files != null) {
        wtInfoBar(context, 'Could not refresh',
            message: message, severity: WTSeverity.warning);
        return;
      }
      setState(() => _error = message);
    }
  }

  void _retry() {
    setState(() => _error = null);
    unawaited(_load());
  }

  bool _canOpen(WorkerFile file) =>
      widget.fetchFile != null && file.storedPath.isNotEmpty;

  void _open(WorkerFile file) {
    final fetch = widget.fetchFile;
    if (fetch == null || file.storedPath.isEmpty) {
      wtInfoBar(
        context,
        'Preview not available yet',
        message: 'The app can’t show stored files yet. Your file is safe, '
            'and HR can see it.',
      );
      return;
    }
    unawaited(Navigator.of(context).push(platformRoute(
        builder: (_) => WorkerFileViewerScreen(file: file, fetch: fetch))));
  }

  @override
  Widget build(BuildContext context) {
    final files = _files;
    final error = _error;
    final Widget body;
    if (files == null && error == null) {
      body = const Padding(
        key: ValueKey('loading'),
        padding: EdgeInsets.all(AppTheme.s4),
        child: WTSkeletonList(count: 4, lines: 3),
      );
    } else if (files == null) {
      body = _scrollable(
        key: const ValueKey('error'),
        children: [
          _message(
            icon: Icons.cloud_off_rounded,
            title: 'Couldn’t load your files',
            body: error ?? '',
            action: WTButton(
              label: 'Try again',
              icon: Icons.refresh_rounded,
              onPressed: _retry,
            ),
          ),
        ],
      );
    } else if (files.isEmpty) {
      body = _scrollable(
        key: const ValueKey('empty'),
        children: [
          _message(
            icon: Icons.folder_open_rounded,
            title: 'No files yet',
            body: 'Documents you send will show here, with their status.',
            action: WTButton(
              label: 'Upload a document',
              icon: Icons.upload_rounded,
              onPressed:
                  widget.onUpload ?? () => Navigator.of(context).maybePop(),
            ),
          ),
        ],
      );
    } else {
      final groups = groupWorkerFiles(files);
      body = _scrollable(
        key: const ValueKey('list'),
        children: wtStagger([
          WTSectionLabel('${groups.length} '
              '${groups.length == 1 ? 'document' : 'documents'} on record'),
          for (final group in groups) _group(group),
        ]),
      );
    }
    return WTPage(
      appBar: AppBar(title: const Text('Your files')),
      content: SafeArea(
        top: false,
        child: AnimatedSwitcher(
          duration: AppTheme.motion(context, 220),
          child: body,
        ),
      ),
    );
  }

  Widget _row(WorkerFile file) => Padding(
        padding: const EdgeInsets.only(bottom: AppTheme.s2),
        child: _FileRow(
          file: file,
          canOpen: _canOpen(file),
          onTap: () => _open(file),
        ),
      );

  /// The newest copy of a document, with any earlier copies folded under it.
  /// Re-sent files (a CV uploaded again from the enrollment flow) used to list
  /// as identical rows the worker could not tell apart.
  Widget _group(WorkerFileGroup group) {
    final type = group.latest.typeLabel;
    final n = group.earlier.length;
    final open = _unfolded.contains(type);
    final count = '$n earlier ${n == 1 ? 'copy' : 'copies'}';
    void toggle() => setState(() => _unfolded =
        open ? (Set.of(_unfolded)..remove(type)) : {..._unfolded, type});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _row(group.latest),
        if (n > 0) ...[
          Semantics(
            button: true,
            expanded: open,
            label: '$count of $type',
            // The tap is re-declared here: excludeSemantics drops the
            // InkWell's own, and a screen reader could not unfold.
            onTap: toggle,
            excludeSemantics: true,
            child: InkWell(
              borderRadius: BorderRadius.circular(AppTheme.rSm),
              onTap: toggle,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 48),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.s3),
                  child: Row(
                    children: [
                      Icon(Icons.history_rounded,
                          size: 18, color: AppTheme.muted),
                      const SizedBox(width: AppTheme.s2),
                      Expanded(
                        child: Text(count,
                            style: TextStyle(
                                color: AppTheme.muted,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      ),
                      AnimatedRotation(
                        turns: open ? 0.5 : 0,
                        duration: AppTheme.motion(context, 200),
                        child: Icon(Icons.expand_more_rounded,
                            color: AppTheme.muted),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: AppTheme.motion(context, 220),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: !open
                ? const SizedBox(width: double.infinity)
                // Indented under a rule: these belong to the row above.
                : Container(
                    margin: const EdgeInsets.only(left: AppTheme.s3),
                    padding: const EdgeInsets.only(left: AppTheme.s3),
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: AppTheme.border, width: 2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [for (final f in group.earlier) _row(f)],
                    ),
                  ),
          ),
        ],
        const SizedBox(height: AppTheme.s2),
      ],
    );
  }

  /// Pull-to-refresh works in every settled state, the empty and error ones
  /// included.
  Widget _scrollable({required Key key, required List<Widget> children}) {
    return RefreshIndicator.adaptive(
      key: key,
      onRefresh: _load,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
            AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s5),
        children: children,
      ),
    );
  }

  Widget _message({
    required IconData icon,
    required String title,
    required String body,
    required Widget action,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.s3, vertical: AppTheme.s6),
      child: Column(
        children: [
          Icon(icon, size: 36, color: AppTheme.faint),
          const SizedBox(height: AppTheme.s4),
          Text(title, textAlign: TextAlign.center, style: AppTheme.h2),
          const SizedBox(height: AppTheme.s2),
          Semantics(
            liveRegion: true,
            child: Text(body,
                textAlign: TextAlign.center, style: AppTheme.bodyMuted),
          ),
          const SizedBox(height: AppTheme.s5),
          action,
        ],
      ),
    );
  }
}

class _FileRow extends StatelessWidget {
  const _FileRow({
    required this.file,
    required this.canOpen,
    required this.onTap,
  });

  final WorkerFile file;
  final bool canOpen;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final formatDate = MaterialLocalizations.of(context).formatShortDate;
    final status = file.statusInfo;
    final uploaded = file.uploadedAt;
    final expires = file.expiresOn;
    final meta = [
      if (uploaded != null) 'Uploaded ${formatDate(uploaded)}',
      if (expires != null)
        '${expires.isBefore(DateTime.now()) ? 'Expired' : 'Expires'} '
            '${formatDate(expires)}',
    ].join('  ·  ');
    final note =
        file.reviewMessage.isNotEmpty ? file.reviewMessage : status.description;
    return WTCard(
      small: true,
      onTap: onTap,
      semanticLabel: workerFileSemantics(file, formatDate, canOpen: canOpen),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.accentSoft,
              borderRadius: BorderRadius.circular(AppTheme.rSm),
            ),
            child: Icon(documentTypeIcon(file.docType),
                color: AppTheme.accent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Wrap, not Row: with large text the tag drops under the name
                // instead of squeezing it.
                Wrap(
                  spacing: AppTheme.s2,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(file.typeLabel,
                        style: TextStyle(
                            color: AppTheme.ink,
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    WTTag(status.label, kind: status.kind, icon: status.icon),
                  ],
                ),
                if (meta.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(meta, style: AppTheme.caption),
                ],
                const SizedBox(height: 6),
                Text(note,
                    style: TextStyle(
                        color: AppTheme.muted, fontSize: 13, height: 1.4)),
                const SizedBox(height: 10),
                _openHint(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _openHint() {
    if (canOpen) {
      return Row(
        children: [
          Icon(Icons.visibility_rounded, size: 16, color: AppTheme.accent),
          const SizedBox(width: 6),
          Text('Open',
              style: TextStyle(
                  color: AppTheme.accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ],
      );
    }
    return Row(
      children: [
        Icon(Icons.visibility_off_rounded, size: 14, color: AppTheme.faint),
        const SizedBox(width: 6),
        Flexible(
          child: Text('Preview not available in the app yet',
              style: TextStyle(color: AppTheme.faint, fontSize: 12)),
        ),
      ],
    );
  }
}
