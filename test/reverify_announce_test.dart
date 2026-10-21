import 'package:cypurge_mobile/generated/case/v1/case.pb.dart';
import 'package:cypurge_mobile/services/cypurge_grpc_service.dart';
import 'package:cypurge_mobile/services/enrollment_service.dart';
import 'package:cypurge_mobile/services/notification_service.dart';
import 'package:cypurge_mobile/services/re_verify_service.dart';
import 'package:cypurge_mobile/utils/resubmission_message.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReVerifyService.fetchPendingTasks flagged documents', () {
    setUp(() => FlutterSecureStorage.setMockInitialValues({'tenant_id': 't1'}));

    Future<List<String>> flaggedFor(ReverificationRequest r) async {
      final tasks = await ReVerifyService(
        grpc: _FakeGrpc([r..workerId = 'w1']),
        enrollment: _FakeEnrollment(),
      ).fetchPendingTasks();
      return tasks.single.flaggedDocuments;
    }

    test('prefers the request\'s own flagged_documents', () async {
      expect(
        await flaggedFor(ReverificationRequest(
          triggerReason: 'Re-upload: VISA. Blurred.',
          flaggedDocuments: ['PASSPORT', 'FACE_LIVENESS'],
        )),
        ['PASSPORT', 'FACE_LIVENESS'],
      );
    });

    test('falls back to the reason text when an older backend sends none',
        () async {
      expect(
        await flaggedFor(
            ReverificationRequest(triggerReason: 'Re-upload: VISA. Blurred.')),
        ['VISA'],
      );
    });
  });

  group('parseFlaggedDocuments', () {
    test('reads the list the dashboard writes, stopping at the sentence end', () {
      expect(
        parseFlaggedDocuments(
            'Re-upload: Driving License (Back), PASSPORT. Photo is blurred.'),
        ['Driving License (Back)', 'PASSPORT'],
      );
    });

    test('works with no free text and with no trailing period', () {
      expect(parseFlaggedDocuments('Re-upload: PASSPORT.'), ['PASSPORT']);
      expect(parseFlaggedDocuments('Re-upload: PASSPORT'), ['PASSPORT']);
    });

    test('is empty for ordinary reasons and empty strings', () {
      expect(parseFlaggedDocuments('Your passport expired.'), isEmpty);
      expect(parseFlaggedDocuments(''), isEmpty);
    });
  });

  group('NotificationService payload codec', () {
    test('a plain route payload stays a route with no args', () {
      final d = NotificationService.decodePayload('/status');
      expect(d.route, '/status');
      expect(d.args, isEmpty);
    });

    test('args round-trip through encode/decode', () {
      final payload = NotificationService.encodePayload('/reverify', {
        'message': 'Re-upload: PASSPORT.',
        'deadline_days': 2,
      });
      final d = NotificationService.decodePayload(payload!);
      expect(d.route, '/reverify');
      expect(d.args['message'], 'Re-upload: PASSPORT.');
      expect(d.args['deadline_days'], 2);
    });

    test('no args encodes to the bare route, so old payloads keep working', () {
      expect(NotificationService.encodePayload('/status', const {}), '/status');
      expect(NotificationService.encodePayload(null, const {}), isNull);
    });

    test('malformed JSON falls back to treating the payload as a route', () {
      final d = NotificationService.decodePayload('{not json');
      expect(d.route, '{not json');
      expect(d.args, isEmpty);
    });
  });
}

/// Both services are singletons with private constructors, so the fakes
/// implement them; any call a test does not care about (init) is a no-op.
class _FakeEnrollment implements EnrollmentService {
  @override
  Future<String?> getValidAccessToken() async => 'token';

  @override
  String? workerIdFromToken(String token) => 'w1';

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}

class _FakeGrpc implements CypurgeGrpcService {
  _FakeGrpc(this.items);

  final List<ReverificationRequest> items;

  @override
  Future<ListReverificationRequestsResponse> listReverificationRequests({
    required String token,
    required String tenantId,
  }) async =>
      ListReverificationRequestsResponse(items: items);

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
