import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// One push notification, kept for the notifications (bell) screen.
@immutable
class InboxItem {
  const InboxItem({
    this.id,
    required this.title,
    required this.body,
    this.route,
    this.args = const {},
    required this.receivedAt,
    this.read = false,
  });

  /// Gotify message id. A replayed message with an id already kept is skipped.
  final int? id;
  final String title;
  final String body;

  /// Where tapping it goes, as the shade notification would.
  final String? route;
  final Map<String, dynamic> args;
  final DateTime receivedAt;
  final bool read;

  InboxItem asRead() => InboxItem(
        id: id,
        title: title,
        body: body,
        route: route,
        args: args,
        receivedAt: receivedAt,
        read: true,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'route': route,
        'args': args,
        'at': receivedAt.toIso8601String(),
        'read': read,
      };

  /// Null for an entry that cannot be read back, so one bad entry never costs
  /// the worker the rest of the list.
  static InboxItem? fromJson(Object? json) {
    if (json is! Map) return null;
    final at = DateTime.tryParse('${json['at']}');
    if (at == null) return null;
    final args = json['args'];
    final route = json['route'];
    return InboxItem(
      id: (json['id'] as num?)?.toInt(),
      title: '${json['title'] ?? ''}',
      body: '${json['body'] ?? ''}',
      route: route is String ? route : null,
      args: args is Map ? Map<String, dynamic>.from(args) : const {},
      receivedAt: at,
      read: json['read'] == true,
    );
  }
}

/// [items] with [item] added: newest first, one entry per Gotify id, at most
/// [cap]. Unchanged (the same list) when the id is already kept.
@visibleForTesting
List<InboxItem> withItem(List<InboxItem> items, InboxItem item,
    {int cap = NotificationInbox.cap}) {
  if (item.id != null && items.any((i) => i.id == item.id)) return items;
  return [item, ...items].take(cap).toList();
}

/// Every push the worker received, saved on the device so the bell screen can
/// list them after the shade notification is gone.
///
/// Fed by NotificationService for live messages and for the ones replayed on
/// connect, so a push sent while the app was closed lands here too.
class NotificationInbox {
  NotificationInbox._();
  static final instance = NotificationInbox._();

  static const cap = 100;
  static const _key = 'notification_inbox';
  static const _storage = FlutterSecureStorage();

  /// Newest first.
  final items = ValueNotifier<List<InboxItem>>(const []);

  Future<void>? _loading;

  /// Writes run one after another: a catch-up adds many messages back to back.
  Future<void> _writes = Future.value();

  /// Reads the saved list once. Every change waits for it, so a change can
  /// never overwrite the saved list with an empty one.
  Future<void> load() => _loading ??= _read();

  Future<void> _read() async {
    try {
      final raw = await _storage.read(key: _key);
      if (raw == null || raw.isEmpty) return;
      items.value = List.unmodifiable((jsonDecode(raw) as List)
          .map(InboxItem.fromJson)
          .whereType<InboxItem>());
    } on Exception catch (e) {
      debugPrint('Notification inbox unreadable, starting empty: $e');
    }
  }

  Future<void> add(InboxItem item) => _update((list) => withItem(list, item));

  /// Unread entries are always the newest ones, because only this marks
  /// anything read.
  Future<void> markAllRead() => _update((list) => list.every((i) => i.read)
      ? list
      : [for (final i in list) i.read ? i : i.asRead()]);

  /// Signing out or enrolling another worker on this phone.
  Future<void> clear() => _update((list) => list.isEmpty ? list : const []);

  Future<void> _update(List<InboxItem> Function(List<InboxItem>) change) {
    return _writes = _writes.then((_) async {
      await load();
      final next = change(items.value);
      if (identical(next, items.value)) return;
      items.value = List.unmodifiable(next);
      await _storage.write(
          key: _key, value: jsonEncode([for (final i in next) i.toJson()]));
    }).catchError((Object e) {
      debugPrint('Notification inbox not saved: $e');
    });
  }
}
