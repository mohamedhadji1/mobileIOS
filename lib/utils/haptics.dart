import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

/// Tactile confirmation that survives the device's haptics settings.
///
/// Flutter's own [HapticFeedback] routes to `View.performHapticFeedback` on
/// Android, which **silently does nothing** when the system touch/keyboard
/// haptics toggle is off — and Flutter exposes no way to pass
/// `FLAG_IGNORE_GLOBAL_SETTING`. That was measured on real hardware during a
/// liveness run: the call fired for all six steps and the phone never buzzed.
///
/// So drive the Vibrator service directly (VIBRATE permission, declared in
/// AndroidManifest.xml; Core Haptics on iOS) and keep [HapticFeedback] purely as
/// the fallback for devices with no vibrator motor.
///
/// Durations are short on purpose: this fires mid-gesture while the worker is
/// holding a pose, so it must register without being startling enough to make
/// them move and fail the step it is confirming.
class Haptics {
  const Haptics._();

  /// Cached because `hasVibrator()` is a platform round-trip and this runs once
  /// per challenge step, on a path already short of frame budget.
  static bool? _hasVibrator;

  static Future<bool> _vibratorAvailable() async {
    final cached = _hasVibrator;
    if (cached != null) return cached;
    try {
      final has = await Vibration.hasVibrator();
      _hasVibrator = has;
      return has;
    } on Exception catch (e) {
      // Never let a haptics probe break the flow it decorates.
      debugPrint('Haptics: hasVibrator() failed, falling back — $e');
      _hasVibrator = false;
      return false;
    }
  }

  static Future<void> _buzz(int ms, Future<void> Function() fallback) async {
    try {
      if (await _vibratorAvailable()) {
        await Vibration.vibrate(duration: ms);
        return;
      }
    } on Exception catch (e) {
      debugPrint('Haptics: vibrate() failed, falling back — $e');
    }
    await fallback();
  }

  /// One challenge step cleared.
  static Future<void> stepPassed() => _buzz(60, HapticFeedback.mediumImpact);

  /// A challenge step was missed and is about to be retried.
  ///
  /// Longer and blunter than [stepPassed]: the worker is holding a pose and
  /// watching their own face, not the screen, so "that did not count" has to be
  /// tellable from "that counted" by feel alone. Still ONE pulse — two pulses is
  /// [failure], which means the whole check is over.
  static Future<void> stepMissed() => _buzz(140, HapticFeedback.heavyImpact);

  /// The whole liveness check passed — longer than [stepPassed] so "finished"
  /// is distinguishable by feel from "one more step done".
  static Future<void> success() => _buzz(220, HapticFeedback.heavyImpact);

  /// Liveness failed. Two pulses, because one long buzz reads as success to a
  /// worker who is not looking at the screen.
  static Future<void> failure() async {
    try {
      if (await _vibratorAvailable()) {
        // pattern is [wait, buzz, wait, buzz]
        await Vibration.vibrate(pattern: const [0, 120, 90, 120]);
        return;
      }
    } on Exception catch (e) {
      debugPrint('Haptics: failure pattern failed, falling back — $e');
    }
    await HapticFeedback.vibrate();
  }
}
