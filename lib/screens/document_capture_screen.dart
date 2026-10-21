import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/enrollment_service.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/document_check.dart';
import '../services/document_quality_service.dart';
import '../utils/document_debug_report.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../utils/file_keys.dart';
import '../config/constants.dart';
import '../utils/capture_geometry.dart';
import '../utils/image_work.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';

class DocumentCaptureScreen extends StatefulWidget {
  final String documentType;

  /// When true, capture returns the file path to the caller WITHOUT uploading.
  /// The enrollment checklist uploads everything itself on finalize — uploading
  /// here too created duplicate doc-processing workflows per document.
  final bool returnOnly;

  const DocumentCaptureScreen(
      {super.key, required this.documentType, this.returnOnly = false});

  @override
  State<DocumentCaptureScreen> createState() => _DocumentCaptureScreenState();
}

class _DocumentCaptureScreenState extends State<DocumentCaptureScreen>
    with CameraFullScreen {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  XFile? _capturedImage;

  bool _isUploading = false;
  double _uploadProgress = 0.0;
  bool _uploadFailed = false;
  String? _errorMessage;

  /// The upload is in and the backend is checking it is the right document.
  bool _checking = false;

  /// Why the upload check refused this photo. Only a retake helps, so it
  /// disables the upload button until then.
  String? _refusal;

  // On-device quality analysis of the captured image (US-013-1).
  DocumentQuality? _quality;
  bool _analyzing = false;

  /// Set when the on-device quality check itself failed. Distinct from "not
  /// analysed yet", because a failed check must not block the upload.
  String? _qualityError;

  /// Set when the camera could not be opened at all.
  String? _cameraError;

  bool _flashOn = false;
  Offset? _focusPoint;

  /// Size of the camera view on screen, recorded by the LayoutBuilder so the
  /// crop can reproduce exactly what the guide frame showed.
  Size? _previewBox;

  /// Real proportions of the document being captured (ID-1 card, passport page,
  /// A4 certificate) — drives both the guide frame and the crop.
  double get _docAspect => docAspectFor(_wireDocType);

  /// Preview aspect as width / height in portrait — the same number
  /// CameraPreview uses for its own AspectRatio.
  double get _previewAspect {
    final a = _cameraController?.value.aspectRatio;
    if (a == null || a <= 0) return 3 / 4;
    return 1 / a;
  }

  /// Tap-to-focus + tap-to-meter. Maps the tap to normalized sensor coords.
  Future<void> _focusOnTap(TapDownDetails d, Size size) async {
    final cam = _cameraController;
    if (cam == null || !cam.value.isInitialized) return;
    // The preview is cover-fitted, so screen → preview coordinates go through
    // the same geometry the crop uses; a tap on the frame focuses on the frame.
    final p =
        CoverFit(Size(_previewAspect, 1), size).toContent(d.localPosition);
    final dx = (p.dx / _previewAspect).clamp(0.0, 1.0);
    final dy = p.dy.clamp(0.0, 1.0);
    setState(() => _focusPoint = d.localPosition);
    try {
      await cam.setFocusPoint(Offset(dx, dy));
      await cam.setExposurePoint(Offset(dx, dy));
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Focus', e, stack);
    }
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _focusPoint = null);
    });
  }

  /// Crops the full-sensor capture down to the guide-frame rectangle so the
  /// saved/uploaded image matches what the worker framed (no extra background).
  Future<String> _cropToFrame(String path) async {
    try {
      return await cropStillToFrame(
        path: path,
        box: _previewBox,
        docAspect: _docAspect,
        previewAspect: _previewAspect,
      );
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Crop', e, stack);
      return path; // fall back to the uncropped capture
    }
  }

  Future<void> _toggleFlash() async {
    final cam = _cameraController;
    if (cam == null || !cam.value.isInitialized) return;
    final next = !_flashOn;
    try {
      await cam.setFlashMode(next ? FlashMode.torch : FlashMode.off);
      if (mounted) setState(() => _flashOn = next);
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Flash Toggle', e, stack);
    }
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        // Use the first back camera
        final backCamera = _cameras!.firstWhere(
            (c) => c.lensDirection == CameraLensDirection.back,
            orElse: () => _cameras![0]);
        // max = whatever the phone's largest still size is — no cap on our
        // side (12 MP, 50 MP or 200 MP, the device decides). Not a 1080p
        // preset: the crop keeps only the document, so every pixel the sensor
        // has ends up on the MRZ / text that M4 must OCR.
        _cameraController = CameraController(backCamera, ResolutionPreset.max,
            enableAudio: false);
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {});
        }
        if (mounted) setState(() => _cameraError = null);
      } else if (mounted) {
        setState(() => _cameraError = 'No camera was found on this device.');
      }
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Camera Initialization', e, stack);
      if (mounted) {
        setState(
            () => _cameraError = humanizeError(e, action: 'open the camera'));
      }
    }
  }

  Future<void> _analyzeQuality(String path) async {
    setState(() {
      _analyzing = true;
      _qualityError = null;
    });
    try {
      final quality = await DocumentQualityService.analyze(path);
      if (mounted) {
        setState(() {
          _quality = quality;
          _analyzing = false;
        });
      }
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Quality Analysis', e, stack);
      if (mounted) {
        setState(() {
          _analyzing = false;
          _qualityError = 'Could not check this image automatically.';
        });
      }
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _captureDocument() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    try {
      final image = await _cameraController!.takePicture();
      final croppedPath = await _cropToFrame(image.path);
      if (!mounted) return;
      setState(() {
        _capturedImage = XFile(croppedPath);
      });
      await _analyzeQuality(croppedPath);
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Capture Failure', e, stack);
      if (!mounted) return;
      wtInfoBar(context, 'Notification',
          message: humanizeError(e, action: 'capture the document'));
    }
  }

  void _retakeDocument() {
    setState(() {
      _capturedImage = null;
      _uploadFailed = false;
      _errorMessage = null;
      _isUploading = false;
      _uploadProgress = 0.0;
      _quality = null;
      _analyzing = false;
      _checking = false;
      _refusal = null;
    });
  }

  /// Display title -> backend doc_type enum value. Raw titles ("Passport",
  /// "Driver's License (Front)") are NOT valid document_type enum values and
  /// would kill the processing workflow at the DB insert.
  /// Back sides use the exact strings the backend's front/back pairing looks
  /// up ('Driving License (Back)' enum added by migration 000008).
  /// Unknown titles fall back to generic DOCUMENT.
  String get _wireDocType {
    // Two naming conventions reach this getter. The upload wizard passes display
    // titles ("National ID (Front)"); re-verification passes the analyst's wire
    // constants straight through ("NATIONAL_ID_FRONT", case.proto:213). Underscores
    // made every substring test below miss, so a re-verified National ID or work
    // permit was filed as a generic DOCUMENT — HR asked for one document and got
    // back an untyped one. Normalise separators before matching.
    final t = widget.documentType.toLowerCase().replaceAll('_', ' ');
    if (t.contains('passport')) return 'PASSPORT';
    if (t.contains('national id')) {
      return t.contains('back') ? 'National ID (Back)' : 'NATIONAL_ID';
    }
    // Ordered before the 'licen' test: "Education License" also contains 'licen'
    // but is LICENSE, and a work permit is not a driving licence. DRIVING_LICENSE
    // is the front of the driving licence; the back is 'Driving License (Back)'.
    if (t.contains('work permit')) return 'WORK_PERMIT';
    if (t.contains('visa')) return 'VISA';
    if (t.contains('qualification') || t.contains('certificate')) {
      return 'QUALIFICATION_CERT';
    }
    // LICENSE is the education licence; bare 'LICENSE' arrives from the analyst's
    // re-verification list and must not fall through to the driving-licence test.
    if (t.contains('education') || t.trim() == 'license') return 'LICENSE';
    if (t.contains('licen')) {
      return t.contains('back') ? 'Driving License (Back)' : 'DRIVING_LICENSE';
    }
    return 'DOCUMENT';
  }

  Future<void> _uploadDocument() async {
    if (_capturedImage == null) return;
    if (_isUploading) {
      return; // re-entry guard: double-tap → duplicate workflows
    }

    if (widget.returnOnly) {
      Navigator.pop(context, _capturedImage!.path);
      return;
    }

    debugPrint('📤 UPLOAD (standalone): 1 doc → '
        'title=${widget.documentType} docType=$_wireDocType');

    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
      _uploadFailed = false;
      _errorMessage = null;
    });

    try {
      const storage = FlutterSecureStorage();
      final enrollment = EnrollmentService();
      final accessToken = await enrollment.getDocumentBearerToken();
      // Resolve a REAL worker_id. Prefer the token claim; otherwise resolve via
      // SyncUser (cached). The backend's InitializeDocumentActivity does a strict
      // uuid.Parse on this — a bogus id (e.g. 'unknown_worker') makes the upload
      // workflow die, so we abort cleanly instead of sending garbage.
      final tokenWorkerId = accessToken != null
          ? enrollment.workerIdFromToken(accessToken)
          : null;
      final workerId = tokenWorkerId ?? await enrollment.resolveWorkerId();
      if (workerId == null || workerId.isEmpty) {
        throw Exception(
            'No worker identity found. Please log in and enroll first.');
      }
      final tenantId = await storage.read(key: 'tenant_id') ?? '';

      // 1. Get Presigned Upload URL via gRPC
      final grpcService = CypurgeGrpcService();
      grpcService.init(useGateway: true);

      final stage = Stopwatch()..start();
      final uploadUrlRes = await grpcService.generateUploadURL(
        token: accessToken ?? '',
        tenantId: tenantId,
        workerId: workerId,
        fileExt: 'jpg',
        docType: _wireDocType,
      );

      String presignedUrl = uploadUrlRes.uploadUrl;
      final objectKey = uploadUrlRes.objectKey;
      final requiredHeaders = uploadUrlRes.requiredHeaders;
      final debug = DocumentDebugLog.instance
        ..note(objectKey, 'app.upload_url', TraceStatus.ok,
            ms: stage.elapsedMilliseconds,
            data: {'doc_type': _wireDocType, 'ext': 'jpg'});

      // 2. Upload file to MinIO via the presigned PUT URL with progress tracking
      final file = File(_capturedImage!.path);
      final length = await file.length();

      final originalHost = Uri.parse(presignedUrl).authority;
      // Always rewrite the MinIO hostname to the reachable node IP — the phone
      // can't resolve minio.workertrust.local. The original Host header is kept
      // below so the presigned signature still validates.
      presignedUrl =
          presignedUrl.replaceAll('minio.workertrust.local', AppConfig.host);

      final request = http.StreamedRequest('PUT', Uri.parse(presignedUrl));
      request.contentLength = length;
      request.headers['Content-Type'] = 'image/jpeg';
      request.headers['Host'] = originalHost;
      // Apply any required headers returned by the backend
      requiredHeaders.forEach((k, v) => request.headers[k] = v);

      int byteCount = 0;
      file.openRead().listen(
            (List<int> chunk) {
              byteCount += chunk.length;
              setState(() {
                _uploadProgress = byteCount / length;
              });
              request.sink.add(chunk);
            },
            onDone: () => request.sink.close(),
            onError: (e) {
              request.sink.addError(e);
              request.sink.close();
            },
            cancelOnError: true,
          );

      stage.reset();
      final response = await request.send();
      final stored = response.statusCode == 200 || response.statusCode == 204;
      debug.note(
          objectKey, 'app.put', stored ? TraceStatus.ok : TraceStatus.fail,
          ms: stage.elapsedMilliseconds,
          data: {
            'kb': (length / 1024).toStringAsFixed(1),
            'http': response.statusCode,
          });
      if (!stored) {
        throw Exception(
            'Upload to storage failed with status: ${response.statusCode}');
      }

      // 3. Confirm upload via gRPC so the backend registers the document
      stage.reset();
      await grpcService.confirmUpload(
        token: accessToken ?? '',
        objectKey: objectKey,
        docType: _wireDocType,
      );
      debug.note(objectKey, 'app.confirm', TraceStatus.ok,
          ms: stage.elapsedMilliseconds);
      // Kept so the worker can open this file later from "Your files" on an
      // older backend that does not send a worker the key (FileKeyStore).
      await FileKeyStore.remember(
          documentId: uploadUrlRes.documentId, objectKey: objectKey);

      // 4. Upload check. Without it the backend deletes the file after 30
      // minutes and never verifies it.
      // ponytail: a back side has no check of its own (it is checked with its
      // front), so a back re-uploaded alone still expires; re-verification has
      // to ask for both sides to fix that.
      if (expectedTypeFor(_wireDocType) != null) {
        if (mounted) setState(() => _checking = true);
        await checkUpload(
          grpcService,
          token: accessToken ?? '',
          objectKey: objectKey,
          docType: _wireDocType,
        );
      }

      if (mounted) {
        Navigator.pop(context, _capturedImage!.path);
      }
    } on DocumentRefused catch (e) {
      if (!mounted) return;
      setState(() {
        _refusal = e.message;
        _isUploading = false;
        _checking = false;
      });
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Upload Failure', e, stack);
      setState(() {
        _uploadFailed = true;
        _errorMessage = humanizeError(e, action: 'upload the document');
        _isUploading = false;
        _checking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraError != null) {
      return WTPage(
        appBar: AppBar(
          title: Text('Capture ${widget.documentType}',
              maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        content: Padding(
          padding: const EdgeInsets.all(AppTheme.s5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WTAlert(_cameraError!, kind: WTAlertKind.danger),
              const SizedBox(height: 8),
              WTButton(
                label: 'Try again',
                icon: Icons.refresh_rounded,
                onPressed: () {
                  setState(() => _cameraError = null);
                  _initCamera();
                },
              ),
            ],
          ),
        ),
      );
    }
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return WTPage(
        content: Center(child: WTSpinner(activeColor: AppTheme.accent)),
      );
    }

    // Camera step is immersive (no app bar, viewfinder to the top edge);
    // review step keeps the app bar.
    if (_capturedImage == null) {
      return WTPage(topGap: 0, fullBleed: true, content: _buildCameraPreview());
    }
    return WTPage(
      appBar: AppBar(
        // Review has Retake / Upload; a back arrow here would skip both.
        automaticallyImplyLeading: false,
        title: Text('Review ${widget.documentType}',
            maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      content: _buildUploadPreview(),
    );
  }

  Widget _buildCameraPreview() {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Camera fills the screen behind everything. Tap anywhere to focus.
        Positioned.fill(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final size = Size(constraints.maxWidth, constraints.maxHeight);
              _previewBox = size;
              // Cover-fit, not the plugin's letterboxed AspectRatio: a 4:3
              // sensor at max resolution would otherwise sit between black
              // bars and the guide frame would no longer be over live pixels.
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (d) => _focusOnTap(d, size),
                child: ClipRect(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 1000 * _previewAspect,
                      height: 1000,
                      child: CameraPreview(_cameraController!),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Landscape ID-shaped guide with dimmed surround.
        Positioned.fill(
          child: IgnorePointer(
            child:
                CustomPaint(painter: DocumentFramePainter(aspect: _docAspect)),
          ),
        ),

        // Tap-to-focus reticle.
        if (_focusPoint != null)
          Positioned(
            left: _focusPoint!.dx - 30,
            top: _focusPoint!.dy - 30,
            child: IgnorePointer(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.accent, width: 2),
                ),
              ),
            ),
          ),

        SafeArea(
          child: Column(
            children: [
              // ── Header: close · doc chip · flash ──
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _glassButton(Icons.chevron_left_rounded,
                        label: 'Back',
                        onTap: () => Navigator.maybePop(context)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.12)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.description_rounded,
                              color: AppTheme.accent, size: 14),
                          const SizedBox(width: 8),
                          Text(
                            widget.documentType,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    _glassButton(
                      Icons.lightbulb_rounded,
                      label: _flashOn ? 'Turn flash off' : 'Turn flash on',
                      onTap: _toggleFlash,
                      active: _flashOn,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // ── Hint pill above the shutter ──
              Container(
                margin: const EdgeInsets.only(bottom: 28),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.photo_camera_rounded,
                        color: Colors.white, size: 16),
                    SizedBox(width: 8),
                    Text('Align document in frame · avoid glare',
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ],
                ),
              ),

              // ── Shutter row ──
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: Semantics(
                  button: true,
                  label: 'Capture ${widget.documentType}',
                  excludeSemantics: true,
                  child: GestureDetector(
                    onTap: _captureDocument,
                    child: Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.accent.withValues(alpha: 0.5),
                            blurRadius: 18,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.accent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _glassButton(IconData icon,
      {required VoidCallback onTap,
      required String label,
      bool active = false}) {
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active
                ? AppTheme.accent.withValues(alpha: 0.9)
                : Colors.black.withValues(alpha: 0.55),
            border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
          ),
          child:
              Icon(icon, color: active ? Colors.black : Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget _buildUploadPreview() {
    // top: false — the header's own SafeArea already cleared the status bar.
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(_capturedImage!.path),
                  fit: BoxFit.contain,
                  // Decode at screen width, not the sensor's full resolution.
                  cacheWidth: (MediaQuery.sizeOf(context).width *
                          MediaQuery.devicePixelRatioOf(context))
                      .round(),
                ),
              ),
            ),
            const SizedBox(height: 24),

            _buildQualityPanel(),

            // The colours below used to be hardcoded for the old dark theme:
            // white "Retake" and "Uploading" text vanished on the light ground,
            // and black text on the navy button measured under 3:1.
            if (_isUploading) ...[
              Text(
                _checking
                    ? 'Checking your document…'
                    : 'Uploading... ${(_uploadProgress * 100).toStringAsFixed(0)}%',
                style: AppTheme.label,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              WTProgressBar(value: _uploadProgress),
              const SizedBox(height: 16),
            ],

            if (_uploadFailed)
              WTAlert('Upload failed. $_errorMessage',
                  kind: WTAlertKind.danger),
            if (_refusal != null) WTAlert(_refusal!, kind: WTAlertKind.danger),

            Row(
              children: [
                Expanded(
                  child: WTButton(
                    label: 'Retake',
                    kind: WTButtonKind.subtle,
                    icon: Icons.photo_camera_rounded,
                    onPressed: _isUploading ? null : _retakeDocument,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: WTButton(
                    label: _uploadFailed ? 'Retry upload' : 'Upload document',
                    icon: _uploadFailed
                        ? Icons.refresh_rounded
                        : Icons.upload_rounded,
                    loading: _isUploading,
                    onPressed: (_analyzing ||
                            _refusal != null ||
                            (_quality == null && _qualityError == null))
                        ? null
                        : _uploadDocument,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQualityPanel() {
    if (_analyzing) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: AppTheme.card(),
        child: Row(
          children: [
            SizedBox(
                width: 16,
                height: 16,
                child: WTSpinner(strokeWidth: 2, activeColor: AppTheme.accent)),
            const SizedBox(width: 12),
            Text('Analysing image quality...',
                style: TextStyle(color: AppTheme.ink)),
          ],
        ),
      );
    }

    if (_qualityError != null) {
      return WTAlert(
        '$_qualityError You can still upload it, or retake for a clearer shot.',
        kind: WTAlertKind.warning,
      );
    }

    final q = _quality;
    if (q == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: AppTheme.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _qualityRow('Sharpness', q.sharpnessLabel, q.sharpnessOk),
          const SizedBox(height: 8),
          _qualityRow('Lighting', q.brightnessLabel, q.brightnessOk),
        ],
      ),
    );
  }

  Widget _qualityRow(String label, String value, bool ok,
      {bool hardFail = false}) {
    final color =
        ok ? AppTheme.success : (hardFail ? AppTheme.error : AppTheme.warn);
    return Row(
      children: [
        Icon(
            ok
                ? Icons.check_circle_outline_rounded
                : Icons.warning_amber_rounded,
            color: color,
            size: 16),
        const SizedBox(width: 10),
        Text('$label: ',
            style: TextStyle(color: AppTheme.ink, fontWeight: FontWeight.w600)),
        Expanded(child: Text(value, style: TextStyle(color: color))),
      ],
    );
  }
}

class DocumentFramePainter extends CustomPainter {
  const DocumentFramePainter({required this.aspect});

  /// Width / height of the document being captured — see docAspectFor.
  final double aspect;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    // Same rectangle the crop uses (frameRectFor), so what the worker sees in
    // the window is exactly what gets saved.
    final Rect frame = frameRectFor(size, aspect);
    final double margin = frame.left;
    final double frameHeight = frame.height;
    final double topOffset = frame.top;

    final RRect frameRect = RRect.fromRectAndRadius(
      frame,
      const Radius.circular(16),
    );

    // Draw dark overlay with a cutout
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    final clearPaint = Paint()..blendMode = BlendMode.clear;
    canvas.drawRRect(frameRect, clearPaint);
    canvas.restore();

    // Draw corners
    final cornerPaint = Paint()
      ..color = AppTheme.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    const double cornerLength = 30.0;

    // Top-Left
    canvas.drawLine(Offset(margin, topOffset + cornerLength),
        Offset(margin, topOffset), cornerPaint);
    canvas.drawLine(Offset(margin, topOffset),
        Offset(margin + cornerLength, topOffset), cornerPaint);

    // Top-Right
    canvas.drawLine(Offset(size.width - margin - cornerLength, topOffset),
        Offset(size.width - margin, topOffset), cornerPaint);
    canvas.drawLine(Offset(size.width - margin, topOffset),
        Offset(size.width - margin, topOffset + cornerLength), cornerPaint);

    // Bottom-Left
    canvas.drawLine(Offset(margin, topOffset + frameHeight - cornerLength),
        Offset(margin, topOffset + frameHeight), cornerPaint);
    canvas.drawLine(Offset(margin, topOffset + frameHeight),
        Offset(margin + cornerLength, topOffset + frameHeight), cornerPaint);

    // Bottom-Right
    canvas.drawLine(
        Offset(size.width - margin - cornerLength, topOffset + frameHeight),
        Offset(size.width - margin, topOffset + frameHeight),
        cornerPaint);
    canvas.drawLine(
        Offset(size.width - margin, topOffset + frameHeight),
        Offset(size.width - margin, topOffset + frameHeight - cornerLength),
        cornerPaint);
  }

  @override
  bool shouldRepaint(covariant DocumentFramePainter oldDelegate) =>
      oldDelegate.aspect != aspect;
}
