import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cypurge_mobile/screens/re_verification_screen.dart'
    show isLivenessTask;
import 'package:cypurge_mobile/screens/reverify_entry.dart';
import 'package:cypurge_mobile/services/notification_inbox.dart';

/// The Re-verify tab used to show every worker the same canned request —
/// "upload your Identity Document" — because it was built only from a push's
/// arguments and the tab passes none. It now shows the newest request this
/// phone was actually sent, or says there is nothing to do.
void main() {
  InboxItem push(String? route, int day,
          {Map<String, dynamic> args = const {}}) =>
      InboxItem(
        title: 'Re-verification',
        body: '',
        route: route,
        args: args,
        receivedAt: DateTime(2026, 10, day),
      );

  group('latestReverifyPush', () {
    test('picks the newest re-verification request', () {
      final items = [
        push('/reverify', 2),
        push('/reverify', 5),
        push('/reverify', 3)
      ];
      expect(latestReverifyPush(items)?.receivedAt, DateTime(2026, 10, 5));
    });

    test('ignores every other kind of notification', () {
      final items = [
        push('/status', 9),
        push('/verify-face', 8),
        push(null, 7)
      ];
      expect(latestReverifyPush(items), isNull);
    });

    test('skips a request already answered on this phone', () {
      final items = [push('/reverify', 2), push('/reverify', 4)];
      expect(
          latestReverifyPush(items, answeredAt: DateTime(2026, 10, 4)), isNull);
      expect(
        latestReverifyPush(items, answeredAt: DateTime(2026, 10, 3))
            ?.receivedAt,
        DateTime(2026, 10, 4),
      );
    });

    test('is null with an empty inbox', () {
      expect(latestReverifyPush(const []), isNull);
    });
  });

  group('reverifyDeadline', () {
    test('reads an ISO-8601 deadline', () {
      expect(reverifyDeadline({'deadline': '2026-10-20T00:00:00Z'}),
          DateTime.utc(2026, 10, 20));
    });

    test('reads a number of days from now', () {
      expect(reverifyDeadline({'deadline_days': 3}, now: DateTime(2026, 10, 6)),
          DateTime(2026, 10, 9));
    });

    test('is null when the request sets none', () {
      expect(reverifyDeadline(const {}), isNull);
      expect(reverifyDeadline(null), isNull);
    });
  });

  group('reverifyDocuments', () {
    test('reads a list or a comma-separated string', () {
      expect(
          reverifyDocuments({
            'flagged_documents': ['Passport', 'Visa']
          }),
          ['Passport', 'Visa']);
      expect(reverifyDocuments({'documents': 'Passport, Visa'}),
          ['Passport', 'Visa']);
    });

    test('reads the list the dashboard writes into the message', () {
      expect(
          reverifyDocuments(
              {'message': 'Re-upload: PASSPORT. Photo is blurred.'}),
          ['PASSPORT']);
    });
  });

  // The dashboard's one-click face re-check (WorkerProfile, FACE_LIVENESS):
  // the push's reason text is the only place the item list travels.
  const faceRecheck = {
    'reason': 'Re-upload: Face scan (liveness). Please repeat your face scan.',
  };

  test('reads the dashboard face re-check as a liveness task', () {
    final docs = reverifyDocuments(faceRecheck);
    expect(docs, ['Face scan (liveness)']);
    expect(isLivenessTask(docs.single), isTrue);
  });

  testWidgets('a face-only request talks about a face scan, not uploads',
      (tester) async {
    FlutterSecureStorage.setMockInitialValues({});
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(
        home: reverifyScreenFor({'reason': 'Re-upload: Face scan (liveness).'})));

    expect(tester.takeException(), isNull);
    expect(find.text('Your organization asked you to repeat your face scan.'),
        findsOneWidget);
    expect(find.text('Start face scan'), findsOneWidget);
    expect(find.text('Requested · tap to start'), findsOneWidget);
    expect(find.textContaining('re-upload'), findsNothing);
  });

  testWidgets('the tab says there is nothing to do when nobody asked',
      (tester) async {
    FlutterSecureStorage.setMockInitialValues({});
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MaterialApp(home: ReverifyFromInbox()));
    await tester.pump(); // inbox and storage resolve
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(find.text('Nothing to re-verify'), findsOneWidget);
    // The canned request it used to show to everyone.
    expect(find.text('Identity Document'), findsNothing);
  });
}
