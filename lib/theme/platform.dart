import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_theme.dart';

// The platform's own pieces: page routes, the spinner, and how a camera
// screen takes over the display. The transitions themselves live in
// AppTheme.theme()'s pageTransitionsTheme.

/// A page route with the platform's own transition: the iOS slide with its
/// edge-swipe back, and Android's predictive-back transition.
Route<T> platformRoute<T>({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool fullscreenDialog = false,
}) =>
    MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );

/// A move between top-level destinations — the nav tabs. The platform slide
/// says "one level deeper", which a tab switch is not, so this is Material's
/// fade-through instead: the old screen fades out to the page ground, then
/// the new one fades in while settling from 92% scale. Opacity and scale only.
///
/// Pass [reduceMotion] from `AppTheme.reduceMotion(context)`; it makes the
/// swap instant. The route is a plain PageRouteBuilder, so a platform page
/// underneath holds still rather than sliding away under the fade.
class FadeThroughRoute<T> extends PageRouteBuilder<T> {
  FadeThroughRoute({
    required WidgetBuilder builder,
    super.settings,
    bool reduceMotion = false,
  }) : super(
          transitionDuration: reduceMotion ? Duration.zero : fadeThroughIn,
          reverseTransitionDuration:
              reduceMotion ? Duration.zero : fadeThroughOut,
          pageBuilder: (context, _, __) => builder(context),
          transitionsBuilder: _fadeThrough,
        );

  /// Entering is eased out over 240ms; leaving (a pop) runs quicker.
  static const fadeThroughIn = Duration(milliseconds: 240);
  static const fadeThroughOut = Duration(milliseconds: 180);

  /// The share of the transition spent fading the old screen to the ground.
  static const double _outShare = 0.35;

  static Widget _fadeThrough(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final groundIn = CurvedAnimation(
        parent: animation,
        curve: const Interval(0, _outShare, curve: Curves.easeOut));
    final pageIn = CurvedAnimation(
        parent: animation,
        curve: const Interval(_outShare, 1, curve: Curves.easeOutCubic));
    return Stack(
      fit: StackFit.passthrough,
      children: [
        // The ground covering the old screen is drawn by this route, so the
        // midpoint is always the page colour — never a black gap, whatever
        // kind of route sits underneath.
        Positioned.fill(
          child: FadeTransition(
            opacity: groundIn,
            child: ColoredBox(color: AppTheme.bg),
          ),
        ),
        FadeTransition(
          opacity: pageIn,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.92, end: 1).animate(pageIn),
            child: child,
          ),
        ),
      ],
    );
  }
}

/// The platform's progress indicator — the Material spinner on Android, the
/// activity indicator on iOS. A determinate [value] keeps the Material ring on
/// both, because the iOS indicator cannot show progress.
class WTSpinner extends StatelessWidget {
  const WTSpinner({
    super.key,
    this.value,
    this.activeColor,
    this.strokeWidth = 4,
    this.backgroundColor,
  });

  final double? value;
  final Color? activeColor;
  final double strokeWidth;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final color = activeColor ?? AppTheme.accent;
    final progress = value;
    if (progress != null) {
      return CircularProgressIndicator(
        value: progress,
        color: color,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        // No semanticsValue: a determinate indicator reports its own value as
        // a number, and a string such as "40%" fails the semantics assertion.
        semanticsLabel: 'Progress',
      );
    }
    return CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      strokeWidth: strokeWidth,
      backgroundColor: backgroundColor,
      semanticsLabel: 'Loading',
    );
  }
}

/// Camera screens currently alive. A camera screen can open over another (the
/// face re-lock on resume), so only the last one to close restores the bars.
int _openCameraScreens = 0;

/// For a screen that is a camera viewfinder: the system bars step aside while
/// it shows and come back when it closes, and the screen holds portrait —
/// the face oval, document frame and capture math all assume an upright
/// sensor. Every other screen keeps the status bar and turns with the phone.
mixin CameraFullScreen<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    _openCameraScreens++;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    if (--_openCameraScreens == 0) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      // An empty list hands orientation back to the phone's own setting.
      SystemChrome.setPreferredOrientations(const []);
    }
    super.dispose();
  }
}
