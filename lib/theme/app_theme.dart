// Flutter 3.44 moved the iOS page transition out of material.dart.
import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';

/// Cypurge / WorkerTrust design system.
///
/// Dual palette: dark (v2, default) + light. Flip [light] then rebuild
/// (CypurgeApp.themeNotifier) to switch. Tokens are getters so every screen
/// follows the active palette. Colour tokens are NOT const for this reason —
/// use them in non-const contexts.
class AppTheme {
  AppTheme._();

  /// Active brightness. Toggle via the app bar; CypurgeApp rebuilds on change.
  /// Light is the default; dark stays available behind the toggle.
  static bool light = true;
  static Brightness get brightness =>
      light ? Brightness.light : Brightness.dark;

  static Color _p(Color dark, Color lite) => light ? lite : dark;

  /// Brand eye symbol (kit: TRIDOMA_Symbol_*_transparent): the light-background
  /// version in light mode, the dark-background one in dark mode, both in colour.
  static String get logoAsset => light ? 'assets/tridoma.png' : 'assets/tridoma_dark.png';

  // ── Palette: "Port Authority" ───────────────────────────────────────────────
  // Derived from the brand mark itself, not from a seed colour: the logo is
  // exactly navy #244878 and red #CC1824. The old palette was a generic cyan
  // (#0A6FB0) on cool blue-grey, which matched nothing in the brand.
  //
  // Light is a warm paper ground rather than a cool dashboard grey, so the app
  // reads as an official document. Every value below is contrast-checked
  // against bg / surface / surfaceAlt; the lowest pair is 4.6:1.
  static Color get bg => _p(const Color(0xFF0D1725), const Color(0xFFF2EFE8));
  static Color get nav => _p(const Color(0xFF16243A), const Color(0xFFFBF9F4));
  static Color get surface =>
      _p(const Color(0xFF16243A), const Color(0xFFFBF9F4));
  static Color get surfaceAlt =>
      _p(const Color(0xFF22375A), const Color(0xFFEFEAE0));
  static Color get hover =>
      _p(const Color(0xFF2A4267), const Color(0xFFE6E0D4));
  static Color get border =>
      _p(const Color(0xFF24344F), const Color(0xFFD5CEC0));
  static Color get border2 =>
      _p(const Color(0xFF35496B), const Color(0xFFBEB5A3));

  static Color get ink => _p(const Color(0xFFE8EEF7), const Color(0xFF1A2740));
  static Color get muted =>
      _p(const Color(0xFFA8B6CC), const Color(0xFF465471));
  static Color get faint =>
      _p(const Color(0xFF93A3BA), const Color(0xFF59637A));

  /// Fill/border only — 1.9:1 against every surface, never legible as text.
  static Color get disabled =>
      _p(const Color(0xFF47576F), const Color(0xFFC3BCAD));

  /// Interactive. This is the brand navy from the logo, unmodified.
  static Color get accent =>
      _p(const Color(0xFF7FA9DE), const Color(0xFF244878));
  static Color get accentLight =>
      _p(const Color(0xFFA3C4EA), const Color(0xFF35639C));
  static Color get accentSoft =>
      _p(const Color(0xFF1B2C46), const Color(0xFFE2E7F1));

  static Color get success =>
      _p(const Color(0xFF4CC79A), const Color(0xFF1F6B4A));
  static Color get warn => _p(const Color(0xFFE0AE4A), const Color(0xFF80550B));
  static Color get error =>
      _p(const Color(0xFFF4858C), const Color(0xFFB31E28));

  /// Brass. Deliberately NOT a status colour — it marks the credential itself
  /// (seal, foil, document eyebrow) so the one warm saturated moment in the
  /// app belongs to the thing the product exists to issue.
  static Color get brass =>
      _p(const Color(0xFFD9AE63), const Color(0xFF7F591C));

  /// Foreground for text/icons sitting on a *solid* accent or status fill.
  /// White works on the light palette (5.4:1 on accent) but collapses on the
  /// dark one — white on dark `accent` is 2.7:1 and on `success`/`warn` about
  /// 2:1. Deep navy on those same fills is 5.9-8.7:1.
  static Color get onAccent =>
      light ? const Color(0xFFFFFFFF) : const Color(0xFF0A2238);

  /// Text or an icon drawn on an [error] fill: white on the light theme's deep
  /// red, near-black on the dark theme's pale red.
  static Color get onError =>
      light ? const Color(0xFFFFFFFF) : const Color(0xFF2A0A0C);

  /// Error and success on a camera viewfinder, which is dark whichever theme
  /// the app is in — the light theme's deep red would vanish on it.
  static const Color cameraError = Color(0xFFF4858C);
  static const Color cameraSuccess = Color(0xFF4CC79A);

  /// Maps a status colour key ('green'/'red'/'amber') to a palette colour.
  static Color statusColor(String? key) => switch (key) {
        'green' => success,
        'red' => error,
        'amber' => warn,
        _ => accent,
      };

  /// Honours the OS "reduce motion" switch. Decorative animation — pulses,
  /// entrance slides, press scale — must be skipped when this is true.
  static bool reduceMotion(BuildContext context) =>
      MediaQuery.maybeDisableAnimationsOf(context) ?? false;

  /// [Duration] that collapses to zero under reduce-motion.
  static Duration motion(BuildContext context, int ms) =>
      reduceMotion(context) ? Duration.zero : Duration(milliseconds: ms);

  /// Soft tinted fill for a status/accent colour over the active surface.
  static Color tint(Color c) =>
      Color.alphaBlend(c.withValues(alpha: 0.12), surface);

  // ── Spacing (8pt rhythm) ──────────────────────────────────────────────────
  static const double s1 = 4;
  static const double s2 = 8;
  static const double s3 = 12;
  static const double s4 = 16;
  static const double s5 = 24;
  static const double s6 = 32;
  static const double s7 = 48;

  // ── Radii ─────────────────────────────────────────────────────────────────
  static const double rSm = 8;
  static const double rMd = 14;
  static const double rLg = 18;
  static const double rXl = 26;

  // ── Shadows ────────────────────────────────────────────────────────────────
  static List<BoxShadow> get cardShadow => light
      ? const [
          BoxShadow(
              color: Color(0x14312717), blurRadius: 18, offset: Offset(0, 8)),
          BoxShadow(
              color: Color(0x0A312717), blurRadius: 4, offset: Offset(0, 1)),
        ]
      : const [
          BoxShadow(
              color: Color(0x73000000), blurRadius: 18, offset: Offset(0, 8)),
          BoxShadow(
              color: Color(0x4D000000), blurRadius: 8, offset: Offset(0, 2)),
        ];

  static List<BoxShadow> accentShadow(Color c) => [
        BoxShadow(
            color: c.withValues(alpha: 0.30),
            blurRadius: 20,
            offset: const Offset(0, 8)),
      ];

  // ── Typography (getters: colour follows palette) ──────────────────────────
  // The brand face carries the headings only. Body, labels and controls fall
  // through to the platform's own face — Roboto on Android, San Francisco on
  // iOS — which both platforms expect for running text and reading sizes.
  static const String fontFamily = 'Quasimoda';

  static TextStyle get display => TextStyle(
      fontFamily: fontFamily,
      color: ink,
      fontSize: 28,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.8,
      height: 1.1);
  static TextStyle get h1 => TextStyle(
      fontFamily: fontFamily,
      color: ink,
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4);
  static TextStyle get h2 => TextStyle(
      fontFamily: fontFamily,
      color: ink,
      fontSize: 17,
      fontWeight: FontWeight.w600);
  static TextStyle get body => TextStyle(color: ink, fontSize: 15, height: 1.5);
  static TextStyle get bodyMuted =>
      TextStyle(color: muted, fontSize: 15, height: 1.5);
  static TextStyle get label => TextStyle(
      color: muted,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6);
  static TextStyle get caption => TextStyle(color: muted, fontSize: 12);

  // ── Material theme ───────────────────────────────────────────────────────
  /// Built fresh on every theme switch, because every token is a getter.
  static ThemeData theme() {
    final rounded =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(rMd));
    WidgetStateProperty<T> bySelection<T>(T selected, T idle) =>
        WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? selected : idle);
    final navLabel = bySelection(
      TextStyle(color: accent, fontSize: 12, fontWeight: FontWeight.w700),
      TextStyle(color: faint, fontSize: 12, fontWeight: FontWeight.w600),
    );
    return ThemeData(
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: accent,
        onPrimary: onAccent,
        primaryContainer: accentSoft,
        onPrimaryContainer: ink,
        secondary: accent,
        onSecondary: onAccent,
        error: error,
        onError: onError,
        surface: surface,
        onSurface: ink,
        onSurfaceVariant: muted,
        surfaceContainerHighest: surfaceAlt,
        outline: border2,
        outlineVariant: border,
        inverseSurface: ink,
        onInverseSurface: bg,
      ),
      scaffoldBackgroundColor: bg,
      canvasColor: bg,
      dividerColor: border,
      // No fontFamily: running text uses the platform face (see Typography).
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: ink,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: h2,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: nav,
        surfaceTintColor: Colors.transparent,
        indicatorColor: accentSoft,
        iconTheme: bySelection(
            IconThemeData(color: accent), IconThemeData(color: faint)),
        labelTextStyle: navLabel,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: nav,
        indicatorColor: accentSoft,
        selectedIconTheme: IconThemeData(color: accent),
        unselectedIconTheme: IconThemeData(color: faint),
        selectedLabelTextStyle: navLabel.resolve({WidgetState.selected}),
        unselectedLabelTextStyle: navLabel.resolve({}),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surface,
        contentTextStyle: body,
        actionTextColor: accent,
        closeIconColor: muted,
        behavior: SnackBarBehavior.floating,
        elevation: 6,
        shape: rounded.copyWith(side: BorderSide(color: border)),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rLg)),
        titleTextStyle: h2,
        contentTextStyle: body,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: accent,
        linearTrackColor: surfaceAlt,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: bySelection<Color?>(onAccent, null),
        trackColor: bySelection<Color?>(accent, null),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: bySelection<Color?>(accent, null),
        checkColor: WidgetStatePropertyAll(onAccent),
      ),
    );
  }

  // ── Reusable surface decoration ───────────────────────────────────────────
  static BoxDecoration card(
          {Color? color, Color? borderColor, double? radius}) =>
      BoxDecoration(
        color: color ?? surface,
        borderRadius: BorderRadius.circular(radius ?? rMd),
        border: Border.all(color: borderColor ?? border),
        boxShadow: cardShadow,
      );
}
