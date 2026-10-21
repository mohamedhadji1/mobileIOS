import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/worker_files.dart' show documentTypeIcon, fetchWorkerFile;
import 'document_capture_screen.dart';
import 'worker_files_screen.dart';
import 'worker_nav.dart';

/// Post-login document manager. Unlike the enrollment stepper
/// ([DocumentUploadScreen]), this is NOT a wizard: an already-enrolled worker
/// can upload or replace ANY identity document at any time. Every supported
/// document type is always listed with its current state.
///
/// Upload state is read from the SAME `doc_uploaded_<id>` secure-storage keys
/// the enrollment stepper writes, so a document provided during enrollment
/// shows as already uploaded here instead of inviting the worker to send it a
/// second time. It previously lived in a plain in-memory Set, which meant
/// enrollment uploads were invisible AND a capture made on this screen was
/// forgotten the moment the worker navigated away.
///
/// ponytail: local flags, not server truth — a reinstall or a new device shows
/// everything as missing again. The durable fix needs a worker-scoped list RPC.
/// `ListDocumentsByTenant` is deliberately NOT used: it returns every worker's
/// documents in the tenant, so filtering client-side would pull other workers'
/// document numbers and storage paths onto this device.
class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocType {
  const _DocType(this.id, this.title, this.description);

  /// Storage-key suffix. MUST match the enrollment stepper's step ids — that
  /// match is the whole mechanism making an enrollment upload visible here.
  final String id;
  final String title;
  final String description;

  /// The shared mapping, so this list matches the upload screen.
  IconData get icon => documentTypeIcon(id);
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  static const List<_DocType> _docTypes = [
    _DocType('passport', 'Passport', 'Main bio-data page'),
    _DocType('id_front', 'National ID (Front)', 'Front of your ID card'),
    _DocType('id_back', 'National ID (Back)', 'Back of your ID card'),
    _DocType(
        'license_front', "Driver's License (Front)", 'Front of your license'),
    _DocType('license_back', "Driver's License (Back)", 'Back of your license'),
  ];

  static const _storage = FlutterSecureStorage();

  final Set<String> _uploaded = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadUploaded();
  }

  Future<void> _loadUploaded() async {
    final found = <String>{};
    for (final doc in _docTypes) {
      final flag = await _storage.read(key: 'doc_uploaded_${doc.id}');
      if (flag == 'true') found.add(doc.id);
    }
    if (!mounted) return;
    setState(() {
      _uploaded
        ..clear()
        ..addAll(found);
      _loading = false;
    });
  }

  Future<void> _capture(_DocType doc) async {
    // DocumentCaptureScreen does the real upload here (GenerateUploadURL →
    // ConfirmUpload) because `returnOnly` defaults to false — the enrollment
    // stepper is the one passing returnOnly:true and uploading at finalize.
    // So a non-null result means the document actually reached the backend,
    // which is what makes it honest to persist the flag below.
    final path = await Navigator.of(context).push<String>(
      platformRoute(
        builder: (_) => DocumentCaptureScreen(documentType: doc.title),
      ),
    );
    if (path == null || !mounted) return;

    await _storage.write(key: 'doc_uploaded_${doc.id}', value: 'true');
    if (!mounted) return;
    setState(() => _uploaded.add(doc.id));
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      nav: WTBottomNav(items: workerNavItems(context, 1), activeIndex: 1),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                      AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: wtStagger([
                      Text('Documents', style: AppTheme.display),
                      const SizedBox(height: 4),
                      Text(
                        'Upload or replace your identity documents anytime.',
                        style: AppTheme.caption,
                      ),
                      const SizedBox(height: AppTheme.s4),
                      _filesEntry(),
                      const SizedBox(height: AppTheme.s4),
                      // Skeleton fades into the list rather than cutting.
                      WTSwitcher(
                        stateKey: _loading,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _loading
                              ? const [
                                  WTSkeleton(width: 190, height: 12),
                                  SizedBox(height: AppTheme.s3),
                                  WTSkeletonList(count: 5),
                                ]
                              : [
                                  WTSectionLabel('Identity documents  ·  '
                                      '${_uploaded.length} of '
                                      '${_docTypes.length} uploaded'),
                                  for (final doc in _docTypes) ...[
                                    _docCard(doc),
                                    const SizedBox(height: AppTheme.s2),
                                  ],
                                ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// The server's record of what this worker sent, with each file's status.
  /// The cards below only know what this phone uploaded.
  Widget _filesEntry() {
    return WTCard(
      small: true,
      semanticLabel: 'Your files. See what you have sent and its status',
      onTap: () => Navigator.of(context).push(platformRoute(
        builder: (ctx) => WorkerFilesScreen(
          fetchFile: fetchWorkerFile,
          onUpload: () => Navigator.of(ctx).pop(),
        ),
      )),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.accentSoft,
              borderRadius: BorderRadius.circular(AppTheme.rSm),
            ),
            child: Icon(Icons.folder_open_rounded,
                color: AppTheme.accent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your files',
                    style: TextStyle(
                        color: AppTheme.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text('See what you’ve sent and its status',
                    style: TextStyle(color: AppTheme.faint, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(Icons.chevron_right_rounded, color: AppTheme.faint),
        ],
      ),
    );
  }

  Widget _docCard(_DocType doc) {
    final uploaded = _uploaded.contains(doc.id);
    return WTCard(
      small: true,
      onTap: () => _capture(doc),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.accentSoft,
              borderRadius: BorderRadius.circular(AppTheme.rSm),
            ),
            child: Icon(doc.icon, color: AppTheme.accent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doc.title,
                    style: TextStyle(
                        color: AppTheme.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                // Say so explicitly: an already-uploaded row still opens the
                // camera on tap, and without this the only way to discover that
                // is to tap a document you have already sent and hope.
                Text(uploaded ? 'Uploaded · tap to replace' : doc.description,
                    style: TextStyle(color: AppTheme.faint, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (uploaded)
            const WTTag('Uploaded',
                kind: WTTagKind.green, icon: Icons.check_rounded)
          else
            const WTTag('Upload',
                kind: WTTagKind.blue, icon: Icons.add_rounded),
        ],
      ),
    );
  }
}
