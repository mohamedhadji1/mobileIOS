import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/biometrics_enrollment_screen.dart';
import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import 'package:cypurge_mobile/screens/notifications_screen.dart';
import 'package:cypurge_mobile/screens/pending_approval_screen.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:cypurge_mobile/widgets/country_picker_dialog.dart';

/// The app turns with the phone now, so its screens must lay out on their
/// side and on a tablet, and navigation moves to a side rail once there is
/// room. This stands in for the rotation and tablet checks a device would do.
void main() {
  const phone = Size(390, 844);
  const phoneOnItsSide = Size(844, 390);
  const tablet = Size(1024, 768);

  Future<void> pumpAt(WidgetTester tester, Size size, Widget home) async {
    FlutterSecureStorage.setMockInitialValues({});
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(MaterialApp(theme: AppTheme.theme(), home: home));
    await tester.pump();
  }

  Widget tabs({int active = 0, bool badge = false}) => WTPage(
        nav: WTBottomNav(
          activeIndex: active,
          items: [
            WTNavItem(icon: Icons.home_rounded, label: 'Home', onTap: () {}),
            WTNavItem(
                icon: Icons.notifications_rounded,
                label: 'Alerts',
                badge: badge,
                onTap: () {}),
          ],
        ),
        content: const Text('body'),
      );

  group('navigation', () {
    testWidgets('a phone held upright gets the bottom bar', (tester) async {
      await pumpAt(tester, phone, tabs());
      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.byType(NavigationRail), findsNothing);
    });

    for (final (name, size) in [
      ('a phone on its side', phoneOnItsSide),
      ('a tablet', tablet)
    ]) {
      testWidgets('$name gets the side rail', (tester) async {
        await pumpAt(tester, size, tabs());
        expect(find.byType(NavigationRail), findsOneWidget);
        expect(find.byType(NavigationBar), findsNothing);
        // The content sits beside the rail, not under it.
        expect(
          tester.getTopLeft(find.text('body')).dx,
          greaterThanOrEqualTo(
              tester.getTopRight(find.byType(NavigationRail)).dx),
        );
      });
    }

    testWidgets('a screen outside the tabs shows no bar', (tester) async {
      await pumpAt(tester, phone, tabs(active: -1));
      expect(find.byType(NavigationBar), findsNothing);
      expect(find.text('body'), findsOneWidget);
    });

    testWidgets('a badge is spoken, not only drawn', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpAt(tester, phone, tabs(badge: true));
      expect(find.bySemanticsLabel(RegExp('needs attention')), findsOneWidget);
      handle.dispose();
    });
  });

  // Overflow ("RIGHT OVERFLOWED BY …") fails a test by itself, with the
  // framework's report naming the widget.
  final screens = <String, Widget Function()>{
    'biometrics': () => const BiometricsEnrollmentScreen(),
    'fingerprint': () => const FingerprintScanScreen(),
    'waiting for HR': () => PendingApprovalScreen(
        statusTitle: 'PENDING REVIEW', onRefresh: () async {}),
    'notifications': () => const NotificationsScreen(),
  };
  for (final (sizeName, size) in [
    ('on its side', phoneOnItsSide),
    ('on a tablet', tablet)
  ]) {
    for (final MapEntry(key: name, value: build) in screens.entries) {
      testWidgets('$name page lays out $sizeName', (tester) async {
        await pumpAt(tester, size, build());
        await tester.pump();
        expect(tester.takeException(), isNull);
      });
    }
  }

  // AlertDialog measures its content's intrinsic width, and a bare ListView
  // cannot answer that: the picker threw the moment it opened.
  testWidgets('the country picker opens and lists countries', (tester) async {
    await pumpAt(
      tester,
      phone,
      Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () => showCountryPicker(context),
            child: const Text('pick'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('pick'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('Select nationality'), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets('a status message has an icon, a close button and its action',
      (tester) async {
    var opened = false;
    await pumpAt(
      tester,
      phone,
      Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () => wtInfoBar(
              context,
              'Uploaded',
              message: 'All three documents are in.',
              severity: WTSeverity.success,
              actionLabel: 'Open',
              onAction: () => opened = true,
            ),
            child: const Text('send'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('send'));
    await tester.pumpAndSettle();

    expect(find.text('Uploaded'), findsOneWidget);
    expect(find.text('All three documents are in.'), findsOneWidget);
    // Meaning never rests on colour alone.
    expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
    expect(find.byTooltip('Close'), findsOneWidget);

    await tester.tap(find.text('Open'));
    expect(opened, isTrue);
  });
}
