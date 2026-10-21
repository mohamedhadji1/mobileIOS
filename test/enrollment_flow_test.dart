import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/enrollment_flow_screen.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';

/// The contract that makes "go back a step" safe: stepping back and forward
/// must hand the worker the same step, with its state, not a rebuilt empty
/// one. Every real step writes to the backend with no way to read it back, so
/// a rebuilt step would re-send jobs and documents.
void main() {
  /// A stand-in step: counts taps, so lost state shows up as a reset count.
  Widget fakeStep(int i) => _FakeStep(i);

  Future<EnrollmentFlowState> pumpFlow(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => TextButton(
          child: const Text('open'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => EnrollmentFlowScreen(stepBuilder: fakeStep),
            ),
          ),
        ),
      ),
    ));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    return tester.state<EnrollmentFlowState>(find.byType(EnrollmentFlowScreen));
  }

  testWidgets('a step keeps its state across back and forward', (tester) async {
    final flow = await pumpFlow(tester);

    await tester.tap(find.text('tap 0'));
    await tester.tap(find.text('tap 0'));
    await tester.pump();
    expect(find.text('step 0 count 2'), findsOneWidget);

    await tester.tap(find.text('next 0'));
    await tester.pump();
    expect(flow.step, 1);
    await tester.tap(find.text('tap 1'));
    await tester.pump();

    flow.back();
    await tester.pump();
    expect(flow.step, 0);
    expect(find.text('step 0 count 2'), findsOneWidget,
        reason: 'going back must not rebuild the earlier step');

    flow.next();
    await tester.pump();
    expect(flow.step, 1);
    expect(find.text('step 1 count 1'), findsOneWidget,
        reason: 'going forward again must not rebuild the later step');
    // Let the button press animations finish.
    await tester.pumpAndSettle();
  });

  testWidgets('system back walks the steps before leaving the flow',
      (tester) async {
    final flow = await pumpFlow(tester);
    flow.next();
    flow.next();
    await tester.pump();
    expect(flow.step, 2);

    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(flow.step, 1);
    expect(find.byType(EnrollmentFlowScreen), findsOneWidget);

    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(flow.step, 0);

    // Only the first step lets the gesture leave.
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.byType(EnrollmentFlowScreen), findsNothing);
  });

  testWidgets('back and next stay inside the step range', (tester) async {
    final flow = await pumpFlow(tester);
    flow.back();
    await tester.pump();
    expect(flow.step, 0);
    for (var i = 0; i < 10; i++) {
      flow.next();
    }
    await tester.pump();
    expect(flow.step, EnrollmentFlowScreen.stepCount - 1);
  });

  testWidgets('back button shows inside the flow only', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: EnrollmentBackButton('Back to details'),
    ));
    expect(find.byType(WTIconButton), findsNothing);

    final flow = await pumpFlow(tester);
    flow.next();
    await tester.pump();
    // Step 1's fake renders a back button; tapping it returns to step 0.
    // The chevron, not the full-width Align around it.
    await tester.tap(find.descendant(
        of: find.byKey(const ValueKey('back 1')),
        matching: find.byType(WTIconButton)));
    await tester.pump();
    expect(flow.step, 0);
  });
}

class _FakeStep extends StatefulWidget {
  const _FakeStep(this.index);
  final int index;

  @override
  State<_FakeStep> createState() => _FakeStepState();
}

class _FakeStepState extends State<_FakeStep> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    final i = widget.index;
    return WTPage(
      content: Column(
        children: [
          EnrollmentBackButton('Back', key: ValueKey('back $i')),
          Text('step $i count $_count'),
          TextButton(
            child: Text('tap $i'),
            onPressed: () => setState(() => _count++),
          ),
          TextButton(
            child: Text('next $i'),
            onPressed: () => EnrollmentFlowScreen.maybeOf(context)!.next(),
          ),
        ],
      ),
    );
  }
}
