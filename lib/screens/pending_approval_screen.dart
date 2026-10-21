import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/enrollment_service.dart';
import '../services/notification_inbox.dart';
import '../services/notification_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/decision_note.dart';
import 'device_status_screen.dart';
import 'worker_nav.dart';

/// Gates the daily app behind HR acceptance.
///
/// A freshly-enrolled worker stays locked on [PendingApprovalScreen] until the
/// backend traffic light first turns GREEN (HR adjudication). That first GREEN
/// is remembered for the session only (never persisted), so an already-accepted
/// worker who later degrades to AMBER/RED keeps full app access (they need the
/// re-verify tab to fix it) and no network round-trip runs on later opens.
///
/// ponytail: UX gate only — backend RBAC still enforces authorization; a
/// network failure fails open rather than bricking the app offline.
class ApprovalGate extends StatefulWidget {
  final Widget child;

  /// Let a signed-in but not-yet-accepted worker through. Only /reverify sets
  /// this: a reviewer who sends an enrollment back needs the worker to reach
  /// the re-upload screen, and that worker is by definition still pending.
  /// Unauthenticated callers are still denied.
  final bool allowPending;

  const ApprovalGate(
      {super.key, required this.child, this.allowPending = false});

  /// Clears the session cache — call when a new worker enrolls so the previous
  /// worker's acceptance doesn't leak into this session.
  static void reset() {
    _ApprovalGateState._acceptedThisSession = false;
    _ApprovalGateState._cleared = null;
    _ApprovalGateState._deviceCheckedThisSession = false;
  }

  /// A signed-in screen is on show. The face check on reopen only runs then.
  static bool get isShowing => _ApprovalGateState._showing > 0;

  /// The last status check said HR has not accepted this worker yet. The nav
  /// bar then offers only what a waiting worker can use. False when nothing
  /// was checked, or the check failed and the gate failed open.
  static bool get isPending => _ApprovalGateState._cleared == false;

  @override
  State<ApprovalGate> createState() => _ApprovalGateState();
}

class _ApprovalGateState extends State<ApprovalGate> {
  static const _storage = FlutterSecureStorage();
  // Session cache: once resolved, tab switches don't re-check.
  static bool _acceptedThisSession = false;
  // Result of the last status check that got an answer.
  static bool? _cleared;

  // One login per phone: checked once a session, before anything else.
  static bool _deviceCheckedThisSession = false;
  static int _showing = 0;

  bool? _accepted; // null = checking
  String _statusTitle = 'PENDING';
  String _statusColor = 'amber';
  ({DeviceScreen? screen, bool swapRequested})? _device;

  @override
  void initState() {
    super.initState();
    _showing++;
    _check();
    // Every authenticated screen is wrapped in this gate, so this is the one
    // place that reliably means "a worker is signed in" — the earliest point a
    // per-worker Gotify token can exist. Previously push started in main()'s
    // initState, before login. initialize() self-guards, so the repeat calls
    // from tab switches cost nothing.
    unawaited(NotificationService().initialize());
    // The nav bar's unread dot reads it.
    unawaited(NotificationInbox.instance.load());
  }

  @override
  void dispose() {
    _showing--;
    super.dispose();
  }

  Future<void> _check() async {
    if (!_deviceCheckedThisSession) {
      setState(() => _accepted = null);
      final workerId = await EnrollmentService().resolveWorkerId();
      if (workerId != null) {
        final device = await checkDevice(workerId);
        if (device.screen != null) {
          if (mounted) setState(() => _device = device);
          return;
        }
      }
      _deviceCheckedThisSession = true;
    }
    if (_acceptedThisSession) {
      setState(() => _accepted = true);
      return;
    }
    setState(() => _accepted = null);
    try {
      // Deliberately NOT reading a persisted 'hr_accepted' flag any more. Caching
      // approval to disk meant the gate stopped asking after the first green, so a
      // worker later suspended or blocked kept full app access indefinitely. Any
      // value written by an older build is cleared here.
      await _storage.delete(key: 'hr_accepted');

      final status = await EnrollmentService().getWorkerStatus();
      _statusTitle = (status['status_title'] ?? 'PENDING').toString();
      _statusColor = (status['status_color'] ?? 'amber').toString();
      _cleared = status['cleared'] == true;
      // `cleared`, not the colour. Amber covers both "cleared but elevated
      // risk" (YELLOW — that worker needs the app to reach their re-verify
      // tasks) and "nothing decided yet", and only the first opens the gate.
      if (status['cleared'] == true) {
        // Session-scoped only, so a revocation lands on the next launch.
        _acceptedThisSession = true;
        if (mounted) setState(() => _accepted = true);
      } else {
        if (mounted) setState(() => _accepted = widget.allowPending);
      }
    } on AuthRequiredException catch (e) {
      // No session on this device. Failing open here handed an unauthenticated
      // caller /home, /documents, /status, /tasks and /profile — deny instead.
      debugPrint('ApprovalGate: no session, denying ($e)');
      if (mounted) {
        setState(() {
          _statusTitle = 'SIGN IN REQUIRED';
          _accepted = false;
        });
      }
    } on Exception catch (e) {
      // Transport/backend failure only. A worker who is already approved should
      // not be locked out of their own app by a network blip, so this branch
      // stays open — but it is now genuinely limited to "the check could not be
      // performed", never "there is nobody signed in".
      debugPrint('ApprovalGate: status check failed, failing open ($e)');
      if (mounted) setState(() => _accepted = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = _device;
    final deviceScreen = device?.screen;
    if (device != null && deviceScreen != null) {
      return DeviceStatusScreen(
          screen: deviceScreen, swapRequested: device.swapRequested);
    }
    return switch (_accepted) {
      true => widget.child,
      false => PendingApprovalScreen(
          statusTitle: _statusTitle,
          statusColor: _statusColor,
          onRefresh: _check,
        ),
      null => WTPage(
          content: Center(child: WTSpinner(activeColor: AppTheme.accent)),
        ),
    };
  }
}

/// Shown while HR has not yet accepted the enrollment. It is the waiting
/// worker's Status tab: the traffic light, and a nav bar limited to status,
/// re-verification and notifications.
class PendingApprovalScreen extends StatelessWidget {
  final String statusTitle;

  /// The backend's traffic-light colour: green, amber or red.
  final String statusColor;
  final Future<void> Function() onRefresh;
  const PendingApprovalScreen({
    super.key,
    required this.statusTitle,
    this.statusColor = 'amber',
    required this.onRefresh,
  });

  WTTagKind get _lightKind => switch (statusColor) {
        'green' => WTTagKind.green,
        'red' => WTTagKind.red,
        _ => _suspended ? WTTagKind.red : WTTagKind.amber,
      };

  bool get _suspended => statusTitle.toUpperCase() == 'SUSPENDED';

  /// The status check never got an answer. Distinct from "awaiting approval":
  /// telling a worker their enrollment is under review, when in fact nothing
  /// was reached, sends them to HR over what is a connectivity problem.
  bool get _unreachable => statusTitle.toUpperCase() == 'CANNOT REACH SERVER';

  String get _heading {
    if (_unreachable) return 'Can’t reach the server';
    if (_suspended) return 'Account suspended';
    return 'Awaiting HR approval';
  }

  String get _body {
    if (_unreachable) {
      return 'We could not check your status — the server did not respond. '
          'Check your connection and try again.';
    }
    if (_suspended) {
      return 'Your account was suspended by your organization. If you think '
          'this is a mistake, contact your HR department.';
    }
    return 'Your enrollment is complete and under review. You will get access '
        'as soon as HR approves your profile.';
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      nav: const WorkerNavBar(current: '/status'),
      content: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Scrolls when the reviewer's note or large text outgrows the screen.
              child: WTFormBody(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(flex: 2),
                    Center(
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: Image.asset(AppTheme.logoAsset, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      _heading,
                      textAlign: TextAlign.center,
                      style: AppTheme.h1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _body,
                      textAlign: TextAlign.center,
                      style: AppTheme.bodyMuted,
                    ),
                    const SizedBox(height: 20),
                    WTTrafficLight(
                      kind: _lightKind,
                      label: statusTitle.toUpperCase(),
                      subtitle: 'Your trust status',
                    ),
                    // Why. The reviewer's message arrives only inside the block push
                    // and is saved from there (DecisionNoteStore); without it the
                    // worker was told "suspended" and nothing they could act on.
                    if (_suspended)
                      FutureBuilder<DecisionNote?>(
                        future: const DecisionNoteStore().read(),
                        builder: (context, snap) {
                          final note = snap.data;
                          if (note == null) return const SizedBox.shrink();
                          return Padding(
                            padding: const EdgeInsets.only(top: AppTheme.s5),
                            child: _DecisionNoteCard(note: note),
                          );
                        },
                      ),
                    const Spacer(flex: 3),
                    WTButton(
                      label: 'Check again',
                      icon: Icons.refresh_rounded,
                      onPressed: onRefresh,
                    ),
                    const SizedBox(height: 10),
                    WTButton(
                      label: 'Back to sign in',
                      kind: WTButtonKind.subtle,
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The reviewer's own words, set apart from the app's copy above it: a quoted
/// message from a person, not a status line. Scrolls rather than overflowing
/// when an analyst wrote a paragraph.
class _DecisionNoteCard extends StatelessWidget {
  const _DecisionNoteCard({required this.note});
  final DecisionNote note;

  @override
  Widget build(BuildContext context) {
    final at = note.at;
    return WTCard(
      leftAccent: AppTheme.error,
      semanticLabel: 'Message from your organization: ${note.reason}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Message from your organization', style: AppTheme.caption),
          const SizedBox(height: AppTheme.s2),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 180),
            child: SingleChildScrollView(
              child: Text(note.reason, style: AppTheme.body),
            ),
          ),
          if (at != null) ...[
            const SizedBox(height: AppTheme.s2),
            Text(
              'Received ${at.day}/${at.month}/${at.year}',
              style: AppTheme.caption,
            ),
          ],
        ],
      ),
    );
  }
}
