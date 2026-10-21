import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/error_logger.dart';
import '../utils/image_work.dart';
import '../utils/profile_photo.dart';

/// Captures the enrollment selfie — the single reference face the ML side
/// matches everything against (document ↔ selfie and live-video ↔ selfie,
/// per the M4/M5 integration guide). Captured once, held as base64 JPEG in
/// secure storage under `enroll_selfie`.
///
/// ponytail: the selfie is stored but not yet sent — StreamLivenessRequest has
/// no doc_face field until backend plan task 4 lands. Wiring it into the
/// stream (and retiring the ID-crop anchor) is plan task 6.
class SelfieCaptureScreen extends StatefulWidget {
  const SelfieCaptureScreen({super.key, this.profileOnly = false});

  /// Capture a display photo WITHOUT touching the enrollment anchor.
  ///
  /// `enroll_selfie` is sent as `doc_face` on every liveness stream, sign-in
  /// included, so a stored anchor is a client-supplied reference face for the
  /// match. Re-photographing an avatar must never quietly become "pick the face
  /// you would like to be verified against", so this path writes the display
  /// copy alone.
  final bool profileOnly;

  @override
  State<SelfieCaptureScreen> createState() => _SelfieCaptureScreenState();
}

enum _Phase { init, countdown, preview, saving, error }

class _SelfieCaptureScreenState extends State<SelfieCaptureScreen>
    with CameraFullScreen {
  CameraController? _cam;
  _Phase _phase = _Phase.init;
  int _countdown = 3;
  Timer? _timer;
  Uint8List? _shot;
  String _error = '';

  // Same navy scrim as the liveness screen.
  static const _bg = Color(0xFF06141F);

  @override
  void initState() {
    super.initState();
    _initCam();
  }

  Future<void> _initCam() async {
    try {
      final cams = await availableCameras();
      final front = cams.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.front,
        orElse: () => cams.first,
      );
      _cam = CameraController(front, ResolutionPreset.high, enableAudio: false);
      await _cam!.initialize();
      if (!mounted) return;
      _startCountdown();
    } on CameraException catch (e, stack) {
      ErrorLogger.log('Selfie Capture - Camera Init', e, stack);
      if (mounted) {
        setState(() {
          _phase = _Phase.error;
          _error = 'Camera unavailable. Check the app camera permission.';
        });
      }
    }
  }

  void _startCountdown() {
    setState(() {
      _phase = _Phase.countdown;
      _countdown = 3;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_countdown > 1) {
        setState(() => _countdown--);
      } else {
        t.cancel();
        _capture();
      }
    });
  }

  Future<void> _capture() async {
    try {
      final file = await _cam!.takePicture();
      final raw = await file.readAsBytes();
      // Downscale to 720p/q90 off the UI isolate (see utils/image_work.dart).
      final jpeg = await downscaleSelfie(raw);
      if (!mounted) return;
      setState(() {
        _shot = jpeg;
        _phase = _Phase.preview;
      });
    } on CameraException catch (e, stack) {
      ErrorLogger.log('Selfie Capture - Take Picture', e, stack);
      if (mounted) {
        setState(() {
          _phase = _Phase.error;
          _error = 'Could not take the photo. Please try again.';
        });
      }
    }
  }

  Future<void> _confirm() async {
    final shot = _shot;
    if (shot == null) return;
    setState(() => _phase = _Phase.saving);
    try {
      if (!widget.profileOnly) {
        const storage = FlutterSecureStorage();
        await storage.write(key: 'enroll_selfie', value: base64Encode(shot));
      }
      // Second copy, for the avatar on Home and Profile. `enroll_selfie` is
      // consumed and deleted by the liveness screen once enrollment passes, so
      // a display copy cannot share that key.
      await saveProfileSelfie(shot);
      if (mounted) Navigator.pop(context, true);
    } on Exception catch (e, stack) {
      ErrorLogger.log('Selfie Capture - Save', e, stack);
      if (mounted) {
        setState(() {
          _phase = _Phase.error;
          _error = 'Could not save the photo. Please try again.';
        });
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cam?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      topGap: 0,
      fullBleed: true,
      content: Container(
        color: _bg,
        child: Stack(children: [
          // Live preview, or the frozen shot once taken. Mirror the frozen shot
          // so it reads like the front-camera mirror the user just posed in.
          // ponytail: display-only flip — the STORED bytes stay raw so doc_face
          // still matches the (un-mirrored) live liveness frames on M5.
          if (_shot != null)
            Positioned.fill(
              child: Transform.scale(
                scaleX: -1,
                child: Image.memory(_shot!, fit: BoxFit.cover),
              ),
            )
          else if (_cam != null && _cam!.value.isInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _cam!.value.previewSize!.height,
                  height: _cam!.value.previewSize!.width,
                  child: CameraPreview(_cam!),
                ),
              ),
            ),

          if (_phase == _Phase.countdown)
            Positioned.fill(
              child: Container(
                color: const Color(0x59000000),
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    const Text('Look straight at the camera',
                        style:
                            TextStyle(color: Color(0xB3FFFFFF), fontSize: 16)),
                    const SizedBox(height: 10),
                    Text('$_countdown',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
            ),

          // Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: Row(children: [
                  Semantics(
                    button: true,
                    label: 'Cancel selfie capture',
                    excludeSemantics: true,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context, false),
                      child: Container(
                        // 15 + 18 = 48dp target; all(8) gave 34dp.
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                        child: Icon(Icons.chevron_left_rounded,
                            color: Colors.white.withValues(alpha: 0.72),
                            size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text('Reference Selfie',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ),
                ]),
              ),
            ),
          ),

          // Bottom actions
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
                    _bg.withValues(alpha: 0.9),
                    _bg
                  ],
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 40, 28, 20),
                  child: switch (_phase) {
                    _Phase.preview => Row(children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white54),
                            ),
                            onPressed: () {
                              setState(() => _shot = null);
                              _startCountdown();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text('Retake'),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton(
                            onPressed: _confirm,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text('Use this photo'),
                            ),
                          ),
                        ),
                      ]),
                    _Phase.saving => const Center(child: WTSpinner()),
                    _Phase.error =>
                      Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(_error,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: AppTheme.error, fontSize: 13)),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: () {
                            setState(() => _phase = _Phase.init);
                            _initCam();
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: Text('Try again'),
                          ),
                        ),
                      ]),
                    _ => Text(
                        'This photo is the reference your identity is matched against.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.4),
                            fontSize: 13),
                      ),
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
