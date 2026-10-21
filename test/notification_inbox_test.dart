import 'package:cypurge_mobile/services/notification_inbox.dart';
import 'package:flutter_test/flutter_test.dart';

InboxItem item(int? id, {DateTime? at}) => InboxItem(
      id: id,
      title: 'Document expiring',
      body: 'Your passport expires soon.',
      route: '/documents',
      args: const {'type': 'DOCUMENT_EXPIRING'},
      receivedAt: at ?? DateTime(2026, 9, 16, 13, 5),
    );

void main() {
  test('newest first, and a replayed message is kept once', () {
    final list = withItem(withItem(const [], item(1)), item(2));
    expect(list.map((i) => i.id), [2, 1]);
    expect(identical(withItem(list, item(1)), list), isTrue);
  });

  test('messages without an id are never merged', () {
    final list = withItem(withItem(const [], item(null)), item(null));
    expect(list, hasLength(2));
  });

  test('keeps at most the cap, dropping the oldest', () {
    var list = const <InboxItem>[];
    for (var id = 1; id <= NotificationInbox.cap + 5; id++) {
      list = withItem(list, item(id));
    }
    expect(list, hasLength(NotificationInbox.cap));
    expect(list.first.id, NotificationInbox.cap + 5);
    expect(list.last.id, 6);
  });

  test('survives a save and a reload, read state included', () {
    final saved = item(7).asRead().toJson();
    final back = InboxItem.fromJson(saved)!;
    expect(back.id, 7);
    expect(back.read, isTrue);
    expect(back.route, '/documents');
    expect(back.args['type'], 'DOCUMENT_EXPIRING');
    expect(back.receivedAt, DateTime(2026, 9, 16, 13, 5));
    expect(InboxItem.fromJson({'title': 'no date'}), isNull);
  });
}
