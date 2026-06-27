import 'package:fluent_ui/fluent_ui.dart';
import '../theme/app_widgets.dart';

/// Shared bottom-nav for the worker app's destination screens (Home, Profile).
/// Tabs 0/4 (Home/Profile) replace the current destination; 1/2/3 push the
/// existing Docs/Status/Re-verify flows so their back button returns here.
/// ponytail: not a persistent tab shell — Status/Docs/Re-verify are push-based
/// flows with their own headers; promoting them to an IndexedStack shell only
/// pays off if those screens lose their back buttons.
List<WTNavItem> workerNavItems(BuildContext context, int active, {bool docsBadge = false}) {
  void go(int i, String route, {bool replace = false}) {
    if (i == active) return;
    if (replace) {
      Navigator.pushReplacementNamed(context, route);
    } else {
      Navigator.pushNamed(context, route);
    }
  }

  return [
    WTNavItem(icon: FluentIcons.home, label: 'Home', onTap: () => go(0, '/home', replace: true)),
    WTNavItem(icon: FluentIcons.documentation, label: 'Docs', badge: docsBadge, onTap: () => go(1, '/documents')),
    WTNavItem(icon: FluentIcons.shield, label: 'Status', onTap: () => go(2, '/status')),
    WTNavItem(icon: FluentIcons.sync, label: 'Re-verify', onTap: () => go(3, '/reverify')),
    WTNavItem(icon: FluentIcons.contact, label: 'Profile', onTap: () => go(4, '/profile', replace: true)),
  ];
}
