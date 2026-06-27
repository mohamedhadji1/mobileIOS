import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'app_theme.dart';

/// Floating-label input (Material's native animated label, AppTheme-styled).
/// Reused across every enrollment form so inputs share one layout.
class WTFloatField extends StatelessWidget {
  const WTFloatField({
    super.key,
    required this.label,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  final String label;
  final TextEditingController? controller;
  final IconData? icon;
  final bool obscureText;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  m.OutlineInputBorder _border(Color c, [double w = 1]) => m.OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.rSm),
        borderSide: m.BorderSide(color: c, width: w),
      );

  @override
  Widget build(BuildContext context) {
    return m.Material(
      type: m.MaterialType.transparency,
      child: m.TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLines: obscureText ? 1 : maxLines,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        cursorColor: AppTheme.accent,
        style: TextStyle(color: AppTheme.ink, fontSize: 15),
        decoration: m.InputDecoration(
          labelText: label,
          floatingLabelBehavior: m.FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: AppTheme.faint, fontSize: 15),
          floatingLabelStyle: TextStyle(color: AppTheme.accent, fontSize: 13, fontWeight: FontWeight.w600),
          prefixIcon: icon == null ? null : Icon(icon, color: AppTheme.muted, size: 18),
          filled: true,
          fillColor: AppTheme.surfaceAlt,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          enabledBorder: _border(AppTheme.border),
          focusedBorder: _border(AppTheme.accent, 1.5),
          errorBorder: _border(AppTheme.error),
          focusedErrorBorder: _border(AppTheme.error, 1.5),
          errorStyle: TextStyle(color: AppTheme.error, fontSize: 12),
        ),
      ),
    );
  }
}

/// WorkerTrust UI kit (light edition) â€” smooth, animated Flutter components.
/// Cards float on white with soft shadows, buttons/cards give a subtle press
/// scale, and [WTEntrance] fades+slides content in for a polished reveal.

// â”€â”€ Press-scale wrapper (smooth tactile feedback) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class _PressScale extends StatefulWidget {
  const _PressScale({required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;

  @override
  State<_PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<_PressScale> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    if (widget.onTap == null) return widget.child;
    return GestureDetector(
      onTapDown: (_) => setState(() => _down = true),
      onTapUp: (_) => setState(() => _down = false),
      onTapCancel: () => setState(() => _down = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _down ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

// â”€â”€ Entrance animation (fade + slide up, optional stagger delay) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class WTEntrance extends StatefulWidget {
  const WTEntrance({super.key, required this.child, this.delayMs = 0});
  final Widget child;
  final int delayMs;

  @override
  State<WTEntrance> createState() => _WTEntranceState();
}

class _WTEntranceState extends State<WTEntrance> with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 460));
  late final Animation<double> _fade =
      CurvedAnimation(parent: _c, curve: Curves.easeOut);
  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(0, 0.06),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delayMs), () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      FadeTransition(opacity: _fade, child: SlideTransition(position: _slide, child: widget.child));
}

/// Wraps a list of children, each revealed with a staggered [WTEntrance].
List<Widget> wtStagger(List<Widget> children, {int step = 70, int start = 0}) {
  return [
    for (int i = 0; i < children.length; i++)
      WTEntrance(delayMs: start + i * step, child: children[i]),
  ];
}

// â”€â”€ Section label (.slbl) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class WTSectionLabel extends StatelessWidget {
  const WTSectionLabel(this.text, {super.key, this.topGap = 4});
  final String text;
  final double topGap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: topGap, bottom: AppTheme.s2),
        child: Text(text.toUpperCase(), style: AppTheme.label),
      );
}

// â”€â”€ Card (.card / .card-sm) â€” floating white surface with press feedback â”€â”€â”€â”€â”€â”€
class WTCard extends StatelessWidget {
  const WTCard({
    super.key,
    required this.child,
    this.small = false,
    this.leftAccent,
    this.onTap,
    this.padding,
  });

  final Widget child;
  final bool small;
  final Color? leftAccent;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    // A rounded BoxDecoration cannot use a non-uniform Border, so the optional
    // left accent is drawn as a clipped strip instead of a thick left side.
    final radius = BorderRadius.circular(AppTheme.rMd);
    final inner = Padding(
      padding: padding ?? EdgeInsets.all(small ? 14 : 18),
      child: child,
    );
    final card = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: radius,
        boxShadow: AppTheme.cardShadow,
        border: Border.all(color: AppTheme.border),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: leftAccent == null
            ? inner
            : IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(width: 3, color: leftAccent),
                    Expanded(child: inner),
                  ],
                ),
              ),
      ),
    );
    return _PressScale(onTap: onTap, child: card);
  }
}

// â”€â”€ Tag / chip (.tag .tg/.ta/.trd/.tb-t/.tn) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
enum WTTagKind { green, amber, red, blue, neutral }

class WTTag extends StatelessWidget {
  const WTTag(this.label, {super.key, this.kind = WTTagKind.neutral, this.icon});
  final String label;
  final WTTagKind kind;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final (fg, bg, bd) = switch (kind) {
      WTTagKind.green => (AppTheme.success, AppTheme.tint(AppTheme.success), AppTheme.success.withValues(alpha: 0.28)),
      WTTagKind.amber => (AppTheme.warn, AppTheme.tint(AppTheme.warn), AppTheme.warn.withValues(alpha: 0.28)),
      WTTagKind.red => (AppTheme.error, AppTheme.tint(AppTheme.error), AppTheme.error.withValues(alpha: 0.28)),
      WTTagKind.blue => (AppTheme.accent, AppTheme.accentSoft, AppTheme.accent.withValues(alpha: 0.30)),
      WTTagKind.neutral => (AppTheme.muted, AppTheme.surfaceAlt, AppTheme.border),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppTheme.rSm),
        border: Border.all(color: bd),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 11, color: fg), const SizedBox(width: 4)],
          Text(label, style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// â”€â”€ Big traffic-light card (.tl-big) â€” pulsing status dot â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class WTTrafficLight extends StatefulWidget {
  const WTTrafficLight({super.key, required this.kind, required this.label, required this.subtitle});
  final WTTagKind kind; // green / amber / red
  final String label;
  final String subtitle;

  @override
  State<WTTrafficLight> createState() => _WTTrafficLightState();
}

class _WTTrafficLightState extends State<WTTrafficLight> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1800))..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = switch (widget.kind) {
      WTTagKind.amber => AppTheme.warn,
      WTTagKind.red => AppTheme.error,
      _ => AppTheme.success,
    };
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: AppTheme.tint(c),
        borderRadius: BorderRadius.circular(AppTheme.rLg),
        border: Border.all(color: c.withValues(alpha: 0.28), width: 1.5),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _pulse,
            builder: (_, __) => Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c,
                boxShadow: [
                  BoxShadow(
                    color: c.withValues(alpha: 0.35 + _pulse.value * 0.35),
                    blurRadius: 16 + _pulse.value * 14,
                    spreadRadius: _pulse.value * 4,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(widget.label, style: TextStyle(color: c, fontSize: 24, fontWeight: FontWeight.w800, letterSpacing: -0.6)),
          const SizedBox(height: 6),
          Text(widget.subtitle, textAlign: TextAlign.center, style: TextStyle(color: c.withValues(alpha: 0.9), fontSize: 13)),
        ],
      ),
    );
  }
}

// â”€â”€ Key/value list row (.lrow) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class WTListRow extends StatelessWidget {
  const WTListRow({super.key, this.label, this.valueText, this.leading, this.trailing, this.last = false});
  final String? label;
  final String? valueText;
  final Widget? leading;
  final Widget? trailing;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: leading ??
                Text(label ?? '', style: TextStyle(color: AppTheme.faint, fontSize: 12)),
          ),
          if (trailing != null)
            trailing!
          else if (valueText != null)
            Text(valueText!, style: TextStyle(color: AppTheme.ink, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// â”€â”€ Alert banner (.alert .aw/.ai/.ad) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
enum WTAlertKind { info, warning, danger }

class WTAlert extends StatelessWidget {
  const WTAlert(this.message, {super.key, this.kind = WTAlertKind.info});
  final String message;
  final WTAlertKind kind;

  @override
  Widget build(BuildContext context) {
    final (c, icon) = switch (kind) {
      WTAlertKind.warning => (AppTheme.warn, FluentIcons.warning),
      WTAlertKind.danger => (AppTheme.error, FluentIcons.alert_solid),
      WTAlertKind.info => (AppTheme.accent, FluentIcons.info),
    };
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      margin: const EdgeInsets.only(bottom: AppTheme.s3),
      decoration: BoxDecoration(
        color: kind == WTAlertKind.info ? AppTheme.accentSoft : AppTheme.tint(c),
        borderRadius: BorderRadius.circular(AppTheme.rSm),
        border: Border.all(color: c.withValues(alpha: 0.30)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: c),
          const SizedBox(width: 10),
          Expanded(child: Text(message, style: TextStyle(color: c, fontSize: 13, height: 1.5))),
        ],
      ),
    );
  }
}

// â”€â”€ Buttons (.btn-p / .btn-s / .btn-r) with press feedback â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
enum WTButtonKind { primary, subtle, danger }

class WTButton extends StatelessWidget {
  const WTButton({
    super.key,
    required this.label,
    this.onPressed,
    this.kind = WTButtonKind.primary,
    this.small = false,
    this.icon,
    this.trailingIcon,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final WTButtonKind kind;
  final bool small;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, bd, shadow) = switch (kind) {
      WTButtonKind.primary => (AppTheme.accent, Colors.white, null, AppTheme.accentShadow(AppTheme.accent)),
      WTButtonKind.subtle => (AppTheme.surface, AppTheme.muted, AppTheme.border, AppTheme.cardShadow),
      WTButtonKind.danger => (AppTheme.tint(AppTheme.error), AppTheme.error, AppTheme.error.withValues(alpha: 0.30), <BoxShadow>[]),
    };
    final enabled = onPressed != null && !loading;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: _PressScale(
        onTap: enabled ? onPressed : null,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: small ? 11 : 15),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(small ? AppTheme.rSm : AppTheme.rMd),
            border: bd != null ? Border.all(color: bd) : null,
            boxShadow: enabled ? shadow : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading)
                SizedBox(width: 16, height: 16, child: ProgressRing(strokeWidth: 2, activeColor: fg))
              else ...[
                if (icon != null) ...[Icon(icon, size: 18, color: fg), const SizedBox(width: 8)],
                Text(label, style: TextStyle(color: fg, fontSize: small ? 13 : 15, fontWeight: FontWeight.w600)),
                if (trailingIcon != null) ...[const SizedBox(width: 8), Icon(trailingIcon, size: 16, color: fg)],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// â”€â”€ Step row (.step-row + .step-num) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
enum WTStepState { done, active, pending }

class WTStepRow extends StatelessWidget {
  const WTStepRow({
    super.key,
    required this.index,
    required this.state,
    required this.title,
    required this.subtitle,
    this.last = false,
  });

  final int index;
  final WTStepState state;
  final String title;
  final String subtitle;
  final bool last;

  @override
  Widget build(BuildContext context) {
    final Widget num = switch (state) {
      WTStepState.done => Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.accent),
          child: const Icon(FluentIcons.check_mark, size: 13, color: Colors.white),
        ),
      WTStepState.active => Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.accentSoft,
            border: Border.all(color: AppTheme.accent, width: 2),
          ),
          child: Center(
            child: Text('$index',
                style: TextStyle(color: AppTheme.accent, fontSize: 11, fontWeight: FontWeight.w700)),
          ),
        ),
      WTStepState.pending => Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.border2, width: 2),
          ),
          child: Center(
            child: Text('$index',
                style: TextStyle(color: AppTheme.faint, fontSize: 11, fontWeight: FontWeight.w700)),
          ),
        ),
    };
    final titleColor = state == WTStepState.active ? AppTheme.accent : AppTheme.ink;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: last ? null : Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          num,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: titleColor, fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(color: AppTheme.faint, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// â”€â”€ Capture box (.capture) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class WTCaptureBox extends StatelessWidget {
  const WTCaptureBox({
    super.key,
    required this.label,
    this.icon = FluentIcons.camera,
    this.height = 190,
    this.onTap,
    this.child,
  });
  final String label;
  final IconData icon;
  final double height;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _PressScale(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: height,
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: AppTheme.surfaceAlt,
          borderRadius: BorderRadius.circular(AppTheme.rMd),
          border: Border.all(color: AppTheme.border2, width: 1.5),
        ),
        child: child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 34, color: AppTheme.faint),
                const SizedBox(height: 10),
                Text(label, style: TextStyle(color: AppTheme.faint, fontSize: 13)),
              ],
            ),
      ),
    );
  }
}

// â”€â”€ Progress bar (.prog-bar) â€” animated fill â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
class WTProgressBar extends StatelessWidget {
  const WTProgressBar({super.key, required this.value, this.color});
  final double value; // 0..1
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: 7,
        color: AppTheme.border,
        child: Align(
          alignment: Alignment.centerLeft,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: value.clamp(0, 1)),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (_, v, __) => FractionallySizedBox(
              widthFactor: v,
              child: Container(color: color ?? AppTheme.accent),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Hero credential card (.cred) — maritime gradient ID badge ────────────────
/// The Home centrepiece: a deep-navy gradient credential showing the worker's
/// identity, a live status seal, ID/validity meta and a QR placeholder.
/// ponytail: QR is a glyph, not a scannable code — swap for a `qr_flutter`
/// widget if a real scannable credential is needed.
class WTCredentialCard extends StatelessWidget {
  const WTCredentialCard({
    super.key,
    required this.name,
    required this.role,
    required this.statusKind,
    required this.statusLabel,
    this.validityText,
  });

  final String name;
  final String role;
  final WTTagKind statusKind; // green / amber / red
  final String statusLabel;
  final String? validityText;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '–';
    if (parts.length == 1) return parts.first.characters.take(2).toString().toUpperCase();
    return (parts.first.characters.first + parts.last.characters.first).toUpperCase();
  }

  Color get _statusColor => switch (statusKind) {
        WTTagKind.amber => AppTheme.warn,
        WTTagKind.red => AppTheme.error,
        _ => AppTheme.success,
      };

  @override
  Widget build(BuildContext context) {
    final sc = _statusColor;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.rXl),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF12406B), Color(0xFF0E2F50), Color(0xFF0A2238)],
          stops: [0.0, 0.55, 1.0],
        ),
        border: Border.all(color: const Color(0xFF2C5680)),
        boxShadow: const [BoxShadow(color: Color(0x66061A2E), blurRadius: 30, offset: Offset(0, 16))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('WORKERTRUST CREDENTIAL',
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: sc.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: sc.withValues(alpha: 0.4)),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Container(width: 7, height: 7, decoration: BoxDecoration(shape: BoxShape.circle, color: sc)),
                  const SizedBox(width: 6),
                  Text(statusLabel,
                      style: TextStyle(color: sc, fontSize: 11, fontWeight: FontWeight.w700)),
                ]),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(colors: [AppTheme.accent, AppTheme.accentLight]),
                  boxShadow: [BoxShadow(color: AppTheme.accent.withValues(alpha: 0.4), blurRadius: 16, offset: const Offset(0, 6))],
                ),
                child: Center(
                  child: Text(_initials,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800, letterSpacing: -0.4)),
                    const SizedBox(height: 3),
                    Text(role,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white.withValues(alpha: 0.6), fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          if (validityText != null) ...[
            const SizedBox(height: 20),
            _credMeta('Status', validityText!),
          ],
        ],
      ),
    );
  }

  Widget _credMeta(String k, String v) => RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 11, height: 1.5),
          children: [
            TextSpan(text: '$k  '),
            TextSpan(text: v, style: TextStyle(color: Colors.white.withValues(alpha: 0.88), fontWeight: FontWeight.w600)),
          ],
        ),
      );
}

// ── Bottom navigation bar (.bnav) ────────────────────────────────────────────
class WTNavItem {
  const WTNavItem({required this.icon, required this.label, required this.onTap, this.badge = false});
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool badge;
}

class WTBottomNav extends StatelessWidget {
  const WTBottomNav({super.key, required this.items, required this.activeIndex});
  final List<WTNavItem> items;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.nav,
        border: Border(top: BorderSide(color: AppTheme.border)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (int i = 0; i < items.length; i++)
                Expanded(child: _navButton(items[i], i == activeIndex)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navButton(WTNavItem item, bool active) {
    final color = active ? AppTheme.accent : AppTheme.faint;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: item.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: active ? AppTheme.accentSoft : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: color, size: 21),
              ),
              if (item.badge)
                Positioned(
                  right: 2,
                  top: 2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.error,
                      border: Border.all(color: AppTheme.nav, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(item.label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
