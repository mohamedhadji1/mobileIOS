import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/biometrics_enrollment_screen.dart';
import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import 'package:cypurge_mobile/screens/notifications_screen.dart';
import 'package:cypurge_mobile/screens/pending_approval_screen.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:cypurge_mobile/widgets/step_indicator.dart';

/// Guards the layout contract between [WTFormBody] and [StepIndicator].
///
/// WTFormBody wraps its child in an IntrinsicHeight so a Spacer inside a form
/// still works. IntrinsicHeight asks the subtree to measure itself, and a
/// LayoutBuilder answers that question by throwing. StepIndicator used to be a
/// LayoutBuilder, so every screen that combined the two — sign-up details, CV
/// upload, work experience — threw during layout and rendered a black screen.
///
/// Neither `flutter analyze` nor a render-free unit test can see this: it only
/// appears when something actually measures the tree.
void main() {
  Widget host(Widget child) => MaterialApp(
        home: WTPage(
          content: WTFormBody(child: child),
        ),
      );

  testWidgets('StepIndicator can be measured inside WTFormBody',
      (tester) async {
    await tester.pumpWidget(host(
      const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StepIndicator(
            currentStep: 1,
            stepLabels: [
              'Scan',
              'Details',
              'Experience',
              'Documents',
              'Biometrics'
            ],
          ),
          // The Spacer is the reason WTFormBody needs IntrinsicHeight at all,
          // so the regression only reproduces with one present.
          Spacer(),
          Text('bottom'),
        ],
      ),
    ));

    expect(tester.takeException(), isNull);
    expect(find.text('SCAN'), findsOneWidget);
    expect(find.text('BIOMETRICS'), findsOneWidget);
  });

  // The smallest phone we support, with the text size turned up. An overflow
  // ("BOTTOM OVERFLOWED BY 62 PIXELS") fails the test on its own, with the
  // framework's full report naming the widget; takeException would keep only
  // the one-line summary.
  Future<void> onSmallPhone(WidgetTester tester, Widget screen) async {
    FlutterSecureStorage.setMockInitialValues({});
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(
            size: Size(320, 568), textScaler: TextScaler.linear(1.3)),
        child: screen,
      ),
    ));
    await tester.pump();
  }

  testWidgets('biometrics page fits a small phone', (tester) async {
    await onSmallPhone(tester, const BiometricsEnrollmentScreen());
    // One word, one line: it used to break as "EXPERIEN / CE".
    expect(tester.getSize(find.text('EXPERIENCE')).height, lessThan(24));
  });

  testWidgets('fingerprint page fits a small phone', (tester) async {
    await onSmallPhone(tester, const FingerprintScanScreen());
  });

  testWidgets('waiting-for-HR page fits a small phone', (tester) async {
    await onSmallPhone(
        tester,
        PendingApprovalScreen(
            statusTitle: 'PENDING REVIEW', onRefresh: () async {}));
    expect(find.text('PENDING REVIEW'), findsOneWidget);
  });

  testWidgets('empty notifications page fits a small phone', (tester) async {
    await onSmallPhone(tester, const NotificationsScreen());
    await tester.pump();
    expect(find.text('No notifications yet'), findsOneWidget);
  });

  testWidgets('connector lines survive both ends of the step range',
      (tester) async {
    for (final step in [0, 4]) {
      await tester.pumpWidget(host(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StepIndicator(
              currentStep: step,
              stepLabels: const [
                'Scan',
                'Details',
                'Experience',
                'Documents',
                'Biometrics'
              ],
            ),
            const Spacer(),
          ],
        ),
      ));
      expect(tester.takeException(), isNull, reason: 'currentStep $step');
    }
  });
}
