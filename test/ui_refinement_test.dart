import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/profile_screen.dart';
import 'package:cypurge_mobile/screens/signup_form_screen.dart';
import 'package:cypurge_mobile/screens/status_screen.dart';
import 'package:cypurge_mobile/screens/worker_nav.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:cypurge_mobile/utils/worker_files.dart';

/// The screenshot-review pass: one monogram per worker, a credential card
/// legible in both themes, tab switches that fade rather than slide, readable
/// width on a tablet, and no duplicate or fake controls. Synthetic data only.
void main() {
  tearDown(() => AppTheme.light = true);

  group('wtInitials', () {
    test('first and last word, as Home always did', () {
      expect(wtInitials('Amira Ben Salah'), 'AS');
      expect(wtInitials('  amira   ben  '), 'AB');
    });

    test('one word gives two letters; no name gives a dash', () {
      expect(wtInitials('Amira'), 'AM');
      expect(wtInitials('   '), '–');
    });
  });

  group('credential card', () {
    Future<void> pumpCard(WidgetTester tester,
        {required String validity, bool light = true}) async {
      AppTheme.light = light;
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme(),
        home: Scaffold(
          body: WTCredentialCard(
            name: 'Amira Ben Salah',
            role: 'acme-test · Worker',
            statusKind: WTTagKind.amber,
            statusLabel: 'PENDING',
            validityText: validity,
          ),
        ),
      ));
      await tester.pump(const Duration(milliseconds: 300));
    }

    testWidgets('states the status once when the title repeats the seal',
        (tester) async {
      await pumpCard(tester, validity: 'Pending');
      expect(find.text('PENDING'), findsOneWidget);
      expect(find.textContaining('Status', findRichText: true), findsNothing);
      expect(find.text('AS'), findsOneWidget);
    });

    testWidgets('keeps a title that says more than the seal', (tester) async {
      await pumpCard(tester, validity: 'REVIEW REQUIRED');
      expect(find.textContaining('REVIEW REQUIRED', findRichText: true),
          findsOneWidget);
    });

    double contrast(Color a, Color b) {
      final la = a.computeLuminance(), lb = b.computeLuminance();
      return (la > lb ? la + 0.05 : lb + 0.05) /
          (la > lb ? lb + 0.05 : la + 0.05);
    }

    testWidgets('the seal is the same legible tone in both themes',
        (tester) async {
      // The card's lightest gradient stop: the worst background it has.
      const lightestStop = Color(0xFF2E5A92);
      final tones = <Color>[];
      for (final light in [true, false]) {
        await pumpCard(tester, validity: 'PENDING', light: light);
        final label = tester.widget<Text>(find.text('PENDING'));
        final pill = tester.widget<Container>(find
            .ancestor(
                of: find.text('PENDING'), matching: find.byType(Container))
            .first);
        final fill = (pill.decoration! as BoxDecoration).color!;
        final ground = Color.alphaBlend(fill, lightestStop);
        tones.add(label.style!.color!);
        expect(contrast(label.style!.color!, ground), greaterThan(4.5),
            reason: light ? 'light theme' : 'dark theme');
      }
      expect(tones.toSet(), hasLength(1),
          reason: 'the card is navy in both themes, so its seal must not '
              'follow the theme');
    });
  });

  group('tab switches', () {
    const tabs = {
      '/home': 0,
      '/documents': 1,
      '/status': 2,
      '/reverify': 3,
      '/profile': 4,
    };

    Widget tabPage(BuildContext context, String name) => WTPage(
          nav: WTBottomNav(
              items: workerNavItems(context, tabs[name]!),
              activeIndex: tabs[name]!),
          content: Text('page $name'),
        );

    Future<void> pumpTabs(WidgetTester tester,
        {bool reduceMotion = false}) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme(),
        builder: (context, child) => MediaQuery(
          data:
              MediaQuery.of(context).copyWith(disableAnimations: reduceMotion),
          child: child!,
        ),
        home: Builder(builder: (context) => tabPage(context, '/home')),
        // Every page the way the app builds them: a platform route.
        onGenerateRoute: (settings) => tabs.containsKey(settings.name)
            ? platformRoute<dynamic>(
                settings: settings,
                builder: (context) => tabPage(context, settings.name!))
            : null,
      ));
    }

    // skipOffstage: false — a pushed page spends its first frame offstage
    // while heroes are measured.
    ModalRoute<Object?> routeShowing(WidgetTester tester, String text) =>
        ModalRoute.of(tester.element(find.text(text, skipOffstage: false)))!;

    testWidgets('fade through, keeping the route name and push semantics',
        (tester) async {
      await pumpTabs(tester);
      await tester.tap(find.text('Docs'));
      await tester.pump();

      final route = routeShowing(tester, 'page /documents');
      expect(route, isA<FadeThroughRoute<Object?>>());
      expect(route.settings.name, '/documents');
      expect(route.settings.arguments, isNull);
      expect((route as FadeThroughRoute).transitionDuration,
          FadeThroughRoute.fadeThroughIn);

      await tester.pumpAndSettle();
      // Pushed, as before: Back returns to Home.
      expect(
          Navigator.of(tester.element(find.text('page /documents'))).canPop(),
          isTrue);
      expect(tester.takeException(), isNull);
    });

    testWidgets('Profile still replaces Home', (tester) async {
      await pumpTabs(tester);
      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      expect(find.text('page /home'), findsNothing);
      expect(routeShowing(tester, 'page /profile'),
          isA<FadeThroughRoute<Object?>>());
      expect(Navigator.of(tester.element(find.text('page /profile'))).canPop(),
          isFalse);
    });

    testWidgets('is instant under reduce motion', (tester) async {
      await pumpTabs(tester, reduceMotion: true);
      await tester.tap(find.text('Status'));
      await tester.pump();

      final route = routeShowing(tester, 'page /status') as FadeThroughRoute;
      expect(route.transitionDuration, Duration.zero);
      expect(route.reverseTransitionDuration, Duration.zero);
      expect(route.animation!.isCompleted, isTrue,
          reason: 'one frame, no animation');
    });

    // iOS has no fade-through convention, and its slide carries the
    // edge-swipe back that a pushed Docs/Status/Re-verify page must keep.
    testWidgets('on iOS a pushed tab keeps the slide and swipe back',
        (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      addTearDown(() => debugDefaultTargetPlatformOverride = null);
      await pumpTabs(tester);
      await tester.tap(find.text('Docs'));
      await tester.pumpAndSettle();
      expect(routeShowing(tester, 'page /documents'),
          isNot(isA<FadeThroughRoute<Object?>>()));

      // Swipe from the left edge across most of the screen.
      final gesture = await tester.startGesture(const Offset(5, 400));
      await gesture.moveBy(const Offset(300, 0));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(find.text('page /home'), findsOneWidget);
      expect(find.text('page /documents'), findsNothing);
      debugDefaultTargetPlatformOverride = null;
    });
  });

  group('readable width', () {
    Future<Size> contentSize(WidgetTester tester, Size window,
        {bool fullBleed = false}) async {
      tester.view.physicalSize = window;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      const key = Key('content');
      await tester.pumpWidget(MaterialApp(
        home: WTPage(
          fullBleed: fullBleed,
          content: const SizedBox.expand(key: key),
        ),
      ));
      return tester.getSize(find.byKey(key));
    }

    testWidgets('a tablet holds content to the readable width, centred',
        (tester) async {
      final size = await contentSize(tester, const Size(1024, 768));
      expect(size.width, wtReadableWidth);
      expect(tester.getCenter(find.byKey(const Key('content'))).dx, 512);
    });

    testWidgets('a full-bleed page (camera, splash) keeps the whole window',
        (tester) async {
      final size =
          await contentSize(tester, const Size(1024, 768), fullBleed: true);
      expect(size.width, 1024);
    });

    testWidgets('a phone is unaffected', (tester) async {
      final size = await contentSize(tester, const Size(390, 844));
      expect(size.width, 390);
    });
  });

  testWidgets('status error state offers one way to try again', (tester) async {
    // No session, so the status call fails with "Not logged in".
    FlutterSecureStorage.setMockInitialValues({});
    await tester.pumpWidget(
        MaterialApp(theme: AppTheme.theme(), home: const StatusScreen()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('My status'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
    expect(find.text('Refresh'), findsNothing);
  });

  testWidgets('profile shows the same initials as Home and no dead switches',
      (tester) async {
    FlutterSecureStorage.setMockInitialValues(
        {'cypurge_worker_name': 'Amira Ben Salah'});
    await tester.pumpWidget(
        MaterialApp(theme: AppTheme.theme(), home: const ProfileScreen()));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('AS'), findsOneWidget);
    expect(find.text('AB'), findsNothing);
    expect(find.byType(Switch), findsNothing);
    expect(find.text('SETTINGS'), findsNothing);
    expect(find.text('Your files'), findsOneWidget);
  });

  testWidgets('the sign-up consent row lays out, and toggles from anywhere',
      (tester) async {
    FlutterSecureStorage.setMockInitialValues({});
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
        MaterialApp(theme: AppTheme.theme(), home: const SignUpFormScreen()));
    await tester.pump();
    // "ink splashes may be invisible" and a form overflow are both framework
    // errors, which would surface here.
    expect(tester.takeException(), isNull);

    bool checked() => tester.widget<Checkbox>(find.byType(Checkbox)).value!;
    final explanation = find.textContaining('sanctions lists');
    await tester.ensureVisible(explanation);
    await tester.pumpAndSettle();
    expect(checked(), isFalse);

    await tester.tap(explanation);
    await tester.pump();
    expect(checked(), isTrue, reason: 'tapping the text toggles the box');

    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(checked(), isFalse);
    expect(tester.takeException(), isNull);
  });

  test('one icon per document type, whatever spelling arrives', () {
    for (final passport in ['passport', 'PASSPORT', 'Passport']) {
      expect(documentTypeIcon(passport), Icons.menu_book_rounded);
    }
    for (final licence in [
      'license_front',
      "Driver's License (Front)",
      'driving_licence_back'
    ]) {
      expect(documentTypeIcon(licence), Icons.directions_car_rounded,
          reason: licence);
    }
    for (final id in ['id_back', 'National ID (Front)', 'identity_card']) {
      expect(documentTypeIcon(id), Icons.badge_rounded, reason: id);
    }
    expect(documentTypeIcon('Education License'), Icons.school_rounded);
  });
}
