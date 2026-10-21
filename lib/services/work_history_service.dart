import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grpc/grpc.dart' show GrpcError, StatusCode;
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../generated/worker/v1/worker.pb.dart' show CvJob, CvQualification;
import '../generated/worker/v1/worker.pbenum.dart';
import '../utils/cv_text.dart';
import '../utils/document_debug_report.dart';
import '../utils/error_logger.dart';
import '../utils/file_keys.dart';
import 'cypurge_grpc_service.dart';
import 'document_check.dart';
import 'enrollment_service.dart';

/// One previous job the worker typed on the Work & Experience step.
///
/// `description` has no column on the backend's employer-reference record
/// (employer_name, contact_email, position, start_date, end_date, status), so
/// rather than collect it and throw it away it is folded into the position line
/// — see [positionLine]. When the backend adds a description field, send it on
/// its own and drop the join.
@immutable
class EmploymentRecord {
  const EmploymentRecord({
    this.employer = '',
    this.title = '',
    this.description = '',
    this.contactEmail = '',
    this.startDate,
    this.endDate,
    this.needsCheck = false,
  });

  final String employer;
  final String title;
  final String description;
  final String contactEmail;
  final DateTime? startDate;
  final DateTime? endDate;

  /// The CV reader was unsure about this entry (CvJob.needs_check, October
  /// backend drop). Worth the worker's eye; it never blocks the step.
  final bool needsCheck;

  /// Nothing typed at all — an untouched card the worker added and left blank.
  /// Those are skipped silently instead of blocking the step.
  bool get isBlank =>
      employer.trim().isEmpty &&
      title.trim().isEmpty &&
      description.trim().isEmpty &&
      startDate == null &&
      endDate == null;

  /// Enough to be worth sending: who and what — exactly what a CV states.
  /// Dates help but a worker may not remember the exact day they started
  /// twelve years ago.
  ///
  /// No referee email: the worker is not asked for one any more (a CV never
  /// carries it). RequestEmployerReference still requires contact_email on the
  /// backend, so until it accepts an empty one every job comes back refused
  /// and stays editable for a retry.
  bool get isComplete =>
      employer.trim().isNotEmpty && title.trim().isNotEmpty;

  /// What is still missing, for the inline hint. Null when the card is fine.
  String? get problem {
    if (isBlank || isComplete) return null;
    if (employer.trim().isEmpty) return 'Add the employer name';
    return 'Add your job title';
  }
}

/// A job the CV parser suggested, as an editable card, complete as parsed.
EmploymentRecord employmentFromCv(CvJob job) => EmploymentRecord(
      employer: job.employer.trim(),
      title: job.title.trim(),
      description: job.description.trim(),
      // YYYY-MM-DD; an empty end date means ongoing or unknown.
      startDate: DateTime.tryParse(job.startDate),
      endDate: DateTime.tryParse(job.endDate),
      needsCheck: job.needsCheck,
    );

/// A qualification the CV parser suggested. Its type arrives as the enum's bare
/// name ("DEGREE"); an unknown or empty type falls back to Certificate, which
/// the worker can change. The photo is still theirs to take.
QualificationRecord qualificationFromCv(CvQualification q) {
  final type = QualificationType.values.firstWhere(
    (t) => t.name == 'QUALIFICATION_TYPE_${q.type.trim().toUpperCase()}',
    orElse: () => QualificationType.QUALIFICATION_TYPE_CERTIFICATION,
  );
  return QualificationRecord(
    type: type == QualificationType.QUALIFICATION_TYPE_UNSPECIFIED
        ? QualificationType.QUALIFICATION_TYPE_CERTIFICATION
        : type,
    institution: q.institution.trim(),
    needsCheck: q.needsCheck,
  );
}

/// A job read off the CV's own text, as a card to confirm. Always flagged for
/// the worker's eye: nothing here came from the reader, we worked it out.
EmploymentRecord employmentFromCvText(CvTextJob job) => EmploymentRecord(
      employer: job.employer,
      title: job.title,
      description: job.description,
      startDate: job.start,
      endDate: job.end,
      needsCheck: true,
    );

/// Two dates are the same job's start when the CV named the same month,
/// whatever day either side put on it.
bool _sameMonth(DateTime? a, DateTime? b) =>
    a != null && b != null && a.year == b.year && a.month == b.month;

String _key(String s) => s.trim().toLowerCase();

/// The jobs the reader returned, plus the ones only the page text shows.
///
/// A job the reader did find is kept as it is — its description is the fuller
/// one — except where it arrived with no employer. That happens when the
/// reader glued "Title - Employer" into one title and dropped the separator,
/// and the employer is the one field a reference request cannot do without, so
/// the pair read off the page replaces it.
List<EmploymentRecord> mergeCvJobs(
  List<EmploymentRecord> fromReader,
  List<CvTextJob> fromText,
) {
  final merged = [...fromReader];
  for (final job in fromText) {
    if (merged.length >= cvMaxEntries) break;
    final at = merged.indexWhere((r) =>
        _sameMonth(r.startDate, job.start) ||
        (_key(r.employer).isNotEmpty && _key(r.employer) == _key(job.employer)));
    if (at < 0) {
      merged.add(employmentFromCvText(job));
      continue;
    }
    final known = merged[at];
    if (known.employer.trim().isEmpty && job.employer.isNotEmpty) {
      merged[at] = EmploymentRecord(
        employer: job.employer,
        title: job.title.isEmpty ? known.title : job.title,
        description:
            known.description.isEmpty ? job.description : known.description,
        contactEmail: known.contactEmail,
        startDate: known.startDate ?? job.start,
        endDate: known.endDate ?? job.end,
        needsCheck: true,
      );
    }
  }
  return List.unmodifiable(merged);
}

/// The qualifications the reader returned, plus the schools only the page text
/// shows. A school already on the list is left alone.
List<QualificationRecord> mergeCvSchools(
  List<QualificationRecord> fromReader,
  List<CvTextSchool> fromText,
) {
  final merged = [...fromReader];
  final seen = fromReader.map((q) => _key(q.institution)).toSet();
  for (final school in fromText) {
    if (merged.length >= cvMaxEntries) break;
    final institution =
        school.institution.isEmpty ? school.title : school.institution;
    if (institution.isEmpty || !seen.add(_key(institution))) continue;
    merged.add(QualificationRecord(
      type: _qualificationType(school.type),
      institution: institution,
      needsCheck: true,
    ));
  }
  return List.unmodifiable(merged);
}

/// "DEGREE" → the enum member. Anything unknown is a certificate, which the
/// worker can change — the fallback [qualificationFromCv] already uses.
QualificationType _qualificationType(String name) =>
    QualificationType.values.firstWhere(
      (t) => t.name == 'QUALIFICATION_TYPE_${name.trim().toUpperCase()}',
      orElse: () => QualificationType.QUALIFICATION_TYPE_CERTIFICATION,
    );

/// One degree or certificate, with the photo of it the worker just captured.
@immutable
class QualificationRecord {
  const QualificationRecord({
    required this.type,
    this.institution = '',
    this.filePath = '',
    this.needsCheck = false,
  });

  final QualificationType type;
  final String institution;

  /// The CV reader was unsure about this entry (CvQualification.needs_check).
  final bool needsCheck;

  /// Local path to the captured image. Empty until the worker takes the photo.
  final String filePath;

  bool get isBlank => institution.trim().isEmpty && filePath.isEmpty;
  bool get isComplete => institution.trim().isNotEmpty && filePath.isNotEmpty;

  String? get problem {
    if (isBlank || isComplete) return null;
    if (filePath.isEmpty) return 'Add a photo of the certificate';
    return 'Add the school or awarding body';
  }
}

/// The five qualification kinds the backend accepts, in the worker's words.
const Map<QualificationType, String> kQualificationLabels = {
  QualificationType.QUALIFICATION_TYPE_DEGREE: 'Degree',
  QualificationType.QUALIFICATION_TYPE_CERTIFICATION: 'Certificate',
  QualificationType.QUALIFICATION_TYPE_DIPLOMA: 'Diploma',
  QualificationType.QUALIFICATION_TYPE_LICENSE: 'Licence',
  QualificationType.QUALIFICATION_TYPE_APPRENTICESHIP: 'Apprenticeship',
};

/// `YYYY-MM-DD`, the format the employer-reference request documents. Empty
/// string for a date the worker left unset — the field is optional on the wire.
String ymd(DateTime? d) {
  if (d == null) return '';
  final m = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '${d.year}-$m-$day';
}

/// The backend's limit on `position`, in characters (VARCHAR(255); the handler
/// refuses anything longer with INVALID_ARGUMENT).
const maxPositionChars = 255;

/// Job title, with the description appended when there is one, because the
/// employer-reference record has no description column of its own. Cut to
/// [maxPositionChars]: a CV description is often longer, and the whole job was
/// refused instead of saved.
// ponytail: the tail of a long description is dropped; keeping all of it
// needs a description field on the backend.
String positionLine(String title, String description) {
  final t = title.trim();
  final d = description.trim();
  final line = d.isEmpty
      ? t
      : t.isEmpty
          ? d
          : '$t — $d';
  final chars = line.runes;
  if (chars.length <= maxPositionChars) return line;
  final kept = String.fromCharCodes(chars.take(maxPositionChars - 1));
  return '${kept.trimRight()}…';
}

/// A start date after the end date is the one ordering mistake worth catching;
/// everything else is the worker's own memory of their career.
bool datesOutOfOrder(DateTime? start, DateTime? end) =>
    start != null && end != null && end.isBefore(start);

/// What happened when the step was submitted, so the screen can tell the worker
/// the truth instead of a blanket "saved".
@immutable
class WorkHistoryOutcome {
  const WorkHistoryOutcome({
    this.jobsSent = 0,
    this.jobsFailed = 0,
    this.certsSent = 0,
    this.certsFailed = 0,
    this.referenceLimitReached = false,
    this.failedJobs = const {},
    this.failedCerts = const {},
    this.refusals = const [],
  });

  final int jobsSent;
  final int jobsFailed;
  final int certsSent;
  final int certsFailed;

  /// Indexes, into the lists passed to [WorkHistoryService.submit], of the rows
  /// that did not go through. Counts alone cannot say which card to keep
  /// editable, and a row lost to a dropped connection must stay retryable.
  final Set<int> failedJobs;
  final Set<int> failedCerts;

  /// Why a certificate photo was refused by the upload check ("This looks like
  /// a CV, not a diploma…"), ready to show. Empty when none was.
  final List<String> refusals;

  /// The backend caps a worker at 10 open reference requests; the jobs past
  /// that were not sent.
  final bool referenceLimitReached;

  bool get allOk => jobsFailed == 0 && certsFailed == 0;
  int get sent => jobsSent + certsSent;
  int get failed => jobsFailed + certsFailed;
}

/// What reading the CV produced. Empty is a normal answer — a scanned CV with
/// no text layer, or a layout nothing could make sense of.
@immutable
class CvSuggestions {
  const CvSuggestions({this.jobs = const [], this.qualifications = const []});

  final List<EmploymentRecord> jobs;
  final List<QualificationRecord> qualifications;

  bool get isEmpty => jobs.isEmpty && qualifications.isEmpty;
  int get count => jobs.length + qualifications.length;
}

/// Sends the Work & Experience step to the backend.
///
/// Each entry goes on its own: one bad row must not lose the other four the
/// worker just typed, so failures are counted and reported rather than thrown.
class WorkHistoryService {
  WorkHistoryService({
    CypurgeGrpcService? grpc,
    EnrollmentService? enrollment,
    this.storage = const FlutterSecureStorage(),
  })  : _grpc = grpc ?? CypurgeGrpcService(),
        _enrollment = enrollment ?? EnrollmentService();

  final CypurgeGrpcService _grpc;
  final EnrollmentService _enrollment;
  final FlutterSecureStorage storage;

  Future<WorkHistoryOutcome> submit({
    required List<EmploymentRecord> jobs,
    required List<QualificationRecord> qualifications,
  }) async {
    final token = await _enrollment.getValidAccessToken();
    if (token == null) throw 'Your session has expired. Please sign in again.';

    final workerId = _enrollment.workerIdFromToken(token) ??
        await storage.read(key: 'worker_id') ??
        '';
    final tenantId = await storage.read(key: 'tenant_id') ?? '';
    if (workerId.isEmpty || tenantId.isEmpty) {
      throw 'We could not identify your account. Please sign in again.';
    }

    _grpc.init(useGateway: true);

    int jobsSent = 0, jobsFailed = 0, certsSent = 0, certsFailed = 0;
    var limitReached = false;
    final failedJobs = <int>{}, failedCerts = <int>{};
    final refusals = <String>[];

    for (var i = 0; i < jobs.length; i++) {
      final job = jobs[i];
      if (!job.isComplete) continue;
      // Past the cap every call is refused the same way; count, don't call.
      if (limitReached) {
        jobsFailed++;
        failedJobs.add(i);
        continue;
      }
      try {
        await _grpc.requestEmployerReference(
          token: token,
          tenantId: tenantId,
          workerId: workerId,
          employerName: job.employer.trim(),
          contactEmail: job.contactEmail.trim(),
          position: positionLine(job.title, job.description),
          startDate: ymd(job.startDate),
          endDate: ymd(job.endDate),
        );
        jobsSent++;
      } catch (e, stack) {
        jobsFailed++;
        failedJobs.add(i);
        if (e is GrpcError && e.code == StatusCode.resourceExhausted) {
          limitReached = true;
        }
        ErrorLogger.log('Work History - employer reference', e, stack);
      }
    }

    for (var i = 0; i < qualifications.length; i++) {
      final q = qualifications[i];
      if (!q.isComplete) continue;
      try {
        final upload = await _uploadFile(
          token: token,
          tenantId: tenantId,
          workerId: workerId,
          filePath: q.filePath,
        );
        await _grpc.submitQualification(
          token: token,
          tenantId: tenantId,
          workerId: workerId,
          type: q.type,
          institution: q.institution.trim(),
          storedPath: upload.objectKey,
          documentId: upload.documentId,
        );
        certsSent++;
      } on DocumentRefused catch (e) {
        certsFailed++;
        failedCerts.add(i);
        refusals.add(e.message);
      } catch (e, stack) {
        certsFailed++;
        failedCerts.add(i);
        ErrorLogger.log('Work History - qualification', e, stack);
      }
    }

    return WorkHistoryOutcome(
      jobsSent: jobsSent,
      jobsFailed: jobsFailed,
      certsSent: certsSent,
      certsFailed: certsFailed,
      referenceLimitReached: limitReached,
      failedJobs: failedJobs,
      failedCerts: failedCerts,
      refusals: refusals,
    );
  }

  /// Uploads the worker's CV so it is on file, and returns its storage key —
  /// the handle the parser needs to read it.
  Future<String> uploadCv(String filePath) async {
    final token = await _enrollment.getValidAccessToken();
    if (token == null) throw 'Your session has expired. Please sign in again.';
    final workerId = _enrollment.workerIdFromToken(token) ??
        await storage.read(key: 'worker_id') ??
        '';
    final tenantId = await storage.read(key: 'tenant_id') ?? '';
    if (workerId.isEmpty || tenantId.isEmpty) {
      throw 'We could not identify your account. Please sign in again.';
    }
    _grpc.init(useGateway: true);
    // Confirmed inside _uploadFile — ParseCv refuses an unconfirmed upload.
    final upload = await _uploadFile(
      token: token,
      tenantId: tenantId,
      workerId: workerId,
      filePath: filePath,
      docType: 'CV',
    );
    return upload.objectKey;
  }

  /// Asks the backend to read the uploaded CV and suggest jobs and
  /// qualifications, so the worker corrects a filled form instead of typing a
  /// blank one. Nothing is saved until the worker continues.
  ///
  /// "Could not read it" is a normal answer, not a failure: the CV is already
  /// on file, so a scanned PDF, a parser outage or a timeout all come back as
  /// no suggestions and the worker fills the form themselves.
  Future<CvSuggestions> parseCv(String objectKey) async {
    final token = await _enrollment.getValidAccessToken();
    if (token == null) throw 'Your session has expired. Please sign in again.';
    _grpc.init(useGateway: true);
    try {
      final res = await _grpc
          .parseCv(token: token, storedPath: objectKey)
          .timeout(const Duration(seconds: 60));
      // The reader's own entries first, then whatever only the page text
      // shows — see utils/cv_text.dart for why a CV's later jobs and its
      // whole education section can go missing on the way here.
      return CvSuggestions(
        jobs: mergeCvJobs(
          res.jobs.map(employmentFromCv).toList(),
          jobsFromCvText(res.rawText),
        ),
        qualifications: mergeCvSchools(
          res.qualifications.map(qualificationFromCv).toList(),
          schoolsFromCvText(res.rawText),
        ),
      );
    } on GrpcError catch (e) {
      const unreadable = {
        StatusCode.failedPrecondition,
        StatusCode.invalidArgument,
        StatusCode.unavailable,
        StatusCode.deadlineExceeded,
        StatusCode.unimplemented,
      };
      if (unreadable.contains(e.code)) return const CvSuggestions();
      rethrow;
    } on TimeoutException {
      return const CvSuggestions();
    }
  }

  /// Same three steps the documents screen uses: ask for a pre-signed URL, PUT
  /// the bytes, confirm. Returns the storage key and the document id the
  /// backend issued for the file.
  Future<({String objectKey, String documentId})> _uploadFile({
    required String token,
    required String tenantId,
    required String workerId,
    required String filePath,
    String docType = 'QUALIFICATION_CERT',
  }) async {
    final file = File(filePath);
    final ext = filePath.split('.').last.toLowerCase();

    final stage = Stopwatch()..start();
    final res = await _grpc
        .generateUploadURL(
          token: token,
          tenantId: tenantId,
          workerId: workerId,
          fileExt: ext,
          docType: docType,
        )
        .timeout(const Duration(seconds: 10));

    final objectKey = res.objectKey;
    var uploadUrl = res.uploadUrl;
    final debug = DocumentDebugLog.instance
      ..note(objectKey, 'app.upload_url', TraceStatus.ok,
          ms: stage.elapsedMilliseconds,
          data: {'doc_type': docType, 'ext': ext});

    final headers = <String, String>{
      'Content-Type': switch (ext) {
        'pdf' => 'application/pdf',
        'docx' =>
          'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
        'png' => 'image/png',
        _ => 'image/jpeg',
      },
    };
    // The encryption headers are part of the signature, so the server's values
    // are applied LAST and nothing here may guess them. This used to end with
    // `kms-$tenantId`, which is only the name of a tenant's FIRST key: after a
    // key rotation the signed name is `kms-<tenant>-v2`, the sent one was not,
    // and MinIO answered 403 on every CV upload.
    headers.addAll(res.requiredHeaders);

    // The phone cannot resolve the storage hostname, so point at the node and
    // keep the original Host header or the pre-signed signature stops matching.
    final originalHost = Uri.parse(uploadUrl).authority;
    uploadUrl =
        uploadUrl.replaceAll('minio.workertrust.local', AppConfig.host);
    headers['Host'] = originalHost;

    final bytes = await file.readAsBytes();
    stage.reset();
    final put = await http
        .put(Uri.parse(uploadUrl), headers: headers, body: bytes)
        .timeout(const Duration(seconds: 30));
    debug.note(objectKey, 'app.put',
        put.statusCode == 200 ? TraceStatus.ok : TraceStatus.fail,
        ms: stage.elapsedMilliseconds,
        data: {
          'kb': (bytes.length / 1024).toStringAsFixed(1),
          'http': put.statusCode,
        });
    if (put.statusCode != 200) {
      // MinIO answers with XML carrying a <Code>; naming it turns "403" into
      // something diagnosable (SignatureDoesNotMatch, ExpiredToken, …).
      final code = RegExp(r'<Code>([^<]+)</Code>').firstMatch(put.body)?.group(1);
      throw 'Upload failed (${put.statusCode}${code == null ? '' : ': $code'})';
    }

    stage.reset();
    await _grpc
        .confirmUpload(
          token: token,
          objectKey: objectKey,
          docType: docType,
        )
        .timeout(const Duration(seconds: 10));
    debug.note(objectKey, 'app.confirm', TraceStatus.ok,
        ms: stage.elapsedMilliseconds);
    // Kept so the worker can open this file later from "Your files" on an
    // older backend that does not send a worker the key (FileKeyStore).
    // Before the check: a refused file stays on record and can be opened.
    await FileKeyStore.remember(
        documentId: res.documentId, objectKey: objectKey);

    // The upload check is not optional: the backend holds an unchecked upload
    // in AWAITING_CHECK, deletes it after 30 minutes, and ParseCv /
    // SubmitQualification refuse it ("has not passed the upload check").
    // Throws DocumentRefused for the wrong document.
    final checkedId = await checkUpload(_grpc,
        token: token, objectKey: objectKey, docType: docType);
    if (checkedId.isNotEmpty && checkedId != res.documentId) {
      await FileKeyStore.remember(documentId: checkedId, objectKey: objectKey);
    }
    return (
      objectKey: objectKey,
      documentId: checkedId.isNotEmpty ? checkedId : res.documentId,
    );
  }
}
