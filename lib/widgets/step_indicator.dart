import 'package:fluent_ui/fluent_ui.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final double totalWidth = constraints.maxWidth;
        final double slotWidth = totalWidth / totalSteps;
        final double linePadding = slotWidth / 2;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            children: [
              // Circles and Lines
              Stack(
                alignment: Alignment.center,
                children: [
                  // Background Lines (Centered between circles)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: linePadding),
                    child: Row(
                      children: List.generate(totalSteps - 1, (index) {
                        bool isCompleted = index < currentStep;
                        return Expanded(
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
                                duration: const Duration(milliseconds: 1000),
                                height: 2,
                                width: isCompleted ? 1000 : 0,
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
                        );
                      }),
                    ),
                  ),
                  // Circles (Each centered in its Expanded slot)
                  Row(
                    children: List.generate(totalSteps, (index) {
                      bool isCompleted = index < currentStep;
                      bool isActive = index == currentStep;

                      return Expanded(
                        child: Center(
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
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
                                  ? const Icon(FluentIcons.check_mark,
                                      size: 14, color: Colors.white)
                                  : Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: isActive
                                            ? AppTheme.accent
                                            : AppTheme.faint,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
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
              // Labels (Each centered in its Expanded slot)
              Row(
                children: List.generate(totalSteps, (index) {
                  bool isActive = index == currentStep;
                  return Expanded(
                    child: Text(
                      stepLabels[index].toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9,
                        letterSpacing: 0.8,
                        fontWeight:
                            isActive ? FontWeight.w800 : FontWeight.w500,
                        color: isActive ? AppTheme.accent : AppTheme.faint,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
