import 'dart:async';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/face_embedding_service.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';

class VerifyFaceScreen extends StatefulWidget {
  final String verificationType;
  const VerifyFaceScreen({super.key, this.verificationType = 'random_alert'});

  @override
  State<VerifyFaceScreen> createState() => _VerifyFaceScreenState();
}

enum VerifyStep { init, countdown, blink, processing, success, fail }

class _VerifyFaceScreenState extends State<VerifyFaceScreen>
    with TickerProviderStateMixin {
  CameraController? _cam;
  FaceDetector? _det;
  final _enrollService = EnrollmentService();
  final _storage = const FlutterSecureStorage();

  bool _busy = false, _face = false;
  VerifyStep _step = VerifyStep.init;
  int _hold = 0;
  int _countdown = 3;
  Timer? _countdownTimer;
  bool _eyesOpen = false;
  final double _scanPercent = 0;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _initCam();
  }

  Future<void> _initCam({int attempt = 1}) async {
    try {
      debugPrint(
          '🎬 VerifyFaceScreen - Initializing camera (attempt $attempt)...');

      // Pre-load MobileFaceNet asynchronously without blocking camera initialization
      FaceEmbeddingService.initialize().catchError((e, s) {
        debugPrint('⚠️ VerifyFaceScreen - MobileFaceNet pre-load error: $e');
      });

      final cams = await availableCameras();
      if (cams.isEmpty) {
        throw Exception('No cameras found on the device.');
      }

      final front = cams.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cams.first,
      );

      _cam =
          CameraController(front, ResolutionPreset.medium, enableAudio: false);
      await _cam!.initialize();
      debugPrint('🎬 VerifyFaceScreen - Camera initialized successfully.');

      _det = FaceDetector(
          options: FaceDetectorOptions(
              enableClassification: true, enableTracking: true));

      if (mounted) {
        setState(() => _step = VerifyStep.init);
        // Delay starting the image stream until the UI renders CameraPreview
        // to avoid IllegalStateException with surface texture on Android
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await Future.delayed(const Duration(milliseconds: 500));
          if (mounted && _cam != null && _cam!.value.isInitialized) {
            try {
              await _cam!.startImageStream((img) {
                if (_busy || _step.index >= VerifyStep.processing.index) return;
                _busy = true;
                _proc(img).then((_) => _busy = false);
              });
            } catch (streamErr) {
              debugPrint(
                  '⚠️ VerifyFaceScreen - Error starting image stream: $streamErr');
            }
          }
        });
      }
    } catch (e, stack) {
      debugPrint(
          '❌ VerifyFaceScreen - Camera initialization failed (attempt $attempt): $e');
      // Dispose any half-initialised controller so the next attempt starts clean.
      try {
        await _cam?.dispose();
      } catch (_) {}
      _cam = null;
      // On slow-release devices (e.g. MIUI) the camera may still be held by the
      // previous screen for a moment — back off and retry before giving up.
      if (attempt < 3 && mounted) {
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) return _initCam(attempt: attempt + 1);
        return;
      }
      ErrorLogger.log('VerifyFaceScreen - Camera Init', e, stack);
      if (mounted) {
        setState(() {
          _step = VerifyStep.fail;
          _errorMessage = 'Camera init failed: $e';
        });
      }
    }
  }

  Future<void> _proc(CameraImage image) async {
    try {
      final inp = _mkInput(image);
      if (inp == null) return;
      final faces = await _det!.processImage(inp);

      if (faces.isEmpty) {
        if (mounted) {
          setState(() {
            _hold = 0;
            _face = false;
          });
        }
        return;
      }

      final f = faces.first;
      if (mounted) setState(() => _face = true);

      if (_step == VerifyStep.init) {
        setState(() => _step = VerifyStep.countdown);
        _startCountdown();
        return;
      }

      if (_step == VerifyStep.blink) {
        final lo = f.leftEyeOpenProbability, ro = f.rightEyeOpenProbability;
        if (lo != null && ro != null) {
          if (!_eyesOpen && lo > 0.7 && ro > 0.7) {
            _eyesOpen = true;
          } else if (_eyesOpen && lo < 0.4 && ro < 0.4) {
            _hold++;
            if (_hold >= 1) _verify();
          }
        }
      }
    } catch (_) {}
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _countdownTimer?.cancel();
          _step = VerifyStep.blink;
        }
      });
    });
  }

  Future<void> _verify() async {
    setState(() => _step = VerifyStep.processing);
    try {
      final workerId = await _storage.read(key: 'worker_id');
      if (workerId == null) throw 'Worker ID not found';

      await _cam!.stopImageStream();
      final p = await _cam!.takePicture();
      final e = await FaceEmbeddingService.extractEmbedding(p.path);

      // Initialize real gRPC service
      final grpcService = CypurgeGrpcService();
      grpcService.init(useGateway: true);

      final token = await _enrollService.getValidAccessToken();
      if (token == null) throw 'Not authenticated';

      // Call real SearchCollisions on BiometricService via Gateway
      final response = await grpcService.searchCollisions(
        token: token,
        embedding: e,
      );

      // Verify if the live face embedding matches the current worker's ID in database
      final match = response.results.any((r) => r.workerId == workerId);
      debugPrint(
          '🤖 Real Biometric Match result: $match (results count: ${response.results.length})');

      // Log verification outcome locally/audit
      await _enrollService.logVerification(
        type: widget.verificationType,
        status: match ? 'success' : 'failed',
        score: match ? 1.0 : 0.0,
        lat: 0.0,
        lon: 0.0,
      );

      if (mounted) {
        setState(() {
          _step = match ? VerifyStep.success : VerifyStep.fail;
          _errorMessage = match ? '' : 'Identity not verified (Face mismatch)';
        });
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Navigator.pop(context, match);
      }
    } catch (e, stack) {
      ErrorLogger.log('Verify Face Screen - Biometric Verification', e, stack);
      if (mounted) {
        setState(() {
          _step = VerifyStep.fail;
          _errorMessage = 'Verification Error: $e';
        });
      }
    }
  }

  InputImage? _mkInput(CameraImage i) {
    try {
      final s = _cam!.description.sensorOrientation;
      final r = {
        0: InputImageRotation.rotation0deg,
        90: InputImageRotation.rotation90deg,
        180: InputImageRotation.rotation180deg,
        270: InputImageRotation.rotation270deg
      }[s];
      final f = InputImageFormatValue.fromRawValue(i.format.raw);
      if (r == null || f == null) return null;
      return InputImage.fromBytes(
          bytes: i.planes.first.bytes,
          metadata: InputImageMetadata(
              size: Size(i.width.toDouble(), i.height.toDouble()),
              rotation: r,
              format: f,
              bytesPerRow: i.planes.first.bytesPerRow));
    } catch (_) {
      return null;
    }
  }

  @override
  void dispose() {
    _cam?.dispose();
    _det?.close();
    _countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Stack(
        children: [
          if (_cam != null && _cam!.value.isInitialized)
            Positioned.fill(child: CameraPreview(_cam!)),
          _buildOverlay(),
          Positioned(
            top: 20,
            left: 20,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(FluentIcons.chrome_back,
                    color: Colors.white, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Column(
              children: [
                const Text(
                  'SECURITY CHECK',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                const SizedBox(height: 12),
                Text(
                  _getStepTitle(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                if (_errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.red.normal.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _errorMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (_step == VerifyStep.countdown)
            Center(
                child: Text('$_countdown',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  String _getStepTitle() {
    switch (_step) {
      case VerifyStep.init:
        return 'Prepare for Scan';
      case VerifyStep.countdown:
        return 'Hold Still';
      case VerifyStep.blink:
        return 'Blink your eyes';
      case VerifyStep.processing:
        return 'Verifying...';
      case VerifyStep.success:
        return 'Verified';
      case VerifyStep.fail:
        return 'Failed';
    }
  }

  Widget _buildOverlay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
      ),
      child: Center(
        child: Container(
          width: 250,
          height: 350,
          decoration: BoxDecoration(
            border: Border.all(
              color: _getBorderColor(),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }

  Color _getBorderColor() {
    if (_step == VerifyStep.success) return const Color(0xFF4CAF50);
    if (_step == VerifyStep.fail) return Colors.red.normal;
    return _face
        ? const Color(0xFF4CAF50).withValues(alpha: 0.5)
        : Colors.white.withValues(alpha: 0.24);
  }
}
