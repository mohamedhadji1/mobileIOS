import 'dart:io';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'document_capture_screen.dart';
import '../widgets/step_indicator.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/enrollment_service.dart';
import '../utils/error_logger.dart';
import '../config/constants.dart';
import 'package:hugeicons/hugeicons.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'worker_nav.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

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
      'icon': HugeIcons.strokeRoundedPassport,
      'required': false,
      'file': null,
    },
    {
      'id': 'id_front',
      'title': 'National ID (Front)',
      'description': 'Front side of your Identity Card',
      'icon': HugeIcons.strokeRoundedIdentityCard,
      'required': false,
      'file': null,
    },
    {
      'id': 'id_back',
      'title': 'National ID (Back)',
      'description': 'Reverse side of your Identity Card',
      'icon': HugeIcons.strokeRoundedIdentityCard,
      'required': false,
      'file': null,
    },
    {
      'id': 'license_front',
      'title': 'Driver\'s License (Front)',
      'description': 'Front side of your License',
      'icon': HugeIcons.strokeRoundedLicense,
      'required': false,
      'file': null,
    },
    {
      'id': 'license_back',
      'title': 'Driver\'s License (Back)',
      'description': 'Reverse side of your License',
      'icon': HugeIcons.strokeRoundedLicense,
      'required': false,
      'file': null,
    },
  ];

  int _activeStepIndex = 0;
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  String _uploadStage = '';
  int _currentUploadStageIndex = -1;

  late AnimationController _pulseController;
  late AnimationController _scanLineController;
  late AnimationController _progressGlowController;
  late Animation<double> _pulseAnim;
  late Animation<double> _scanLineAnim;
  late Animation<double> _progressGlowAnim;

  final List<Map<String, dynamic>> _uploadStages = [
    {'label': 'Optimizing document quality...', 'target': 0.20, 'duration': 3500},
    {'label': 'Verifying cryptographic signatures...', 'target': 0.45, 'duration': 3000},
    {'label': 'Encrypting sensitive data (AES-256)...', 'target': 0.70, 'duration': 4000},
    {'label': 'Uploading to secure maritime vault...', 'target': 0.95, 'duration': 4500},
    {'label': 'Finalizing secure connection', 'target': 1.0, 'duration': 1500},
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _scanLineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat();
    _scanLineAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scanLineController, curve: Curves.easeInOut),
    );

    _progressGlowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _progressGlowAnim = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _progressGlowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _scanLineController.dispose();
    _progressGlowController.dispose();
    super.dispose();
  }

  Future<void> _captureCurrentDoc() async {
    await showDialog<void>(
      context: context,
      builder: (context) => ContentDialog(
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
              icon: FluentIcons.camera,
              title: 'Take Photo',
              subtitle: 'Scan document with camera',
              onTap: () {
                Navigator.pop(context);
                _openCameraCapture();
              },
            ),
            const SizedBox(height: 12),
            _buildSourceOption(
              icon: FluentIcons.photo_collection,
              title: 'Phone Gallery',
              subtitle: 'Choose existing image (JPG, PNG)',
              onTap: () {
                Navigator.pop(context);
                _pickFromGallery();
              },
            ),
            const SizedBox(height: 12),
            _buildSourceOption(
              icon: FluentIcons.document,
              title: 'Browse Files',
              subtitle: 'Pick PDF, DOC or DOCX file',
              onTap: () {
                Navigator.pop(context);
                _pickDocument();
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
        actions: [
          Button(
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
    return GestureDetector(
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
            Icon(FluentIcons.chevron_right, color: AppTheme.faint, size: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _openCameraCapture() async {
    final resultPath = await Navigator.push(
      context,
      FluentPageRoute(
        builder: (context) => DocumentCaptureScreen(
          documentType: _steps[_activeStepIndex]['title'],
        ),
      ),
    );

    if (resultPath != null && resultPath is String) {
      setState(() {
        _steps[_activeStepIndex]['file'] = File(resultPath);
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
      setState(() {
        _steps[_activeStepIndex]['file'] = File(image.path);
      });
      _nextStep();
    }
  }

  Future<void> _pickDocument() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final picked = result.files.first;
        if (picked.path != null) {
          setState(() {
            _steps[_activeStepIndex]['file'] = File(picked.path!);
          });
          _nextStep();
        }
      }
    } catch (e) {
      if (mounted) {
        displayInfoBar(
          context,
          builder: (context, close) => InfoBar(
            title: const Text('File Picker Error'),
            content: Text(e.toString()),
            severity: InfoBarSeverity.error,
            action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
          ),
        );
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

  void _prevStep() {
    if (_activeStepIndex > 0) {
      setState(() {
        _activeStepIndex--;
      });
    }
  }

  bool get _hasAtLeastOneDoc => _steps.any((s) => s['file'] != null);

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

  Future<void> _uploadAll() async {
    if (!_hasAtLeastOneDoc) return;

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
      // Derive the worker id from the token's worker_id claim â€” the exact value
      // the backend compares against in its document self-confirm check â€” and
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

      final activeDocs = _steps.where((s) => s['file'] != null).toList();
      double progressPerDoc = 0.9 / activeDocs.length;

      for (int i = 0; i < activeDocs.length; i++) {
        final step = activeDocs[i];
        final File file = step['file'] as File;
        final String fileExt = file.path.split('.').last.toLowerCase();

        // Stage 1: Generate Upload URL
        setState(() {
          _currentUploadStageIndex = 0;
          _uploadStage = 'Requesting secure upload URL for ${step['title']}...';
          _uploadProgress = (i * progressPerDoc) + (progressPerDoc * 0.1);
        });

        debugPrint('Generating secure upload URL via gRPC for ${step['id']}...');
        final uploadUrlRes = await grpcService.generateUploadURL(
          token: accessToken,
          tenantId: tenantId!,
          workerId: workerId,
          fileExt: fileExt,
        ).timeout(const Duration(seconds: 10));

        String uploadUrl = uploadUrlRes.uploadUrl;
        final String objectKey = uploadUrlRes.objectKey;

        // Stage 2: PUT request upload to MinIO with SSE-KMS headers
        setState(() {
          _currentUploadStageIndex = 2; // Encrypting/Uploading stage
          _uploadStage = 'Encrypting & uploading ${step['title']}...';
          _uploadProgress = (i * progressPerDoc) + (progressPerDoc * 0.4);
        });

        final bytes = await file.readAsBytes();
        final putHeaders = <String, String>{};

        // Merge any required headers returned by the server
        uploadUrlRes.requiredHeaders.forEach((k, v) {
          putHeaders[k] = v;
        });

        // Enforce required SSE-KMS headers
        putHeaders['Content-Type'] = _getMimeType(fileExt);
        putHeaders['x-amz-server-side-encryption'] = 'aws:kms';
        putHeaders['x-amz-server-side-encryption-aws-kms-key-id'] = 'kms-$tenantId';

        final originalHost = Uri.parse(uploadUrl).authority;
        // Always rewrite the MinIO hostname to the reachable node IP â€” the phone
        // can't resolve minio.workertrust.local. The original Host header is kept
        // below so the presigned signature still validates.
        uploadUrl = uploadUrl.replaceAll('minio.workertrust.local', AppConfig.host);
        putHeaders['Host'] = originalHost;

        debugPrint('Uploading binary file via HTTP PUT to MinIO pre-signed URL...');
        final putResponse = await http.put(
          Uri.parse(uploadUrl),
          headers: putHeaders,
          body: bytes,
        ).timeout(const Duration(seconds: 30));

        if (putResponse.statusCode != 200) {
          throw 'Failed to upload ${step['title']}: HTTP ${putResponse.statusCode} - ${putResponse.body}';
        }

        // Stage 3: Confirm upload via gRPC
        setState(() {
          _currentUploadStageIndex = 4; // Finalizing stage
          _uploadStage = 'Confirming upload for ${step['title']}...';
          _uploadProgress = (i * progressPerDoc) + (progressPerDoc * 0.8);
        });

        // Map step id to docType
        String docType = 'OTHER';
        if (step['id'] == 'passport') {
          docType = 'PASSPORT';
        } else if (step['id'].startsWith('id_')) {
          docType = 'ID';
        } else if (step['id'].startsWith('license_')) {
          docType = 'LICENSE';
        }

        debugPrint('Confirming upload via gRPC for ${step['id']}...');
        await grpcService.confirmUpload(
          token: accessToken,
          objectKey: objectKey,
          docType: docType,
        ).timeout(const Duration(seconds: 10));

        await _storage.write(key: 'doc_uploaded_${step['id']}', value: 'true');
        debugPrint('âœ… Document upload tracked: ${step['id']}');
      }

      setState(() {
        _uploadProgress = 1.0;
        _uploadStage = 'Enrollment finalized successfully';
      });

      await Future.delayed(const Duration(milliseconds: 1200));

      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    } catch (e, stack) {
      ErrorLogger.log('Secure Document Upload Process', e, stack);
      debugPrint('âŒ Secure document upload failed: $e');
      if (mounted) {
        displayInfoBar(context, builder: (context, close) => InfoBar(
          title: const Text('Upload Error'),
          content: Text('$e'),
          severity: InfoBarSeverity.error,
          action: IconButton(icon: const Icon(FluentIcons.clear), onPressed: close),
        ));
      }
    } finally {
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
    final currentStep = _steps[_activeStepIndex];
    final isLastStep = _activeStepIndex == _steps.length - 1;
    final uploadedCount = _steps.where((s) => s['file'] != null).length;

    return ScaffoldPage(
      content: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    const StepIndicator(
                    currentStep: 3,
                    stepLabels: ['Scan', 'Details', 'Biometrics', 'Documents'],
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Document Verification', style: AppTheme.h1),
                          const SizedBox(height: 4),
                          Text(
                            'Step ${_activeStepIndex + 1} of ${_steps.length}',
                            style: AppTheme.caption,
                          ),
                        ],
                      ),
                      WTTag('$uploadedCount Captured', kind: WTTagKind.blue),
                    ],
                  ),

                  const SizedBox(height: 32),

                  Expanded(
                    child: _buildStepCard(currentStep),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    children: [
                      if (_activeStepIndex > 0)
                        IconButton(
                          icon: const Icon(FluentIcons.back, size: 20),
                          onPressed: _prevStep,
                        ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _hasAtLeastOneDoc && isLastStep
                            ? _buildActionButton(
                                label: 'Finalize Enrollment',
                                icon: FluentIcons.save,
                                color: const Color(0xFF00E676),
                                onPressed: _uploadAll,
                              )
                            : _buildActionButton(
                                label: currentStep['file'] != null ? 'Continue' : 'Skip Step',
                                icon: currentStep['file'] != null ? FluentIcons.chevron_right : FluentIcons.forward,
                                color: currentStep['file'] != null
                                    ? AppTheme.accent
                                    : AppTheme.surfaceAlt,
                                onPressed: _nextStep,
                                isGhost: currentStep['file'] == null && !isLastStep,
                              ),
                      ),
                    ],
                  ),
                  
                  if (_hasAtLeastOneDoc && !isLastStep)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: HyperlinkButton(
                        onPressed: _uploadAll,
                        child: const Text('Finish with current documents'),
                      ),
                    ),
                ],
              ),
                  ),
                ),
                WTBottomNav(items: workerNavItems(context, 1), activeIndex: 1),
              ],
            ),
          ),
          if (_isUploading) _buildUploadOverlay(),
        ],
      ),
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
                child: HugeIcon(
                  icon: step['icon'] as List<List<dynamic>>,
                  color: AppTheme.accent,
                  size: 44,
                ),
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
    return GestureDetector(
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
            Icon(FluentIcons.camera, color: Colors.white, size: 24),
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
    );
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
              image: FileImage(file),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: const Color(0xFF00E676), width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00E676).withValues(alpha: 0.2),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        Positioned(
          top: -10,
          right: -10,
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: const Icon(FluentIcons.clear, color: Colors.white, size: 14),
            ),
            onPressed: () => setState(() => _steps[_activeStepIndex]['file'] = null),
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
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 18),
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
            Text(
              label,
              style: TextStyle(
                color: isGhost ? AppTheme.muted : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              icon,
              color: isGhost ? AppTheme.muted : Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  // Three coarse phases derived from upload progress — robust regardless of the
  // finer internal stage list. Each: (label, icon, completion threshold).
  static const List<(String, IconData, double)> _uploadPhases = [
    ('Encrypt', FluentIcons.lock, 0.45),
    ('Upload', FluentIcons.cloud_upload, 0.95),
    ('Verify', FluentIcons.shield, 1.0),
  ];

  Widget _buildUploadOverlay() {
    final done = _uploadProgress >= 1.0;
    final ringColor = done ? const Color(0xFF00E676) : AppTheme.accent;

    return AnimatedBuilder(
      animation: _progressGlowAnim,
      builder: (context, child) {
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
                        SizedBox(
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
                                          alpha: _progressGlowAnim.value * 0.35),
                                      blurRadius: 48,
                                      spreadRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: ProgressRing(
                                  value: 100,
                                  strokeWidth: 8,
                                  activeColor: Colors.white.withValues(alpha: 0.06),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 150,
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween(begin: 0, end: _uploadProgress * 100),
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeOutCubic,
                                  builder: (_, v, __) => ProgressRing(
                                    value: v,
                                    strokeWidth: 8,
                                    activeColor: ringColor,
                                  ),
                                ),
                              ),
                              done
                                  ? Icon(FluentIcons.completed_solid,
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
                                                alpha: _progressGlowAnim.value),
                                            blurRadius: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
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
                      Icon(FluentIcons.shield,
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
      },
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
      ring = const Color(0xFF00E676);
      inner = const Icon(FluentIcons.check_mark, color: Colors.white, size: 16);
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
                ? [BoxShadow(color: ring.withValues(alpha: 0.5), blurRadius: 12)]
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
          ? const Color(0xFF00E676)
          : Colors.white.withValues(alpha: 0.12),
    );
  }
}
