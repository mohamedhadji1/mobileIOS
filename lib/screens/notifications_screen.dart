import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/notification_inbox.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'worker_nav.dart';

/// The bell: every push this worker received, newest first.
///
/// Opening it marks everything read. Rows that were unread when it opened
/// keep their accent for this visit, so the worker can still see what is new.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final _inbox = NotificationInbox.instance;

  /// The entries that were unread when this screen opened.
  Set<InboxItem> _newAtOpen = const {};
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    unawaited(_open());
  }

  Future<void> _open() async {
    await _inbox.load();
    if (!mounted) return;
    setState(() {
      _newAtOpen = _inbox.items.value.where((i) => !i.read).toSet();
      _loaded = true;
    });
    await _inbox.markAllRead();
  }

  /// Marking read swaps the entry for a copy, so match on its content.
  bool _isNew(InboxItem item) =>
      !item.read ||
      _newAtOpen.any((n) =>
          n.id == item.id &&
          n.receivedAt == item.receivedAt &&
          n.title == item.title);

  @override
  Widget build(BuildContext context) {
    return WTPage(
      nav: const WorkerNavBar(current: '/notifications'),
      appBar: AppBar(title: const Text('Notifications')),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: !_loaded
                    ? const Padding(
                        padding: EdgeInsets.all(AppTheme.s4),
                        child: WTSkeletonList(count: 4, leading: false),
                      )
                    : ValueListenableBuilder<List<InboxItem>>(
                        valueListenable: _inbox.items,
                        builder: (context, items, _) =>
                            items.isEmpty ? _buildEmpty() : _buildList(items),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.notifications_rounded, size: 36, color: AppTheme.faint),
            const SizedBox(height: AppTheme.s4),
            Text('No notifications yet',
                textAlign: TextAlign.center, style: AppTheme.h2),
            const SizedBox(height: AppTheme.s2),
            Text(
              'Updates about your enrollment, documents and status will '
              'appear here.',
              textAlign: TextAlign.center,
              style: AppTheme.bodyMuted,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<InboxItem> items) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppTheme.s4),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppTheme.s3),
      itemBuilder: (_, i) => _buildRow(items[i]),
    );
  }

  Widget _buildRow(InboxItem item) {
    final isNew = _isNew(item);
    final route = item.route;
    final time = DateFormat('MMM d · HH:mm').format(item.receivedAt);
    return Semantics(
      button: route != null,
      label: '${isNew ? 'New. ' : ''}${item.title}. ${item.body}. $time',
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        // Same destination as tapping it in the shade.
        onTap: route == null
            ? null
            : () => Navigator.pushNamed(context, route, arguments: item.args),
        child: WTCard(
          small: true,
          leftAccent: isNew ? AppTheme.accent : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title,
                        style: TextStyle(
                            color: AppTheme.ink,
                            fontSize: 15,
                            fontWeight:
                                isNew ? FontWeight.w700 : FontWeight.w500)),
                    if (item.body.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(item.body, style: AppTheme.bodyMuted),
                    ],
                    const SizedBox(height: 6),
                    Text(time, style: AppTheme.caption),
                  ],
                ),
              ),
              if (route != null)
                Padding(
                  padding: const EdgeInsets.only(left: AppTheme.s2, top: 2),
                  child: Icon(Icons.chevron_right_rounded,
                      size: 14, color: AppTheme.faint),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
