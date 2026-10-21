import 'dart:async';

import 'package:flutter/material.dart';
import '../services/notification_inbox.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../theme/platform.dart';
import 'pending_approval_screen.dart';

/// The worker's bottom nav, chosen by approval state. [current] is the route
/// of the screen showing it.
///
/// While HR has not accepted the worker, only three tabs: the traffic light
/// (the waiting screen, which every gated route shows), re-verification and
/// the notifications bell. Those tabs replace the whole stack, so switching
/// back and forth never piles screens up behind a worker who cannot go
/// anywhere else yet.
class WorkerNavBar extends StatelessWidget {
  const WorkerNavBar(
      {super.key, required this.current, this.docsBadge = false});

  final String current;
  final bool docsBadge;

  static const _fullRoutes = [
    '/home',
    '/documents',
    '/status',
    '/reverify',
    '/profile'
  ];

  @override
  Widget build(BuildContext context) {
    if (!ApprovalGate.isPending) {
      final active = _fullRoutes.indexOf(current);
      return WTBottomNav(
        items: workerNavItems(context, active, docsBadge: docsBadge),
        activeIndex: active,
      );
    }
    void go(String route) {
      if (route == current) return;
      switchTab(context, route, TabMove.resetStack);
    }

    const routes = ['/status', '/reverify', '/notifications'];
    return ValueListenableBuilder<List<InboxItem>>(
      valueListenable: NotificationInbox.instance.items,
      builder: (context, items, _) => WTBottomNav(
        activeIndex: routes.indexOf(current),
        items: [
          WTNavItem(
              icon: Icons.shield_rounded,
              label: 'Status',
              onTap: () => go('/status')),
          WTNavItem(
              icon: Icons.sync_rounded,
              label: 'Re-verify',
              onTap: () => go('/reverify')),
          WTNavItem(
            icon: Icons.notifications_rounded,
            label: 'Alerts',
            badge: items.any((i) => !i.read),
            onTap: () => go('/notifications'),
          ),
        ],
      ),
    );
  }
}

/// Shared bottom-nav for the worker app's destination screens (Home, Profile).
/// Tabs 0/4 (Home/Profile) replace the current destination; 1/2/3 push the
/// existing Docs/Status/Re-verify flows so their back button returns here.
/// ponytail: not a persistent tab shell — Status/Docs/Re-verify are push-based
/// flows with their own headers; promoting them to an IndexedStack shell only
/// pays off if those screens lose their back buttons.
List<WTNavItem> workerNavItems(BuildContext context, int active,
    {bool docsBadge = false}) {
  void go(int i, String route, {bool replace = false}) {
    if (i == active) return;
    switchTab(context, route, replace ? TabMove.replace : TabMove.push);
  }

  return [
    WTNavItem(
        icon: Icons.home_rounded,
        label: 'Home',
        onTap: () => go(0, '/home', replace: true)),
    WTNavItem(
        icon: Icons.folder_rounded,
        label: 'Docs',
        badge: docsBadge,
        onTap: () => go(1, '/documents')),
    WTNavItem(
        icon: Icons.shield_rounded,
        label: 'Status',
        onTap: () => go(2, '/status')),
    WTNavItem(
        icon: Icons.sync_rounded,
        label: 'Re-verify',
        onTap: () => go(3, '/reverify')),
    WTNavItem(
        icon: Icons.person_rounded,
        label: 'Profile',
        onTap: () => go(4, '/profile', replace: true)),
  ];
}

/// How a tab switch changes the stack — the same three moves the nav always
/// made with pushNamed / pushReplacementNamed / pushNamedAndRemoveUntil.
enum TabMove { push, replace, resetStack }

/// Opens the named destination [route] with a [FadeThroughRoute] instead of
/// the platform slide. Only the transition changes: the page comes from the
/// app's own onGenerateRoute, with the same RouteSettings (name, no
/// arguments) pushNamed would have used, so gates, deep links and Back behave
/// exactly as before.
void switchTab(BuildContext context, String route, TabMove move) {
  final nav = Navigator.of(context);
  final settings = RouteSettings(name: route);
  final page = nav.widget.onGenerateRoute?.call(settings);
  if (page is! MaterialPageRoute) {
    // Not one of the app's platform pages (or no route table at all): let
    // the Navigator resolve the name the way it always did.
    unawaited(switch (move) {
      TabMove.push => nav.pushNamed(route),
      TabMove.replace => nav.pushReplacementNamed(route),
      TabMove.resetStack => nav.pushNamedAndRemoveUntil(route, (_) => false),
    });
    return;
  }
  // iOS keeps its own slide: it has no fade-through convention, and the
  // slide carries the edge-swipe back a pushed Docs/Status/Re-verify needs.
  final Route<Object?> next = Theme.of(context).platform == TargetPlatform.iOS
      ? page
      : FadeThroughRoute<Object?>(
          builder: page.builder,
          settings: page.settings,
          reduceMotion: AppTheme.reduceMotion(context),
        );
  unawaited(switch (move) {
    TabMove.push => nav.push(next),
    TabMove.replace => nav.pushReplacement(next),
    TabMove.resetStack => nav.pushAndRemoveUntil(next, (_) => false),
  });
}
