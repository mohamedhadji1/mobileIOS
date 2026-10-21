import 'package:cypurge_mobile/generated/worker/v1/worker.pb.dart';
import 'package:cypurge_mobile/services/cypurge_grpc_service.dart';
import 'package:cypurge_mobile/services/enrollment_service.dart';
import 'package:cypurge_mobile/services/work_history_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart' show GrpcError;

void main() {
  group('ymd', () {
    test('pads month and day so the backend gets YYYY-MM-DD', () {
      expect(ymd(DateTime(2019, 3, 7)), '2019-03-07');
      expect(ymd(DateTime(2024, 11, 30)), '2024-11-30');
    });

    test('an unset date is an empty string, not a fake one', () {
      expect(ymd(null), '');
    });
  });

  group('positionLine', () {
    test('carries the description, which has no field of its own', () {
      expect(positionLine('Deck Officer', 'Ran a crew of twelve'),
          'Deck Officer — Ran a crew of twelve');
    });

    test('is just the title when there is no description', () {
      expect(positionLine('Deck Officer', '   '), 'Deck Officer');
    });

    test('fits the backend limit when the CV description is long', () {
      // The real case: a CV job description of ~400 characters was refused
      // with "position must be at most 255 characters".
      final line = positionLine('Software Development Intern', 'é' * 400);
      expect(line.runes.length, lessThanOrEqualTo(maxPositionChars));
      expect(line, startsWith('Software Development Intern — é'));
      expect(line, endsWith('…'));
    });

    test('never leaves a dangling dash', () {
      expect(positionLine('', 'Night shift'), 'Night shift');
      expect(positionLine('  ', '  '), '');
    });
  });

  test('datesOutOfOrder catches an end before a start, nothing else', () {
    expect(datesOutOfOrder(DateTime(2020, 5, 1), DateTime(2019, 5, 1)), isTrue);
    expect(datesOutOfOrder(DateTime(2019, 5, 1), DateTime(2020, 5, 1)), isFalse);
    expect(datesOutOfOrder(DateTime(2019, 5, 1), null), isFalse);
    expect(datesOutOfOrder(null, null), isFalse);
  });

  group('EmploymentRecord', () {
    test('an untouched card is blank and is skipped, not flagged', () {
      const r = EmploymentRecord();
      expect(r.isBlank, isTrue);
      expect(r.problem, isNull);
    });

    test('employer and title are enough; dates optional, no email asked', () {
      const r = EmploymentRecord(employer: 'Maersk', title: 'Deck Officer');
      expect(r.isComplete, isTrue);
      expect(r.problem, isNull);
    });

    test('a half-filled card says exactly what is missing', () {
      expect(const EmploymentRecord(title: 'Deck Officer').problem,
          'Add the employer name');
      expect(const EmploymentRecord(employer: 'Maersk').problem,
          'Add your job title');
    });
  });

  group('CV suggestions', () {
    test('a parsed job becomes an editable card with real dates', () {
      final r = employmentFromCv(CvJob(
        employer: ' Maersk ',
        title: 'Deck Officer',
        startDate: '2019-03-01',
        endDate: '',
        description: 'Night watch',
      ));
      expect(r.employer, 'Maersk');
      expect(r.startDate, DateTime(2019, 3, 1));
      expect(r.endDate, isNull, reason: 'empty end = ongoing or unknown');
      // Nothing left for the worker to add: a parsed job is ready to send.
      expect(r.isComplete, isTrue);
    });

    test('the qualification type maps from its bare name, unknown to Certificate',
        () {
      expect(qualificationFromCv(CvQualification(type: 'DEGREE')).type,
          QualificationType.QUALIFICATION_TYPE_DEGREE);
      expect(qualificationFromCv(CvQualification(type: 'apprenticeship')).type,
          QualificationType.QUALIFICATION_TYPE_APPRENTICESHIP);
      expect(qualificationFromCv(CvQualification(type: '')).type,
          QualificationType.QUALIFICATION_TYPE_CERTIFICATION);
      expect(qualificationFromCv(CvQualification(type: 'UNSPECIFIED')).type,
          QualificationType.QUALIFICATION_TYPE_CERTIFICATION);
    });
  });

  group('QualificationRecord', () {
    const type = QualificationType.QUALIFICATION_TYPE_DEGREE;

    test('needs both the awarding body and the photo', () {
      expect(
          const QualificationRecord(
                  type: type,
                  institution: 'Rotterdam Maritime',
                  filePath: '/tmp/a.jpg')
              .isComplete,
          isTrue);
      expect(const QualificationRecord(type: type).isBlank, isTrue);
    });

    test('names the missing half', () {
      expect(
          const QualificationRecord(
                  type: type, institution: 'Rotterdam Maritime')
              .problem,
          'Add a photo of the certificate');
      expect(
          const QualificationRecord(type: type, filePath: '/tmp/a.jpg').problem,
          'Add the school or awarding body');
    });
  });

  test('every qualification type the backend accepts has a worker-facing name',
      () {
    for (final t in QualificationType.values) {
      if (t == QualificationType.QUALIFICATION_TYPE_UNSPECIFIED) continue;
      expect(kQualificationLabels[t], isNotNull, reason: '$t has no label');
    }
  });

  group('WorkHistoryOutcome', () {
    test('reports partial success honestly', () {
      const o = WorkHistoryOutcome(jobsSent: 2, jobsFailed: 1, certsSent: 1);
      expect(o.allOk, isFalse);
      expect(o.sent, 3);
      expect(o.failed, 1);
    });

    test('nothing sent and nothing failed is still a clean run', () {
      expect(const WorkHistoryOutcome().allOk, isTrue);
    });
  });

  // The Experience screen locks every row it believes was sent. Counts alone
  // cannot say which, so a row lost to a dropped connection used to be locked
  // as "Sent" and never retried.
  group('submit reports failed rows by index', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      FlutterSecureStorage.setMockInitialValues({'tenant_id': 't1'});
    });

    EmploymentRecord job(String employer) => EmploymentRecord(
        employer: employer, title: 'Deck Officer', contactEmail: 'hr@example.com');

    test('a failed row is named; a blank row is neither sent nor failed',
        () async {
      final grpc = _FakeGrpc(fail: (_) => const GrpcError.unavailable('no route'));
      final outcome = await WorkHistoryService(
              grpc: grpc, enrollment: _FakeEnrollment())
          .submit(jobs: [
        job('Alpha Marine'),
        const EmploymentRecord(), // blank card
        job('Beta Shipping'),
      ], qualifications: const []);

      expect(grpc.calls, ['Alpha Marine', 'Beta Shipping']);
      expect(outcome.jobsSent, 0);
      expect(outcome.failedJobs, {0, 2});
    });

    test('only the row that failed is reported', () async {
      final grpc = _FakeGrpc(
          fail: (e) => e == 'Beta Shipping'
              ? const GrpcError.unavailable('no route')
              : null);
      final outcome = await WorkHistoryService(
              grpc: grpc, enrollment: _FakeEnrollment())
          .submit(jobs: [job('Alpha Marine'), job('Beta Shipping')],
              qualifications: const []);

      expect(outcome.jobsSent, 1);
      expect(outcome.failedJobs, {1});
      expect(outcome.referenceLimitReached, isFalse);
    });

    test('past the reference cap the rest are failed without a call',
        () async {
      final grpc =
          _FakeGrpc(fail: (_) => const GrpcError.resourceExhausted('cap'));
      final outcome = await WorkHistoryService(
              grpc: grpc, enrollment: _FakeEnrollment())
          .submit(jobs: [job('Alpha Marine'), job('Beta Shipping')],
              qualifications: const []);

      expect(grpc.calls, ['Alpha Marine']);
      expect(outcome.failedJobs, {0, 1});
      expect(outcome.referenceLimitReached, isTrue);
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
  _FakeGrpc({required this.fail});

  /// Error to throw for an employer, or null to succeed.
  final GrpcError? Function(String employer) fail;
  final calls = <String>[];

  @override
  Future<RequestEmployerReferenceResponse> requestEmployerReference({
    required String token,
    required String tenantId,
    required String workerId,
    required String employerName,
    required String contactEmail,
    required String position,
    required String startDate,
    required String endDate,
  }) async {
    calls.add(employerName);
    final error = fail(employerName);
    if (error != null) throw error;
    return RequestEmployerReferenceResponse();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => null;
}
