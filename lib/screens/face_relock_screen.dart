import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';

import '../services/enrollment_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'device_status_screen.dart';
import 'face_liveness_screen.dart';

/// How long the app may sit in the background before reopening it asks for
/// the worker's face again. Stops a signed-in phone being handed to someone
/// else: the check compares the live face with the worker's ID portrait.
const faceRelockAfter = Duration(minutes: 15);

/// Full-screen lock shown on reopen after [faceRelockAfter]. Back does not
/// dismiss it: the only ways out are passing the face check or signing out.
class FaceRelockScreen extends StatefulWidget {
  const FaceRelockScreen({super.key});

  @override
  State<FaceRelockScreen> createState() => _FaceRelockScreenState();
}

class _FaceRelockScreenState extends State<FaceRelockScreen> {
  bool _busy = false;

  Future<void> _scan() async {
    setState(() => _busy = true);
    final workerId = await EnrollmentService().resolveWorkerId();
    if (!mounted) return;
    if (workerId == null) {
      await signOutKeepingDevice(context);
      return;
    }
    final ok = await Navigator.push(
      context,
      platformRoute(
          builder: (_) =>
              FaceLivenessScreen(fullLiveness: false, userId: workerId)),
    );
    if (!mounted) return;
    if (ok == true) {
      Navigator.pop(context, true);
    } else {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: WTPage(
        content: SafeArea(
          child: WTFormBody(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(flex: 2),
                Icon(Icons.person_rounded, size: 56, color: AppTheme.accent),
                const SizedBox(height: 24),
                Text('Confirm it’s you',
                    textAlign: TextAlign.center, style: AppTheme.h1),
                const SizedBox(height: 10),
                Text(
                  'The app was closed for a while. Scan your face to go on.',
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyMuted,
                ),
                const Spacer(flex: 3),
                WTButton(
                  label: 'Scan my face',
                  icon: Icons.person_rounded,
                  loading: _busy,
                  onPressed: _busy ? null : _scan,
                ),
                const SizedBox(height: 10),
                WTButton(
                  label: 'Sign out',
                  kind: WTButtonKind.subtle,
                  onPressed: _busy ? null : () => signOutKeepingDevice(context),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
