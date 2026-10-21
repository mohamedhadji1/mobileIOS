import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';

import '../services/device_identity_service.dart';
import '../services/enrollment_service.dart';
import '../services/notification_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'face_liveness_screen.dart';
import 'pending_approval_screen.dart';

/// One login per phone. A worker is bound to one phone; any other phone waits
/// for HR (a swap), is refused, or belongs to someone else.
enum DeviceScreen { pending, rejected, taken, replaced }

/// The device screen for [state]; null when the worker may go on. A backend
/// that cannot say yet ([DeviceState.unknown]) lets the worker through.
DeviceScreen? screenFor(DeviceState state) => switch (state) {
      DeviceState.pending || DeviceState.none => DeviceScreen.pending,
      DeviceState.rejected => DeviceScreen.rejected,
      DeviceState.replaced => DeviceScreen.replaced,
      DeviceState.active || DeviceState.unknown => null,
    };

/// Where this phone stands. A phone the backend has no record of is registered
/// first (RegisterDevice), which on a phone that is not the worker's opens the
/// swap case for HR. [registerIfUnknown] also registers when the backend cannot
/// say — only for a deliberate sign-in, never on every launch, since each
/// RegisterDevice from a foreign phone opens a case.
Future<({DeviceScreen? screen, bool swapRequested})> checkDevice(
  String workerId, {
  bool registerIfUnknown = false,
}) async {
  final ids = DeviceIdentityService();
  var status = await ids.status();
  final unregistered = status.state == DeviceState.none ||
      (registerIfUnknown && status.state == DeviceState.unknown);
  if (unregistered) {
    if (await ids.bind(workerId) ==
        DeviceBindResult.registeredToAnotherAccount) {
      return (screen: DeviceScreen.taken, swapRequested: false);
    }
    status = await ids.status();
  }
  return (screen: screenFor(status.state), swapRequested: status.swapRequested);
}

/// After a password sign-in: check the phone, then the face, then the app.
Future<void> continueAfterSignIn(BuildContext context,
    {bool registerIfUnknown = true}) async {
  final workerId = await EnrollmentService().resolveWorkerId();
  if (!context.mounted) return;
  if (workerId == null) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
    return;
  }
  final device =
      await checkDevice(workerId, registerIfUnknown: registerIfUnknown);
  if (!context.mounted) return;
  final screen = device.screen;
  if (screen != null) {
    Navigator.pushAndRemoveUntil(
      context,
      platformRoute(
          builder: (_) => DeviceStatusScreen(
              screen: screen, swapRequested: device.swapRequested)),
      (r) => false,
    );
    return;
  }
  final faceOk = await Navigator.push(
    context,
    platformRoute(
        builder: (_) =>
            FaceLivenessScreen(fullLiveness: false, userId: workerId)),
  );
  if (!context.mounted || faceOk != true) return;
  Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
}

/// Signs the worker out of this phone. The phone keeps its identity, so the
/// next sign-in here is recognised as the same phone.
Future<void> signOutKeepingDevice(BuildContext context) async {
  await NotificationService().disconnect();
  await DeviceIdentityService().clearSessionKeepDevice();
  ApprovalGate.reset();
  if (context.mounted) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }
}

class DeviceStatusScreen extends StatefulWidget {
  const DeviceStatusScreen(
      {super.key, required this.screen, this.swapRequested = false});

  final DeviceScreen screen;

  /// Pending only: the worker asked HR for this swap first.
  final bool swapRequested;

  @override
  State<DeviceStatusScreen> createState() => _DeviceStatusScreenState();
}

class _DeviceStatusScreenState extends State<DeviceStatusScreen> {
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    // Refused, someone else's, or swapped out: this phone gets no session.
    if (widget.screen != DeviceScreen.pending) {
      DeviceIdentityService().clearSessionKeepDevice();
    }
  }

  (String, String) get _copy => switch (widget.screen) {
        DeviceScreen.pending => (
            'Waiting for HR to approve this phone',
            widget.swapRequested
                ? 'You asked HR for a new phone. They are checking this one. '
                    'You can sign in here once they approve it.'
                : 'This isn’t the phone your account is registered on. HR has '
                    'been told and is checking it. You can sign in here once '
                    'they approve it, or keep using your registered phone.',
          ),
        DeviceScreen.rejected => (
            'This phone was refused',
            'HR did not approve this phone for your account. Keep using your '
                'registered phone, or contact HR.',
          ),
        DeviceScreen.taken => (
            'This phone belongs to another account',
            'It is registered to another worker, so it can’t be used for '
                'yours. Use your own phone. HR has been told.',
          ),
        DeviceScreen.replaced => (
            'This is no longer your registered phone',
            'Your account moved to a new phone. Sign in on that phone.',
          ),
      };

  Future<void> _checkAgain() async {
    setState(() => _busy = true);
    // No registering here: the phone is already on record as pending.
    await continueAfterSignIn(context, registerIfUnknown: false);
    if (mounted) setState(() => _busy = false);
  }

  @override
  Widget build(BuildContext context) {
    final (heading, body) = _copy;
    final pending = widget.screen == DeviceScreen.pending;
    return WTPage(
      content: SafeArea(
        child: WTFormBody(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Icon(
                pending ? Icons.smartphone_rounded : Icons.block_rounded,
                size: 56,
                color: pending ? AppTheme.warn : AppTheme.error,
              ),
              const SizedBox(height: 24),
              Text(heading, textAlign: TextAlign.center, style: AppTheme.h1),
              const SizedBox(height: 10),
              Text(body,
                  textAlign: TextAlign.center, style: AppTheme.bodyMuted),
              const Spacer(flex: 3),
              if (pending) ...[
                WTButton(
                  label: 'Check again',
                  icon: Icons.refresh_rounded,
                  loading: _busy,
                  onPressed: _busy ? null : _checkAgain,
                ),
                const SizedBox(height: 10),
              ],
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
    );
  }
}
