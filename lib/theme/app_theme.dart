import 'package:fluent_ui/fluent_ui.dart';

/// Cypurge / WorkerTrust design system.
///
/// Dual palette: dark (v2, default) + light. Flip [light] then rebuild
/// (CypurgeApp.themeNotifier) to switch. Tokens are getters so every screen
/// follows the active palette. Colour tokens are NOT const for this reason —
/// use them in non-const contexts.
class AppTheme {
  AppTheme._();

  /// Active brightness. Toggle via the app bar; CypurgeApp rebuilds on change.
  static bool light = false;
  static Brightness get brightness => light ? Brightness.light : Brightness.dark;

  static Color _p(Color dark, Color lite) => light ? lite : dark;

  // ── Palette (maritime: deep harbor navy + ocean cyan, brass, coral) ─────────
  // ponytail: dark = navy not black; every screen reads these getters, so this
  // is the whole "maritime, no black background" restyle.
  static Color get bg => _p(const Color(0xFF0A2238), const Color(0xFFEAF1F7));
  static Color get nav => _p(const Color(0xFF0D2A44), const Color(0xFFFFFFFF));
  static Color get surface => _p(const Color(0xFF103253), const Color(0xFFFFFFFF));
  static Color get surfaceAlt => _p(const Color(0xFF163A5E), const Color(0xFFEFF4F9));
  static Color get hover => _p(const Color(0xFF1C476E), const Color(0xFFE3ECF4));
  static Color get border => _p(const Color(0xFF20466B), const Color(0xFFD8E2EC));
  static Color get border2 => _p(const Color(0xFF315F8A), const Color(0xFFC3D0DD));

  static Color get ink => _p(const Color(0xFFEAF3FB), const Color(0xFF0C2236));
  static Color get muted => _p(const Color(0xFF9FB6CC), const Color(0xFF4C6076));
  static Color get faint => _p(const Color(0xFF6A86A2), const Color(0xFF7E8FA1));
  static Color get disabled => _p(const Color(0xFF42627F), const Color(0xFFAEBECD));

  static Color get accent => _p(const Color(0xFF34A7E0), const Color(0xFF0A6FB0));
  static Color get accentLight => _p(const Color(0xFF5BC0EE), const Color(0xFF1E86CC));
  static Color get accentSoft => _p(const Color(0xFF12324E), const Color(0xFFDDEEF9));

  static Color get success => _p(const Color(0xFF35D0A0), const Color(0xFF12876B));
  static Color get warn => _p(const Color(0xFFF2B33D), const Color(0xFFAD7A14));
  static Color get error => _p(const Color(0xFFFF6B78), const Color(0xFFD13438));

  /// Maps a status colour key ('green'/'red'/'amber') to a palette colour.
  static Color statusColor(String? key) => switch (key) {
        'green' => success,
        'red' => error,
        'amber' => warn,
        _ => accent,
      };

  /// Soft tinted fill for a status/accent colour over the active surface.
  static Color tint(Color c) => Color.alphaBlend(c.withValues(alpha: 0.12), surface);

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
          BoxShadow(color: Color(0x14101828), blurRadius: 18, offset: Offset(0, 8)),
          BoxShadow(color: Color(0x0A101828), blurRadius: 4, offset: Offset(0, 1)),
        ]
      : const [
          BoxShadow(color: Color(0x73000000), blurRadius: 18, offset: Offset(0, 8)),
          BoxShadow(color: Color(0x4D000000), blurRadius: 8, offset: Offset(0, 2)),
        ];

  static List<BoxShadow> accentShadow(Color c) => [
        BoxShadow(color: c.withValues(alpha: 0.30), blurRadius: 20, offset: const Offset(0, 8)),
      ];

  // ── Typography (getters: colour follows palette) ──────────────────────────
  static const String fontFamily = 'Quasimoda';

  static TextStyle get display => TextStyle(
      color: ink, fontSize: 28, fontWeight: FontWeight.w800, letterSpacing: -0.8, height: 1.1);
  static TextStyle get h1 =>
      TextStyle(color: ink, fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: -0.4);
  static TextStyle get h2 => TextStyle(color: ink, fontSize: 17, fontWeight: FontWeight.w600);
  static TextStyle get body => TextStyle(color: ink, fontSize: 15, height: 1.5);
  static TextStyle get bodyMuted => TextStyle(color: muted, fontSize: 15, height: 1.5);
  static TextStyle get label => TextStyle(
      color: faint, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.6);
  static TextStyle get caption => TextStyle(color: faint, fontSize: 12);

  // ── FluentThemeData ──────────────────────────────────────────────────────
  static FluentThemeData theme() => FluentThemeData(
        brightness: brightness,
        scaffoldBackgroundColor: bg,
        cardColor: surface,
        fontFamily: fontFamily,
        accentColor: AccentColor.swatch(<String, Color>{
          'darkest': const Color(0xFF073049),
          'darker': const Color(0xFF0A4D74),
          'dark': const Color(0xFF0E6A95),
          'normal': accent,
          'light': accentLight,
          'lighter': const Color(0xFF7FCEF2),
          'lightest': const Color(0xFFB3E2F8),
        }),
      );

  // ── Reusable surface decoration ───────────────────────────────────────────
  static BoxDecoration card({Color? color, Color? borderColor, double? radius}) =>
      BoxDecoration(
        color: color ?? surface,
        borderRadius: BorderRadius.circular(radius ?? rMd),
        border: Border.all(color: borderColor ?? border),
        boxShadow: cardShadow,
      );

  /// Primary blue button style.
  static ButtonStyle primaryButton() => ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.disabled) ? accent.withValues(alpha: 0.4) : accent),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        padding:
            WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 14, horizontal: 18)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(rMd)),
        ),
        elevation: WidgetStateProperty.all(0),
      );
}
