import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart' show GrpcError;
import 'package:permission_handler/permission_handler.dart'
    show Permission, PermissionActions, PermissionStatusGetters;
import '../services/device_identity_service.dart';
import '../services/background_signal_service.dart';
import '../generated/biometric/v1/biometric.pb.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';
import '../utils/error_humanizer.dart';
import '../utils/haptics.dart';
import '../utils/liveness_camera.dart';
import '../utils/liveness_debug_report.dart';
import '../utils/profile_photo.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'debug_report_screen.dart';

class FaceLivenessScreen extends StatefulWidget {
  final bool fullLiveness;
  final String userId;
  const FaceLivenessScreen(
      {super.key, this.fullLiveness = true, required this.userId});
  @override
  State<FaceLivenessScreen> createState() => _FaceLivenessScreenState();
}

enum Step { init, countdown, challenge, finalizing, processing, success, fail }

String swapTurnDirection(String s) {
  final isTurnStep =
      RegExp(r'\b(turn|head)\b', caseSensitive: false).hasMatch(s);
  if (!isTurnStep) return s;

  return s.replaceAllMapped(
    RegExp(r'\b(left|right)\b', caseSensitive: false),
    (m) {
      final word = m[1]!;
      final swapped = word.toLowerCase() == 'left' ? 'right' : 'left';
      if (word == word.toUpperCase()) return swapped.toUpperCase();
      if (word[0] == word[0].toUpperCase()) {
        return swapped[0].toUpperCase() + swapped.substring(1);
      }
      return swapped;
    },
  );
}

/// How to do a gesture so M5 actually sees it, or null when the headline says
/// enough. M5 checks what is visible, not intent: a wink leaves both eyes in
/// view (cover_eye needs one hidden for 0.8s), and its hand counter reads skin
/// shapes, so fingers held over the face merge into it and closed fingers read
/// as one blob (SEQUENTIAL_LIVENESS §5).
String? gestureTip(String instruction) {
  final s = instruction.toLowerCase();
  if (s.contains('finger')) {
    return 'Hold your hand next to your face, not in front of it. Palm to the '
        'camera, fingers spread apart, and keep still.';
  }
  // M5 has shipped both an eye-cover step and a wink step; the tips are
  // opposite, so the wink check must come first.
  if (s.contains('wink')) {
    return 'Close only that eye and keep it shut until the phone buzzes.';
  }
  if (s.contains('eye')) {
    return 'Cover the eye with your whole hand and keep it there. A wink '
        "doesn't count.";
  }
  if (s.contains('nose')) {
    return 'Keep your finger on your nose until the phone buzzes.';
  }
  return null;
}

/// Why a REJECT, in words the worker can act on. Never a score.
///
/// The backend rejects for exactly two reasons (biometric verdictFor): the
/// camera check was not live, or it was live and the face does not match the
/// portrait taken from the worker's accepted identity document.
String livenessRejectMessage(LivenessResult r) {
  if (!r.livenessPassed) {
    return switch (r.spoofClassification) {
      'spoof_2d' ||
      'spoof_3d' =>
        'We could not confirm a live person in front of the camera. The check '
            'must be done with your own face, not a photo, a screen or a mask.',
      _ => 'We could not confirm the check was live. Move to good light, keep '
          'your whole face in view and try again.',
    };
  }
  return 'Your face does not match the photo on your identity document. The '
      'document you uploaded must be your own. If it is, start again facing '
      'the camera in good light.';
}

class _FaceLivenessScreenState extends State<FaceLivenessScreen>
    with TickerProviderStateMixin, CameraFullScreen {
  /// Native camera frames (see LivenessCamera): drawn as the viewfinder from
  /// the moment the camera opens, forwarded to M5 only while the walk runs.
  StreamSubscription<Uint8List>? _frameSub;
  void Function(Uint8List jpeg)? _onWalkFrame;
  bool _cameraOpen = false;
  Map<String, Object?> _cameraInfo = const {};
  final _lastFrame = ValueNotifier<Uint8List?>(null);

  bool _recording = false;
  Step _step = Step.init;
  int _countdown = 3;
  Timer? _countdownTimer;
  double _scanPercent = 0;
  String _customError = '';
  List<String> _steps = [];
  int _stepIdx = 0;
  bool _allStepsPassed = false;

  /// What this run did, for the tester's debug report (see [_leave]).
  LivenessRunLog _run = LivenessRunLog();

  bool _cameraClosed = false;

  /// Send-rate cap for the M5 stream in frames per second; 0 = every frame.
  /// 6 is the rate FRONTEND_GUIDE §4.2 asks for ("matches the server's tick
  /// rate"); M5 also keeps only the first frame and the last 59, so at 25 fps
  /// those covered just the last ~2 s of the walk. Under test against the
  /// fingers step, which failed twice per run at 25 fps. Override with
  /// `--dart-define=LIVENESS_MAX_FPS=10` (or 0 for every frame). The preview
  /// always shows every frame.
  static const _maxSendFps =
      int.fromEnvironment('LIVENESS_MAX_FPS', defaultValue: 6);
  // Server per-step budget (M5_STEP_TIMEOUT_S = 15). Drives only the active
  // segment's fill animation — the server, not this timer, advances steps.
  static const _perStepDuration = Duration(seconds: 15);

  /// Longest silence from the server before the stream is declared dead.
  ///
  /// Nothing else bounds the upload. Not stopping frames on a step_timeout is
  /// correct — M5 retries the step — but only while M5 is still talking. When
  /// it goes quiet the client kept streaming: one run pushed 1300 frames /
  /// 268 MB over 254 s into a relay discarding every one, then died on an
  /// HTTP/2 forced termination with no verdict at all.
  ///
  /// 30 s, against a 15 s per-step budget and a ~16 s verification tail, so the
  /// longest legitimate gap keeps roughly 2x headroom. Also bounds the gateway
  /// dying mid-tail, which previously waited for the socket to reset.
  static const _streamIdleTimeout = Duration(seconds: 30);

  late AnimationController _resultAnim;

  /// 1-based attempt at the CURRENT step index.
  ///
  /// M5 retries a missed gesture (M5_STEP_MAX_ATTEMPTS, default 3) and
  /// re-randomises it each time — a different finger count, the other eye. On
  /// screen that is indistinguishable from a brand-new step: same progress
  /// segment, similar wording, no sign anything went wrong. This is what turns
  /// it into "you missed that one, this is try 2".
  int _stepAttempt = 1;

  /// The gesture just missed, held until the step is passed or advanced.
  String? _missedGesture;

  /// How many tries this step gets in total, from the server, or 0 when it has
  /// not said. The October proto added `attempt` and `attempts_left` to both
  /// LivenessStep and LivenessStepTimeout; before that the relay dropped them
  /// and the UI could only count the tries it had witnessed.
  int _attemptsTotal = 0;

  static final _green = AppTheme.success;
  // Camera scrim: deep harbor navy (not black) for legibility over the preview.
  static const _bg = Color(0xFF06141F);

  /// Retry amber — a missed step is recoverable, so it must not read as the
  /// terminal red. Local rather than in AppTheme: nothing else needs a warning
  /// colour yet, and this one is tuned against this screen's navy scrim
  /// (~10:1 on #06141F, comfortably past the 4.5:1 floor).
  static const _amber = Color(0xFFFFC24B);

  String _tenantId = 'cypurge';

  // The selfie captured just before this screen (the enrollment anchor), sent as
  // VerifyLiveness.doc_face — the reference face M5 1:1-matches the live capture
  // against. Per the M5 contract doc_face IS the selfie, not the ID crop (the
  // backend extracts the document face itself for the selfie-vs-document match).
  List<int>? _docFace;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // No system UI mode here: the whole app is full screen (main.dart), and
    // the preview already reaches the physical edges.
    _resultAnim = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _loadTenant();
    _initCam();
  }

  Future<void> _loadTenant() async {
    const storage = FlutterSecureStorage();
    final t = await storage.read(key: 'tenant_id');
    if (t != null && t.isNotEmpty) _tenantId = t;

    final selfieB64 = await storage.read(key: 'enroll_selfie');
    if (selfieB64 != null && selfieB64.isNotEmpty) {
      try {
        _docFace = base64Decode(selfieB64);
      } catch (_) {
        _docFace = null;
      }
    }
    debugPrint(
        'doc_face (selfie) for liveness: ${_docFace?.length ?? 0} bytes');
  }

  /// Wrapper that guarantees this screen never sits on "Setting up..." forever.
  ///
  /// initState calls this without awaiting, so anything thrown below used to
  /// vanish into an unhandled async error and leave the phase stuck at
  /// [Step.init] with no message, no preview and no way out but the back
  /// button. `availableCameras()` in particular sat outside every try block.
  Future<void> _initCam() async {
    try {
      await _openCamera();
    } catch (e, stack) {
      ErrorLogger.log('Face Liveness Screen - Camera Init', e, stack);
      if (mounted) _fail('Camera unavailable: $e');
    }
  }

  Future<void> _openCamera() async {
    // Android asks here. iOS asks inside the native start: permission_handler's
    // iOS side needs Podfile macros this project doesn't set.
    if (Platform.isAndroid && !(await Permission.camera.request()).isGranted) {
      throw 'camera permission is needed for the face check';
    }

    // Listen before starting: the native side drops frames nobody listens for.
    // Every frame is the viewfinder (the same bytes M5 scores); during the walk
    // it is also forwarded to the stream.
    _frameSub = LivenessCamera.frames().listen((jpeg) {
      _lastFrame.value = jpeg;
      _onWalkFrame?.call(jpeg);
    });

    String? lastError;
    // The selfie screen releases this same front camera as it pops; on some
    // devices it isn't free yet on our first try — retry briefly.
    for (var attempt = 1; attempt <= 3; attempt++) {
      try {
        // Timed: a camera service that never answers must not leave the worker
        // on an empty scrim with no error.
        _cameraInfo =
            await LivenessCamera.start().timeout(const Duration(seconds: 8));
        _cameraOpen = true;
        debugPrint('📷 Liveness camera ready (native): $_cameraInfo');
        break;
      } catch (e, stack) {
        lastError = e is PlatformException ? (e.message ?? e.code) : '$e';
        debugPrint(
            '📷 Liveness camera start attempt $attempt failed: $lastError');
        if (e is PlatformException && e.code == 'permission_denied') break;
        if (attempt == 3) {
          ErrorLogger.log('Face Liveness Screen - Camera Init', e, stack);
        } else {
          await Future.delayed(const Duration(milliseconds: 600));
        }
      }
    }
    if (!mounted) return;
    // No camera means no check. Say so, and say WHY — a blank screen with no
    // message is indistinguishable from a broken camera, and the driver's own
    // reason is the only thing that makes the next report actionable.
    if (!_cameraOpen) {
      _run.cameraError = lastError ?? 'unknown error';
      _fail('Camera unavailable: ${lastError ?? "unknown error"}');
      return;
    }
    // Brief the worker BEFORE the countdown. Once the walk starts the server
    // owns the clock — each step has a 15s budget and M5 measures holds in
    // video time — so there is no moment later to explain the rules without
    // costing them a step.
    await _showBriefing();
    if (!mounted) return;
    _startCountdown();
  }

  /// Pre-flight explainer: what is about to happen, and what the buzz means.
  ///
  /// Exists because the vibration is only useful if its meaning is known in
  /// advance. Without this the worker feels an unexplained buzz mid-pose and
  /// reads it as an error or a notification — the opposite of the reassurance
  /// it is there to give. It also states the one thing that most affects
  /// whether they pass: hold the pose until the buzz.
  Future<void> _showBriefing() async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        constraints: const BoxConstraints(maxWidth: 460),
        title: const Text('Before we start'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We need to confirm a real person is holding the phone. '
              'You will be asked to perform a few short gestures.',
              style: TextStyle(color: AppTheme.muted, height: 1.4),
            ),
            const SizedBox(height: 18),
            _briefRow(
                '1',
                'Follow the prompt at the top of the screen. An arrow shows '
                    'which way to turn.'),
            _briefRow(
                '2',
                'Hold each pose until the phone buzzes. The buzz means that '
                    'step passed and the next one is starting.'),
            _briefRow(
                '3',
                'Keep your whole face in the frame. When asked to show '
                    'fingers, keep your hand in view as well.'),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _green.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(AppTheme.rSm),
                border: Border.all(color: _green.withValues(alpha: 0.35)),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_rounded, color: _green, size: 14),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'One short buzz = step passed.\n'
                      'One long buzz = all done.',
                      style: TextStyle(
                          color: AppTheme.ink,
                          fontSize: 13,
                          height: 1.4,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              // Leaving cancels the whole check — the caller treats false as
              // "not verified", same as the back button on the capture screen.
              if (mounted) Navigator.pop(context, false);
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("I'm ready"),
          ),
        ],
      ),
    );
  }

  Widget _briefRow(String n, String text) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22,
              height: 22,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppTheme.accent.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Text(n,
                  style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(text,
                  style: TextStyle(
                      color: AppTheme.ink, fontSize: 13.5, height: 1.4)),
            ),
          ],
        ),
      );

  void _startCountdown() {
    setState(() {
      _step = Step.countdown;
      _countdown = 3;
    });
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_countdown > 1) {
        setState(() => _countdown--);
      } else {
        t.cancel();
        _runFlow();
      }
    });
  }

  /// GetChallenge -> StreamLiveness bidi (server-driven sequential challenge):
  /// send start, then a continuous ~6 fps JPEG frame flow; render each server-
  /// pushed step; the final verdict arrives on the stream (no polling — the
  /// old VerifyLiveness/GetLivenessResult upload+poll pair is retired).
  Future<void> _runFlow() async {
    _run = LivenessRunLog()
      ..maxSendFps = _maxSendFps
      ..camera = _cameraInfo;
    try {
      final service = CypurgeGrpcService();
      service.init(useGateway: true);
      final token = await EnrollmentService().getValidAccessToken();
      if (token == null) {
        _run.appError = 'No valid access token on the phone (not signed in).';
        _fail('Not authenticated. Please log in again.');
        return;
      }

      // Worker identity is needed up front now — the stream's start message
      // carries it. Enrollment reuses the signup form's stored worker_id;
      // sign-in re-verification passes the identified userId.
      const storage = FlutterSecureStorage();
      String workerId = widget.userId;
      if (workerId.isEmpty || workerId == 'temp-enroll') {
        workerId = await storage.read(key: 'worker_id') ?? '';
      }
      if (workerId.isEmpty) {
        _run.appError = 'No worker_id stored on the phone.';
        throw 'No worker identity found on this device. Complete signup first.';
      }

      // challenge_id is one-shot: fresh GetChallenge per stream attempt. The
      // response's steps list is ignored — the server pushes each instruction
      // live on the stream.
      final challengeClock = Stopwatch()..start();
      final challenge =
          await service.getChallenge(token: token).onError<Object>((e, stack) {
        _run.challengeFailed(_errorText(e), challengeClock.elapsedMilliseconds);
        Error.throwWithStackTrace(e, stack);
      });
      _run.challengeIssued(
          challenge.challengeId, challengeClock.elapsedMilliseconds);
      _steps = [];
      _stepIdx = 0;
      _allStepsPassed = false;

      final result =
          await _runStream(service, token, challenge.challengeId, workerId);

      setState(() {
        _step = Step.processing;
        _scanPercent = 95;
      });
      if (widget.fullLiveness) {
        await _finishEnroll(result, workerId);
      } else {
        await _finishVerify(result, workerId);
      }
    } catch (e, stack) {
      ErrorLogger.log('Face Liveness Screen - Flow', e, stack);
      if (e is GrpcError && _run.challengeError == null) {
        _run.streamFailed(_errorText(e));
      }
      _fail(_friendly(e));
    }
  }

  static String _errorText(Object e) =>
      e is GrpcError ? '${e.codeName}: ${e.message ?? ''}' : '$e';

  /// Drives one StreamLiveness session: pumps upright JPEG frames at ~6 fps
  /// while rendering the server's live step transitions. Returns the final
  /// LivenessResult; throws when the stream ends with an error / without one.
  Future<LivenessResult> _runStream(
    CypurgeGrpcService service,
    String token,
    String challengeId,
    String workerId,
  ) async {
    if (!mounted) throw 'Screen closed';
    setState(() {
      _step = Step.challenge;
      _recording = true;
      _scanPercent = 0;
    });

    final out = StreamController<LivenessClientMsg>();
    out.add(LivenessClientMsg(
      start: LivenessStart(
        challengeId: challengeId,
        workerId: workerId,
        tenantId: _tenantId,
        docFace: _docFace ?? const [],
      ),
    ));
    final responses =
        service.streamLiveness(token: token, messages: out.stream);
    _run.streamStarted();

    // Frames MUST stop the moment the challenge walk ends (last step passed, or a
    // step timed out). M5 then spends ~16 s on the verification tail WITHOUT
    // draining its socket; frames pushed into that window pile up unread, so when
    // M5 closes after writing `result` the kernel sends RST instead of FIN and the
    // in-flight result bytes are discarded — the backend then fails with
    // "m5ws: read: failed to read frame payload: unexpected EOF" (gRPC UNAVAILABLE)
    // and a completed check is reported as a connection failure. The tail runs
    // entirely on frames M5 already buffered, so stopping costs nothing.
    //
    // Stopping is necessary but NOT sufficient, and this comment used to claim
    // otherwise. Runs that stopped frames cleanly at the terminal step still
    // reset, because going quiet on a stream the client is still holding open
    // is indistinguishable from a stalled phone. `stopFrames` therefore also
    // half-closes the request stream — see there for why that is the actual
    // end-of-upload signal.
    // Frame-pipeline instrumentation. Capture and encode stats come back from
    // the native camera when it stops; this side counts what it forwarded.
    final wall = Stopwatch()..start();
    var walkMs = 0;
    var jpegBytes = 0;
    var sent = 0;
    Future<Map<String, Object?>>? cameraStats;

    var framesDone = false;
    void stopFrames() {
      if (framesDone) return;
      framesDone = true;
      walkMs = wall.elapsedMilliseconds;
      _run.framesStopped(sent, walkMs);
      // Stop the camera now rather than leaving it idling: frees the phone's
      // cores for M5's ~16s tail instead of encoding frames nobody sends. The
      // `finally` below is still the backstop.
      _onWalkFrame = null;
      cameraStats ??= LivenessCamera.stop();
      // Half-close the request stream: "no more frames coming". gRPC bidi keeps
      // the RESPONSE direction open after a client half-close, so the result
      // still arrives on `responses` below — this ends the upload, not the call.
      //
      // This is the missing signal behind the post-walk connection reset. The
      // request stream used to stay open until the result came back, so for the
      // whole ~12s tail the relay held a socket to M5 with nothing arriving on
      // it. That is dead air, not end-of-stream, and M5 cannot tell "the walk
      // is over" from "the phone froze" — so its read side eventually gives up
      // and closes hard, and RST discards the result it had already written.
      // The client log shows exactly that shape: framesStoppedAt=23288ms,
      // total=35716ms, reset in between with the socket idle the whole time.
      //
      // Nothing in flight is lost by closing here: `framesDone` is already true
      // above, so frames still arriving from the camera are dropped by the
      // guard in the walk frame handler whether this controller is open or not.
      if (!out.isClosed) unawaited(out.close());
      if (mounted) {
        setState(() {
          _step = Step.processing;
          _scanPercent = 90;
          _recording = false;
          _cameraClosed = true;
        });
      }
    }

    // Frames arrive from the native camera already upright, encoded and in
    // capture order (M5 requires ordered frames); all that is left is to
    // forward them. The camera has been running since the screen opened.
    DateTime? lastSentAt;
    const minGap = _maxSendFps > 0
        ? Duration(microseconds: 1000000 ~/ _maxSendFps)
        : Duration.zero;
    _onWalkFrame = (jpeg) {
      if (framesDone || out.isClosed) return;
      final now = DateTime.now();
      if (lastSentAt != null && now.difference(lastSentAt!) < minGap) return;
      lastSentAt = now;
      jpegBytes += jpeg.length;
      out.add(LivenessClientMsg(frame: jpeg));
      sent++;
    };

    LivenessResult? result;
    String? streamError;
    var timedOut = false;
    try {
      // .timeout, not a Timer: this fires on the GAP BETWEEN events, which is
      // exactly the condition that matters — the server has stopped talking —
      // and it tears the stream down from inside the await, which a Timer
      // callback cannot do.
      await for (final msg in responses.timeout(_streamIdleTimeout)) {
        switch (msg.whichMsg()) {
          case LivenessServerMsg_Msg.step:
            final s = msg.step;
            // Same index = the retry of a step just missed, so the attempt
            // counter and the miss banner survive. A new index means the walk
            // moved on: clear both.
            final isRetry = s.index == _stepIdx && _missedGesture != null;
            // The attempt is counted HERE, when M5 actually re-issues the step,
            // so the number on screen is always an attempt the worker is really
            // being given. Counting on the timeout instead overshot by one on
            // the final miss, where no retry follows.
            // M5's own count when it sends one (October proto), else the tries
            // this screen has witnessed.
            final attempt =
                s.attempt > 0 ? s.attempt : (isRetry ? _stepAttempt + 1 : 1);
            if (s.attempt > 0 && s.attemptsLeft >= 0) {
              _attemptsTotal = s.attempt + s.attemptsLeft;
            }
            // Logged because "M5 retries fine" and "the retry never happens"
            // are both true at once, and only this line separates them: it
            // proves M5 DID re-issue the step and that the silence afterwards
            // is frames not reaching it, not a missing retry.
            debugPrint(isRetry
                ? '🔁 step ${s.index + 1} RE-ISSUED by M5 (attempt '
                    '$attempt) — "${s.instruction}"'
                : '▶️ step ${s.index + 1}/${s.total} — "${s.instruction}"');
            _run.stepIssued(s.index, s.total, s.instruction, attempt);
            if (mounted) {
              setState(() {
                if (_steps.length != s.total) {
                  _steps = List<String>.filled(s.total, '');
                }
                // Always overwrite: a retry is RE-RANDOMISED (different finger
                // count, the other eye), so the cached wording is wrong.
                if (s.index < _steps.length) _steps[s.index] = s.instruction;
                _stepIdx = s.index;
                _scanPercent = (s.index / s.total * 80).clamp(0, 80);
                _stepAttempt = attempt;
                // The miss banner survives a retry (it names the gesture to redo)
                // and is cleared only when the walk moves to a new step.
                if (!isRetry) _missedGesture = null;
              });
            }
          case LivenessServerMsg_Msg.stepPassed:
            final p = msg.stepPassed;
            // Confirm the pass by touch. The worker is holding a pose and
            // watching their own face, not the progress bar, so a visual-only
            // tick is easy to miss — they hold too long, or move too early and
            // fail a step they had already cleared.
            //
            // Haptics, not HapticFeedback: every flutter/services variant routes
            // to View.performHapticFeedback, which this device ignores outright
            // when system haptics are off — the call fired 6/6 steps and nothing
            // buzzed. Haptics drives the Vibrator service instead.
            //
            // Unawaited on purpose: this branch is inside the stream response
            // loop, and awaiting a platform round-trip here would delay reading
            // the next server message.
            unawaited(Haptics.stepPassed());
            debugPrint('📳 step ${p.index + 1} passed — haptic requested');
            _run.stepPassed(p.index);
            if (mounted && _steps.isNotEmpty) {
              setState(() {
                _scanPercent =
                    ((p.index + 1) / _steps.length * 80).clamp(0, 80);
                // Cleared on the retry — drop the banner so the next gesture
                // starts clean.
                _missedGesture = null;
                _stepAttempt = 1;
              });
            }
            // Last step cleared -> the walk is over, M5 starts the tail.
            if (_steps.isNotEmpty && p.index + 1 >= _steps.length) {
              _allStepsPassed = true;
              stopFrames();
            }
          case LivenessServerMsg_Msg.stepTimeout:
            // NOT terminal any more. M5 retries a missed step up to
            // M5_STEP_MAX_ATTEMPTS (3); steps already passed stay passed. This
            // arm used to call stopFrames(), which makes every retry unwinnable:
            // M5 re-issues the step and waits for frames the client can no
            // longer send, so all three attempts expire and the walk fails.
            //
            // M5 sends `failed` to separate "tries remain" from "out of
            // attempts", but LivenessStepTimeout carries only `index`, so the
            // biometric relay drops the flag before it reaches us. We do not
            // need it: the NEXT message disambiguates. A retry sends
            // `step` for the same index; exhaustion sends `result`. Staying in
            // the frame loop is right for both — on the terminal path the relay
            // has already stopped forwarding, so the extra frames never reach
            // M5 and cannot add to its unread backlog.
            //
            // `timedOut` still feeds the no-result error message below.
            timedOut = true;
            final missed = msg.stepTimeout.index;
            // The same counts, now that the timeout carries them: `failed`
            // means that pose is out of tries, not merely late.
            if (msg.stepTimeout.attempt > 0) {
              _stepAttempt = msg.stepTimeout.attempt;
              _attemptsTotal =
                  msg.stepTimeout.attempt + msg.stepTimeout.attemptsLeft;
            }
            _run
              ..stepTimedOut(missed, _stepAttempt,
                  missed < _steps.length ? _steps[missed] : '')
              // M5's own view of the miss, read while the session is live.
              ..snapshotM5(
                  'step ${missed + 1} timeout (attempt $_stepAttempt)');
            debugPrint('⏱ step ${msg.stepTimeout.index + 1} timed out — '
                'holding the frame loop open for a possible retry');
            // Tell the worker by touch as well as on screen. They are holding a
            // pose and looking at their own face, so a banner alone is missed by
            // exactly the person who needs it.
            unawaited(Haptics.stepMissed());
            if (mounted) {
              setState(() {
                // Deliberately NOT bumping _stepAttempt here. A timeout means
                // the attempt just ENDED, not that another has begun — and on
                // the last one none does: M5 is out of attempts and sends
                // `result` instead of re-issuing. Counting here showed "Try 4"
                // against a 3-attempt limit, and made the final message claim
                // four tries when the worker was given three. The retry arm
                // above counts the attempt that actually starts.
                _missedGesture =
                    _steps.isNotEmpty && msg.stepTimeout.index < _steps.length
                        ? _humanStep(_steps[msg.stepTimeout.index])
                        : 'that gesture';
              });
            }
          case LivenessServerMsg_Msg.result:
            result = msg.result;
            _run.resultReceived(msg.result);
          case LivenessServerMsg_Msg.error:
            streamError = msg.error.message;
            _run.serverErrored(msg.error.message);
          case LivenessServerMsg_Msg.notSet:
            break;
        }
        if (result != null || streamError != null) break;
      }
    } on TimeoutException {
      _run
        ..idle(_streamIdleTimeout.inSeconds)
        ..snapshotM5('no server message for ${_streamIdleTimeout.inSeconds} s');
      // The server stopped talking. Named separately from a transport failure
      // because the cause is different and so is the advice: the stream was
      // healthy, M5 simply never sent the next step or the verdict.
      streamError = timedOut
          ? 'The verification server stopped responding after a missed step. '
              'Please start again.'
          : 'The verification server stopped responding. Please start again.';
      debugPrint('⛔ no server message for ${_streamIdleTimeout.inSeconds}s — '
          'abandoning the stream instead of uploading into a dead session');
    } finally {
      _onWalkFrame = null;
      final cam = await (cameraStats ??= LivenessCamera.stop());
      await out.close();
      if (mounted) setState(() => _recording = false);

      // Print the stats HERE, not after the try block. When the stream throws —
      // which is exactly what a mid-tail connection reset looks like — the
      // exception propagates past any code below, so the one run where these
      // numbers matter most was the one run that never logged them. `finally`
      // covers both the clean and the thrown path.
      //
      // `framesStoppedAt` is the tell-tale for the reset: it is the elapsed ms
      // at which the client stopped sending. If it is well before `total`, the
      // client honoured the stop-at-terminal contract and the reset happened
      // with an idle socket — meaning the unread-frame explanation does not
      // apply and the close is M5's alone.
      wall.stop();
      // walkMs is 0 if the stream died before any terminal step — fall back to
      // the full elapsed time so the fps figure is never divided by zero.
      final walk = walkMs > 0 ? walkMs : wall.elapsedMilliseconds;
      final fps = walk > 0 ? sent * 1000 / walk : 0;
      final avgKb = sent > 0 ? jpegBytes / sent / 1024 : 0;
      _run
        ..framesSent = sent
        ..fps = fps.toDouble()
        ..walkMs = walk
        ..tailMs = wall.elapsedMilliseconds - walk
        ..totalMs = wall.elapsedMilliseconds
        ..camera = _cameraInfo
        ..cameraStats = cam
        ..allStepsPassed = _allStepsPassed
        ..streamEnded(cam);
      // `dropped` = frames the camera produced while every encoder thread was
      // busy. High means this phone's encode is the ceiling, not the camera.
      debugPrint('🎥 StreamLiveness done: sent=$sent frames in ${walk}ms walk '
          '(${fps.toStringAsFixed(2)} fps, cap=${_maxSendFps > 0 ? "$_maxSendFps" : "none"}, camera '
          '${_cameraInfo['width']}x${_cameraInfo['height']} '
          'max ${_cameraInfo['fpsMax']}fps), '
          'encode avg=${cam['encodeMs'] ?? "-"}ms on '
          '${cam['encoders'] ?? "-"} threads, dropped=${cam['dropped'] ?? "-"}, '
          'jpeg avg=${avgKb.toStringAsFixed(0)}KB, '
          'total sent=${(jpegBytes / 1048576).toStringAsFixed(1)}MB, '
          'luma avg=${cam['luma'] ?? "-"}/255, '
          'framesStoppedAt=${walkMs > 0 ? "${walkMs}ms" : "never"}, '
          'tail=${wall.elapsedMilliseconds - walk}ms, '
          'total=${wall.elapsedMilliseconds}ms, '
          'verdict=${result?.verdict ?? "-"}, error=${streamError ?? "-"}, '
          'stepTimeout=$timedOut');
      // Why the verdict: REJECT is either not live (live=false) or a face
      // mismatch against the document photo. Scores stay in the debug log only.
      final r = result;
      if (r != null) {
        debugPrint('🧾 Liveness why: live=${r.livenessPassed}, '
            'spoof=${r.spoofClassification}, '
            'match=${r.matchScore.toStringAsFixed(3)} (${r.matchReason}, '
            'matched=${r.matched}), deepfake=${r.deepfakeVerdict}');
      }
    }

    if (result == null) {
      throw streamError ??
          (timedOut
              ? _missedGesture != null
                  ? '"$_missedGesture" was not captured in time. Please start '
                      'again and hold that pose steady until you feel the buzz.'
                  : 'A step was not completed in time — please retry.'
              : 'Verification ended unexpectedly. Please retry.');
    }
    return result;
  }

  /// Large glyph cue for the current instruction, or null when the gesture has
  /// no useful symbol.
  ///
  /// Derived from the ALREADY-DISPLAYED text, not the raw step name, so it can
  /// never contradict the words: [_humanStep] mirrors LEFT/RIGHT for the front
  /// camera, and reading the raw step here would point the arrow the other way.
  ///
  /// Drawn as text glyphs rather than icon-font constants — an arrow reads
  /// instantly at arm's length, and there is no icon name to get wrong.
  String? _stepGlyph(String displayed) {
    final s = displayed.toLowerCase();
    if (s.contains('left')) return '←'; // <-
    if (s.contains('right')) return '→'; // ->
    if (s.contains('up')) return '↑';
    if (s.contains('down')) return '↓';
    if (s.contains('finger')) return '✋'; // raised hand
    if (s.contains('nose')) return '☝'; // pointing up finger
    if (s.contains('wink') || s.contains('eye')) return '◑'; // half circle
    if (s.contains('smile')) return '☺';
    if (s.contains('straight') ||
        s.contains('center') ||
        s.contains('centre') ||
        s.contains('forward')) {
      return '◎'; // bullseye — face the lens
    }
    return null;
  }

  // Challenge step -> human prompt. M5's /challenge already returns display-ready
  // sentences ("Cover your RIGHT eye"); show those verbatim. Only the legacy
  // UPPER_SNAKE tokens need mapping.
  String _humanStep(String s) {
    if (s.contains(' ')) {
      return swapTurnDirection(s); // human sentence from M5
    }
    final mapped = switch (s.toUpperCase()) {
      'LOOK_LEFT' || 'TURN_LEFT' => 'Turn left',
      'LOOK_RIGHT' || 'TURN_RIGHT' => 'Turn right',
      'LOOK_FORWARD' || 'LOOK_STRAIGHT' || 'LOOK_CENTER' => 'Look straight',
      'COVER_EYE' => 'Cover one eye',
      'TOUCH_NOSE' => 'Touch your nose',
      // Deliberately vague: the target count is randomised (M5_FINGERS_MIN..MAX,
      // now 2-3 — 4 and 5 were the main cause of failed challenges) and is
      // re-randomised on each retry, so only M5's own instruction text can state
      // it. This is the last-resort fallback.
      'FINGERS_BESIDE_FACE' => 'Hold fingers up beside your face',
      'LOOK_UP' => 'Look up',
      'LOOK_DOWN' => 'Look down',
      'SMILE' => 'Smile',
      _ => s.replaceAll('_', ' '),
    };
    return swapTurnDirection(mapped);
  }

  /// Post-verdict actions for enrollment. The verdict is already final and
  /// server-computed (PASS | REVIEW | REJECT) — never enrol a spoof.
  Future<void> _finishEnroll(LivenessResult result, String workerId) async {
    try {
      const storage = FlutterSecureStorage();
      final verdict = result.verdict;
      if (verdict == 'PASS' || verdict == 'REVIEW') {
        // REVIEW = accepted-but-flagged; the backend routes it to an analyst
        // and the worker proceeds either way.
        await storage.write(key: 'cypurge_enrolled', value: 'true');
        // Keep a display copy BEFORE the anchor is dropped. _docFace is that
        // same selfie, already in memory. Without this the avatar would go
        // blank at the exact moment enrollment succeeded — and the delete is
        // permanent, so nothing would be left on the device to recover it from.
        final selfie = _docFace;
        if (selfie != null && selfie.isNotEmpty) {
          await saveProfileSelfie(Uint8List.fromList(selfie));
        }
        await storage.delete(
            key: 'enroll_selfie'); // consumed; fresh on re-enroll

        // Bind this device to the worker (non-fatal on failure, retried later).
        final bound = await DeviceIdentityService().registerDevice(workerId);
        if (bound) {
          unawaited(BackgroundSignalService().collectAndSendTelemetry());
        }

        _succeed(verdict == 'REVIEW' ? 'Submitted for review.' : '');
      } else {
        _fail(livenessRejectMessage(result));
      }
    } catch (e, stack) {
      ErrorLogger.log('Biometric Face Enrollment Process', e, stack);
      _fail(_friendly(e));
    }
  }

  /// Post-verdict actions for sign-in re-verification.
  Future<void> _finishVerify(LivenessResult result, String workerId) async {
    try {
      const storage = FlutterSecureStorage();
      // REVIEW = accepted-pending (flagged for an analyst), not a rejection.
      final ok = result.verdict == 'PASS' || result.verdict == 'REVIEW';
      if (ok) {
        await storage.write(key: 'worker_id', value: workerId);
        await storage.write(key: 'cypurge_user_id', value: workerId);
        await storage.write(key: 'cypurge_enrolled', value: 'true');
        // Last resort for the avatar: a worker who enrolled before the photo
        // was ever stored has no selfie left on the device — the anchor was
        // consumed at enrollment — and re-enrolling just to get a picture is
        // not something to ask of them. A frame from a walk that just PASSED is
        // a verified live photo of the right person. IfMissing, because it may
        // catch them mid-gesture and must never displace a posed selfie.
        final frame = _lastFrame.value;
        if (frame != null) await saveProfileSelfieIfMissing(frame);
        _succeed('');
      } else {
        _fail(livenessRejectMessage(result));
      }
    } catch (e, stack) {
      ErrorLogger.log('Biometric Face Verification Process', e, stack);
      _fail(_friendly(e));
    }
  }

  String _friendly(Object e) {
    final m = e.toString().toLowerCase();
    // Every gesture cleared, then the server dropped before the verdict
    // ("m5ws: ... unexpected EOF" — the ML socket closed on its side). That is
    // not a rejection, and the generic "server unavailable" wording sent
    // workers to fix their lighting for a problem that was never theirs.
    if (_allStepsPassed && (m.contains('unavailable') || m.contains('eof'))) {
      return 'You completed all ${_steps.length} steps, but the verification '
          'server disconnected before sending your result. Nothing was '
          'rejected — please try again.';
    }
    if (m.contains('already') || m.contains('already_exists')) {
      return 'This face is already registered.';
    }
    return humanizeError(e, action: 'verify your identity');
  }

  void _succeed(String note) {
    if (!mounted) return;
    // Longer than the per-step buzz so the end of the whole check is
    // distinguishable by feel from clearing one more gesture.
    unawaited(Haptics.success());
    setState(() {
      _step = Step.success;
      _customError = note;
      _scanPercent = 100;
      _resultAnim.forward();
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) _leave(true);
    });
  }

  void _fail(String message) {
    if (!mounted) return;
    // Double pulse — a single long buzz reads as success to a worker who is not
    // looking at the screen.
    unawaited(Haptics.failure());
    setState(() {
      _step = Step.fail;
      _customError = message;
      _scanPercent = 0;
      _resultAnim.forward();
    });
    // Long enough to read the reason: the calling screens show nothing of
    // their own after a failure. Testers get the same reason on the report.
    Future.delayed(const Duration(seconds: livenessDebugReport ? 3 : 8), () {
      if (mounted) _leave(false);
    });
  }

  /// Closes the screen with [passed]. In tester builds the debug report takes
  /// its place first: which side (ML, Backend, App) owns each problem.
  Future<void> _leave(bool passed) async {
    if (!livenessDebugReport) {
      Navigator.pop(context, passed);
      return;
    }
    _run.trace.add('app.verdict', passed ? TraceStatus.ok : TraceStatus.fail,
        why: passed ? 'passed' : 'shown to the worker: $_customError');
    await _run.settle();
    if (!mounted) return;
    final issues = diagnose(_run);
    final report = renderReport(_run, issues);
    publishDebugReport(
      kind: 'liveness',
      headline: 'liveness ${_run.result?.verdict ?? 'no result'}'
          '${_run.cid.isEmpty ? '' : ' · cid ${_run.cid}'}',
      report: report,
      issues: issues,
    );
    final shown = _customError.isEmpty ? '' : ': $_customError';
    Navigator.pushReplacement(
      context,
      platformRoute(
        builder: (_) => DebugReportScreen(
          title: 'Liveness debug report',
          summary: passed ? 'Passed$shown' : 'Failed$shown',
          issues: issues,
          report: report,
        ),
      ),
      result: passed,
    );
  }

  /// True while the server-driven gesture walk is running. Was an index range
  /// spanning four enum members, only one of which was ever assigned.
  bool get _active => _step == Step.challenge;

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _onWalkFrame = null;
    _frameSub?.cancel();
    if (_cameraOpen) unawaited(LivenessCamera.stop());
    _lastFrame.dispose();
    _resultAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    final h = mq.size.height;
    // Vertical anchor for the result badge / spinner. Was also the face
    // frame's centre; the frame is gone, this is not.
    final faceY = h * 0.38;

    return WTPage(
        topGap: 0,
        fullBleed: true,
        content: Stack(children: [
          // --- CAMERA (over a permanent scrim) ---
          //
          // The scrim is NOT decoration. The page paints the app theme's
          // scaffold background, and AppTheme.light defaults to true — #EAF1F7.
          // Every moment without a live preview (camera still initializing, camera
          // failed, walk finished) therefore showed a near-WHITE screen where the
          // worker expected their own face. Paint navy first, preview on top.
          const Positioned.fill(child: ColoredBox(color: _bg)),

          // Preview from the native camera's frames (see LivenessCamera): no second
          // camera stream, which weaker phones could not run alongside analysis.
          //
          // These frames are the ones already going to M5, so this preview cannot
          // silently disagree with what the server is scoring. Mirrored, because
          // the LEFT/RIGHT prompt swap in swapTurnDirection assumes the worker is
          // looking at a mirror. cacheWidth keeps the per-frame decode cheap — it
          // is a viewfinder, not the evidence.
          if (!_cameraClosed)
            Positioned.fill(
              // Own layer: the preview repaints every frame, the overlays do not.
              child: RepaintBoundary(
                child: ValueListenableBuilder<Uint8List?>(
                  valueListenable: _lastFrame,
                  // Before the first frame (a few hundred ms) the navy scrim shows.
                  builder: (_, frame, __) => frame == null
                      ? const SizedBox.shrink()
                      : Transform.scale(
                          scaleX: -1,
                          child: Image.memory(frame,
                              gaplessPlayback: true,
                              // cover, NOT contain. Frames are 720x1280 (0.5625);
                              // phones run from 0.5 (4:3 tablets) to ~0.42 (21:9),
                              // and `contain` paints the difference as navy bars —
                              // the screen simply is not full on most handsets. cover
                              // fills any aspect ratio by cropping the long edge,
                              // which is what every camera viewfinder does.
                              //
                              // Safe for the check: cropping is symmetric about the
                              // centre where the face sits, this widget is a
                              // viewfinder only, and the bytes sent to M5 are the
                              // uncropped frame regardless of how it is displayed.
                              fit: BoxFit.cover,
                              // 540: the value in place for the last run that ended
                              // in a PASS. 360 decodes ~2x cheaper and raised the
                              // frame rate, but it was one of the changes made
                              // between that PASS and two consecutive stream resets,
                              // so it is back at the known-good value until those are
                              // explained. Restore 360 only alongside a run to
                              // compare against.
                              cacheWidth: 540),
                        ),
                ),
              ),
            ),
          // --- COUNTDOWN OVERLAY ---
          if (_step == Step.countdown)
            Positioned.fill(
                child: Container(
                    color: const Color(0x73000000),
                    child: Center(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                      // The only framing guidance left now the face frame is gone,
                      // so it has to actually say what fits: hands too. Half the
                      // gestures happen beside the face, and the old frame drew a
                      // head-sized box that implied the opposite.
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                              'Hold the phone at eye level.\n'
                              'Keep your face and both hands in view.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xE6FFFFFF),
                                  fontSize: 16,
                                  height: 1.45))),
                      const SizedBox(height: 10),
                      Text('$_countdown',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                              fontWeight: FontWeight.bold)),
                    ])))),
          // The face frame ("crop cadre") used to sit here: a rounded rect with
          // corner brackets, a dimming scrim outside it, a scan sweep and a dot
          // grid. Removed deliberately — it was working against the check it was
          // decorating.
          //
          // It framed a head-sized box, but half the gestures (fingers beside the
          // face, touch nose) happen OUTSIDE that box, so the frame told the worker
          // to stay inside a boundary the challenge required them to leave. Its
          // scrim also darkened an already-dim indoor front-camera image — the
          // in-code note "the whole pre-recording screen read as the camera is
          // black" is that, and dropping the alpha to 0.35 treated the symptom.
          //
          // Nothing replaces it. Where to stand is now said in words in the
          // countdown overlay, and the preview is full-bleed, which is what a
          // worker checking their own framing actually needs.

          // --- RESULT ICON ---
          if (_step == Step.success)
            Positioned(
                left: w / 2 - 44,
                top: faceY - 44,
                child: ScaleTransition(
                    scale: CurvedAnimation(
                        parent: _resultAnim, curve: Curves.elasticOut),
                    child: Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _green,
                            boxShadow: [
                              BoxShadow(
                                  color: _green.withValues(alpha: 0.5),
                                  blurRadius: 40,
                                  spreadRadius: 8)
                            ]),
                        child: const Icon(Icons.check_rounded,
                            color: Colors.white, size: 48)))),

          if (_step == Step.fail)
            Positioned(
                left: w / 2 - 44,
                top: faceY - 44,
                child: ScaleTransition(
                    scale: CurvedAnimation(
                        parent: _resultAnim, curve: Curves.elasticOut),
                    child: Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.error,
                            boxShadow: [
                              BoxShadow(
                                  color: AppTheme.error.withValues(alpha: 0.5),
                                  blurRadius: 40,
                                  spreadRadius: 8)
                            ]),
                        child: const Icon(Icons.close_rounded,
                            color: Colors.white, size: 48)))),

          if (_step == Step.processing)
            Positioned(
                left: w / 2 - 28,
                top: faceY - 28,
                child: SizedBox(
                    width: 56,
                    height: 56,
                    child: WTSpinner(
                        strokeWidth: 2.5,
                        activeColor: _green.withValues(alpha: 0.8)))),

          // --- TOP SECTION ---
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        _bg,
                        _bg.withValues(alpha: 0.8),
                        const Color(0x00000000)
                      ])),
                  child: SafeArea(
                      bottom: false,
                      child: Padding(
                          // 20, not 40, at the bottom: the instruction block that
                          // used to sit under this row now lives in the coach card,
                          // so the extra inset was scrimming empty camera.
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Semantics(
                                      button: true,
                                      label: 'Cancel identity check',
                                      excludeSemantics: true,
                                      child: GestureDetector(
                                          onTap: () =>
                                              Navigator.pop(context, false),
                                          child: Container(
                                              // all(15) + an 18sp icon reaches the 48dp
                                              // minimum target; all(8) gave 34dp.
                                              padding: const EdgeInsets.all(15),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color: Colors.white
                                                      .withValues(alpha: 0.06)),
                                              child: Icon(
                                                  Icons.chevron_left_rounded,
                                                  color: Colors.white
                                                      .withValues(alpha: 0.72),
                                                  size: 18)))),
                                  const Spacer(),
                                  if (_active)
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: _recording
                                                ? _green.withValues(alpha: 0.12)
                                                : Colors.white
                                                    .withValues(alpha: 0.06)),
                                        child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                  width: 6,
                                                  height: 6,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: _recording
                                                          ? _green
                                                          : Colors.white
                                                              .withValues(
                                                                  alpha: 0.24),
                                                      boxShadow: _recording
                                                          ? [
                                                              BoxShadow(
                                                                  color: _green
                                                                      .withValues(
                                                                          alpha:
                                                                              0.6),
                                                                  blurRadius: 6)
                                                            ]
                                                          : [])),
                                              const SizedBox(width: 6),
                                              Text(
                                                  _recording
                                                      ? 'Recording'
                                                      : 'Ready',
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: _recording
                                                          ? _green
                                                          : const Color(
                                                              0x4DFFFFFF),
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ])),
                                ]),
                                // Instruction, timer, attempts and the miss reason
                                // all moved to the coach card at the bottom. They
                                // used to be split across both overlays, so a
                                // worker who had just missed a step read the
                                // gesture at the top and the progress at the
                                // bottom and the reason in neither. One surface,
                                // one place to look.
                              ]))))),

          // --- BOTTOM SECTION ---
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        const Color(0x00000000),
                        _bg.withValues(alpha: 0.85),
                        _bg
                      ])),
                  child: SafeArea(
                      top: false,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
                          child: _buildCoachCard())))),
        ]));
  }

  /// Instruction headline: glyph cue on the left, wording on the right.
  ///
  /// Keyed on the step INDEX as well as the phase. Every gesture in the walk is
  /// the same `Step.challenge`, so a key of just the phase never changed and the
  /// AnimatedSwitcher sat still while the words swapped underneath it — the one
  /// moment the worker most needs to notice something changed.
  Widget _buildStepHeadline(Color accent) {
    final title = _stepTitle;
    final glyph = _active ? _stepGlyph(title) : null;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Row(
        key: ValueKey('t$_step$_stepIdx$title$_stepAttempt'),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (glyph != null) ...[
            Text(glyph,
                style: TextStyle(
                    fontSize: 40,
                    height: 1.0,
                    fontWeight: FontWeight.w700,
                    color: accent)),
            const SizedBox(width: 14),
          ],
          Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.5,
                    height: 1.1)),
          ),
        ],
      ),
    );
  }

  /// How many tries a step is assumed to get when the server has not said.
  ///
  /// Mirrors M5_STEP_MAX_ATTEMPTS' default, and is only a fallback now that
  /// `attempts_left` reaches us ([_attemptsTotal]). The dot row GROWS rather
  /// than clamping if more attempts arrive than this — an ops change makes the
  /// row longer, never wrong.
  static const _maxAttemptsHint = 3;

  /// The one surface the worker reads: what to do, how long is left, how many
  /// tries are gone, and what went wrong.
  ///
  /// Everything used to be split across both overlays — gesture at the top,
  /// progress at the bottom, reason nowhere — so a worker who had just missed a
  /// step had to hunt for why. One card, one place to look, always the same
  /// place.
  ///
  /// The card's own border and glyph carry the state (amber = missed, red =
  /// failed, green = passed) rather than a note appended underneath. The
  /// surface being read is the surface that changes, which is what makes it
  /// noticeable to someone whose eyes are on their own face.
  Widget _buildCoachCard() {
    final missed = _missedGesture;
    final tip = _active ? gestureTip(_stepTitle) : null;
    final accent = _step == Step.fail
        ? AppTheme.error
        : missed != null
            ? _amber
            : _green;
    final motion = MediaQuery.of(context).disableAnimations
        ? Duration.zero
        : const Duration(milliseconds: 240);

    return AnimatedContainer(
      duration: motion,
      curve: Curves.easeOut,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        // Solid, not translucent: this sits over a live camera, and a glassy
        // panel over a moving image is where text goes unreadable.
        color: const Color(0xFF0B1E2D),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: accent.withValues(alpha: missed != null ? 0.55 : 0.16),
            width: missed != null ? 1.5 : 1),
        boxShadow: [
          BoxShadow(
              color: missed != null
                  ? accent.withValues(alpha: 0.22)
                  : Colors.black.withValues(alpha: 0.4),
              blurRadius: missed != null ? 28 : 20,
              spreadRadius: missed != null ? 1 : 0),
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          // Stretch, not the default centre: the segment bar and the meta row
          // both need the card's full width to lay out their Expanded/Spacer.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Walk progress: one segment per gesture, across the top of the card.
            if (widget.fullLiveness && _active) ...[
              _buildSteps(),
              const SizedBox(height: 16),
            ],
            _buildStepHeadline(accent),
            if (tip != null) ...[
              const SizedBox(height: 8),
              Text(tip,
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      color: Colors.white.withValues(alpha: 0.75))),
            ],
            if (_active) ...[
              const SizedBox(height: 14),
              _buildStepMeta(accent),
            ],
            // Recovery line. During the walk it only appears after a miss;
            // outside it, it carries the phase's own explanation (processing,
            // result…). Gated on there actually BEING text — init and countdown
            // have no sub-line, and the divider was drawing above nothing.
            if (missed != null || (!_active && _stepSub.isNotEmpty)) ...[
              const SizedBox(height: 12),
              Container(height: 1, color: Colors.white.withValues(alpha: 0.07)),
              const SizedBox(height: 12),
              Semantics(
                liveRegion: missed != null || _step == Step.fail,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (missed != null) ...[
                        const Icon(Icons.warning_amber_rounded,
                            size: 15, color: _amber),
                        const SizedBox(width: 9),
                      ],
                      Expanded(
                        child: Text(
                          missed != null
                              ? 'Missed "$missed" — hold the pose steady until you '
                                  'feel the buzz.'
                              : _stepSub,
                          style: TextStyle(
                              fontSize: 13,
                              height: 1.4,
                              fontWeight: missed != null
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: missed != null
                                  ? _amber
                                  : Colors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                    ]),
              ),
            ],
            if (!_active) ...[
              const SizedBox(height: 14),
              _buildProgressBar(),
            ],
          ]),
    );
  }

  /// Ring timer + attempt dots: how long is left on THIS pose, and how many
  /// tries it has already cost.
  Widget _buildStepMeta(Color accent) {
    final used = (_stepAttempt - 1).clamp(0, 1 << 20);
    // The server's total when it sent one, else the assumed default; either way
    // the row grows rather than clamping.
    final total = _attemptsTotal > 0 ? _attemptsTotal : _maxAttemptsHint;
    final dots = used >= total ? used + 1 : total;

    return Row(children: [
      // Restarts per ATTEMPT, not per step — a retry keeps the same index, so
      // keying on the index alone left a full ring over a fresh 15 seconds.
      SizedBox(
        width: 38,
        height: 38,
        child: TweenAnimationBuilder<double>(
          key: ValueKey('ring${_stepIdx}a$_stepAttempt'),
          tween: Tween(begin: 1, end: 0),
          duration: _perStepDuration,
          builder: (_, v, __) => Stack(alignment: Alignment.center, children: [
            WTSpinner(
                value: v * 100,
                strokeWidth: 3,
                activeColor: accent,
                backgroundColor: Colors.white.withValues(alpha: 0.10)),
            Text('${(v * _perStepDuration.inSeconds).ceil()}',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    // Tabular so the ring does not jiggle as digits change.
                    fontFeatures: const [FontFeature.tabularFigures()],
                    color: Colors.white.withValues(alpha: 0.85))),
          ]),
        ),
      ),
      const SizedBox(width: 14),
      // Attempt dots. Filled = a try already spent, so an untouched step shows
      // an empty row and says nothing alarming.
      Semantics(
        label: used == 0
            ? 'First attempt'
            : 'Attempt $_stepAttempt, $used already used',
        child: Row(
          children: List.generate(
            dots,
            (i) => Padding(
              padding: EdgeInsets.only(right: i == dots - 1 ? 0 : 5),
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      i < used ? _amber : Colors.white.withValues(alpha: 0.16),
                ),
              ),
            ),
          ),
        ),
      ),
      const Spacer(),
      Text(
        used == 0
            ? 'Step ${_stepIdx + 1} of ${_steps.length}'
            : _attemptsTotal > 0
                ? 'Try $_stepAttempt of $_attemptsTotal'
                : 'Try $_stepAttempt',
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: used == 0 ? Colors.white.withValues(alpha: 0.45) : _amber),
      ),
    ]);
  }

  String get _stepTitle {
    if (_active && _steps.isNotEmpty) return _humanStep(_steps[_stepIdx]);
    return {
          Step.init: 'Setting up...',
          Step.countdown: 'Get ready',
          Step.finalizing: 'Finalizing...',
          Step.processing: 'Liveness check finished',
          Step.success: 'Scan completed',
          Step.fail: 'Verification failed',
        }[_step] ??
        '';
  }

  String get _stepSub {
    if (_active && _steps.isNotEmpty) {
      // Next instruction may be unknown ('') — the server reveals steps live.
      final nextName =
          _stepIdx + 1 < _steps.length ? _humanStep(_steps[_stepIdx + 1]) : '';
      final next = _stepIdx + 1 >= _steps.length
          ? 'Last step — almost done'
          : nextName.isEmpty
              ? 'Follow the on-screen prompts'
              : 'Next: $nextName';
      return 'Step ${_stepIdx + 1} of ${_steps.length}  ·  $next';
    }
    return {
          Step.finalizing: 'Look straight at the camera to finish',
          Step.processing:
              'Now waiting for verification: we are matching your face with '
                  'your identity document. Keep the app open, this takes about '
                  '20 seconds.',
          Step.success: 'Thanks, we will get back to you soon',
          // Name the gesture that ran out of tries. "Please try again" after a
          // 90-second walk tells the worker nothing they can act on; the one
          // fact that changes their next attempt is WHICH pose never landed.
          Step.fail: _customError.isNotEmpty
              ? _customError
              : _missedGesture != null
                  ? 'The step "$_missedGesture" was not captured after '
                      '$_stepAttempt attempts. Start again and hold that pose '
                      'steady until you feel the buzz.'
                  : 'Please try again.',
        }[_step] ??
        '';
  }

  /// Segmented progress bar (one segment per challenge step). Uses Expanded
  /// segments so any number of steps fits the width — no horizontal overflow.
  /// The current gesture is named large in the title above; the active segment
  /// fills over the step duration so the user sees how long to hold each pose.
  Widget _buildSteps() {
    if (_steps.isEmpty) return const SizedBox.shrink();
    final cur = _stepIdx;
    return Row(
        children: List.generate(_steps.length, (i) {
      final done = i < cur;
      final active = i == cur;
      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(right: i == _steps.length - 1 ? 0 : 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              height: 6,
              child: Stack(children: [
                Container(
                    color:
                        done ? _green : Colors.white.withValues(alpha: 0.14)),
                if (active)
                  // Restarts on each step change AND on each retry, and fills
                  // across the step's on-screen duration — a live per-gesture
                  // timer.
                  //
                  // `_stepAttempt` belongs in the key. A retry keeps the same
                  // index, so keying on `cur` alone left the bar sitting full
                  // from the attempt that just expired while the worker was
                  // given a fresh 15s — the timer would read "out of time" for
                  // the whole of their next try.
                  TweenAnimationBuilder<double>(
                    key: ValueKey('seg${cur}a$_stepAttempt'),
                    tween: Tween(begin: 0, end: 1),
                    duration: _perStepDuration,
                    builder: (_, v, __) => FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: v,
                      child: Container(
                        decoration: BoxDecoration(
                          color: _green,
                          boxShadow: [
                            BoxShadow(
                                color: _green.withValues(alpha: 0.5),
                                blurRadius: 6),
                          ],
                        ),
                      ),
                    ),
                  ),
              ]),
            ),
          ),
        ),
      );
    }));
  }

  Widget _buildProgressBar() {
    final isSuccess = _step == Step.success;
    final isFail = _step == Step.fail;
    final barColor = isFail ? AppTheme.error : _green;
    return Column(children: [
      Row(children: [
        Text('${_scanPercent.toInt()}%',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isSuccess
                    ? _green
                    : isFail
                        ? AppTheme.error
                        : Colors.white)),
        const SizedBox(width: 6),
        Text(
            isSuccess
                ? 'recognised'
                : isFail
                    ? 'failed'
                    : _step == Step.processing
                        ? 'verifying'
                        : 'recording',
            style: TextStyle(
                fontSize: 13, color: Colors.white.withValues(alpha: 0.3))),
        const Spacer(),
        if (_step == Step.processing)
          SizedBox(
              width: 14,
              height: 14,
              child: WTSpinner(
                  strokeWidth: 1.5,
                  activeColor: Colors.white.withValues(alpha: 0.3))),
      ]),
      const SizedBox(height: 8),
      ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
              height: 6,
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06))),
                AnimatedFractionallySizedBox(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    widthFactor: (_scanPercent / 100).clamp(0, 1),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: LinearGradient(colors: [
                              barColor.withValues(alpha: 0.7),
                              barColor
                            ]),
                            boxShadow: [
                          BoxShadow(
                              color: barColor.withValues(alpha: 0.4),
                              blurRadius: 8)
                        ]))),
              ]))),
    ]);
  }
}

class AnimatedFractionallySizedBox extends ImplicitlyAnimatedWidget {
  final double widthFactor;
  final Widget child;
  const AnimatedFractionallySizedBox(
      {super.key,
      required this.widthFactor,
      required this.child,
      required super.duration,
      super.curve});
  @override
  AnimatedWidgetBaseState<AnimatedFractionallySizedBox> createState() =>
      _AnimFracState();
}

class _AnimFracState
    extends AnimatedWidgetBaseState<AnimatedFractionallySizedBox> {
  Tween<double>? _wf;
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _wf = visitor(
            _wf, widget.widthFactor, (v) => Tween<double>(begin: v as double))
        as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
      alignment: Alignment.centerLeft,
      widthFactor: _wf?.evaluate(animation) ?? 0,
      child: widget.child);
}
