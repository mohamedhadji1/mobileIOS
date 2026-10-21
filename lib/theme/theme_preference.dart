import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app_theme.dart';

/// Light or dark: the phone's own setting until the worker picks one in the
/// app, then their pick, remembered across launches.
///
/// The app used to start light whatever the phone was set to, and the switch
/// was forgotten on every restart.
class ThemePreference {
  ThemePreference._();

  /// Absent: follow the phone. Otherwise "light" or "dark".
  static const storageKey = 'theme_mode';
  static const _storage = FlutterSecureStorage();

  /// Repaints the app when the theme changes; CypurgeApp listens to it.
  static final notifier = ValueNotifier<Brightness>(AppTheme.brightness);

  static bool _chosen = false;

  /// True until the worker picks a theme in the app.
  static bool get followsSystem => !_chosen;

  /// Applies the stored pick, or the phone's setting when there is none. Runs
  /// before the first frame so the app never opens in the wrong theme.
  static Future<void> load({Brightness? system}) async {
    String? stored;
    try {
      stored = await _storage.read(key: storageKey);
    } on Exception {
      stored = null; // unreadable storage: follow the phone
    }
    _chosen = stored == 'light' || stored == 'dark';
    _apply(_chosen ? stored == 'light' : _isLight(system));
  }

  /// The phone's setting changed. Followed only while the worker hasn't chosen.
  static void systemChanged({Brightness? system}) {
    if (_chosen) return;
    _apply(_isLight(system));
  }

  /// The worker flipped the switch: apply it now and remember it.
  static Future<void> toggle() async {
    _chosen = true;
    _apply(!AppTheme.light);
    try {
      await _storage.write(
          key: storageKey, value: AppTheme.light ? 'light' : 'dark');
    } on Exception {
      // Applied for this session; it just won't survive a restart.
    }
  }

  static bool _isLight(Brightness? system) =>
      (system ??
          WidgetsBinding.instance.platformDispatcher.platformBrightness) ==
      Brightness.light;

  static void _apply(bool light) {
    AppTheme.light = light;
    notifier.value = AppTheme.brightness;
  }
}
