import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:camera/camera.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../services/re_verify_service.dart';
import '../utils/error_humanizer.dart';
import '../utils/profile_photo.dart';
import '../utils/worker_files.dart' show documentTypeLabel;

/// "8 min" under an hour, "5h" after. A spot check gives the worker minutes,
/// and "0h remaining" read as already too late.
String timeLeft(Duration left) {
  if (left.inMinutes < 60) {
    return '${left.inMinutes < 0 ? 0 : left.inMinutes} min';
  }
  return '${left.inHours}h';
}

class ReVerifyScreen extends StatefulWidget {
  const ReVerifyScreen({required this.task, super.key});
  final ReVerifyTask task;

  @override
  State<ReVerifyScreen> createState() => _ReVerifyScreenState();
}

class _ReVerifyScreenState extends State<ReVerifyScreen> with CameraFullScreen {
  late final ReVerifyService _service;
  // Nullable, not `late`: this is only assigned once availableCameras() has
  // returned AND a front camera was found. When either failed, `late` left the
  // field unassigned while dispose() still called .dispose() on it — throwing
  // LateInitializationError on the way out of a screen that never got a camera.
  CameraController? _cameraController;
  bool _isCameraReady = false;
  bool _isSubmitting = false;
  String? _error;

  /// The captured selfie. Kept as bytes and encoded only when submitted —
  /// the preview used to base64-decode it again on every rebuild.
  Uint8List? _selfie;

  @override
  void initState() {
    super.initState();
    _service = ReVerifyService();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final front = cameras
          .firstWhere((c) => c.lensDirection == CameraLensDirection.front);
      // Build into a local first: if this screen is popped while initialize()
      // is in flight, dispose() has already run and would never reach a
      // controller published to the field afterwards.
      final controller = CameraController(front, ResolutionPreset.high);
      await controller.initialize();
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _cameraController = controller;
        _isCameraReady = true;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = humanizeError(e, action: 'start the camera'));
    }
  }

  Future<void> _captureSelfie() async {
    final controller = _cameraController;
    if (controller == null) {
      setState(() => _error = 'Camera is not ready yet.');
      return;
    }
    try {
      final image = await controller.takePicture();
      final bytes = await image.readAsBytes();
      // Also the freshest posed photo of this worker, so re-verification keeps
      // the Home and Profile avatar current. Reachable without re-enrolling,
      // which matters for workers whose enrollment selfie was already consumed.
      await saveProfileSelfie(bytes);
      if (!mounted) return;
      setState(() {
        _selfie = bytes;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = humanizeError(e, action: 'capture your selfie'));
    }
  }

  Future<void> _submitReVerify() async {
    if (_selfie == null) {
      setState(() => _error = 'Capture selfie first');
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      final result = await _service.submitReVerify(
        requestId: widget.task.id,
        selfieBase64: base64Encode(_selfie!),
      );

      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Re-verification'),
            content: Text(result['message'] ?? 'Submitted'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'))
            ],
          ),
        );
      }
    } catch (e) {
      setState(() =>
          _error = humanizeError(e, action: 'submit your re-verification'));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  void dispose() {
    // Null when camera init never got far enough to publish a controller.
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final left = widget.task.deadlineAt.difference(DateTime.now());
    final hoursLeft = left.inHours;
    final deadlineColor = hoursLeft < 12
        ? AppTheme.error
        : hoursLeft < 24
            ? AppTheme.warn
            : AppTheme.accentLight;
    // The wording has to change too. Colour alone said nothing to a
    // colourblind worker or on a greyscale screen.
    final deadlineText = left.isNegative
        ? 'Overdue'
        : hoursLeft < 12
            ? '${timeLeft(left)} remaining - due very soon'
            : hoursLeft < 24
                ? '${timeLeft(left)} remaining - due today'
                : '${timeLeft(left)} remaining';

    return WTPage(
      appBar: AppBar(title: const Text('Re-verification')),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.s4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WTCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('REASON', style: AppTheme.label),
                      const SizedBox(height: AppTheme.s2),
                      Text(widget.task.reason, style: AppTheme.h2),
                      const SizedBox(height: AppTheme.s4),
                      Text('DEADLINE', style: AppTheme.label),
                      const SizedBox(height: AppTheme.s1),
                      Text(deadlineText,
                          style: TextStyle(
                              color: deadlineColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: AppTheme.s4),
                if (widget.task.flaggedDocuments.isNotEmpty) ...[
                  Text('REQUIRED', style: AppTheme.label),
                  const SizedBox(height: AppTheme.s2),
                  ...widget.task.flaggedDocuments.map((doc) => Padding(
                        padding: const EdgeInsets.only(bottom: AppTheme.s2),
                        child: Row(
                          children: [
                            Icon(Icons.check_rounded,
                                color: AppTheme.success, size: 16),
                            const SizedBox(width: AppTheme.s2),
                            // Wire values (FACE_LIVENESS, NATIONAL_ID_BACK) since the
                            // list comes from flagged_documents; show them in words.
                            Text(documentTypeLabel(doc)),
                          ],
                        ),
                      )),
                  const SizedBox(height: AppTheme.s4),
                ],
                if (_error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppTheme.s2),
                    decoration: BoxDecoration(
                        color: AppTheme.error.withValues(alpha: 0.1),
                        border: Border.all(color: AppTheme.error),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(_error!,
                        style: TextStyle(color: AppTheme.error, fontSize: 12)),
                  ),
                  const SizedBox(height: AppTheme.s4),
                ],
                // _isCameraReady is only ever set together with a non-null
                // controller, so the ! below is safe.
                if (_isCameraReady && _cameraController != null) ...[
                  Text('SELFIE', style: AppTheme.label),
                  const SizedBox(height: AppTheme.s2),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.border, width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    child: _selfie == null
                        ? CameraPreview(_cameraController!)
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.memory(_selfie!),
                              Icon(Icons.check_rounded,
                                  color: AppTheme.success, size: 48),
                            ],
                          ),
                  ),
                  const SizedBox(height: AppTheme.s3),
                  if (_selfie == null)
                    FilledButton(
                      onPressed: _captureSelfie,
                      child: const Text('Capture Selfie'),
                    )
                  else
                    Row(
                      children: [
                        OutlinedButton(
                            onPressed: () => setState(() => _selfie = null),
                            child: const Text('Retake')),
                        const SizedBox(width: AppTheme.s2),
                        Expanded(
                          child: FilledButton(
                            onPressed: _isSubmitting ? null : _submitReVerify,
                            child:
                                Text(_isSubmitting ? 'Submitting…' : 'Submit'),
                          ),
                        ),
                      ],
                    ),
                ] else
                  const Padding(
                      padding: EdgeInsets.all(AppTheme.s4), child: WTSpinner()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
