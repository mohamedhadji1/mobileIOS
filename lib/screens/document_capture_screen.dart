import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/enrollment_service.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/document_quality_service.dart';
import '../utils/error_logger.dart';
import '../config/constants.dart';
import '../theme/app_theme.dart';

class DocumentCaptureScreen extends StatefulWidget {
  final String documentType;

  const DocumentCaptureScreen({super.key, required this.documentType});

  @override
  State<DocumentCaptureScreen> createState() => _DocumentCaptureScreenState();
}

class _DocumentCaptureScreenState extends State<DocumentCaptureScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  XFile? _capturedImage;
  
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  bool _uploadFailed = false;
  String? _errorMessage;
  
  // On-device quality analysis of the captured image (US-013-1).
  DocumentQuality? _quality;
  bool _analyzing = false;

  bool _flashOn = false;
  Offset? _focusPoint;

  /// ID-1 cards / passport data pages are landscape; the on-screen guide frame
  /// uses this ratio, so the saved image must be cropped to match it.
  static const double _frameAspect = 1.586; // width / height
  static const double _frameWidthFraction = 0.92;

  /// Tap-to-focus + tap-to-meter. Maps the tap to normalized sensor coords.
  Future<void> _focusOnTap(TapDownDetails d, Size size) async {
    final cam = _cameraController;
    if (cam == null || !cam.value.isInitialized) return;
    final dx = (d.localPosition.dx / size.width).clamp(0.0, 1.0);
    final dy = (d.localPosition.dy / size.height).clamp(0.0, 1.0);
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
      final bytes = await File(path).readAsBytes();
      final decoded = img.decodeImage(bytes);
      if (decoded == null) return path;
      final w = decoded.width;
      final h = decoded.height;
      // Frame spans most of the shorter (portrait-width) dimension, landscape.
      final shorter = w < h ? w : h;
      int cropW = (shorter * _frameWidthFraction).round();
      int cropH = (cropW / _frameAspect).round();
      cropW = cropW.clamp(1, w);
      cropH = cropH.clamp(1, h);
      final x = ((w - cropW) / 2).round().clamp(0, w - cropW);
      final y = ((h - cropH) / 2).round().clamp(0, h - cropH);
      final cropped = img.copyCrop(decoded, x: x, y: y, width: cropW, height: cropH);
      final out = path.replaceFirst(
          RegExp(r'(\.\w+)?$'), '_crop.jpg');
      await File(out).writeAsBytes(img.encodeJpg(cropped, quality: 92));
      return out;
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
          orElse: () => _cameras![0]
        );
        _cameraController = CameraController(backCamera, ResolutionPreset.high, enableAudio: false);
        await _cameraController!.initialize();
        if (mounted) {
          setState(() {});
        }
      }
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Camera Initialization', e, stack);
    }
  }

  Future<void> _analyzeQuality(String path) async {
    setState(() => _analyzing = true);
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
      if (mounted) setState(() => _analyzing = false);
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _captureDocument() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
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
      displayInfoBar(context, builder: (context, close) => InfoBar(title: const Text('Notification'), content: Text('Capture failed: $e'), action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close)));
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
    });
  }

  Future<void> _uploadDocument() async {
    if (_capturedImage == null) return;

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
      final tokenWorkerId =
          accessToken != null ? enrollment.workerIdFromToken(accessToken) : null;
      final workerId = tokenWorkerId ?? await enrollment.resolveWorkerId();
      if (workerId == null || workerId.isEmpty) {
        throw Exception('No worker identity found. Please log in and enroll first.');
      }
      final tenantId = await storage.read(key: 'tenant_id') ?? '';

      // 1. Get Presigned Upload URL via gRPC
      final grpcService = CypurgeGrpcService();
      grpcService.init(useGateway: true);

      final uploadUrlRes = await grpcService.generateUploadURL(
        token: accessToken ?? '',
        tenantId: tenantId,
        workerId: workerId,
        fileExt: 'jpg',
      );

      String presignedUrl = uploadUrlRes.uploadUrl;
      final objectKey = uploadUrlRes.objectKey;
      final requiredHeaders = uploadUrlRes.requiredHeaders;

      // 2. Upload file to MinIO via the presigned PUT URL with progress tracking
      final file = File(_capturedImage!.path);
      final length = await file.length();

      final originalHost = Uri.parse(presignedUrl).authority;
      // Always rewrite the MinIO hostname to the reachable node IP â€” the phone
      // can't resolve minio.workertrust.local. The original Host header is kept
      // below so the presigned signature still validates.
      presignedUrl = presignedUrl.replaceAll('minio.workertrust.local', AppConfig.host);

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

      final response = await request.send();
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Upload to storage failed with status: ${response.statusCode}');
      }

      // 3. Confirm upload via gRPC so the backend registers the document
      await grpcService.confirmUpload(
        token: accessToken ?? '',
        objectKey: objectKey,
        docType: widget.documentType,
      );

      if (mounted) {
        Navigator.pop(context, _capturedImage!.path);
      }
    } catch (e, stack) {
      ErrorLogger.log('Document Capture - Upload Failure', e, stack);
      setState(() {
        _uploadFailed = true;
        _errorMessage = e.toString();
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return ScaffoldPage(
      content: Center(child: ProgressRing(activeColor: AppTheme.accent)),
      );
    }

    // Camera step is immersive (no PageHeader); review step keeps the header.
    if (_capturedImage == null) {
      return ScaffoldPage(content: _buildCameraPreview());
    }
    return ScaffoldPage(
      header: PageHeader(
        title: Text('Review ${widget.documentType}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
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
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (d) => _focusOnTap(d, size),
                child: CameraPreview(_cameraController!),
              );
            },
          ),
        ),

        // Landscape ID-shaped guide with dimmed surround.
        Positioned.fill(
          child: IgnorePointer(
            child: CustomPaint(painter: DocumentFramePainter()),
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
                    _glassButton(FluentIcons.chevron_left,
                        onTap: () => Navigator.maybePop(context)),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.white.withValues(alpha: 0.12)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FluentIcons.document,
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
                      _flashOn ? FluentIcons.lightbulb : FluentIcons.lightbulb,
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
                    Icon(FluentIcons.camera, color: Colors.white, size: 16),
                    SizedBox(width: 8),
                    Text('Align document in frame · avoid glare',
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ],
                ),
              ),

              // ── Shutter row ──
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _glassButton(IconData icon,
      {required VoidCallback onTap, bool active = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: active
              ? AppTheme.accent.withValues(alpha: 0.9)
              : Colors.black.withValues(alpha: 0.55),
          border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
        ),
        child: Icon(icon,
            color: active ? Colors.black : Colors.white, size: 20),
      ),
    );
  }

  Widget _buildUploadPreview() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                File(_capturedImage!.path),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),
          
          _buildQualityPanel(),

          if (_isUploading) ...[
            Text(
              'Uploading... ${( _uploadProgress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ProgressBar(
              value: _uploadProgress,
              backgroundColor: Colors.white.withValues(alpha: 0.1),
              activeColor: AppTheme.accent,
              strokeWidth: 8,
            ),
            const SizedBox(height: 24),
          ],

          if (_uploadFailed) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.normal.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.normal.withValues(alpha: 0.5)),
              ),
              child: Column(
                children: [
                  Icon(FluentIcons.error, color: Colors.red.normal, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    'Upload Failed\n$_errorMessage',
                    style: TextStyle(color: Colors.red.normal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],

          Row(
            children: [
              Expanded(
                child: Button(
                  onPressed: _isUploading ? null : _retakeDocument,
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                  ),
                  child: const Text('Retake'),
                ),
              ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: FilledButton(
                    onPressed: (_isUploading ||
                            _analyzing ||
                            _quality == null ||
                            !_quality!.canSubmit)
                        ? null
                        : _uploadDocument,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(_uploadFailed ? Colors.orange.normal : AppTheme.accent),
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
                    ),
                    child: _isUploading
                      ? const SizedBox(height: 20, width: 20, child: ProgressRing(strokeWidth: 2, activeColor: Colors.black))
                      : Text(_uploadFailed ? 'Retry Upload' : 'Upload Document', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
        ],
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
                child: ProgressRing(strokeWidth: 2, activeColor: AppTheme.accent)),
            const SizedBox(width: 12),
            Text('Analyzing image qualityâ€¦',
                style: TextStyle(color: AppTheme.ink)),
          ],
        ),
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
          _qualityRow('Resolution', q.resolutionLabel, q.resolutionOk,
              hardFail: !q.resolutionOk),
          const SizedBox(height: 8),
          _qualityRow('Sharpness', q.sharpnessLabel, q.sharpnessOk),
          const SizedBox(height: 8),
          _qualityRow('Lighting', q.brightnessLabel, q.brightnessOk),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(FluentIcons.fingerprint,
                  size: 14, color: Colors.white.withValues(alpha: 0.5)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'SHA-256: ${q.shortHash}',
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (!q.canSubmit) ...[
            const SizedBox(height: 12),
            Text(
              'Image must be at least ${DocumentQuality.minWidth}px wide. '
              'Please retake.',
              style: TextStyle(
                  color: Colors.red.normal,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }

  Widget _qualityRow(String label, String value, bool ok,
      {bool hardFail = false}) {
    final color = ok
        ? AppTheme.success
        : (hardFail ? AppTheme.error : AppTheme.warn);
    return Row(
      children: [
        Icon(ok ? FluentIcons.completed : FluentIcons.warning,
            color: color, size: 16),
        const SizedBox(width: 10),
        Text('$label: ',
            style: TextStyle(
                color: AppTheme.ink, fontWeight: FontWeight.w600)),
        Expanded(child: Text(value, style: TextStyle(color: color))),
      ],
    );
  }
}

class DocumentFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;

    // The clear frame for the document. ID-1 cards and passport data pages are
    // LANDSCAPE (~1.586:1 wide), so the window must be wider than it is tall.
    const double margin = 24.0;
    final double frameWidth = size.width - (margin * 2);
    final double frameHeight = frameWidth / 1.586;
    final double topOffset = (size.height - frameHeight) / 2;

    final RRect frameRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(margin, topOffset, frameWidth, frameHeight),
      const Radius.circular(16),
    );

    // Draw dark overlay with a cutout
    canvas.saveLayer(Rect.fromLTWH(0, 0, size.width, size.height), Paint());
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    
    final clearPaint = Paint()
      ..blendMode = BlendMode.clear;
    canvas.drawRRect(frameRect, clearPaint);
    canvas.restore();

    // Draw corners
    final cornerPaint = Paint()
      ..color = AppTheme.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    const double cornerLength = 30.0;
    
    // Top-Left
    canvas.drawLine(Offset(margin, topOffset + cornerLength), Offset(margin, topOffset), cornerPaint);
    canvas.drawLine(Offset(margin, topOffset), Offset(margin + cornerLength, topOffset), cornerPaint);

    // Top-Right
    canvas.drawLine(Offset(size.width - margin - cornerLength, topOffset), Offset(size.width - margin, topOffset), cornerPaint);
    canvas.drawLine(Offset(size.width - margin, topOffset), Offset(size.width - margin, topOffset + cornerLength), cornerPaint);

    // Bottom-Left
    canvas.drawLine(Offset(margin, topOffset + frameHeight - cornerLength), Offset(margin, topOffset + frameHeight), cornerPaint);
    canvas.drawLine(Offset(margin, topOffset + frameHeight), Offset(margin + cornerLength, topOffset + frameHeight), cornerPaint);

    // Bottom-Right
    canvas.drawLine(Offset(size.width - margin - cornerLength, topOffset + frameHeight), Offset(size.width - margin, topOffset + frameHeight), cornerPaint);
    canvas.drawLine(Offset(size.width - margin, topOffset + frameHeight), Offset(size.width - margin, topOffset + frameHeight - cornerLength), cornerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
