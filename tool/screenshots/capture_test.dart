// Headless screenshots of the main screens, light and dark, for design review.
//
//   C:\flutterSDK\flutter\bin\flutter test --no-pub tool/screenshots/capture_test.dart
//
// Writes build/screenshots/<screen>_<light|dark>.png and report.txt. One
// testWidgets per capture, so a screen that throws costs only its own PNG.
// See README.md in this folder.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/main.dart' show HomeScreen;
import 'package:cypurge_mobile/screens/biometrics_enrollment_screen.dart';
import 'package:cypurge_mobile/screens/cv_upload_screen.dart';
import 'package:cypurge_mobile/screens/document_upload_screen.dart';
import 'package:cypurge_mobile/screens/documents_screen.dart';
import 'package:cypurge_mobile/screens/login_screen.dart';
import 'package:cypurge_mobile/screens/notifications_screen.dart';
import 'package:cypurge_mobile/screens/pending_approval_screen.dart';
import 'package:cypurge_mobile/screens/profile_screen.dart';
import 'package:cypurge_mobile/screens/reverify_entry.dart';
import 'package:cypurge_mobile/screens/signup_form_screen.dart';
import 'package:cypurge_mobile/screens/status_screen.dart';
import 'package:cypurge_mobile/screens/worker_files_screen.dart';
import 'package:cypurge_mobile/services/notification_inbox.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/utils/worker_files.dart';

import 'fixtures.dart';
import 'harness.dart';

const _phone = Size(390, 844);
const _phoneOnItsSide = Size(844, 390);
const _tablet = Size(1024, 768);
const _devicePixelRatio = 2.0;

/// One screen to capture. Camera screens are left out: their plugins cannot
/// run headless.
class _Shot {
  const _Shot(this.name, this.build,
      {this.size = _phone, this.themes = const [true, false]});

  final String name;
  final Widget Function() build;
  final Size size;

  /// `true` = light, `false` = dark.
  final List<bool> themes;
}

final _shots = <_Shot>[
  _Shot('login', () => const SecureLoginScreen()),
  _Shot('home', () => const HomeScreen()),
  _Shot('documents', () => const DocumentsScreen()),
  _Shot('status', () => const StatusScreen()),
  _Shot('profile', () => const ProfileScreen()),
  _Shot('notifications', () => const NotificationsScreen()),
  _Shot(
      'pending_approval',
      () => PendingApprovalScreen(
          statusTitle: 'PENDING REVIEW', onRefresh: () async {})),
  _Shot('signup_form', () => const SignUpFormScreen()),
  _Shot('biometrics_enrollment', () => const BiometricsEnrollmentScreen()),
  _Shot('cv_upload', () => const CvUploadScreen()),
  // Seven copies of one CV (what repeat uploads left behind) plus two IDs:
  // the CV must read as one row with its earlier copies folded.
  _Shot(
      'worker_files',
      () => WorkerFilesScreen(
            loadFiles: () async => [
              for (var i = 0; i < 7; i++)
                WorkerFile(id: 'cv-$i', docType: 'CV', status: 'VERIFIED'),
              const WorkerFile(
                  id: 'p-1', docType: 'PASSPORT', status: 'NEEDS_REVIEW'),
              const WorkerFile(
                  id: 'id-1',
                  docType: 'National ID (Front)',
                  status: 'UPLOAD_EXPIRED'),
            ],
          )),
  _Shot('document_upload',
      () => const DocumentUploadScreen(enrollmentMode: false)),
  _Shot('reverify', () => const ReverifyFromInbox()),
  _Shot('home_landscape', () => const HomeScreen(),
      size: _phoneOnItsSide, themes: const [true]),
  _Shot('home_tablet', () => const HomeScreen(),
      size: _tablet, themes: const [true]),
];

void main() {
  final report = CaptureReport();

  setUpAll(() async {
    outputDir.createSync(recursive: true);
    IOOverrides.global = NoNetworkOverrides();
    await loadRealFonts();
    // The inbox caches its first load() future for the whole run. Created
    // inside one test's fake zone, later tests awaiting it would hang (its
    // callbacks go to a zone nobody pumps), so create it here, in real time.
    // ignore: invalid_use_of_visible_for_testing_member
    FlutterSecureStorage.setMockInitialValues(demoStorage());
    await NotificationInbox.instance.load();
  });

  tearDownAll(() {
    IOOverrides.global = null;
    report.write();
  });

  for (final shot in _shots) {
    for (final light in shot.themes) {
      final name = '${shot.name}_${light ? 'light' : 'dark'}';
      testWidgets('capture $name', (tester) async {
        _arrange(tester, shot.size, light: light);
        try {
          final problems = await collectingErrors(tester, () async {
            await tester.pumpWidget(_app(shot.build()));
            await settle(tester);
            await runRealAsyncWork(tester);
            await settle(tester, frames: 2);
            await capturePng(tester, name);
            // Unmount and run out leftover timers (timeouts, delayed
            // entrances) so the binding's pending-timer check passes.
            await tester.pumpWidget(const SizedBox.shrink());
            await tester.pump(const Duration(seconds: 30));
          });
          report.ok(name, problems);
        } catch (e) {
          report.failed(name, e);
          rethrow;
        }
      });
    }
  }
}

/// Phone/tablet size, theme and synthetic storage for one capture; all of it
/// is put back after the test.
void _arrange(WidgetTester tester, Size size, {required bool light}) {
  tester.view.physicalSize = size * _devicePixelRatio;
  tester.view.devicePixelRatio = _devicePixelRatio;
  tester.platformDispatcher.platformBrightnessTestValue =
      light ? Brightness.light : Brightness.dark;
  AppTheme.light = light;
  // tool/ is not a test directory to the analyzer, but this is a test.
  // ignore: invalid_use_of_visible_for_testing_member
  FlutterSecureStorage.setMockInitialValues(demoStorage());
  NotificationInbox.instance.items.value = demoInbox;
  addTearDown(() {
    tester.view.reset();
    tester.platformDispatcher.clearPlatformBrightnessTestValue();
    AppTheme.light = true;
  });
}

/// The app's own MaterialApp setup (theme, locales), minus routing.
Widget _app(Widget home) => RepaintBoundary(
      key: captureBoundaryKey,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme(),
        themeAnimationDuration: Duration.zero,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: home,
      ),
    );
