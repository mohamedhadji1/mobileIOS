import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../theme/theme_preference.dart';
import '../services/enrollment_service.dart';
import '../services/device_identity_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/error_humanizer.dart';
import '../utils/profile_photo.dart';
import 'device_status_screen.dart';
import 'selfie_capture_screen.dart';
import '../utils/worker_files.dart' show fetchWorkerFile;
import 'worker_files_screen.dart';
import 'worker_nav.dart';

/// Profile — mirrors the HTML mockup's Profile tab. Identity facts come from
/// secure storage + the live status service. The mockup's Notifications and
/// Biometric login switches are deliberately absent: nothing read them, and
/// a switch that changes nothing tells a worker something untrue.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _storage = const FlutterSecureStorage();
  final _service = EnrollmentService();

  String _name = 'Worker';
  String _tenant = 'Maritime Trust';
  WTTagKind _statusKind = WTTagKind.amber;
  String _statusLabel = 'Pending';

  bool _loading = true;
  String? _statusError;

  /// Set while sign-out or the device-change request is in flight. Both do
  /// several awaits and used to look inert the whole time.
  bool _busy = false;

  Uint8List? _photo;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final name = await _storage.read(key: 'cypurge_worker_name');
    final tenant = await _storage.read(key: 'tenant_slug') ??
        await _storage.read(key: 'tenant_id');
    final photo = await loadProfileSelfie();
    if (mounted) {
      setState(() {
        if (name != null && name.trim().isNotEmpty) _name = name.trim();
        if (tenant != null && tenant.isNotEmpty) _tenant = tenant;
        _photo = photo;
      });
    }
    try {
      final s = await _service.getWorkerStatus();
      if (!mounted) return;
      setState(() {
        _statusLabel = (s['status_title'] ?? 'PENDING').toString();
        _statusKind = switch (s['status_color']) {
          'green' => WTTagKind.green,
          'red' => WTTagKind.red,
          'amber' => WTTagKind.amber,
          _ => WTTagKind.blue,
        };
        _loading = false;
        _statusError = null;
      });
    } on Exception catch (e) {
      // Without this the screen kept showing the default 'Pending' as though
      // it had just been fetched.
      if (mounted) {
        setState(() {
          _loading = false;
          _statusError = humanizeError(e, action: 'load your profile');
        });
      }
    }
  }

  Future<void> _signOut() async {
    // Close the push stream BEFORE clearing storage. deleteAll() removes the
    // stored client token but cannot close a socket already open on it, so
    // without this the stream keeps running on the previous worker's token and
    // the next person to sign in on this phone receives their notifications.
    //
    // Under path D the token is per-worker, so this is the whole isolation
    // boundary on the device side: deleteAll() drops the token, and the next
    // worker provisions their own.
    // The phone keeps its identity (DeviceIdentityService.deviceKeys): wiping
    // it made the same phone look new at the next sign-in.
    setState(() => _busy = true);
    try {
      await signOutKeepingDevice(context);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  /// Worker wants to move to a new phone. Sent from THIS (the bound) phone,
  /// before the change: the new phone then registers without a colour change.
  /// Signing in on a new phone without asking makes the worker YELLOW.
  Future<void> _requestDeviceChange() async {
    final reason = TextEditingController();
    final send = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ask HR for a new phone'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your account works on this phone only. Ask HR first, then sign '
              'in on the new phone with your email and password. HR checks the '
              'new phone before it works.',
            ),
            const SizedBox(height: AppTheme.s3),
            WTFloatField(
              controller: reason,
              label: 'Why? For example: my phone broke',
              maxLength: 500,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(ctx, false),
          ),
          FilledButton(
            child: const Text('Send to HR'),
            onPressed: () => Navigator.pop(ctx, true),
          ),
        ],
      ),
    );
    final text = reason.text.trim();
    reason.dispose();
    if (send != true) return;

    setState(() => _busy = true);
    final result = await DeviceIdentityService()
        .requestDeviceSwap(reason: text.isEmpty ? 'No reason given' : text);
    if (!mounted) return;
    setState(() => _busy = false);
    final (title, body, severity) = switch (result) {
      SwapRequestResult.sent => (
          'Sent to HR',
          'Now sign in on your new phone with your email and password. It '
              'works once HR approves it.',
          WTSeverity.success,
        ),
      SwapRequestResult.notAvailable => (
          'Not available yet',
          'Phone changes can’t be requested from the app yet. Contact HR.',
          WTSeverity.warning,
        ),
      SwapRequestResult.notBoundPhone => (
          'Send it from your registered phone',
          'This isn’t the phone your account is registered on.',
          WTSeverity.warning,
        ),
      SwapRequestResult.failed => (
          'Could not send',
          'No connection to the server. Try again later.',
          WTSeverity.warning,
        ),
    };
    wtInfoBar(context, title, message: body, severity: severity);
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      nav: WTBottomNav(items: workerNavItems(context, 4), activeIndex: 4),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                      AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: wtStagger([
                      Row(
                        children: [
                          Expanded(
                              child: Text('Profile', style: AppTheme.display)),
                          WTIconButton(
                            icon: AppTheme.light
                                ? Icons.dark_mode_rounded
                                : Icons.light_mode_rounded,
                            label: AppTheme.light
                                ? 'Switch to dark theme'
                                : 'Switch to light theme',
                            color: AppTheme.muted,
                            onPressed: () =>
                                unawaited(ThemePreference.toggle()),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.s3),
                      if (_statusError != null)
                        WTAlert(_statusError!, kind: WTAlertKind.warning),
                      _header(),
                      const SizedBox(height: AppTheme.s5),
                      const WTSectionLabel('Personal info'),
                      WTCard(
                        small: true,
                        child: Column(children: [
                          WTListRow(label: 'Organisation', valueText: _tenant),
                          WTListRow(
                              label: 'Verification',
                              trailing: WTSwitcher(
                                stateKey: _loading ? '' : _statusLabel,
                                alignment: AlignmentDirectional.centerEnd,
                                child: Text(
                                    _loading ? 'Checking...' : _statusLabel,
                                    style: TextStyle(
                                        color: AppTheme.ink,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ),
                              last: true),
                        ]),
                      ),
                      const SizedBox(height: AppTheme.s4),
                      WTButton(
                        label: 'Your files',
                        kind: WTButtonKind.subtle,
                        icon: Icons.folder_open_rounded,
                        small: true,
                        onPressed: _openFiles,
                      ),
                      const SizedBox(height: AppTheme.s2),
                      WTButton(
                        label: 'Ask HR for a new phone',
                        kind: WTButtonKind.subtle,
                        icon: Icons.smartphone_rounded,
                        small: true,
                        loading: _busy,
                        onPressed: _busy ? null : _requestDeviceChange,
                      ),
                      const SizedBox(height: AppTheme.s2),
                      WTButton(
                        label: 'Sign out',
                        kind: WTButtonKind.danger,
                        icon: Icons.logout_rounded,
                        small: true,
                        loading: _busy,
                        onPressed: _busy ? null : _signOut,
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// The worker's own files on record. Its "Upload a document" swaps this
  /// screen for the Docs tab, so Back still returns to Profile.
  void _openFiles() {
    unawaited(Navigator.push(
      context,
      platformRoute(
        builder: (ctx) => WorkerFilesScreen(
          fetchFile: fetchWorkerFile,
          onUpload: () => Navigator.pushReplacementNamed(ctx, '/documents'),
        ),
      ),
    ));
  }

  /// Retake the avatar. `profileOnly` so this writes the display copy and NOT
  /// `enroll_selfie` — that key is sent as `doc_face` on every liveness stream,
  /// so letting a photo picker write it would hand the worker the choice of
  /// which face they are matched against.
  Future<void> _changePhoto() async {
    final taken = await Navigator.push<bool>(
      context,
      platformRoute(
          builder: (_) => const SelfieCaptureScreen(profileOnly: true)),
    );
    if (taken != true || !mounted) return;
    final photo = await readProfileSelfie();
    if (mounted) setState(() => _photo = photo);
  }

  Widget _header() {
    return Column(
      children: [
        Semantics(
            button: true,
            label: 'Change profile photo',
            excludeSemantics: true,
            child: GestureDetector(
              onTap: _changePhoto,
              child: Stack(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [AppTheme.accent, AppTheme.accentLight]),
                      boxShadow: [
                        BoxShadow(
                            color: AppTheme.accent.withValues(alpha: 0.4),
                            blurRadius: 18,
                            offset: const Offset(0, 6))
                      ],
                    ),
                    // Gradient stays behind the photo as the fallback surface, so a
                    // missing or undecodable selfie still looks designed.
                    child: _photo == null
                        ? Center(
                            // onAccent, not white: the dark theme's accent is
                            // a pale blue, and white on it was about 2:1.
                            child: Text(wtInitials(_name),
                                style: TextStyle(
                                    color: AppTheme.onAccent,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800)),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.memory(_photo!,
                                fit: BoxFit.cover,
                                width: 80,
                                height: 80,
                                // Decode at the size shown, not the camera's.
                                cacheWidth: (80 *
                                        MediaQuery.devicePixelRatioOf(context))
                                    .round()),
                          ),
                  ),
                  // Camera badge — without it a tappable avatar is invisible
                  // affordance, and this is currently the only way a worker whose
                  // enrollment selfie was consumed can get a picture at all.
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.bg, width: 2),
                      ),
                      child: Icon(Icons.photo_camera_rounded,
                          size: 11, color: AppTheme.accent),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: AppTheme.s3),
        Text(_name, style: AppTheme.h1),
        const SizedBox(height: 4),
        Text('worker · $_tenant', style: AppTheme.caption),
        const SizedBox(height: AppTheme.s3),
        // A placeholder while the status loads, so the default "Pending" is
        // never shown as though it had been fetched; then a crossfade.
        WTSwitcher(
          stateKey: _loading ? '' : '$_statusKind:$_statusLabel',
          alignment: Alignment.center,
          child: _loading
              ? const WTSkeleton(width: 84, height: 24, radius: AppTheme.rSm)
              : WTTag(_statusLabel, kind: _statusKind),
        ),
      ],
    );
  }
}
