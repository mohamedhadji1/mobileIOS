// Synthetic data for the screenshot harness. Nobody here is a real person.
import 'dart:convert';

import 'package:cypurge_mobile/services/notification_inbox.dart';

/// The bell list, newest first: one unread re-verification request (so the
/// Re-verify tab shows a real request and Home's bell shows its dot), one
/// unread reminder, one already read.
final List<InboxItem> demoInbox = List.unmodifiable([
  InboxItem(
    id: 9003,
    title: 'Documents needed again',
    body: 'acme-logistics asked you to re-upload 2 documents.',
    route: '/reverify',
    args: const {
      'message': 'The passport photo page was too blurred to read. '
          'Please retake it in good light.',
      'flagged_documents': ['Passport', 'National ID (Front)'],
      'deadline_days': 5,
    },
    receivedAt: DateTime(2026, 10, 6, 16, 42),
  ),
  InboxItem(
    id: 9002,
    title: 'Shift reminder',
    body: 'Your shift at Pier 4 starts at 07:00 tomorrow.',
    route: '/home',
    receivedAt: DateTime(2026, 10, 6, 9, 15),
  ),
  InboxItem(
    id: 9001,
    title: 'Enrollment received',
    body: "HR is reviewing your enrollment. We'll let you know.",
    route: '/status',
    receivedAt: DateTime(2026, 10, 3, 11, 5),
    read: true,
  ),
]);

/// Mock secure storage. Deliberately no `id_token` / `access_token`: without
/// a session the status calls stop before any gRPC request, so screens that
/// fetch status show their signed-out / unavailable state.
Map<String, String> demoStorage() => {
      'cypurge_worker_name': 'Amira Ben Salah',
      'worker_id': 'wkr-demo-0001',
      'tenant_slug': 'acme-logistics',
      // Documents screen: two uploaded, three still missing.
      'doc_uploaded_passport': 'true',
      'doc_uploaded_id_front': 'true',
      'notification_inbox':
          jsonEncode([for (final item in demoInbox) item.toJson()]),
    };
