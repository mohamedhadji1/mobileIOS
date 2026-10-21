import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'app_theme.dart';

/// Floating-label input (Material's native animated label, AppTheme-styled).
/// Reused across every enrollment form so inputs share one layout.
class WTFloatField extends StatefulWidget {
  const WTFloatField({
    super.key,
    required this.label,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.autofillHints,
    this.textCapitalization = TextCapitalization.none,
  });

  final String label;
  final TextEditingController? controller;
  final IconData? icon;
  final bool obscureText;
  final int maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  /// Keyboard action key. Pass `next` on every field but the last so the
  /// worker can chain through a form instead of tapping each box.
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  /// e.g. `[AutofillHints.newPassword]`. Without it no password manager or
  /// contact autofill can offer anything.
  final Iterable<String>? autofillHints;
  final TextCapitalization textCapitalization;

  @override
  State<WTFloatField> createState() => _WTFloatFieldState();
}

class _WTFloatFieldState extends State<WTFloatField> {
  late bool _hidden = widget.obscureText;

  OutlineInputBorder _border(Color c, [double w = 1]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.rSm),
        borderSide: BorderSide(color: c, width: w),
      );

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final icon = widget.icon;
    return Material(
      type: MaterialType.transparency,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _hidden,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        onChanged: widget.onChanged,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        autofillHints: widget.autofillHints,
        textCapitalization: widget.textCapitalization,
        cursorColor: AppTheme.accent,
        style: TextStyle(color: AppTheme.ink, fontSize: 15),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: AppTheme.faint, fontSize: 15),
          floatingLabelStyle: TextStyle(
              color: AppTheme.accent,
              fontSize: 13,
              fontWeight: FontWeight.w600),
          prefixIcon:
              icon == null ? null : Icon(icon, color: AppTheme.muted, size: 18),
          // Typing a password blind on a phone keyboard is the main cause of
          // the "passwords do not match" round trip.
          suffixIcon: !widget.obscureText
              ? null
              : WTIconButton(
                  icon: _hidden
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  label: _hidden ? 'Show password' : 'Hide password',
                  onPressed: () => setState(() => _hidden = !_hidden),
                ),
          filled: true,
          fillColor: AppTheme.surfaceAlt,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
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

/// WorkerTrust UI kit (light edition) — smooth, animated Flutter components.
/// Cards float on white with soft shadows, buttons/cards give a subtle press
/// scale, and [WTEntrance] fades+slides content in for a polished reveal.

// ──── Press-scale wrapper (smooth tactile feedback) ────
class _PressScale extends StatefulWidget {
  const _PressScale({required this.child, this.onTap, this.semanticLabel});
  final Widget child;
  final VoidCallback? onTap;

  /// Accessible name. Without it a tappable card or button announces as loose
  /// text with no role, which is what every CTA in this app used to do.
  final String? semanticLabel;

  @override
  State<_PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<_PressScale> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    final core = widget.onTap == null
        ? widget.child
        : GestureDetector(
            onTapDown: (_) => setState(() => _down = true),
            onTapUp: (_) => setState(() => _down = false),
            onTapCancel: () => setState(() => _down = false),
            onTap: widget.onTap,
            child: AnimatedScale(
              scale: _down ? 0.97 : 1.0,
              duration: AppTheme.motion(context, 120),
              curve: Curves.easeOut,
              child: widget.child,
            ),
          );
    // A disabled control still has to announce itself as a disabled button,
    // so this wraps whenever a label exists, even with no onTap.
    if (widget.onTap == null && widget.semanticLabel == null) return core;
    return Semantics(
      button: true,
      enabled: widget.onTap != null,
      label: widget.semanticLabel,
      excludeSemantics: widget.semanticLabel != null,
      child: core,
    );
  }
}

// ──── Entrance animation (fade + slide up, optional stagger delay) ────
class WTEntrance extends StatefulWidget {
  const WTEntrance({super.key, required this.child, this.delayMs = 0});
  final Widget child;
  final int delayMs;

  @override
  State<WTEntrance> createState() => _WTEntranceState();
}

class _WTEntranceState extends State<WTEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 360));
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
  Widget build(BuildContext context) {
    if (AppTheme.reduceMotion(context)) return widget.child;
    return FadeTransition(
        opacity: _fade,
        child: SlideTransition(position: _slide, child: widget.child));
  }
}

/// The longest any child waits before its entrance starts. Without a cap the
/// last of a long list waited step × length — on Home, most of a second
/// before its bottom tiles appeared.
const _maxStaggerDelayMs = 240;

/// Wraps a list of children, each revealed with a staggered [WTEntrance].
List<Widget> wtStagger(List<Widget> children, {int step = 40, int start = 0}) {
  return [
    for (int i = 0; i < children.length; i++)
      WTEntrance(
        delayMs: (start + i * step).clamp(0, start + _maxStaggerDelayMs),
        child: children[i],
      ),
  ];
}

// ──── Section label (.slbl) ────
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

// ──── Card (.card / .card-sm) — floating white surface with press feedback ────
class WTCard extends StatelessWidget {
  const WTCard({
    super.key,
    required this.child,
    this.small = false,
    this.leftAccent,
    this.onTap,
    this.padding,
    this.semanticLabel,
  });

  final Widget child;
  final bool small;
  final Color? leftAccent;
  final VoidCallback? onTap;
  final EdgeInsets? padding;

  /// Set when the card is tappable and its content is not self-describing.
  final String? semanticLabel;

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
    return _PressScale(onTap: onTap, semanticLabel: semanticLabel, child: card);
  }
}

// ──── Tag / chip (.tag .tg/.ta/.trd/.tb-t/.tn) ────
enum WTTagKind { green, amber, red, blue, neutral }

class WTTag extends StatelessWidget {
  const WTTag(this.label,
      {super.key, this.kind = WTTagKind.neutral, this.icon});
  final String label;
  final WTTagKind kind;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final (fg, bg, bd) = switch (kind) {
      WTTagKind.green => (
          AppTheme.success,
          AppTheme.tint(AppTheme.success),
          AppTheme.success.withValues(alpha: 0.28)
        ),
      WTTagKind.amber => (
          AppTheme.warn,
          AppTheme.tint(AppTheme.warn),
          AppTheme.warn.withValues(alpha: 0.28)
        ),
      WTTagKind.red => (
          AppTheme.error,
          AppTheme.tint(AppTheme.error),
          AppTheme.error.withValues(alpha: 0.28)
        ),
      WTTagKind.blue => (
          AppTheme.accent,
          AppTheme.accentSoft,
          AppTheme.accent.withValues(alpha: 0.30)
        ),
      WTTagKind.neutral => (
          AppTheme.muted,
          AppTheme.surfaceAlt,
          AppTheme.border
        ),
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
          if (icon != null) ...[
            Icon(icon, size: 11, color: fg),
            const SizedBox(width: 4)
          ],
          Text(label,
              style: TextStyle(
                  color: fg, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ──── Big traffic-light card (.tl-big) — pulsing status dot ────
class WTTrafficLight extends StatefulWidget {
  const WTTrafficLight(
      {super.key,
      required this.kind,
      required this.label,
      required this.subtitle});
  final WTTagKind kind; // green / amber / red
  final String label;
  final String subtitle;

  @override
  State<WTTrafficLight> createState() => _WTTrafficLightState();
}

class _WTTrafficLightState extends State<WTTrafficLight>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1800))
    ..repeat(reverse: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // No ticker while reduce-motion is on: the pulse is frozen at t = 0.
    if (AppTheme.reduceMotion(context)) {
      _pulse.stop();
    } else if (!_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    }
  }

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
          // The label below states the status in words; the dot is decoration.
          ExcludeSemantics(
            // Isolate the per-frame glow repaint from the card around it.
            child: RepaintBoundary(
              child: AnimatedBuilder(
                animation: _pulse,
                builder: (_, __) {
                  final t = AppTheme.reduceMotion(context) ? 0.0 : _pulse.value;
                  return Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: c,
                      boxShadow: [
                        BoxShadow(
                          color: c.withValues(alpha: 0.35 + t * 0.35),
                          blurRadius: 16 + t * 14,
                          spreadRadius: t * 4,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(widget.label,
              style: TextStyle(
                  color: c,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.6)),
          const SizedBox(height: 6),
          Text(widget.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: c.withValues(alpha: 0.9), fontSize: 13)),
        ],
      ),
    );
  }
}

// ──── Key/value list row (.lrow) ────
class WTListRow extends StatelessWidget {
  const WTListRow(
      {super.key,
      this.label,
      this.valueText,
      this.leading,
      this.trailing,
      this.last = false});
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
        border:
            last ? null : Border(bottom: BorderSide(color: AppTheme.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: leading ??
                Text(label ?? '',
                    style: TextStyle(color: AppTheme.faint, fontSize: 12)),
          ),
          if (trailing != null)
            trailing!
          else if (valueText != null)
            Text(valueText!,
                style: TextStyle(
                    color: AppTheme.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// ──── Alert banner (.alert .aw/.ai/.ad) ────
enum WTAlertKind { info, warning, danger }

class WTAlert extends StatelessWidget {
  const WTAlert(this.message, {super.key, this.kind = WTAlertKind.info});
  final String message;
  final WTAlertKind kind;

  @override
  Widget build(BuildContext context) {
    final (c, icon) = switch (kind) {
      WTAlertKind.warning => (AppTheme.warn, Icons.warning_amber_rounded),
      WTAlertKind.danger => (AppTheme.error, Icons.error_rounded),
      WTAlertKind.info => (AppTheme.accent, Icons.info_outline_rounded),
    };
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      margin: const EdgeInsets.only(bottom: AppTheme.s3),
      decoration: BoxDecoration(
        color:
            kind == WTAlertKind.info ? AppTheme.accentSoft : AppTheme.tint(c),
        borderRadius: BorderRadius.circular(AppTheme.rSm),
        border: Border.all(color: c.withValues(alpha: 0.30)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: c),
          const SizedBox(width: 10),
          Expanded(
              child: Text(message,
                  style: TextStyle(color: c, fontSize: 13, height: 1.5))),
        ],
      ),
    );
  }
}

// ──── Buttons (.btn-p / .btn-s / .btn-r) with press feedback ────
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
      WTButtonKind.primary => (
          AppTheme.accent,
          AppTheme.onAccent,
          null,
          AppTheme.accentShadow(AppTheme.accent)
        ),
      WTButtonKind.subtle => (
          AppTheme.surface,
          AppTheme.muted,
          AppTheme.border,
          AppTheme.cardShadow
        ),
      WTButtonKind.danger => (
          AppTheme.tint(AppTheme.error),
          AppTheme.error,
          AppTheme.error.withValues(alpha: 0.30),
          <BoxShadow>[]
        ),
    };
    final enabled = onPressed != null && !loading;
    return Opacity(
      // Loading is live content, not a disabled control - keep it readable.
      opacity: enabled || loading ? 1 : 0.5,
      child: _PressScale(
        onTap: enabled ? onPressed : null,
        semanticLabel: loading ? '$label, busy' : label,
        child: Container(
          width: double.infinity,
          // 48dp floor. `small` used to total 11 + 13 + 11 = 35dp.
          constraints: const BoxConstraints(minHeight: 48),
          alignment: Alignment.center,
          padding:
              EdgeInsets.symmetric(vertical: small ? 11 : 15, horizontal: 16),
          decoration: BoxDecoration(
            color: bg,
            // Squared-off CTAs: rSm at every size (rMd read too pill-like).
            borderRadius: BorderRadius.circular(AppTheme.rSm),
            border: bd != null ? Border.all(color: bd) : null,
            boxShadow: enabled ? shadow : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading)
                SizedBox(
                    width: 16,
                    height: 16,
                    child: WTSpinner(strokeWidth: 2, activeColor: fg))
              else ...[
                if (icon != null) ...[
                  Icon(icon, size: 18, color: fg),
                  const SizedBox(width: 8)
                ],
                // Flexible: a long label on a narrow phone or with large text
                // wraps to a second line instead of overflowing the button.
                Flexible(
                  child: Text(label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: fg,
                          fontSize: small ? 13 : 15,
                          fontWeight: FontWeight.w600)),
                ),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 8),
                  Icon(trailingIcon, size: 16, color: fg)
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Form body ────────────────────────────────────────────────
/// Scrollable page body for any screen that contains a text field.
///
/// Solves three things at once:
///  * **The keyboard no longer covers anything.** The keyboard inset is added
///    as scroll padding, so the focused field *and* the submit button below it
///    can be scrolled to. Flutter scrolls a focused field into view by itself,
///    but only when it sits inside a scrollable — which is why a plain Column
///    used to trap the button under the keyboard.
///  * **`Spacer` and `Expanded` keep working.** The min-height plus
///    [IntrinsicHeight] pair lets the column fill the viewport when there is
///    room and grow past it when there is not.
///  * **Wide screens stay readable.** Content is capped at [maxWidth] and
///    centred, instead of stretching edge to edge on a tablet or in landscape.
class WTFormBody extends StatelessWidget {
  const WTFormBody({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: AppTheme.s5),
    this.maxWidth = 520,
  });

  final Widget child;
  final EdgeInsets padding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.viewInsetsOf(context).bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        // Centre by widening the side padding rather than nesting a Center,
        // which would break the min-height chain that Spacer depends on.
        final slack = constraints.maxWidth - padding.horizontal - maxWidth;
        final gutter = slack > 0 ? slack / 2 : 0.0;
        final available = constraints.maxHeight - padding.vertical;
        return SingleChildScrollView(
          // Dragging the form also puts the keyboard away.
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            left: padding.left + gutter,
            right: padding.right + gutter,
            top: padding.top,
            bottom: padding.bottom + keyboard,
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: available > 0 ? available : 0),
            child: IntrinsicHeight(child: child),
          ),
        );
      },
    );
  }
}

// ── Skeleton loading ────────────────────────────────────────
/// One shimmering placeholder block.
///
/// A spinner says "something is happening"; a skeleton also says *what shape*
/// is coming, so the layout does not jump when the data lands. Use it for
/// content being fetched, not for an action that is running — a button that
/// was tapped still wants [WTButton.loading].
class WTSkeleton extends StatefulWidget {
  const WTSkeleton({super.key, this.width, this.height = 14, this.radius});

  /// Null stretches to the parent's width.
  final double? width;
  final double height;
  final double? radius;

  @override
  State<WTSkeleton> createState() => _WTSkeletonState();
}

class _WTSkeletonState extends State<WTSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1100),
  )..repeat(reverse: true);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // No ticker while reduce-motion is on: the block is drawn static.
    if (AppTheme.reduceMotion(context)) {
      _c.stop();
    } else if (!_c.isAnimating) {
      _c.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final still = AppTheme.reduceMotion(context);
    return ExcludeSemantics(
      child: RepaintBoundary(
        child: AnimatedBuilder(
          animation: _c,
          builder: (_, __) => Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Color.lerp(
                AppTheme.surfaceAlt,
                AppTheme.border,
                still ? 0.5 : _c.value,
              ),
              borderRadius:
                  BorderRadius.circular(widget.radius ?? widget.height / 2),
            ),
          ),
        ),
      ),
    );
  }
}

/// Card-shaped placeholder matching [WTCard]'s surface, border and radius.
class WTSkeletonCard extends StatelessWidget {
  const WTSkeletonCard(
      {super.key, this.lines = 2, this.leading = true, this.small = true});

  final int lines;

  /// Reserve a square block on the left, for rows that show an icon tile.
  final bool leading;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < lines; i++) ...[
          if (i > 0) const SizedBox(height: AppTheme.s2),
          // Trailing lines run short, the way a real subtitle sits.
          WTSkeleton(height: i == 0 ? 14 : 11, width: i == 0 ? null : 140),
        ],
      ],
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(small ? 14 : 18),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(AppTheme.rMd),
        border: Border.all(color: AppTheme.border),
        boxShadow: AppTheme.cardShadow,
      ),
      child: leading
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WTSkeleton(width: 38, height: 38, radius: 10),
                const SizedBox(width: AppTheme.s3),
                Expanded(child: body),
              ],
            )
          : body,
    );
  }
}

/// A stack of [WTSkeletonCard]s, announced once as "Loading".
class WTSkeletonList extends StatelessWidget {
  const WTSkeletonList(
      {super.key, this.count = 3, this.lines = 2, this.leading = true});

  final int count;
  final int lines;
  final bool leading;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Loading',
      liveRegion: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < count; i++) ...[
            if (i > 0) const SizedBox(height: AppTheme.s2),
            WTSkeletonCard(lines: lines, leading: leading),
          ],
        ],
      ),
    );
  }
}

// ── Icon button ───────────────────────────────────────────────────────────
/// Icon-only button with a real accessible name and a 48dp target.
///
/// Every control built on it — the theme toggle, the password eye, the step
/// back buttons, the remove buttons on jobs and documents — is named for a
/// screen reader and meets the minimum touch size.
class WTIconButton extends StatelessWidget {
  const WTIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.size = 20,
    this.color,
  });

  final IconData icon;

  /// Spoken name, e.g. 'Back', 'Dismiss', 'Turn flash on'.
  final String label;
  final VoidCallback? onPressed;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onPressed,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Center(
            child: Icon(icon, size: size, color: color ?? AppTheme.muted),
          ),
        ),
      ),
    );
  }
}

// ── Status message ────────────────────────────────────────────────────────
enum WTSeverity { info, success, warning, error }

/// Transient status message: Material's snackbar, with an icon per severity so
/// the meaning never rests on colour alone. It replaces whatever message is
/// showing, so the newest one is the one on screen. The snackbar is a live
/// region and its close button is named, as before.
void wtInfoBar(
  BuildContext context,
  String title, {
  String? message,
  WTSeverity severity = WTSeverity.info,
  Duration duration = const Duration(seconds: 5),
  String? actionLabel,
  VoidCallback? onAction,
}) {
  final (icon, color) = switch (severity) {
    WTSeverity.info => (Icons.info_rounded, AppTheme.accent),
    WTSeverity.success => (Icons.check_circle_rounded, AppTheme.success),
    WTSeverity.warning => (Icons.warning_rounded, AppTheme.warn),
    WTSeverity.error => (Icons.error_rounded, AppTheme.error),
  };
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      duration: duration,
      showCloseIcon: true,
      action: actionLabel == null || onAction == null
          ? null
          : SnackBarAction(label: actionLabel, onPressed: onAction),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: AppTheme.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: AppTheme.body.copyWith(fontWeight: FontWeight.w700)),
                if (message != null)
                  Text(message,
                      style: AppTheme.bodyMuted.copyWith(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    ));
}

// ── Page ──────────────────────────────────────────────────────────────────
/// Window width from which navigation moves to a side rail: a tablet, or a
/// phone on its side. Material's medium window class starts here.
const double wtWideBreakpoint = 600;

bool wtIsWide(BuildContext context) =>
    MediaQuery.sizeOf(context).width >= wtWideBreakpoint;

/// The widest a screen's content runs on a tablet or a phone on its side. A
/// line of body text or a card past this is hard to read and looks stretched.
const double wtReadableWidth = 680;

/// A screen: Material's Scaffold on the app's ground, so snackbars, dialogs,
/// the keyboard inset and the back gesture all behave natively.
///
/// [nav] runs along the bottom on a phone held upright and down the side once
/// the window is [wtWideBreakpoint] wide. On a wide window [content] is held
/// to [wtReadableWidth] and centred, unless the screen is [fullBleed].
class WTPage extends StatelessWidget {
  const WTPage({
    super.key,
    required this.content,
    this.appBar,
    this.nav,
    this.topGap = AppTheme.s5,
    this.fullBleed = false,
  });

  final Widget content;
  final PreferredSizeWidget? appBar;
  final Widget? nav;

  /// Space above [content] when there is no [appBar].
  final double topGap;

  /// Content runs edge to edge at any width — camera viewfinders and the
  /// splash video, whose layout is computed from the whole window.
  final bool fullBleed;

  @override
  Widget build(BuildContext context) {
    final rail = nav != null && wtIsWide(context);
    final padded = Padding(
      padding: EdgeInsets.only(top: appBar == null ? topGap : 0),
      child: content,
    );
    // On a phone the content gets exactly the constraints the Scaffold gave
    // it; on a wide window, the same with the width capped and centred.
    // No LayoutBuilder, so the page can still be measured intrinsically.
    final body = fullBleed
        ? padded
        : Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: wtReadableWidth),
              child: padded,
            ),
          );
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: appBar,
      body: rail ? Row(children: [nav!, Expanded(child: body)]) : body,
      bottomNavigationBar: rail ? null : nav,
    );
  }
}

// ──── Progress bar (.prog-bar) — animated fill ────
class WTProgressBar extends StatelessWidget {
  const WTProgressBar({super.key, required this.value, this.color});
  final double value; // 0..1
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final pct = (value.clamp(0, 1) * 100).round();
    return Semantics(
      label: 'Progress',
      value: '$pct percent',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 7,
          color: AppTheme.border,
          child: Align(
            alignment: Alignment.centerLeft,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value.clamp(0, 1)),
              duration: AppTheme.motion(context, 600),
              curve: Curves.easeOutCubic,
              builder: (_, v, __) => FractionallySizedBox(
                widthFactor: v,
                child: Container(color: color ?? AppTheme.accent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Avatar initials: first letters of the first and last word ("Amira Ben
/// Salah" -> "AS"), the first two letters of a single word, an en dash for
/// no name. Home's credential and the Profile avatar both use this, so the
/// same worker never shows two different monograms.
String wtInitials(String name) {
  final parts =
      name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
  if (parts.isEmpty) return '–';
  if (parts.length == 1) {
    return parts.first.characters.take(2).toString().toUpperCase();
  }
  return (parts.first.characters.first + parts.last.characters.first)
      .toUpperCase();
}

// ── State crossfade ──────────────────────────────────────────────────────────
/// Crossfades one state of a region into the next — skeleton or spinner into
/// content, "checking" into the real status — instead of a hard cut. Pass a
/// [stateKey] that changes only when the state does; a rebuild with the same
/// key does not fade. Opacity only, 220ms in / 150ms out, instant under
/// reduce-motion.
///
/// The outgoing and incoming children share the incoming one's constraints,
/// so a scroll view or an Expanded body lays out exactly as it would alone.
class WTSwitcher extends StatelessWidget {
  const WTSwitcher({
    super.key,
    required this.stateKey,
    required this.child,
    this.alignment = AlignmentDirectional.topStart,
  });

  final Object stateKey;
  final Widget child;

  /// Where a smaller child sits while the two overlap.
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AppTheme.motion(context, 220),
      reverseDuration: AppTheme.motion(context, 150),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      layoutBuilder: (current, previous) => Stack(
        fit: StackFit.passthrough,
        alignment: alignment,
        children: [...previous, if (current != null) current],
      ),
      child: KeyedSubtree(key: ValueKey<Object>(stateKey), child: child),
    );
  }
}

// ── Hero credential card (.cred) — maritime gradient ID badge ────────────────
/// The Home centrepiece: a deep-navy gradient credential showing the worker's
/// identity, a live status seal, ID/validity meta and a QR placeholder.
/// ponytail: QR is a glyph, not a scannable code — swap for a `qr_flutter`
/// widget if a real scannable credential is needed.
///
/// The card is navy in BOTH themes, so nothing drawn on it may use a theme
/// token: the light theme's warn (brown) and the dark theme's accent (pale
/// blue) both vanish on it. Every colour below is fixed and checked against
/// the card's lightest gradient stop (#2E5A92).
class WTCredentialCard extends StatelessWidget {
  const WTCredentialCard({
    super.key,
    required this.name,
    required this.role,
    required this.statusKind,
    required this.statusLabel,
    this.validityText,
    this.photo,
  });

  final String name;
  final String role;

  /// green / amber / red; neutral while the status is still being fetched.
  final WTTagKind statusKind;
  final String statusLabel;

  /// Shown under the name only when it says more than the seal does — e.g.
  /// "REVIEW REQUIRED" beside a PENDING seal. Text that merely repeats
  /// [statusLabel] is dropped, so the status is stated once.
  final String? validityText;

  /// Enrollment selfie. Null before enrollment, and for workers who enrolled
  /// before it was stored — the card falls back to initials, which is why this
  /// is optional rather than a required argument nobody can supply.
  final Uint8List? photo;

  // Seal: a darkened pill, a saturated dot, and a pale tone of the status for
  // the words. Pale tone on the pill is at least 5.6:1 on every gradient stop.
  static const _sealFill = Color(0x590B1726);
  static const _avatarTop = Color(0xFF35639C);
  static const _avatarBottom = Color(0xFF244878);

  /// (dot, text) for the seal.
  (Color, Color) get _sealTones => switch (statusKind) {
        WTTagKind.green => (AppTheme.cameraSuccess, const Color(0xFF8FE3C0)),
        WTTagKind.amber => (const Color(0xFFE0AE4A), const Color(0xFFF2CD7E)),
        WTTagKind.red => (AppTheme.cameraError, const Color(0xFFF9AEB2)),
        _ => (const Color(0xFF9DB3D1), const Color(0xFFD6E2F2)),
      };

  String? get _detail {
    final text = validityText?.trim();
    if (text == null || text.isEmpty) return null;
    return text.toUpperCase() == statusLabel.trim().toUpperCase() ? null : text;
  }

  Widget _seal() {
    final (dot, text) = _sealTones;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: _sealFill,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: text.withValues(alpha: 0.45)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: dot)),
        const SizedBox(width: 6),
        Text(statusLabel,
            style: TextStyle(
                color: text, fontSize: 12, fontWeight: FontWeight.w700)),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final detail = _detail;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.rXl),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2E5A92), Color(0xFF244878), Color(0xFF16304F)],
          stops: [0.0, 0.55, 1.0],
        ),
        border: Border.all(color: const Color(0xFF3D6AA6)),
        boxShadow: const [
          BoxShadow(
              color: Color(0x66101C2E), blurRadius: 30, offset: Offset(0, 16))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('TRIDOMA CREDENTIAL',
                  style: TextStyle(
                      // Fixed, not AppTheme.brass: this card is navy in both
                      // themes, and the light-mode brass (#7F591C) would be
                      // unreadable on it. #EFD29E clears 4.5:1 against the
                      // lightest gradient stop (4.80).
                      color: Color(0xFFEFD29E),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6)),
              // Fades when the status arrives ("CHECKING" -> "PENDING").
              WTSwitcher(
                stateKey: '$statusKind:$statusLabel',
                alignment: AlignmentDirectional.topEnd,
                child: _seal(),
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
                  // White initials: 6.2:1 on the top stop, 9.2:1 below.
                  gradient:
                      const LinearGradient(colors: [_avatarTop, _avatarBottom]),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.14)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x66101C2E),
                        blurRadius: 16,
                        offset: Offset(0, 6))
                  ],
                ),
                // The gradient stays underneath as the fallback surface, so a
                // photo that fails to decode leaves the card looking designed
                // rather than leaving a hole in it.
                child: photo == null
                    ? Center(
                        child: Text(wtInitials(name),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w800)),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.memory(photo!,
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                            // Decode at the size shown, not the camera's.
                            cacheWidth:
                                (60 * MediaQuery.devicePixelRatioOf(context))
                                    .round()),
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
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4)),
                    const SizedBox(height: 3),
                    Text(role,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: 13)),
                  ],
                ),
              ),
            ],
          ),
          WTSwitcher(
            stateKey: detail ?? '',
            child: detail == null
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _credMeta('Status', detail),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _credMeta(String k, String v) => RichText(
        text: TextSpan(
          style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
              height: 1.5),
          children: [
            TextSpan(text: '$k  '),
            TextSpan(
                text: v,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontWeight: FontWeight.w600)),
          ],
        ),
      );
}

// ── Navigation (bottom bar, or side rail when wide) ──────────────────────────
class WTNavItem {
  const WTNavItem(
      {required this.icon,
      required this.label,
      required this.onTap,
      this.badge = false});
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool badge;
}

/// Material's NavigationBar on a phone held upright, a NavigationRail once the
/// window is [wtWideBreakpoint] wide. Both announce "Home, tab 1 of 5" and the
/// selected state themselves. Place it in [WTPage.nav].
class WTBottomNav extends StatelessWidget {
  const WTBottomNav(
      {super.key, required this.items, required this.activeIndex});
  final List<WTNavItem> items;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    // Off the tab screens (an approved worker's notifications, say) there is
    // no tab to mark and NavigationBar requires one; the back button leads
    // home instead.
    if (activeIndex < 0 || activeIndex >= items.length) {
      return const SizedBox.shrink();
    }
    void select(int i) => items[i].onTap();
    // The badge used to be an 8x8 dot with no text anywhere.
    Widget icon(WTNavItem item) => Badge(
          isLabelVisible: item.badge,
          backgroundColor: AppTheme.error,
          child: Icon(item.icon,
              semanticLabel: item.badge ? 'needs attention' : null),
        );
    if (wtIsWide(context)) {
      return DecoratedBox(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: AppTheme.border))),
        child: SafeArea(
          right: false,
          child: NavigationRail(
            selectedIndex: activeIndex,
            onDestinationSelected: select,
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
            destinations: [
              for (final item in items)
                NavigationRailDestination(
                    icon: icon(item), label: Text(item.label)),
            ],
          ),
        ),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppTheme.border))),
      child: NavigationBar(
        selectedIndex: activeIndex,
        onDestinationSelected: select,
        destinations: [
          for (final item in items)
            NavigationDestination(icon: icon(item), label: item.label),
        ],
      ),
    );
  }
}
