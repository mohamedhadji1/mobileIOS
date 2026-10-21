import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'document_capture_screen.dart';
import 'biometrics_enrollment_screen.dart';
import 'enrollment_flow_screen.dart';
import 'selfie_capture_screen.dart';
import '../widgets/step_indicator.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/document_check.dart';
import '../services/enrollment_service.dart';
import '../utils/document_debug_report.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../utils/file_keys.dart';
import '../utils/worker_files.dart' show documentTypeIcon;
import '../config/constants.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'worker_nav.dart';

class DocumentUploadScreen extends StatefulWidget {
  /// When true this is the enrollment wizard step — after upload it advances to
  /// face liveness (documents-before-face, matching the backend order). When
  /// false (standalone doc management) it returns home.
  final bool enrollmentMode;
  const DocumentUploadScreen({super.key, this.enrollmentMode = false});

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen>
    with TickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  final _storage = const FlutterSecureStorage();

  final List<Map<String, dynamic>> _steps = [
    {
      'id': 'passport',
      'title': 'Passport',
      'description': 'Capture the main bio-data page',
      'icon': documentTypeIcon('passport'),
      'required': false,
      'file': null,
    },
    {
      'id': 'id_front',
      'title': 'National ID (Front)',
      'description': 'Front side of your Identity Card',
      'icon': documentTypeIcon('id_front'),
      'required': false,
      'file': null,
    },
    {
      'id': 'id_back',
      'title': 'National ID (Back)',
      'description': 'Reverse side of your Identity Card',
      'icon': documentTypeIcon('id_back'),
      'required': false,
      'file': null,
    },
    {
      'id': 'license_front',
      'title': 'Driver\'s License (Front)',
      'description': 'Front side of your License',
      'icon': documentTypeIcon('license_front'),
      'required': false,
      'file': null,
    },
    {
      'id': 'license_back',
      'title': 'Driver\'s License (Back)',
      'description': 'Reverse side of your License',
      'icon': documentTypeIcon('license_back'),
      'required': false,
      'file': null,
    },
    // Right-to-work, education and trade credentials. The document_type enum has
    // carried these since the schema was written; the app only ever offered
    // identity documents, so a worker had no way to submit the papers vetting
    // actually turns on.
    {
      'id': 'work_permit',
      'title': 'Work Permit',
      'description': 'Permit or right-to-work authorisation',
      'icon': documentTypeIcon('work_permit'),
      'required': false,
      'file': null,
    },
    {
      'id': 'visa',
      'title': 'Visa',
      'description': 'Entry or residence visa page',
      'icon': documentTypeIcon('visa'),
      'required': false,
      'file': null,
    },
    {
      'id': 'education_license',
      'title': 'Education License',
      'description': 'Education or training licence, not a driving licence',
      'icon': documentTypeIcon('education_license'),
      'required': false,
      'file': null,
    },
    {
      'id': 'other_document',
      'title': 'Other Supporting Document',
      'description': 'Any other document your employer asked for',
      'icon': documentTypeIcon('other_document'),
      'required': false,
      'file': null,
    },
  ];

  int _activeStepIndex = 0;
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  String _uploadStage = '';
  int _currentUploadStageIndex = -1;

  // Only the progress glow is actually rendered (the AnimatedBuilder in the
  // upload overlay). A "_pulse" and a "_scanLine" controller used to live here
  // too — both on ..repeat(), both driving animations build() never read.
  late AnimationController _progressGlowController;
  late Animation<double> _progressGlowAnim;

  final List<Map<String, dynamic>> _uploadStages = [
    {
      'label': 'Optimizing document quality...',
      'target': 0.20,
      'duration': 3500
    },
    {
      'label': 'Verifying cryptographic signatures...',
      'target': 0.45,
      'duration': 3000
    },
    {
      'label': 'Encrypting sensitive data (AES-256)...',
      'target': 0.70,
      'duration': 4000
    },
    {
      'label': 'Uploading to secure maritime vault...',
      'target': 0.95,
      'duration': 4500
    },
    {'label': 'Finalizing secure connection', 'target': 1.0, 'duration': 1500},
  ];

  @override
  void initState() {
    super.initState();
    // Deliberately NOT started here. The glow it drives only exists inside
    // _buildUploadOverlay(), which is built only while _isUploading — but a
    // running Ticker keeps the scheduler requesting frames whether or not
    // anything listens, so repeating from initState kept this screen awake at
    // the panel's refresh rate for its entire lifetime. Started/stopped with
    // the upload instead (see _startUpload / its completion).
    _progressGlowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _progressGlowAnim = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _progressGlowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _progressGlowController.dispose();
    super.dispose();
  }

  Future<void> _captureCurrentDoc() async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'CHOOSE SOURCE',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSourceOption(
              icon: Icons.photo_camera_rounded,
              title: 'Take Photo',
              subtitle: 'Scan document with camera',
              onTap: () {
                Navigator.pop(context);
                _openCameraCapture();
              },
            ),
            const SizedBox(height: 12),
            _buildSourceOption(
              icon: Icons.photo_library_rounded,
              title: 'Phone Gallery',
              subtitle: 'Choose existing image (JPG, PNG)',
              onTap: () {
                Navigator.pop(context);
                _pickFromGallery();
              },
            ),
            const SizedBox(height: 12),
            // Identity documents are read from photos only (the upload
            // check refuses a PDF or Word file for them).
            if (!_isIdentityStep(_steps[_activeStepIndex]['id'] as String))
              _buildSourceOption(
                icon: Icons.description_rounded,
                title: 'Browse Files',
                subtitle: 'Pick a PDF or Word (DOCX) file',
                onTap: () {
                  Navigator.pop(context);
                  _pickDocument();
                },
              ),
            const SizedBox(height: 8),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSourceOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return MergeSemantics(
        child: Semantics(
            button: true,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: AppTheme.card(radius: AppTheme.rLg),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.tint(AppTheme.accent),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: AppTheme.accent, size: 24),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: AppTheme.ink,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: AppTheme.faint,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded,
                        color: AppTheme.faint, size: 16),
                  ],
                ),
              ),
            )));
  }

  /// Copies a freshly picked file out of the cache directory.
  ///
  /// The camera, the gallery picker and the file picker all hand back paths
  /// under /data/user/0/<pkg>/cache/. Android reclaims that directory under
  /// storage pressure, and this wizard reads the files much later — at
  /// _uploadAll, once every step is filled in. A capture the worker really did
  /// make would then fail with "No such file or directory, errno = 2" and the
  /// whole batch aborted. Falls back to the original path: a cache file that
  /// still exists uploads fine, so a copy failure must not block the flow.
  Future<File> _persistPick(File src) async {
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      final dir = Directory('${docsDir.path}/captures');
      await dir.create(recursive: true);
      final name = src.uri.pathSegments.last;
      final dest = '${dir.path}/${DateTime.now().microsecondsSinceEpoch}_$name';
      return await src.copy(dest);
    } catch (e, stack) {
      ErrorLogger.log('Document Upload - Persist pick', e, stack);
      return src;
    }
  }

  Future<void> _openCameraCapture() async {
    final resultPath = await Navigator.push(
      context,
      platformRoute(
        builder: (context) => DocumentCaptureScreen(
          documentType: _steps[_activeStepIndex]['title'],
          returnOnly: true, // enrollment finalize uploads; avoid duplicates
        ),
      ),
    );

    if (resultPath != null && resultPath is String) {
      final kept = await _persistPick(File(resultPath));
      if (!mounted) return;
      setState(() {
        _steps[_activeStepIndex]['file'] = kept;
      });
      _nextStep();
    }
  }

  Future<void> _pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );

    if (image != null) {
      final kept = await _persistPick(File(image.path));
      if (!mounted) return;
      setState(() {
        _steps[_activeStepIndex]['file'] = kept;
      });
      _nextStep();
    }
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final picked = result.files.first;
        if (picked.path != null) {
          final kept = await _persistPick(File(picked.path!));
          if (!mounted) return;
          setState(() {
            _steps[_activeStepIndex]['file'] = kept;
          });
          _nextStep();
        }
      }
    } catch (e) {
      if (mounted) {
        wtInfoBar(context, 'File Picker Error',
            message: humanizeError(e, action: 'pick that file'),
            severity: WTSeverity.error);
      }
    }
  }

  void _nextStep() {
    if (_activeStepIndex < _steps.length - 1) {
      setState(() {
        _activeStepIndex++;
      });
    }
  }

  bool get _hasAtLeastOneDoc => _steps.any((s) => s['file'] != null);

  static bool _isIdentityStep(String id) =>
      id == 'passport' || id.startsWith('id_') || id.startsWith('license_');

  Map<String, dynamic> _stepById(String id) =>
      _steps.firstWhere((s) => s['id'] == id);

  /// "National ID (Front)" -> "National ID".
  static String _cardName(Map<String, dynamic> step) =>
      (step['title'] as String).replaceAll(RegExp(r'\s*\((Front|Back)\)'), '');

  /// The refusal for the file currently on [step], or null. Keyed on the file:
  /// capturing a new one hides the old refusal without any extra bookkeeping.
  static String? _refusalOf(Map<String, dynamic> step) =>
      step['file'] != null && identical(step['file'], step['refusedFile'])
          ? step['refusal'] as String?
          : null;

  String _getMimeType(String ext) {
    switch (ext) {
      case 'pdf':
        return 'application/pdf';
      case 'doc':
        return 'application/msword';
      case 'docx':
        return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      default:
        return 'application/octet-stream';
    }
  }

  /// Detects the largest face in an ID-document image and returns a padded JPEG
  /// crop of it, for use as VerifyLiveness.doc_face. Returns null when the file
  /// isn't a decodable image or no face is found (then no doc_face is sent).
  /// Step id -> backend doc_type, sent at BOTH GenerateUploadURL (starts the
  /// processing workflow with the right M4 doc_format) and ConfirmUpload.
  /// Back sides use the exact strings the backend's front/back pairing looks
  /// up (see document getMatchingDocType) so M4 receives both sides together.
  /// Backend canonicalizes ID->NATIONAL_ID and LICENSE->DRIVING_LICENSE at
  /// insert (migration 000008 added the 'Driving License (Back)' enum value).
  /// Step id -> document_type enum value. Every string returned here must exist
  /// in the enum, or the file uploads and then the insert fails.
  /// 'education_license' is matched before the 'license_' prefix: it is LICENSE
  /// (the education licence), while DRIVING_LICENSE is the driving licence front
  /// and 'Driving License (Back)' its reverse.
  String _docTypeFor(String stepId) {
    if (stepId == 'passport') return 'PASSPORT';
    if (stepId == 'id_back') return 'National ID (Back)';
    if (stepId == 'license_back') return 'Driving License (Back)';
    if (stepId == 'work_permit') return 'WORK_PERMIT';
    if (stepId == 'visa') return 'VISA';
    if (stepId == 'education_license') return 'LICENSE';
    if (stepId.startsWith('id_')) return 'NATIONAL_ID';
    if (stepId.startsWith('license_')) return 'DRIVING_LICENSE';
    // Was 'OTHER', which is not a member of the enum: anything reaching the
    // fallback uploaded fine and then failed at the DB insert.
    return 'DOCUMENT';
  }

  /// Captured and not yet uploaded. Recapturing a side swaps in a new File, so
  /// that side counts as pending again and only it is re-sent.
  bool _isPending(Map<String, dynamic> step) =>
      step['file'] != null && !identical(step['file'], step['sentFile']);

  /// Drops a capture the backend has not accepted (never sent, or refused).
  /// A side that was accepted earlier goes back to that accepted file: the
  /// server keeps it, and a worker cannot delete it (no document:delete for
  /// WORKER), so showing the row as empty would be untrue.
  void _removeDoc(Map<String, dynamic> step) {
    setState(() => step['file'] = step['sentFile']);
  }

  void _finish() {
    if (!widget.enrollmentMode) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      return;
    }
    // Documents done → face liveness (can now match live face vs ID).
    final flow = EnrollmentFlowScreen.maybeOf(context);
    if (flow != null) {
      flow.next();
      return;
    }
    Navigator.pushReplacement(
      context,
      platformRoute(builder: (context) => const BiometricsEnrollmentScreen()),
    );
  }

  /// The selfie to send with the identity checks, taking it first if needed.
  ///
  /// The ML compares the photo on an ID with a selfie only when the selfie
  /// comes with that ID's check. Enrollment used to take the selfie later, at
  /// Biometrics, so the comparison never ran. Now it is taken here, once per
  /// enrollment, and only when an identity document is about to be checked.
  /// Skipping it is allowed: the documents still go through, just without
  /// that comparison, and Biometrics asks for the selfie as before.
  Future<List<int>?> _selfieForChecks() async {
    final flow = EnrollmentFlowScreen.maybeOf(context);
    if (!widget.enrollmentMode || flow == null) return null;
    final idPending = _steps.any((s) =>
        _isPending(s) &&
        carriesPortrait(expectedTypeFor(_docTypeFor(s['id'] as String)) ?? ''));
    if (!idPending) return null;
    if (!flow.selfieTaken) {
      final taken = await Navigator.push<bool>(
        context,
        platformRoute(builder: (_) => const SelfieCaptureScreen()),
      );
      if (taken != true) return null;
      flow.selfieTaken = true;
    }
    final b64 = await _storage.read(key: 'enroll_selfie');
    if (b64 == null || b64.isEmpty) return null;
    try {
      return base64Decode(b64);
    } on FormatException {
      return null;
    }
  }

  Future<void> _uploadAll() async {
    // Re-entry guard: a double-tap would start duplicate workflows.
    if (_isUploading) return;
    if (!_hasAtLeastOneDoc) return;
    // Back from Biometrics with nothing new captured: every side is already
    // uploaded and confirmed, and sending it again starts a second
    // verification workflow for the same document.
    if (!_steps.any(_isPending)) {
      _finish();
      return;
    }

    // Before the overlay: this may open the selfie camera.
    final selfie = await _selfieForChecks();
    if (!mounted) return;

    // Ticker runs only while the overlay it drives is on screen.
    _progressGlowController.repeat(reverse: true);
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
      _currentUploadStageIndex = 0;
      _uploadStage = _uploadStages[0]['label'];
    });

    try {
      // 1. OIDC Token Retrieval & Client Channel Setup
      final enrollment = EnrollmentService();
      final accessToken = await enrollment.getDocumentBearerToken();
      // Derive the worker id from the token's worker_id claim — the exact value
      // the backend compares against in its document self-confirm check — and
      // fall back to the stored worker_id only if the claim is absent.
      final workerId = (accessToken != null
              ? enrollment.workerIdFromToken(accessToken)
              : null) ??
          await _storage.read(key: 'worker_id');
      final tenantId = await _storage.read(key: 'tenant_id');

      if (accessToken == null) throw 'Missing authentication';
      if (workerId == null) throw 'Missing worker ID';

      final grpcService = CypurgeGrpcService();
      grpcService.init(useGateway: true);

      // Front and back are checked in ONE call, and a checked upload cannot be
      // given a new partner, so when either side changed, both go again.
      for (final pair in const [
        ['id_front', 'id_back'],
        ['license_front', 'license_back'],
      ]) {
        final front = _stepById(pair[0]);
        final back = _stepById(pair[1]);
        if (_isPending(back) && front['file'] == null) {
          throw 'Add the front of your ${_cardName(front)} too. The back is '
              'checked together with it.';
        }
        if (_isPending(front) || _isPending(back)) {
          front['sentFile'] = null;
          back['sentFile'] = null;
        }
      }

      final activeDocs = _steps.where(_isPending).toList();
      // Upload BACK sides before fronts. Each side triggers its own backend
      // workflow; the M4 verification of the LAST side finds its pair already
      // in MinIO and sends front+back in ONE M4 request (file + file_back,
      // doc_format=TD1 — MRZ lives on the back). Its paired verdict then
      // overwrites the earlier solo run's REVIEW on both rows.
      activeDocs.sort((a, b) {
        int rank(Map<String, dynamic> s) =>
            (s['id'] as String).endsWith('_back') ? 0 : 1;
        return rank(a) - rank(b);
      });
      double progressPerDoc = 0.9 / activeDocs.length;

      debugPrint('📤 UPLOAD BATCH: ${activeDocs.length} doc(s) → '
          '${activeDocs.map((s) => '${s['id']}=${_docTypeFor(s['id'] as String)}').join(', ')}');

      for (int i = 0; i < activeDocs.length; i++) {
        final step = activeDocs[i];
        final File file = step['file'] as File;
        // Storage can still be reclaimed between picking and uploading. Name the
        // document that went missing instead of throwing a raw errno at the user.
        if (!await file.exists()) {
          throw Exception(
              'The file for "${step['title']}" is no longer available on this '
              'device. Please capture or choose it again.');
        }
        final String fileExt = file.path.split('.').last.toLowerCase();
        final String docType = _docTypeFor(step['id'] as String);

        // Stage 1: Generate Upload URL
        setState(() {
          _currentUploadStageIndex = 0;
          _uploadStage = 'Requesting secure upload URL for ${step['title']}...';
          _uploadProgress = (i * progressPerDoc) + (progressPerDoc * 0.1);
        });

        debugPrint('📤 [${i + 1}/${activeDocs.length}] GenerateUploadURL: '
            'step=${step['id']} docType=$docType');
        final stage = Stopwatch()..start();
        final uploadUrlRes = await grpcService
            .generateUploadURL(
              token: accessToken,
              tenantId: tenantId!,
              workerId: workerId,
              fileExt: fileExt,
              docType: docType,
            )
            .timeout(const Duration(seconds: 10));

        String uploadUrl = uploadUrlRes.uploadUrl;
        final String objectKey = uploadUrlRes.objectKey;
        DocumentDebugLog.instance.note(
            objectKey, 'app.upload_url', TraceStatus.ok,
            ms: stage.elapsedMilliseconds,
            data: {'doc_type': docType, 'ext': fileExt});

        // Stage 2: PUT request upload to MinIO with SSE-KMS headers
        setState(() {
          _currentUploadStageIndex = 2; // Encrypting/Uploading stage
          _uploadStage = 'Encrypting & uploading ${step['title']}...';
          _uploadProgress = (i * progressPerDoc) + (progressPerDoc * 0.4);
        });

        final bytes = await file.readAsBytes();
        final putHeaders = <String, String>{
          'Content-Type': _getMimeType(fileExt)
        };

        // The encryption headers are signed, so the server's values are applied
        // LAST and nothing here may guess them. The old code ended with
        // `kms-$tenantId` — the name of a tenant's FIRST key only — so after a
        // key rotation the sent name no longer matched the signed one and MinIO
        // answered 403.
        putHeaders.addAll(uploadUrlRes.requiredHeaders);

        final originalHost = Uri.parse(uploadUrl).authority;
        // Always rewrite the MinIO hostname to the reachable node IP — the phone
        // can't resolve minio.workertrust.local. The original Host header is kept
        // below so the presigned signature still validates.
        uploadUrl =
            uploadUrl.replaceAll('minio.workertrust.local', AppConfig.host);
        putHeaders['Host'] = originalHost;

        debugPrint(
            'Uploading binary file via HTTP PUT to MinIO pre-signed URL...');
        stage.reset();
        final putResponse = await http
            .put(
              Uri.parse(uploadUrl),
              headers: putHeaders,
              body: bytes,
            )
            .timeout(const Duration(seconds: 30));
        DocumentDebugLog.instance.note(objectKey, 'app.put',
            putResponse.statusCode == 200 ? TraceStatus.ok : TraceStatus.fail,
            ms: stage.elapsedMilliseconds,
            data: {
              'kb': (bytes.length / 1024).toStringAsFixed(1),
              'http': putResponse.statusCode,
            });

        if (putResponse.statusCode != 200) {
          throw 'Failed to upload ${step['title']}: HTTP ${putResponse.statusCode} - ${putResponse.body}';
        }

        // Stage 3: Confirm upload via gRPC
        setState(() {
          _currentUploadStageIndex = 4; // Finalizing stage
          _uploadStage = 'Confirming upload for ${step['title']}...';
          _uploadProgress = (i * progressPerDoc) + (progressPerDoc * 0.8);
        });

        debugPrint('📤 [${i + 1}/${activeDocs.length}] ConfirmUpload: '
            'step=${step['id']} docType=$docType objectKey=$objectKey');
        stage.reset();
        await grpcService
            .confirmUpload(
              token: accessToken,
              objectKey: objectKey,
              docType: docType,
            )
            .timeout(const Duration(seconds: 10));
        DocumentDebugLog.instance.note(objectKey, 'app.confirm', TraceStatus.ok,
            ms: stage.elapsedMilliseconds);
        // Kept so the worker can open this file later from "Your files" on an
        // older backend that does not send a worker the key (FileKeyStore).
        await FileKeyStore.remember(
            documentId: uploadUrlRes.documentId, objectKey: objectKey);

        // Not "sent" yet: that waits for the upload check below.
        step['objectKey'] = objectKey;
        step['uploadedFile'] = file;

        // No client-side ID face crop: per the M5 contract the reference face is
        // the SELFIE (VerifyLiveness.doc_face), captured in the biometrics step.
        // The backend extracts the document face itself for the selfie-vs-doc
        // match, so the app just uploads the raw document here.
      }

      // The upload check. Nothing counts as sent until it passes: the backend
      // deletes an unchecked upload after 30 minutes, and a refused one can
      // never be checked again, so both stay pending for a new capture.
      final refused = <String>[];
      for (final step in activeDocs) {
        final id = step['id'] as String;
        if (id.endsWith('_back')) continue; // checked together with its front
        final back = id.endsWith('_front')
            ? _stepById(id.replaceFirst('_front', '_back'))
            : null;
        final withBack = back != null && activeDocs.contains(back);
        setState(() {
          _currentUploadStageIndex = 4;
          _uploadProgress = 0.95;
          _uploadStage = id.endsWith('_front')
              ? 'Reading your ${_cardName(step)}… this can take up to a '
                  'minute and a half'
              : 'Checking your ${step['title']}…';
        });
        try {
          await checkUpload(
            grpcService,
            token: accessToken,
            objectKey: step['objectKey'] as String,
            docType: _docTypeFor(id),
            backObjectKey: withBack ? back['objectKey'] as String : '',
            // Only passports and ID cards actually get it (selfieFor).
            selfie: selfie,
          );
          for (final s in [step, if (withBack) back]) {
            s['sentFile'] = s['uploadedFile'];
            await _storage.write(key: 'doc_uploaded_${s['id']}', value: 'true');
          }
          debugPrint('Upload check passed: $id${withBack ? ' + back' : ''}');
        } on DocumentRefused catch (e) {
          for (final s in [step, if (withBack) back]) {
            s['refusal'] = e.message;
            s['refusedFile'] = s['uploadedFile'];
          }
          refused.add('${_cardName(step)}: ${e.message}');
          debugPrint('Upload check refused: $id: ${e.message}');
        }
      }

      if (refused.isNotEmpty) {
        // Stay on this step: the worker replaces what was refused.
        if (mounted) {
          wtInfoBar(
              context,
              refused.length == 1
                  ? 'This document was not accepted'
                  : 'These documents were not accepted',
              message: refused.join('\n'),
              severity: WTSeverity.warning,
              duration: const Duration(seconds: 12));
        }
        return;
      }

      setState(() {
        _uploadProgress = 1.0;
        _uploadStage = 'Enrollment finalized successfully';
      });

      await Future.delayed(const Duration(milliseconds: 1200));

      if (mounted) _finish();
    } catch (e, stack) {
      ErrorLogger.log('Secure Document Upload Process', e, stack);
      debugPrint('âŒ Secure document upload failed: $e');
      if (mounted) {
        wtInfoBar(context, 'Upload Error',
            message: humanizeError(e, action: 'upload your documents'),
            severity: WTSeverity.error);
      }
    } finally {
      // Stop unconditionally, even when unmounted — a live Ticker outlasting the
      // overlay is the whole bug this guards against.
      _progressGlowController.stop();
      if (mounted) {
        setState(() {
          _isUploading = false;
          _uploadProgress = 0.0;
          _currentUploadStageIndex = -1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final uploadedCount = _steps.where((s) => s['file'] != null).length;

    return WTPage(
      // No nav bar mid-enrollment — worker isn't a destination-tab
      // user until the wizard completes.
      nav: widget.enrollmentMode
          ? null
          : WTBottomNav(items: workerNavItems(context, 1), activeIndex: 1),
      content: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // The header scrolls away with the list, so a short
                        // phone (or large text) still has room for the rows
                        // and the button below stays pinned.
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.only(bottom: 8),
                            children: [
                              EnrollmentBackButton('Back to experience',
                                  enabled: !_isUploading),
                              const StepIndicator(
                                currentStep: 3,
                                stepLabels: [
                                  'Scan',
                                  'Details',
                                  'Experience',
                                  'Documents',
                                  'Biometrics'
                                ],
                              ),
                              const SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Document Verification',
                                            style: AppTheme.h1),
                                        const SizedBox(height: 4),
                                        Text('Capture your identity documents',
                                            style: AppTheme.caption),
                                      ],
                                    ),
                                  ),
                                  WTTag(
                                      '$uploadedCount/${_steps.length} Captured',
                                      kind: WTTagKind.blue),
                                ],
                              ),
                              const SizedBox(height: 20),
                              // All document steps at once, in any order.
                              for (var i = 0; i < _steps.length; i++) ...[
                                if (i > 0) const SizedBox(height: 12),
                                _buildDocRow(_steps[i], i),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildActionButton(
                          label: _hasAtLeastOneDoc
                              ? (widget.enrollmentMode
                                  ? 'Continue to Biometrics'
                                  : 'Upload Documents')
                              : 'Capture at least one document',
                          icon: Icons.save_rounded,
                          color: AppTheme.success,
                          onPressed: _hasAtLeastOneDoc ? _uploadAll : () {},
                          isGhost: !_hasAtLeastOneDoc,
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isUploading) _buildUploadOverlay(),
        ],
      ),
    );
  }

  Widget _buildDocRow(Map<String, dynamic> step, int index) {
    final bool hasFile = step['file'] != null;
    final refusal = _refusalOf(step);
    return MergeSemantics(
        child: Semantics(
            button: true,
            hint: 'Opens the camera',
            child: GestureDetector(
              onTap: () async {
                setState(() => _activeStepIndex = index);
                await _captureCurrentDoc();
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(AppTheme.rMd),
                  border: Border.all(
                    color: refusal != null
                        ? AppTheme.error
                        : hasFile
                            ? AppTheme.success
                            : AppTheme.border,
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: hasFile
                            ? AppTheme.tint(AppTheme.success)
                            : AppTheme.tint(AppTheme.accent),
                      ),
                      child: Center(
                        child: hasFile
                            ? _rowThumb(step['file'])
                            : Icon(step['icon'] as IconData,
                                color: AppTheme.accent, size: 26),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(step['title'],
                              style: TextStyle(
                                  color: AppTheme.ink,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(height: 2),
                          Text(
                              refusal ??
                                  (hasFile
                                      ? (_isPending(step)
                                          ? 'Captured — tap to replace, or remove'
                                          : 'Uploaded — tap to replace')
                                      : step['description']),
                              style: TextStyle(
                                  color: refusal != null
                                      ? AppTheme.error
                                      : hasFile
                                          ? AppTheme.success
                                          : AppTheme.muted,
                                  fontSize: 12.5)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Not accepted yet (captured, or refused): it can be removed.
                    if (_isPending(step))
                      WTIconButton(
                        icon: Icons.delete_rounded,
                        label: 'Remove ${step['title']}',
                        color:
                            refusal != null ? AppTheme.error : AppTheme.muted,
                        size: 18,
                        onPressed: _isUploading ? null : () => _removeDoc(step),
                      )
                    else
                      Icon(
                        hasFile
                            ? Icons.check_rounded
                            : Icons.photo_camera_rounded,
                        color: hasFile ? AppTheme.success : AppTheme.accent,
                        size: 18,
                      ),
                  ],
                ),
              ),
            )));
  }

  Widget _rowThumb(File file) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Image.file(file,
          width: 52,
          height: 52,
          fit: BoxFit.cover,
          // 52dp thumbnail: never decode the full-resolution file.
          cacheWidth: (52 * MediaQuery.devicePixelRatioOf(context)).round(),
          // A picked PDF or Word file is not an image.
          errorBuilder: (_, __, ___) => Icon(Icons.description_rounded,
              color: AppTheme.success, size: 24)),
    );
  }

  Widget _buildStepCard(Map<String, dynamic> step) {
    final bool hasFile = step['file'] != null;

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: AppTheme.card(radius: AppTheme.rXl),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.tint(AppTheme.accent),
              ),
              child: Center(
                child: Icon(step['icon'] as IconData,
                    color: AppTheme.accent, size: 44),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              step['title'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.ink,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              step['description'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.muted,
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 48),
            if (hasFile)
              _buildThumbnail(step['file'])
            else
              _buildCaptureButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCaptureButton() {
    return Semantics(
        button: true,
        label: 'Take a photo of this document',
        excludeSemantics: true,
        child: GestureDetector(
          onTap: _captureCurrentDoc,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.accent, AppTheme.accentLight],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.accent.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.photo_camera_rounded, color: Colors.white, size: 24),
                SizedBox(width: 12),
                Text(
                  'Capture Document',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildThumbnail(File file) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: ResizeImage(FileImage(file),
                  width:
                      (200 * MediaQuery.devicePixelRatioOf(context)).round()),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: AppTheme.success, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppTheme.success.withValues(alpha: 0.2),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            tooltip: 'Remove photo',
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration:
                  BoxDecoration(color: AppTheme.error, shape: BoxShape.circle),
              child:
                  Icon(Icons.close_rounded, color: AppTheme.onError, size: 16),
            ),
            onPressed: () =>
                setState(() => _steps[_activeStepIndex]['file'] = null),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    bool isGhost = false,
  }) {
    return Semantics(
        button: true,
        enabled: !isGhost,
        label: label,
        excludeSemantics: true,
        child: GestureDetector(
          onTap: onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            decoration: BoxDecoration(
              color: isGhost ? Colors.transparent : color,
              borderRadius: BorderRadius.circular(16),
              border: isGhost ? Border.all(color: AppTheme.border) : null,
              boxShadow: !isGhost
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isGhost ? AppTheme.muted : AppTheme.onAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  icon,
                  color: isGhost ? AppTheme.muted : AppTheme.onAccent,
                  size: 18,
                ),
              ],
            ),
          ),
        ));
  }

  // Three coarse phases derived from upload progress — robust regardless of the
  // finer internal stage list. Each: (label, icon, completion threshold).
  static const List<(String, IconData, double)> _uploadPhases = [
    ('Encrypt', Icons.lock_rounded, 0.45),
    ('Upload', Icons.cloud_upload_rounded, 0.95),
    ('Verify', Icons.shield_rounded, 1.0),
  ];

  Widget _buildUploadOverlay() {
    final done = _uploadProgress >= 1.0;
    final ringColor = done ? AppTheme.cameraSuccess : AppTheme.accent;

    return Container(
      // Fully opaque scrim — no underlying screen bleed-through.
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0B1220), Color(0xFF070A12)],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ── Single ring with % (or check on success) ──
                    // Only the ring listens to the glow ticker, in its own
                    // layer; the rest of the overlay is not rebuilt per frame.
                    RepaintBoundary(
                      child: AnimatedBuilder(
                        animation: _progressGlowAnim,
                        builder: (context, _) {
                          final glow = AppTheme.reduceMotion(context)
                              ? 0.55
                              : _progressGlowAnim.value;
                          return SizedBox(
                            width: 168,
                            height: 168,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 168,
                                  height: 168,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: ringColor.withValues(
                                            alpha: glow * 0.35),
                                        blurRadius: 48,
                                        spreadRadius: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: WTSpinner(
                                    value: 100,
                                    strokeWidth: 8,
                                    activeColor:
                                        Colors.white.withValues(alpha: 0.06),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: TweenAnimationBuilder<double>(
                                    tween: Tween(
                                        begin: 0, end: _uploadProgress * 100),
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeOutCubic,
                                    builder: (_, v, __) => WTSpinner(
                                      value: v,
                                      strokeWidth: 8,
                                      activeColor: ringColor,
                                    ),
                                  ),
                                ),
                                done
                                    ? Icon(Icons.check_circle_rounded,
                                        color: ringColor, size: 56)
                                    : Text(
                                        '${(_uploadProgress * 100).toInt()}%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: -1.5,
                                          shadows: [
                                            Shadow(
                                              color: ringColor.withValues(
                                                  alpha: glow),
                                              blurRadius: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── Current stage label ──
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        done ? 'Upload complete' : _uploadStage,
                        key: ValueKey(done ? 'done' : _uploadStage),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.92),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ── 3-phase labelled tracker ──
                    _phaseTracker(),
                  ],
                ),
              ),
            ),

            // ── Reassurance footer (muted, not the headline) ──
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shield_rounded,
                      color: Colors.white.withValues(alpha: 0.35), size: 12),
                  const SizedBox(width: 6),
                  Text(
                    'AES-256 encrypted transfer',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.35),
                      fontSize: 11,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _phaseTracker() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < _uploadPhases.length; i++) ...[
          _phaseNode(i),
          if (i < _uploadPhases.length - 1) _phaseConnector(i),
        ],
      ],
    );
  }

  Widget _phaseNode(int i) {
    final (label, icon, threshold) = _uploadPhases[i];
    final isDone = _uploadProgress >= threshold;
    final prevDone = i == 0 || _uploadProgress >= _uploadPhases[i - 1].$3;
    final isActive = !isDone && prevDone;

    final Color ring;
    final Widget inner;
    if (isDone) {
      ring = AppTheme.cameraSuccess;
      inner = const Icon(Icons.check_rounded, color: Colors.white, size: 16);
    } else if (isActive) {
      ring = AppTheme.accent;
      inner = Icon(icon, color: Colors.white, size: 16);
    } else {
      ring = Colors.white.withValues(alpha: 0.12);
      inner = Icon(icon, color: Colors.white.withValues(alpha: 0.3), size: 16);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone || isActive ? ring : Colors.transparent,
            border: Border.all(color: ring, width: 2),
            boxShadow: isActive
                ? [
                    BoxShadow(
                        color: ring.withValues(alpha: 0.5), blurRadius: 12)
                  ]
                : null,
          ),
          child: Center(child: inner),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isDone || isActive
                ? Colors.white.withValues(alpha: 0.85)
                : Colors.white.withValues(alpha: 0.3),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _phaseConnector(int i) {
    final filled = _uploadProgress >= _uploadPhases[i].$3;
    return Container(
      width: 36,
      height: 2,
      margin: const EdgeInsets.only(bottom: 27),
      color: filled
          ? AppTheme.cameraSuccess
          : Colors.white.withValues(alpha: 0.12),
    );
  }
}
