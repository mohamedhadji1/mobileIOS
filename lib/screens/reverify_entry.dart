import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/notification_inbox.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/resubmission_message.dart';
import 're_verification_screen.dart';
import 'worker_nav.dart';

// What the Re-verify tab and a re-verification push open.
//
// The screen used to be built only from a push's arguments, so opening it from
// the tab — which passes none — showed the same canned request to every
// worker: "upload your Identity Document", whether anyone had asked or not.
//
// The worker role cannot list its re-verification requests: case.v1's
// ListReverificationRequests needs `case:read` and returns the whole tenant.
// But every request HR sends reaches the phone as a push, and the inbox keeps
// each push's route and arguments, so the tab shows the newest one.
// ponytail: the inbox is this phone's copy — a request whose push never
// arrived, or one HR has since withdrawn, is not known here. A worker-scoped
// "my open re-verification requests" RPC replaces this when the backend has
// one.

/// The re-verification screen for one request's arguments — a push payload,
/// or the copy of one kept in the inbox.
ReVerificationScreen reverifyScreenFor(Map<String, dynamic> args) {
  // The analyst's words only: the document list in the same text is already
  // drawn as rows on the screen below.
  final note = resubmissionNote('${args['message'] ?? args['reason'] ?? ''}');
  final docs = reverifyDocuments(args);
  return ReVerificationScreen(
    reason: note.isNotEmpty
        ? note
        : docs.every(isLivenessTask)
            ? 'Your organization asked you to repeat your face scan.'
            : 'Your organization asked you to upload these documents.',
    deadline: reverifyDeadline(args),
    flaggedDocuments: docs,
  );
}

/// The newest re-verification request that arrived after [answeredAt], the
/// last time this phone submitted one. Null when there is none.
InboxItem? latestReverifyPush(Iterable<InboxItem> items,
    {DateTime? answeredAt}) {
  InboxItem? newest;
  for (final item in items) {
    if (item.route != '/reverify') continue;
    if (answeredAt != null && !item.receivedAt.isAfter(answeredAt)) continue;
    if (newest == null || item.receivedAt.isAfter(newest.receivedAt)) {
      newest = item;
    }
  }
  return newest;
}

/// A compliance deadline from a request: `deadline` (ISO-8601) or
/// `deadline_days` (days from [now]). Null when neither is present.
DateTime? reverifyDeadline(Map<String, dynamic>? args, {DateTime? now}) {
  if (args == null) return null;
  final raw = args['deadline'];
  if (raw is String && raw.isNotEmpty) {
    final parsed = DateTime.tryParse(raw);
    if (parsed != null) return parsed;
  }
  final days = args['deadline_days'];
  final daysInt = days is int ? days : int.tryParse('${days ?? ''}');
  if (daysInt != null) {
    return (now ?? DateTime.now()).add(Duration(days: daysInt));
  }
  return null;
}

/// The documents a request names: a `List` or a comma-separated `String` under
/// `flagged_documents` / `documents`, else the list the dashboard writes into
/// the message ("Re-upload: A, B. …").
///
/// A request that names none still asks for a re-upload, so it falls back to
/// the identity document. Only a real request ever reaches that fallback — the
/// tab with nothing to show no longer gets here.
List<String> reverifyDocuments(Map<String, dynamic>? args) {
  final raw = args?['flagged_documents'] ?? args?['documents'];
  if (raw is List) {
    final list =
        raw.map((e) => e.toString().trim()).where((e) => e.isNotEmpty).toList();
    if (list.isNotEmpty) return list;
  }
  if (raw is String && raw.trim().isNotEmpty) {
    final list =
        raw.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    if (list.isNotEmpty) return list;
  }
  final fromText =
      parseFlaggedDocuments('${args?['message'] ?? args?['reason'] ?? ''}');
  if (fromText.isNotEmpty) return fromText;
  return const ['Identity Document'];
}

/// The Re-verify tab: the newest open request this phone was sent, or a plain
/// "nothing to do" when there is none.
class ReverifyFromInbox extends StatefulWidget {
  const ReverifyFromInbox({super.key});

  @override
  State<ReverifyFromInbox> createState() => _ReverifyFromInboxState();
}

class _ReverifyFromInboxState extends State<ReverifyFromInbox> {
  static const _storage = FlutterSecureStorage();
  bool _loading = true;
  InboxItem? _request;

  @override
  void initState() {
    super.initState();
    _resolve();
  }

  Future<void> _resolve() async {
    await NotificationInbox.instance.load();
    DateTime? answeredAt;
    try {
      final raw = await _storage.read(key: reverifyCompletedKey);
      answeredAt = raw == null ? null : DateTime.tryParse(raw);
    } on Exception {
      // Unreadable storage: show every request rather than hide a real one.
      answeredAt = null;
    }
    if (!mounted) return;
    setState(() {
      _request = latestReverifyPush(
        NotificationInbox.instance.items.value,
        answeredAt: answeredAt,
      );
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return WTPage(
        content: Center(child: WTSpinner(activeColor: AppTheme.accent)),
      );
    }
    final request = _request;
    if (request != null) return reverifyScreenFor(request.args);
    return const _NothingToReverify();
  }
}

class _NothingToReverify extends StatelessWidget {
  const _NothingToReverify();

  @override
  Widget build(BuildContext context) {
    return WTPage(
      nav: const WorkerNavBar(current: '/reverify'),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle_outline_rounded,
                            size: 40, color: AppTheme.success),
                        const SizedBox(height: 16),
                        Text('Nothing to re-verify',
                            style: AppTheme.h2, textAlign: TextAlign.center),
                        const SizedBox(height: 8),
                        Text(
                          "Your organization hasn't asked you to re-submit "
                          "anything. If they do, you'll get a notification and "
                          'the request will show here.',
                          style: AppTheme.caption,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
