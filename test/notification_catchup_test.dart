import 'package:cypurge_mobile/services/notification_service.dart';
import 'package:flutter_test/flutter_test.dart';

/// Guards the catch-up replay filter: the piece that decides which messages a
/// worker sees after their socket was dead. An off-by-one here either drops a
/// real alert or re-shows one they already dismissed.
void main() {
  Map<String, dynamic> msg(int id) => {'id': id, 'title': 'Trust status: RED'};

  // Gotify serves /message newest-first.
  final page = [msg(14), msg(13), msg(12), msg(11)];

  test('returns only messages past the high-water mark, oldest first', () {
    final got = NotificationService.messagesAfter(page, 12);

    expect(got.map((m) => m['id']), [13, 14]);
  });

  test('excludes the high-water mark itself, so nothing re-shows', () {
    final got = NotificationService.messagesAfter(page, 14);

    expect(got, isEmpty);
  });

  test('replays the whole page when nothing has been seen', () {
    final got = NotificationService.messagesAfter(page, 0);

    expect(got.map((m) => m['id']), [11, 12, 13, 14]);
  });
}
