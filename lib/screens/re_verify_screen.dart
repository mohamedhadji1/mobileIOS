import 'package:fluent_ui/fluent_ui.dart';
import 'package:camera/camera.dart';
import 'dart:convert';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../services/re_verify_service.dart';

class ReVerifyScreen extends StatefulWidget {
  const ReVerifyScreen({required this.task, super.key});
  final ReVerifyTask task;

  @override
  State<ReVerifyScreen> createState() => _ReVerifyScreenState();
}

class _ReVerifyScreenState extends State<ReVerifyScreen> {
  late final ReVerifyService _service;
  late CameraController _cameraController;
  bool _isCameraReady = false;
  bool _isSubmitting = false;
  String? _error;
  String? _selfieBase64;

  @override
  void initState() {
    super.initState();
    _service = ReVerifyService();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final front = cameras.firstWhere((c) => c.lensDirection == CameraLensDirection.front);
      _cameraController = CameraController(front, ResolutionPreset.high);
      await _cameraController.initialize();
      if (mounted) setState(() => _isCameraReady = true);
    } catch (e) {
      setState(() => _error = 'Camera init failed: $e');
    }
  }

  Future<void> _captureSelfie() async {
    try {
      final image = await _cameraController.takePicture();
      final bytes = await image.readAsBytes();
      setState(() {
        _selfieBase64 = base64Encode(bytes);
        _error = null;
      });
    } catch (e) {
      setState(() => _error = 'Capture failed: $e');
    }
  }

  Future<void> _submitReVerify() async {
    if (_selfieBase64 == null) {
      setState(() => _error = 'Capture selfie first');
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      final result = await _service.submitReVerify(
        requestId: widget.task.id,
        selfieBase64: _selfieBase64!,
      );

      if (mounted) {
        showDialog(
          context: context,
          builder: (_) => ContentDialog(
            title: const Text('Re-verification'),
            content: Text(result['message'] ?? 'Submitted'),
            actions: [Button(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          ),
        );
      }
    } catch (e) {
      setState(() => _error = 'Submit failed: $e');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hoursLeft = widget.task.deadlineAt.difference(DateTime.now()).inHours;
    final deadlineColor = hoursLeft < 12 ? AppTheme.error : hoursLeft < 24 ? AppTheme.warn : AppTheme.accentLight;

    return ScaffoldPage(
      header: PageHeader(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(FluentIcons.chevron_left, color: AppTheme.ink, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('Re-verification', style: AppTheme.h2),
      ),
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
                      Text('${hoursLeft}h remaining', style: TextStyle(color: deadlineColor, fontWeight: FontWeight.bold)),
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
                        Icon(FluentIcons.check_mark, color: AppTheme.success, size: 16),
                        const SizedBox(width: AppTheme.s2),
                        Text(doc),
                      ],
                    ),
                  )),
                  const SizedBox(height: AppTheme.s4),
                ],
                if (_error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppTheme.s2),
                    decoration: BoxDecoration(color: AppTheme.error.withValues(alpha: 0.1), border: Border.all(color: AppTheme.error), borderRadius: BorderRadius.circular(8)),
                    child: Text(_error!, style: TextStyle(color: AppTheme.error, fontSize: 12)),
                  ),
                  const SizedBox(height: AppTheme.s4),
                ],
                if (_isCameraReady) ...[
                  Text('SELFIE', style: AppTheme.label),
                  const SizedBox(height: AppTheme.s2),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(border: Border.all(color: AppTheme.border, width: 2), borderRadius: BorderRadius.circular(12)),
                    child: _selfieBase64 == null
                        ? CameraPreview(_cameraController)
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.memory(base64Decode(_selfieBase64!)),
                              Icon(FluentIcons.check_mark, color: AppTheme.success, size: 48),
                            ],
                          ),
                  ),
                  const SizedBox(height: AppTheme.s3),
                  if (_selfieBase64 == null)
                    FilledButton(
                      onPressed: _captureSelfie,
                      child: const Text('Capture Selfie'),
                    )
                  else
                    Row(
                      children: [
                        Button(onPressed: () => setState(() => _selfieBase64 = null), child: const Text('Retake')),
                        const SizedBox(width: AppTheme.s2),
                        Expanded(
                          child: FilledButton(
                            onPressed: _isSubmitting ? null : _submitReVerify,
                            child: Text(_isSubmitting ? 'Submitting…' : 'Submit'),
                          ),
                        ),
                      ],
                    ),
                ] else
                  const Padding(padding: EdgeInsets.all(AppTheme.s4), child: ProgressRing()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}