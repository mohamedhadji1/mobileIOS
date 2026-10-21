import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/shift_card.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';

/// ShiftCard sits on the home screen, which only a worker HR has approved ever
/// reaches. Its button is a WTButton — a full-width CTA — placed in a Row, which
/// gives it no width to fill: it asked for infinite width, layout threw, and
/// every approved worker got a black screen straight after signing in.
///
/// Same class of bug as form_body_step_indicator_test.dart: invisible to
/// `flutter analyze`, only caught by actually laying the widget out.
void main() {
  Future<void> show(WidgetTester tester,
      {double width = 400, double textScale = 1}) async {
    tester.view.physicalSize = Size(width, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(
      home: MediaQuery(
        data: MediaQueryData(
          size: Size(width, 800),
          textScaler: TextScaler.linear(textScale),
        ),
        child: const WTPage(content: ShiftCard()),
      ),
    ));
    // _load reads secure storage asynchronously, then rebuilds.
    await tester.pump();
  }

  testWidgets('lays out off shift', (tester) async {
    FlutterSecureStorage.setMockInitialValues({});
    await show(tester);
    expect(tester.takeException(), isNull);
    expect(find.text('Not on shift'), findsOneWidget);
    expect(find.text('Start shift'), findsOneWidget);
  });

  testWidgets('lays out on shift', (tester) async {
    FlutterSecureStorage.setMockInitialValues({
      'shift_id': 's1',
      'shift_started_at': '2026-10-06T08:30:00Z',
    });
    await show(tester);
    expect(tester.takeException(), isNull);
    expect(find.text('End shift'), findsOneWidget);
  });

  testWidgets('fits the smallest phone with large text', (tester) async {
    FlutterSecureStorage.setMockInitialValues({});
    await show(tester, width: 320, textScale: 1.3);
    expect(tester.takeException(), isNull);
    expect(find.text('Start shift'), findsOneWidget);
  });
}
