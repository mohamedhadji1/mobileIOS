import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/face_embedding_service.dart';
import '../services/device_identity_service.dart';
import '../services/background_signal_service.dart';
import '../generated/worker/v1/worker.pbenum.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';
import '../theme/app_theme.dart';

class FaceLivenessScreen extends StatefulWidget {
  final bool fullLiveness;
  final String userId;
  const FaceLivenessScreen({super.key, this.fullLiveness = true, required this.userId});
  @override
  State<FaceLivenessScreen> createState() => _FaceLivenessScreenState();
}

enum Step { init, countdown, straight, left, right, blink, finalizing, processing, success, fail }

class _FaceLivenessScreenState extends State<FaceLivenessScreen> with TickerProviderStateMixin {
  CameraController? _cam;
  FaceDetector? _det;
  final GlobalKey _previewKey = GlobalKey();
  bool _busy = false, _face = false;
  Step _step = Step.init;
  int _hold = 0;
  int _countdown = 3;
  Timer? _countdownTimer;
  bool _eyesOpen = false;
  double _scanPercent = 0;
  String _customError = '';
  
  final List<Uint8List> _capturedFrames = [];
  final List<({String step, int timestamp, double confidence})> _gestureMetadata = [];

  late AnimationController _scanAnim, _pulseAnim, _resultAnim, _cornerAnim;

  static final _green = AppTheme.success;
  static const _greenDark = Color(0xFF16A34A);
  static const _greenGlow = Color(0xFF4ADE80);
  // Camera scrim: deep harbor navy (not black) for legibility over the live preview.
  static const _bg = Color(0xFF06141F);

  @override
  void initState() {
    super.initState();
    _checkUserId();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    _scanAnim = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
    _pulseAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))..repeat(reverse: true);
    _resultAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _cornerAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500))..repeat(reverse: true);
    _initCam();
  }

  String _currentUserId = '';
  String _tenantId = 'cypurge';

  Future<void> _checkUserId() async {
    const storage = FlutterSecureStorage();
    final storedTenant = await storage.read(key: 'tenant_id');
    if (storedTenant != null && storedTenant.isNotEmpty) {
      _tenantId = storedTenant;
    }

    if (widget.userId != 'temp-enroll' && widget.userId.isNotEmpty) {
      _currentUserId = widget.userId;
      return;
    }
    final storedId = await storage.read(key: 'cypurge_user_id');
    if (mounted) {
      setState(() {
        _currentUserId = storedId ?? widget.userId;
      });
    }
  }

  Future<void> _initCam() async {
    FaceEmbeddingService.initialize();
    final cams = await availableCameras();
    final front = cams.firstWhere((c) => c.lensDirection == CameraLensDirection.front, orElse: () => cams.first);
    _cam = CameraController(
      front, 
      ResolutionPreset.high, 
      enableAudio: false, 
      imageFormatGroup: ImageFormatGroup.nv21,
    );

    try {
      await _cam!.initialize();
      if (_cam!.value.isInitialized) {
        await _cam!.setFocusMode(FocusMode.auto);
        await _cam!.setExposureMode(ExposureMode.auto);
      }
    } catch (e, stack) {
      ErrorLogger.log('Face Liveness Screen - Camera Initialization', e, stack);
    }
    _det = FaceDetector(options: FaceDetectorOptions(enableClassification: true, enableTracking: true, performanceMode: FaceDetectorMode.fast));
    if (mounted) {
      setState(() => _step = Step.init);
      _cornerAnim.forward();
      _cam!.startImageStream((img) {
        if (_busy || _step.index >= Step.processing.index) return;
        _busy = true;
        _proc(img).then((_) => _busy = false);
      });
    }
  }

  Future<void> _proc(CameraImage image) async {
    try {
      final inp = _mkInput(image);
      if (inp == null) return;
      final faces = await _det!.processImage(inp);
      if (faces.isEmpty) { if (mounted) setState(() { _hold = 0; _face = false; }); return; }
      if (faces.length > 1) { if (mounted) setState(() { _face = true; _hold = 0; }); return; }
      final f = faces.first;
      final hy = f.headEulerAngleY;
      if (hy == null) return;

      if (_step == Step.init) {
        setState(() => _step = Step.countdown);
        _startCountdown();
        return;
      }
      if (_step == Step.countdown) {
        if (mounted) setState(() => _face = true);
        return;
      }

      if (mounted) setState(() => _face = true);
      final lo = f.leftEyeOpenProbability, ro = f.rightEyeOpenProbability;
      switch (_step) {
        case Step.straight:
          if (hy.abs() < 10) { _hold++; if (_hold >= 8) _next(); } else {
            _hold = 0;
          }
        case Step.left:
          if (hy > 25) { _hold++; if (_hold >= 8) _next(); } else {
            _hold = 0;
          }
        case Step.right:
          if (hy < -25) { _hold++; if (_hold >= 8) _next(); } else {
            _hold = 0;
          }
        case Step.blink:
          if (lo != null && ro != null) {
            if (!_eyesOpen && lo > 0.7 && ro > 0.7) { _eyesOpen = true; _hold = 0; }
            else if (_eyesOpen && lo < 0.45 && ro < 0.45) { _hold++; if (_hold >= 1) _next(); }
            else if (_eyesOpen && lo > 0.7 && ro > 0.7) _hold = 0;
          }
        case Step.finalizing:
          if (hy.abs() < 10) { _hold++; if (_hold >= 5) _next(); } else {
            _hold = 0;
          }
        default: break;
      }
      // Update scan percent
      if (mounted) {
        final totalSteps = widget.fullLiveness ? 4.0 : 1.0;
        final currentStep = {Step.straight: 0, Step.left: 1, Step.right: 2, Step.blink: 3}[_step] ?? 0;
        final stepProgress = _hold / 8.0;
        setState(() => _scanPercent = ((currentStep + stepProgress) / totalSteps * 100).clamp(0, 99));
      }
    } catch (e, stack) {
      ErrorLogger.log('Face Liveness Screen - Frame Processing', e, stack);
    }
  }

  Future<void> _captureFrame(Step step) async {
    try {
      _gestureMetadata.add((
        step: step.name,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        confidence: 1.0,
      ));
      
      final boundary = _previewKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 1.0);
        final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          _capturedFrames.add(byteData.buffer.asUint8List());
        }
      }
    } catch (e, stack) {
      ErrorLogger.log('Face Liveness Screen - Widget Frame Capture', e, stack);
    }
  }

  void _startCountdown() {
    _countdownTimer?.cancel();
    setState(() => _countdown = 3);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _countdownTimer?.cancel();
          _step = Step.straight;
        }
      });
    });
  }

  void _next() {
    _hold = 0;
    setState(() {
      final prevStep = _step;
      switch (_step) {
        case Step.straight:
          _step = widget.fullLiveness ? Step.left : Step.processing;
          unawaited(_captureFrame(prevStep)); // Non-blocking
          if (!widget.fullLiveness) { _scanPercent = 80; _verify(); }
        case Step.left: 
          _step = Step.right;
          unawaited(_captureFrame(prevStep)); // Non-blocking
        case Step.right: 
          _step = Step.blink;
          unawaited(_captureFrame(prevStep)); // Non-blocking
        case Step.blink: 
          _step = Step.finalizing;
          unawaited(_captureFrame(prevStep)); // Non-blocking
        case Step.finalizing: 
          _step = Step.processing; 
          _scanPercent = 90; 
          _enroll();
        default: break;
      }
    });
  }

  Future<void> _enroll() async {
    try {
      await _cam!.stopImageStream();
      await Future.delayed(const Duration(milliseconds: 250));
      final p = await _cam!.takePicture();
      final e = await FaceEmbeddingService.extractEmbedding(p.path);
      
      setState(() => _step = Step.processing);

      final service = CypurgeGrpcService();
      service.init(useGateway: true);

      const storage = FlutterSecureStorage();
      String? token = await EnrollmentService().getValidAccessToken();
      String? workerId = await storage.read(key: 'worker_id');

      // Fallback to direct password grant if token is missing
      if (token == null) {
        debugPrint('ðŸ”‘ Access token not found in secure storage. Performing direct login fallback...');
        token = await service.loginDirect(
          username: 'testuser',
          password: 'password123',
        );
      }

      // Resolve the worker_id if not stored. EnrollWorker is idempotent on the
      // keycloak identity (it returns the existing worker if already enrolled),
      // and crucially it returns the id that lives in the worker-service table —
      // the one RegisterDevice and document upload query. SyncUser's user_id is
      // the app_users id and is NOT valid there.
      // Always resolve through EnrollWorker (idempotent). This self-heals any
      // stale worker_id previously cached from SyncUser's app_users id, and
      // guarantees the stored id exists in the worker-service table that
      // RegisterDevice + document upload query.
      debugPrint('👤 Syncing + enrolling worker (idempotent)...');
      await service.syncUser(token: token);
      final workerRes = await service.enrollWorker(
        token: token,
        tenantId: _tenantId,
        surname: 'Hadji',
        givenNames: 'Mohamed',
        nationality: 'Algerian',
        profileType: ProfileType.PROFILE_TYPE_PERMANENT,
      );
      workerId = workerRes.workerId;
      await storage.write(key: 'worker_id', value: workerId);

      // Call the biometric service face enrollment
      final enrollHash = service.computeEmbeddingHash(e);

      // â”€â”€ Check if face already exists (duplicate prevention) â”€â”€
      debugPrint('ðŸ” Duplication check: searching collisions for new face hash...');
      final collisionRes = await service.searchCollisionsByHash(
        token: token,
        embeddingHash: enrollHash,
      );

      bool alreadyExists = false;
      for (var match in collisionRes.results) {
        if (match.workerId.isNotEmpty) {
          alreadyExists = true;
          break;
        }
      }

      if (alreadyExists) {
        throw 'ALREADY_EXISTS: This face is already registered in the system.';
      }

      await service.enrollFace(
        token: token,
        workerId: workerId,
        tenantId: _tenantId,
        embedding: e,
      );

      // Persist the enrollment vector + hash on-device so re-verify can run
      // an on-device cosine match against this exact enrollment.
      await storage.write(
        key: 'enrollment_embedding_vector',
        value: jsonEncode(e),
      );
      await storage.write(key: 'enrollment_embedding_hash', value: enrollHash);
      await storage.write(key: 'cypurge_enrolled', value: 'true');
      debugPrint('Face enrollment stored (backend + on-device vector).');

      // Bind this device (P-256 public key) to the worker on the backend so it
      // is registered against him. Non-fatal: enrollment still succeeds if the
      // device-binding call fails (e.g. offline) — it can be retried later.
      final bound = await DeviceIdentityService().registerDevice(workerId);
      debugPrint(bound
          ? 'Device bound to worker on backend.'
          : 'Device binding deferred (register failed).');

      // Fire one telemetry batch right after binding so the worker's device
      // signals land in device_signal_batches immediately (the WorkManager
      // poll is 15-min and only the realtime monitor fires on radio changes).
      if (bound) {
        unawaited(BackgroundSignalService().collectAndSendTelemetry());
      }

      if (mounted) {
        setState(() {
          _step = Step.success;
          _customError = '';
          _scanPercent = 100;
          _resultAnim.forward();
        });
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) {
          Navigator.pop(context, true);
        }
      }
    } catch (e, stack) {
      ErrorLogger.log('Biometric Face Enrollment Process', e, stack);
      debugPrint('Biometric Enrollment Error: $e');
      if (mounted) {
        setState(() {
          _step = Step.fail;
          _customError = e.toString().contains('already exists') || e.toString().contains('ALREADY_EXISTS')
              ? 'This face is already registered'
              : 'An error occurred during enrollment';
          _scanPercent = 0;
          _resultAnim.forward();
        });
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Navigator.pop(context, false);
      }
    }
  }

  /// Computes the cosine similarity between two face embedding vectors.
  /// Returns a value in [-1, 1] where 1 = identical, 0 = unrelated.
  /// A threshold of 0.50 works well for 192-dim MobileFaceNet embeddings.
  double _cosineSimilarity(List<double> a, List<double> b) {
    double dot = 0, normA = 0, normB = 0;
    final len = min(a.length, b.length);
    for (int i = 0; i < len; i++) {
      dot += a[i] * b[i];
      normA += a[i] * a[i];
      normB += b[i] * b[i];
    }
    if (normA == 0 || normB == 0) return 0;
    return dot / (sqrt(normA) * sqrt(normB));
  }

  Future<void> _verify() async {
    try {
      debugPrint('Attempting verification for UserID: ${widget.userId}');
      if (_cam == null || !_cam!.value.isInitialized) return;
      
      await _cam!.stopImageStream();
      await Future.delayed(const Duration(milliseconds: 300));
      
      final p = await _cam!.takePicture();
      final e = await FaceEmbeddingService.extractEmbedding(p.path);

      setState(() => _step = Step.processing);

      final service = CypurgeGrpcService();
      service.init(useGateway: true);

      String? token = await EnrollmentService().getValidAccessToken();

      if (token == null) {
        debugPrint('ðŸ”‘ Access token not found in secure storage. Performing direct login fallback...');
        token = await service.loginDirect(
          username: 'testuser',
          password: 'password123',
        );
      }

      // â”€â”€ Step 1: On-device cosine similarity check â”€â”€
      // Load the stored 192-dim enrollment vector and compare against the
      // live capture. Reject immediately if similarity is below threshold.
      // This prevents any other face from using the stored hash.
      const storage = FlutterSecureStorage();
      final storedVectorJson = await storage.read(key: 'enrollment_embedding_vector');
      if (storedVectorJson == null || storedVectorJson.isEmpty) {
        throw Exception('No face enrollment found on this device. Please enroll first.');
      }
      final storedVector = (jsonDecode(storedVectorJson) as List).map((v) => (v as num).toDouble()).toList();
      final similarity = _cosineSimilarity(e, storedVector);
      debugPrint('ðŸŽ¯ Face similarity score: ${similarity.toStringAsFixed(4)} (threshold: 0.50)');

      if (similarity < 0.50) {
        debugPrint('âŒ Face mismatch â€” similarity $similarity below threshold.');
        if (mounted) {
          setState(() {
            _step = Step.fail;
            _customError = 'Face not recognized. Similarity: ${(similarity * 100).toStringAsFixed(1)}%';
            _scanPercent = 0;
            _resultAnim.forward();
          });
          await Future.delayed(const Duration(seconds: 2));
          if (mounted) Navigator.pop(context, false);
        }
        return;
      }

      // â”€â”€ Step 2: Backend identity lookup with stored hash â”€â”€
      // Only reached if on-device similarity check passed.
      final storedHash = await storage.read(key: 'enrollment_embedding_hash');
      if (storedHash == null || storedHash.isEmpty) {
        throw Exception('No enrollment hash found. Please re-enroll your face.');
      }

      final collisionRes = await service.searchCollisionsByHash(
        token: token,
        embeddingHash: storedHash,
      );

      bool isMatch = false;
      String? matchedWorkerId;
      for (var match in collisionRes.results) {
        // Backend returns 'WORKER' label (not 'ACTIVE_WORKER')
        if (match.workerId.isNotEmpty) {
          isMatch = true;
          matchedWorkerId = match.workerId;
          debugPrint('âœ… Identity confirmed. Label=${match.label}, WorkerID=${match.workerId}');
          break;
        }
      }

      if (isMatch && matchedWorkerId != null) {
        const storage = FlutterSecureStorage();
        await storage.write(key: 'worker_id', value: matchedWorkerId);
        await storage.write(key: 'cypurge_user_id', value: matchedWorkerId);
        await storage.write(key: 'cypurge_enrolled', value: 'true');
        debugPrint('âœ… Restored worker session for ID: $matchedWorkerId');
      }

      if (mounted) {
        setState(() {
          _step = isMatch ? Step.success : Step.fail;
          _customError = isMatch ? '' : 'Identity not recognized or blocked.';
          _scanPercent = isMatch ? 100 : 0;
          _resultAnim.forward();
        });
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) Navigator.pop(context, isMatch);
      }
    } catch (e, stack) {
      ErrorLogger.log('Biometric Face Verification Process', e, stack);
      debugPrint('Verification error: $e');
      if (mounted) {
        // Surface the real reason (e.g. "No face enrollment foundâ€¦") instead of
        // a generic "Connection failed", so the worker knows what to do next.
        final message = e.toString().replaceAll('Exception: ', '').trim();
        setState(() {
          _step = Step.fail;
          _customError = message.isEmpty ? 'Verification failed' : message;
          _scanPercent = 0;
          _resultAnim.forward();
        });
        await Future.delayed(const Duration(seconds: 3));
        if (mounted) Navigator.pop(context, false);
      }
    }
  }

  InputImage? _mkInput(CameraImage i) {
    try {
      final s = _cam!.description.sensorOrientation;
      final r = {0: InputImageRotation.rotation0deg, 90: InputImageRotation.rotation90deg, 180: InputImageRotation.rotation180deg, 270: InputImageRotation.rotation270deg}[s];
      final f = InputImageFormatValue.fromRawValue(i.format.raw);
      if (r == null || f == null) return null;
      return InputImage.fromBytes(bytes: i.planes.first.bytes, metadata: InputImageMetadata(
        size: Size(i.width.toDouble(), i.height.toDouble()), rotation: r, format: f, bytesPerRow: i.planes.first.bytesPerRow));
    } catch (_) { return null; }
  }

  bool get _active => _step.index >= Step.straight.index && _step.index <= Step.blink.index;

  @override
  void dispose() {
    _cam?.stopImageStream().catchError((_) {});
    _cam?.dispose(); _det?.close();
    for (final c in [_scanAnim, _pulseAnim, _resultAnim, _cornerAnim]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    final h = mq.size.height;
    final faceY = h * 0.38;
    final faceR = w * 0.32;

    return ScaffoldPage(
      content: Stack(children: [
      // â”€â”€â”€ CAMERA â”€â”€â”€
      if (_cam != null && _cam!.value.isInitialized)
        Positioned.fill(child: RepaintBoundary(
          key: _previewKey,
          child: FittedBox(fit: BoxFit.cover, child: SizedBox(
            width: _cam!.value.previewSize!.height, height: _cam!.value.previewSize!.width,
            child: CameraPreview(_cam!))))),

      // â”€â”€â”€ COUNTDOWN OVERLAY â”€â”€â”€
      if (_step == Step.countdown)
        Positioned.fill(child: Container(
          color: const Color(0x73000000),
          child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text('Position your face', style: TextStyle(color: Color(0xB3FFFFFF), fontSize: 16)),
            const SizedBox(height: 10),
            Text('$_countdown', style: const TextStyle(color: Colors.white, fontSize: 80, fontWeight: FontWeight.bold)),
          ])))),
      Positioned.fill(child: AnimatedBuilder(
        animation: Listenable.merge([_scanAnim, _pulseAnim, _cornerAnim]),
        builder: (_, __) => CustomPaint(painter: _FramePainter(
          center: Offset(w / 2, faceY),
          radius: faceR,
          cornerProgress: _cornerAnim.value,
          scanAngle: _scanAnim.value * 2 * pi,
          pulse: _pulseAnim.value,
          faceDetected: _face,
          state: _step,
        )),
      )),

      // â”€â”€â”€ RESULT ICON â”€â”€â”€
      if (_step == Step.success)
        Positioned(left: w / 2 - 44, top: faceY - 44, child: ScaleTransition(
          scale: CurvedAnimation(parent: _resultAnim, curve: Curves.elasticOut),
          child: Container(width: 88, height: 88,
            decoration: BoxDecoration(shape: BoxShape.circle, color: _green,
              boxShadow: [BoxShadow(color: _green.withValues(alpha: 0.5), blurRadius: 40, spreadRadius: 8)]),
            child: const Icon(FluentIcons.check_mark, color: Colors.white, size: 48)))),

      if (_step == Step.fail)
        Positioned(left: w / 2 - 44, top: faceY - 44, child: ScaleTransition(
          scale: CurvedAnimation(parent: _resultAnim, curve: Curves.elasticOut),
          child: Container(width: 88, height: 88,
            decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.error,
              boxShadow: [BoxShadow(color: AppTheme.error.withValues(alpha: 0.5), blurRadius: 40, spreadRadius: 8)]),
            child: const Icon(FluentIcons.clear, color: Colors.white, size: 48)))),

      if (_step == Step.processing)
        Positioned(left: w / 2 - 28, top: faceY - 28, child: SizedBox(width: 56, height: 56,
          child: ProgressRing(strokeWidth: 2.5, activeColor: _green.withValues(alpha: 0.8)))),

      // â”€â”€â”€ TOP SECTION â”€â”€â”€
      Positioned(top: 0, left: 0, right: 0, child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [_bg, _bg.withValues(alpha: 0.8), const Color(0x00000000)])),
        child: SafeArea(bottom: false, child: Padding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              GestureDetector(onTap: () => Navigator.pop(context, false),
                child: Container(padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withValues(alpha: 0.06)),
                  child: Icon(FluentIcons.chevron_left, color: Colors.white.withValues(alpha: 0.54), size: 18))),
              const Spacer(),
              if (_active) Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  color: _face ? _green.withValues(alpha: 0.12) : Colors.white.withValues(alpha: 0.06)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 6, height: 6, decoration: BoxDecoration(shape: BoxShape.circle,
                    color: _face ? _green : Colors.white.withValues(alpha: 0.24),
                    boxShadow: _face ? [BoxShadow(color: _green.withValues(alpha: 0.6), blurRadius: 6)] : [])),
                  const SizedBox(width: 6),
                  Text(_face ? 'Detected' : 'Searching', style: TextStyle(fontSize: 11,
                    color: _face ? _green : const Color(0x4DFFFFFF), fontWeight: FontWeight.w500)),
                ])),
            ]),
            const SizedBox(height: 20),
            AnimatedSwitcher(duration: const Duration(milliseconds: 300),
              child: Text(_stepTitle, key: ValueKey('t$_step'),
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: -0.5, height: 1.1))),
            const SizedBox(height: 6),
            AnimatedSwitcher(duration: const Duration(milliseconds: 300),
              child: Text(_stepSub, key: ValueKey('s$_step'), textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white.withValues(alpha: 0.4), height: 1.4))),
          ]))))),

      // â”€â”€â”€ BOTTOM SECTION â”€â”€â”€
      Positioned(bottom: 0, left: 0, right: 0, child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [const Color(0x00000000), _bg.withValues(alpha: 0.85), _bg])),
        child: SafeArea(top: false, child: Padding(padding: const EdgeInsets.fromLTRB(28, 50, 28, 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // Step indicators
            if (widget.fullLiveness && _active) ...[
              _buildSteps(),
              const SizedBox(height: 24),
            ],
            // Progress bar + percentage
            _buildProgressBar(),
            const SizedBox(height: 12),
          ]))))),
    ]));
  }

  String get _stepTitle => {
    Step.init: 'Setting up...',
    Step.straight: 'Face recognition',
    Step.left: 'Turn left',
    Step.right: 'Turn right',
    Step.blink: 'Blink your eyes',
    Step.finalizing: 'Finalizing...',
    Step.processing: 'Hold still, processing',
    Step.success: 'Scan completed',
    Step.fail: 'Not recognized',
  }[_step] ?? '';

  String get _stepSub => {
    Step.straight: 'Position your face within the frame',
    Step.left: 'Slowly turn your head to the left',
    Step.right: 'Slowly turn your head to the right',
    Step.blink: 'Close both eyes briefly, then open',
    Step.finalizing: 'Look straight at the camera to finish',
    Step.processing: 'Take a clear photo of the front of your face',
    Step.success: 'Thanks for your effort, we\'ll get back to you soon',
    Step.fail: _customError.isNotEmpty ? _customError : 'Face does not match. Please try again.',
  }[_step] ?? '';

  Widget _buildSteps() {
    final labels = ['Straight', 'Left', 'Right', 'Blink'];
    final icons = [FluentIcons.contact, FluentIcons.chevron_left, FluentIcons.chevron_right, FluentIcons.view];
    final cur = {Step.straight: 0, Step.left: 1, Step.right: 2, Step.blink: 3}[_step] ?? 0;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(4, (i) {
      final done = i < cur;
      final active = i == cur;
      return Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child:
        AnimatedContainer(duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: done ? _green.withValues(alpha: 0.12) : active ? Colors.white.withValues(alpha: 0.08) : const Color(0x00000000),
            border: Border.all(color: done ? _green.withValues(alpha: 0.3) : active ? Colors.white.withValues(alpha: 0.1) : const Color(0x00000000))),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(done ? FluentIcons.check_mark : icons[i], size: 14,
              color: done ? _green : active ? const Color(0xB3FFFFFF) : Colors.white.withValues(alpha: 0.2)),
            const SizedBox(width: 4),
            Text(labels[i], style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,
              color: done ? _green : active ? Colors.white.withValues(alpha: 0.6) : Colors.white.withValues(alpha: 0.2))),
          ])));
    }));
  }

  Widget _buildProgressBar() {
    final isSuccess = _step == Step.success;
    final isFail = _step == Step.fail;
    final barColor = isFail ? AppTheme.error : _green;
    return Column(children: [
      Row(children: [
        Text('${_scanPercent.toInt()}%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
          color: isSuccess ? _green : isFail ? AppTheme.error : Colors.white)),
        const SizedBox(width: 6),
        Text(isSuccess ? 'recognised' : isFail ? 'failed' : 'recognised',
          style: TextStyle(fontSize: 13, color: Colors.white.withValues(alpha: 0.3))),
        const Spacer(),
        if (_step == Step.processing)
          SizedBox(width: 14, height: 14, child: ProgressRing(
            strokeWidth: 1.5, activeColor: Colors.white.withValues(alpha: 0.3))),
      ]),
      const SizedBox(height: 8),
      ClipRRect(borderRadius: BorderRadius.circular(4),
        child: SizedBox(height: 6,
          child: Stack(children: [
            Container(decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.06))),
            AnimatedFractionallySizedBox(
              duration: const Duration(milliseconds: 500), curve: Curves.easeOut,
              widthFactor: (_scanPercent / 100).clamp(0, 1),
              child: Container(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: LinearGradient(colors: [barColor.withValues(alpha: 0.7), barColor]),
                boxShadow: [BoxShadow(color: barColor.withValues(alpha: 0.4), blurRadius: 8)]))),
          ]))),
    ]);
  }
}

// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
//  CUSTOM PAINTER â€” GREEN CORNER FRAME + GLOW
// â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

class _FramePainter extends CustomPainter {
  final Offset center;
  final double radius, cornerProgress, scanAngle, pulse;
  final bool faceDetected;
  final Step state;

  _FramePainter({required this.center, required this.radius, required this.cornerProgress,
    required this.scanAngle, required this.pulse, required this.faceDetected, required this.state});

  static final _green = AppTheme.success;

  @override
  void paint(Canvas canvas, Size size) {
    final isEnd = state == Step.success || state == Step.fail || state == Step.processing;
    final accent = state == Step.success ? _green : state == Step.fail ? AppTheme.error : _green;

    // â”€â”€ Dark overlay with rounded-rect cutout â”€â”€
    final frameW = radius * 2;
    final frameH = radius * 2.4;
    final frameRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: frameW, height: frameH),
      const Radius.circular(24));
    canvas.drawPath(
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
        ..addRRect(frameRect)..fillType = PathFillType.evenOdd,
      Paint()..color = const Color(0xFF0C0C0F).withValues(alpha: 0.7));

    // â”€â”€ Green glow behind face area â”€â”€
    if (faceDetected && !isEnd) {
      final glowOp = 0.06 + pulse * 0.06;
      canvas.drawRRect(frameRect.inflate(10), Paint()
        ..color = accent.withValues(alpha: glowOp)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20));
    }

    // â”€â”€ Corner brackets â”€â”€
    final cLen = 28.0 * cornerProgress;
    const cR = 10.0;
    final rect = frameRect.outerRect;
    final opacity = faceDetected ? 0.9 : 0.3;
    final cPaint = Paint()..color = accent.withValues(alpha: opacity)
      ..style = PaintingStyle.stroke..strokeWidth = 3.0..strokeCap = StrokeCap.round;

    // Top-left
    canvas.drawPath(Path()..moveTo(rect.left, rect.top + cLen + cR)
      ..lineTo(rect.left, rect.top + cR)..arcToPoint(Offset(rect.left + cR, rect.top), radius: const Radius.circular(cR))
      ..lineTo(rect.left + cLen + cR, rect.top), cPaint);
    // Top-right
    canvas.drawPath(Path()..moveTo(rect.right, rect.top + cLen + cR)
      ..lineTo(rect.right, rect.top + cR)..arcToPoint(Offset(rect.right - cR, rect.top), radius: const Radius.circular(cR), clockwise: false)
      ..lineTo(rect.right - cLen - cR, rect.top), cPaint);
    // Bottom-left
    canvas.drawPath(Path()..moveTo(rect.left, rect.bottom - cLen - cR)
      ..lineTo(rect.left, rect.bottom - cR)..arcToPoint(Offset(rect.left + cR, rect.bottom), radius: const Radius.circular(cR), clockwise: false)
      ..lineTo(rect.left + cLen + cR, rect.bottom), cPaint);
    // Bottom-right
    canvas.drawPath(Path()..moveTo(rect.right, rect.bottom - cLen - cR)
      ..lineTo(rect.right, rect.bottom - cR)..arcToPoint(Offset(rect.right - cR, rect.bottom), radius: const Radius.circular(cR))
      ..lineTo(rect.right - cLen - cR, rect.bottom), cPaint);

    if (isEnd) return;

    // â”€â”€ Scanning line (horizontal sweep) â”€â”€
    if (faceDetected) {
      final scanY = rect.top + 20 + (rect.height - 40) * ((sin(scanAngle) + 1) / 2);
      final gradient = LinearGradient(colors: [
        accent.withValues(alpha: 0), accent.withValues(alpha: 0.4), accent.withValues(alpha: 0),
      ]);
      canvas.drawLine(
        Offset(rect.left + 12, scanY), Offset(rect.right - 12, scanY),
        Paint()..shader = gradient.createShader(Rect.fromLTWH(rect.left, scanY - 1, rect.width, 2))
          ..strokeWidth = 1.5..strokeCap = StrokeCap.round);

      // Scanning line glow
      canvas.drawLine(
        Offset(rect.left + 12, scanY), Offset(rect.right - 12, scanY),
        Paint()..shader = gradient.createShader(Rect.fromLTWH(rect.left, scanY - 4, rect.width, 8))
          ..strokeWidth = 6..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6));
    }

    // â”€â”€ Subtle grid dots â”€â”€
    if (faceDetected) {
      final dotPaint = Paint()..color = accent.withValues(alpha: 0.08 + pulse * 0.06);
      for (double dx = rect.left + 20; dx < rect.right - 10; dx += 20) {
        for (double dy = rect.top + 20; dy < rect.bottom - 10; dy += 20) {
          canvas.drawCircle(Offset(dx, dy), 0.8, dotPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _FramePainter old) => true;
}

class AnimatedFractionallySizedBox extends ImplicitlyAnimatedWidget {
  final double widthFactor;
  final Widget child;
  const AnimatedFractionallySizedBox({super.key, required this.widthFactor, required this.child,
    required super.duration, super.curve});
  @override
  AnimatedWidgetBaseState<AnimatedFractionallySizedBox> createState() => _AnimFracState();
}

class _AnimFracState extends AnimatedWidgetBaseState<AnimatedFractionallySizedBox> {
  Tween<double>? _wf;
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _wf = visitor(_wf, widget.widthFactor, (v) => Tween<double>(begin: v as double)) as Tween<double>?;
  }
  @override
  Widget build(BuildContext context) => FractionallySizedBox(
    alignment: Alignment.centerLeft, widthFactor: _wf?.evaluate(animation) ?? 0, child: widget.child);
}
