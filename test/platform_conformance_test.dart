import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/fingerprint_scan_screen.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:cypurge_mobile/theme/theme_preference.dart';

/// Platform conformance: platform page routes, the native spinner, a theme
/// that follows the phone, a capped entrance stagger, and a fingerprint scan
/// a screen reader can run.
void main() {
  Widget app(Widget home) => MaterialApp(theme: AppTheme.theme(), home: home);

  group('WTSpinner', () {
    // A string semanticsValue ("40%") failed the semantics assertion the
    // moment a screen reader — or this test — asked for the tree.
    testWidgets('a determinate spinner survives a semantics update',
        (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(app(const Center(child: WTSpinner(value: 0.4))));
      expect(tester.takeException(), isNull);
      handle.dispose();
    });

    testWidgets('an indeterminate spinner announces it is loading',
        (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(app(const Center(child: WTSpinner())));
      expect(tester.takeException(), isNull);
      expect(find.bySemanticsLabel('Loading'), findsOneWidget);
      handle.dispose();
    });
  });

  testWidgets('platformRoute pushes and pops', (tester) async {
    await tester.pumpWidget(app(Builder(
      builder: (context) => Center(
        child: TextButton(
          onPressed: () => Navigator.push(
            context,
            platformRoute<void>(builder: (_) => const Text('second page')),
          ),
          child: const Text('open'),
        ),
      ),
    )));
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    expect(find.text('second page'), findsOneWidget);

    Navigator.of(tester.element(find.text('second page'))).pop();
    await tester.pumpAndSettle();
    expect(find.text('open'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  group('ThemePreference', () {
    test('follows the phone until the worker picks a theme', () async {
      FlutterSecureStorage.setMockInitialValues({});
      await ThemePreference.load(system: Brightness.dark);
      expect(AppTheme.light, isFalse);
      expect(ThemePreference.followsSystem, isTrue);

      ThemePreference.systemChanged(system: Brightness.light);
      expect(AppTheme.light, isTrue);
    });

    test('a stored pick wins over the phone', () async {
      FlutterSecureStorage.setMockInitialValues(
          {ThemePreference.storageKey: 'dark'});
      await ThemePreference.load(system: Brightness.light);
      expect(AppTheme.light, isFalse);
      expect(ThemePreference.followsSystem, isFalse);
    });

    test('the switch is remembered and stops following the phone', () async {
      FlutterSecureStorage.setMockInitialValues({});
      await ThemePreference.load(system: Brightness.light);
      await ThemePreference.toggle();
      expect(AppTheme.light, isFalse);
      expect(ThemePreference.notifier.value, Brightness.dark);
      expect(
        await const FlutterSecureStorage()
            .read(key: ThemePreference.storageKey),
        'dark',
      );

      ThemePreference.systemChanged(system: Brightness.light);
      expect(AppTheme.light, isFalse,
          reason: 'a picked theme ignores the phone');

      await ThemePreference.load(system: Brightness.light);
      expect(AppTheme.light, isFalse, reason: 'the pick survives a restart');
    });

    tearDown(() => AppTheme.light = true);
  });

  test('the entrance stagger is capped', () {
    final items = wtStagger(List.generate(12, (_) => const SizedBox()));
    final delays = items.cast<WTEntrance>().map((e) => e.delayMs).toList();
    expect(delays.first, 0);
    expect(delays[1], 40);
    expect(delays.last, 240, reason: 'twelve items no longer wait 770 ms');
  });

  // Press-and-hold is out of reach for a screen reader: its double-tap fires
  // the semantic tap, never tap-down/tap-up.
  testWidgets('the fingerprint scan can be started without holding',
      (tester) async {
    FlutterSecureStorage.setMockInitialValues({});
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(app(const FingerprintScanScreen()));
    await tester.pump();

    expect(
      tester.getSemantics(find.bySemanticsLabel('Scan fingerprint')),
      matchesSemantics(
        label: 'Scan fingerprint',
        hint: 'Double-tap to scan',
        isButton: true,
        hasTapAction: true,
        hasEnabledState: true,
        isEnabled: true,
      ),
    );
    handle.dispose();
  });

  // The face re-lock opens a camera screen over another camera screen. The
  // top one closing must not hand rotation and the status bar back while the
  // one underneath is still a viewfinder.
  testWidgets(
      'stacked camera screens restore rotation only when the last closes',
      (tester) async {
    final orientations = <List<Object?>>[];
    final messenger = tester.binding.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'SystemChrome.setPreferredOrientations') {
        orientations.add(call.arguments as List<Object?>);
      }
      return null;
    });
    addTearDown(() =>
        messenger.setMockMethodCallHandler(SystemChannels.platform, null));

    await tester.pumpWidget(app(const _Camera('first')));
    final nav = Navigator.of(tester.element(find.text('first')));
    nav.push(platformRoute<void>(builder: (_) => const _Camera('second')));
    await tester.pumpAndSettle();
    nav.pop();
    await tester.pumpAndSettle();
    expect(orientations.last, isNotEmpty,
        reason: 'the first camera screen is still showing');

    await tester.pumpWidget(const SizedBox());
    expect(orientations.last, isEmpty, reason: 'no camera screen is left');
  });
}

class _Camera extends StatefulWidget {
  const _Camera(this.label);
  final String label;

  @override
  State<_Camera> createState() => _CameraState();
}

class _CameraState extends State<_Camera> with CameraFullScreen {
  @override
  Widget build(BuildContext context) => WTPage(content: Text(widget.label));
}
