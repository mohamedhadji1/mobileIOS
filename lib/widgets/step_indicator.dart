import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String> stepLabels;

  int get totalSteps => stepLabels.length;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.stepLabels,
  });

  @override
  Widget build(BuildContext context) {
    final safeStep = currentStep.clamp(0, totalSteps - 1);
    return Semantics(
      label: 'Step ${safeStep + 1} of $totalSteps, ${stepLabels[safeStep]}',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            // Circles and Lines
            Stack(
              alignment: Alignment.center,
              children: [
                // Connector lines, inset by half a slot so each one starts and
                // ends under a circle.
                //
                // The insets are flex, not a measured EdgeInsets, because this
                // widget has to stay measurable: it sits inside WTFormBody,
                // whose IntrinsicHeight asks the subtree for an intrinsic
                // height, and a LayoutBuilder throws rather than answering it.
                // Slots are W/steps wide, so half a slot is W/(2*steps): give
                // each end spacer 1 unit and each connector 2, which totals
                // 2*steps units.
                Row(
                  children: [
                    const Spacer(),
                    for (int index = 0; index < totalSteps - 1; index++)
                      Expanded(
                        flex: 2,
                        child: Stack(
                          children: [
                            Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: AppTheme.border,
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                            AnimatedContainer(
                              duration: AppTheme.motion(context, 1000),
                              height: 2,
                              // Overshoots on purpose; the Stack clips it back
                              // to the connector's own width.
                              width: index < currentStep ? 1000 : 0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.accent,
                                    AppTheme.accentLight
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const Spacer(),
                  ],
                ),
                // Circles (Each centered in its Expanded slot)
                Row(
                  children: List.generate(totalSteps, (index) {
                    bool isCompleted = index < currentStep;
                    bool isActive = index == currentStep;

                    return Expanded(
                      child: Center(
                        child: AnimatedContainer(
                          duration: AppTheme.motion(context, 400),
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: isActive
                                ? LinearGradient(
                                    colors: [
                                      AppTheme.accent,
                                      AppTheme.accentLight
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  )
                                : null,
                            color: isActive
                                ? null
                                : (isCompleted
                                    ? AppTheme.accent
                                    : AppTheme.surfaceAlt),
                            border: Border.all(
                              color: isActive
                                  ? AppTheme.accent
                                  : (isCompleted
                                      ? AppTheme.accent
                                      : AppTheme.border2),
                              width: isActive ? 2 : 1,
                            ),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: AppTheme.accent
                                          .withValues(alpha: 0.4),
                                      blurRadius: 12,
                                      spreadRadius: 1,
                                    )
                                  ]
                                : null,
                          ),
                          child: Center(
                            child: isCompleted
                                ? const Icon(Icons.check_rounded,
                                    size: 14, color: Colors.white)
                                : FittedBox(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: isActive
                                            ? AppTheme.onAccent
                                            : AppTheme.faint,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Labels, one per Expanded slot, centred under its dot.
            //
            // One line, shrunk to fit. Five labels share the width, so a slot
            // is ~62dp on a phone, and each label is ONE word: wrapping could
            // only break the word itself ("EXPERIEN / CE"). scaleDown never
            // enlarges, so wider screens keep the full 11sp.
            //
            // The 5dp inset on each side is the gap between neighbours: with
            // 2dp, "EXPERIENCE DOCUMENTS BIOMETRICS" ran together at 390dp.
            Row(
              children: List.generate(totalSteps, (index) {
                bool isActive = index == currentStep;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        stepLabels[index].toUpperCase(),
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 11,
                          height: 1.25,
                          letterSpacing: 0.2,
                          fontWeight:
                              isActive ? FontWeight.w800 : FontWeight.w500,
                          color: isActive ? AppTheme.accent : AppTheme.faint,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
