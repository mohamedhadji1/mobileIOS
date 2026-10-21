import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart' show GrpcError;

import '../generated/document/v1/document.pb.dart';
import '../services/cypurge_grpc_service.dart';
import 'debug_issue.dart';
import 'debug_trace.dart';

export 'debug_issue.dart';
export 'debug_trace.dart' show TraceStatus;

/// Tester-only: record every upload, its check and the status the backend
/// finally gives the document. Everything shown is what the backend really
/// answered. Off by default (demo recording); turn on with
/// `--dart-define=DOCUMENT_DEBUG=true`. The unit tests need it on, so run
/// `flutter test --dart-define=DOCUMENT_DEBUG=true`.
const documentDebugReport = bool.fromEnvironment('DOCUMENT_DEBUG');

String _sec(int ms) => '${(ms / 1000).toStringAsFixed(1)} s';

String _errorText(Object e) =>
    e is GrpcError ? '${e.codeName}: ${e.message ?? ''}' : '$e';

/// What each document status means. The backend sets it from the check
/// (StatusForCheck): for an identity document from M4's verdict.
const statusMeaning = {
  'VERIFIED': 'passed: right document, M4 verdict PASS for an ID, no review '
      'flag from ML',
  'NEEDS_REVIEW': 'sent to HR review: M4 verdict REVIEW or ERROR for an ID, '
      'or ML flagged it for review',
  'REJECTED': 'rejected: M4 verdict REJECT',
  'REFUSED': 'refused at upload: wrong or unreadable document',
  'UPLOAD_EXPIRED': 'never checked within 30 minutes, deleted',
  'AWAITING_CHECK': 'uploaded, the check result is not applied yet',
  'AWAITING_UPLOAD': 'the backend has not seen the file yet',
  'PENDING_OCR': 'still being processed',
  'PROCESSING': 'still being processed',
};

const _settled = {
  'VERIFIED',
  'NEEDS_REVIEW',
  'REJECTED',
  'REFUSED',
  'UPLOAD_EXPIRED',
};

TraceStatus _statusTrace(String status) => switch (status) {
      'VERIFIED' => TraceStatus.ok,
      'REJECTED' || 'REFUSED' || 'UPLOAD_EXPIRED' => TraceStatus.fail,
      _ => TraceStatus.miss,
    };

/// How long after the check the final status is read: the backend applies
/// the check in its upload workflow, a moment after answering.
const _statusPolls = [
  Duration(seconds: 2),
  Duration(seconds: 3),
  Duration(seconds: 5),
  Duration(seconds: 10),
  Duration(seconds: 15),
];

/// One upload check: the app's steps, the backend's answer and the status
/// the document ended up with.
// ponytail: mutable; filled in as the answers arrive.
class DocumentCheckRun {
  DocumentCheckRun({
    required this.expectedType,
    required this.objectKey,
    this.withBack = false,
  }) : trace = DebugTrace('app.document', _fileId(objectKey));

  final String expectedType;
  final String objectKey;
  final bool withBack;
  final startedAt = DateTime.now();
  final DebugTrace trace;

  VerifyDocumentUploadResponse? backend;

  /// The gRPC failure, as "CODE: message".
  String? backendError;
  int backendMs = 0;

  /// The document as ListWorkerDocuments returns it after the check.
  TenantDocument? document;
  String? documentError;
  bool followingStatus = false;
  bool statusChecked = false;

  bool get pending =>
      (backend == null && backendError == null) || followingStatus;
  bool get twoSided =>
      expectedType == 'national_id' || expectedType == 'driving_licence';

  /// The uploaded file's name, as it appears in the backend's logs.
  String get fileName => objectKey.split('/').last;

  void answered(VerifyDocumentUploadResponse res, int ms) {
    backend = res;
    backendMs = ms;
    trace.add(
      'backend.verify_upload',
      res.accepted ? TraceStatus.ok : TraceStatus.miss,
      ms: ms,
      why: res.accepted
          ? 'accepted: ${res.status}/${res.reason}'
          : res.message.isNotEmpty
              ? res.message
              : '${res.status}/${res.reason}',
      data: {
        'accepted': res.accepted,
        'status': res.status,
        'reason': res.reason,
        'detected': res.detectedType,
        'document_id': res.documentId,
      },
    );
    DocumentDebugLog.instance._changed();
  }

  void failed(Object error, int ms) {
    backendError = _errorText(error);
    backendMs = ms;
    trace.add('backend.verify_upload', TraceStatus.fail,
        ms: ms, why: backendError!);
    DocumentDebugLog.instance
      .._changed()
      .._publish(this);
  }
}

/// "c3baa45a" from ".../c3baa45a-334f-….jpg".
String _fileId(String objectKey) {
  final name = objectKey.split('/').last;
  return name.length > 8 ? name.substring(0, 8) : name;
}

/// The recent upload checks, newest first, for the tester's debug dock.
class DocumentDebugLog {
  DocumentDebugLog._();
  static final instance = DocumentDebugLog._();
  static const cap = 20;

  final runs = ValueNotifier<List<DocumentCheckRun>>(const []);

  /// Upload steps waiting for their check, by object key.
  final _notes = <String, List<TraceStep>>{};

  /// Records an upload step (URL, PUT, confirm) of [objectKey]; it joins the
  /// check's trace when the check starts.
  void note(String objectKey, String step, TraceStatus status,
      {int? ms, String why = '', Map<String, Object?> data = const {}}) {
    if (!documentDebugReport) return;
    (_notes[objectKey] ??= [])
        .add(TraceStep(step, status, ms: ms, why: why, data: data));
  }

  DocumentCheckRun begin({
    required String expectedType,
    required String objectKey,
    String backObjectKey = '',
  }) {
    final run = DocumentCheckRun(
      expectedType: expectedType,
      objectKey: objectKey,
      withBack: backObjectKey.isNotEmpty,
    );
    run.trace
      ..addAll([
        ...?_notes.remove(backObjectKey),
        ...?_notes.remove(objectKey),
      ])
      ..add('app.check.send', TraceStatus.ok, data: {
        'expected_type': expectedType,
        'file': run.fileName,
        if (backObjectKey.isNotEmpty) 'back_file': backObjectKey.split('/').last,
      });
    runs.value = [run, ...runs.value].take(cap).toList();
    return run;
  }

  void clear() {
    _notes.clear();
    runs.value = const [];
  }

  void _changed() => runs.value = List.of(runs.value);

  /// Reads the status the backend gave the checked document, until it settles.
  Future<void> followStatus(
      DocumentCheckRun run, CypurgeGrpcService grpc, String token) async {
    final id = run.backend?.documentId ?? '';
    if (id.isEmpty) {
      _publish(run);
      return;
    }
    // The object key is {tenant}/{worker}/{file}.
    final tenantId = run.objectKey.split('/').first;
    run.followingStatus = true;
    _changed();
    final clock = Stopwatch()..start();
    try {
      for (final wait in _statusPolls) {
        await Future<void>.delayed(wait);
        final res =
            await grpc.listWorkerDocuments(token: token, tenantId: tenantId);
        run.document = res.documents.where((d) => d.id == id).firstOrNull;
        if (_settled.contains(run.document?.status)) break;
      }
      final doc = run.document;
      run.trace.add(
        'backend.document_status',
        doc == null ? TraceStatus.miss : _statusTrace(doc.status),
        ms: clock.elapsedMilliseconds,
        why: doc == null
            ? 'document $id is not in ListWorkerDocuments'
            : statusMeaning[doc.status] ?? 'unknown status',
        data: {
          if (doc != null) ...{
            'status': doc.status,
            'expiry_date': doc.expiryDate,
            'confidence': doc.confidenceScore,
          },
        },
      );
    } on Exception catch (e) {
      run.documentError = _errorText(e);
      run.trace.add('backend.document_status', TraceStatus.fail,
          ms: clock.elapsedMilliseconds, why: run.documentError!);
    } finally {
      run
        ..followingStatus = false
        ..statusChecked = true;
      _changed();
      _publish(run);
    }
  }

  /// Console and DevTools (Logging tab, `cypurge.document`).
  void _publish(DocumentCheckRun run) => publishDebugReport(
        kind: 'document',
        headline: '${run.expectedType} · ${documentSummary(run)}',
        report: renderDocumentReport(run),
        issues: diagnoseDocument(run),
      );
}

/// What went wrong in [run], each problem tagged with the side that owns it.
List<DebugIssue> diagnoseDocument(DocumentCheckRun run) {
  final issues = <DebugIssue>[];
  void add(IssueOwner owner, String title, [String detail = '']) =>
      issues.add(DebugIssue(owner, title, detail));
  final type = run.expectedType;

  final backendError = run.backendError;
  if (backendError != null) {
    switch (backendError.split(':').first) {
      case 'UNAVAILABLE':
        add(IssueOwner.ml, 'Document check busy, or ML unreachable (via backend)',
            '$backendError\nThe backend answers this when the ML gateway fails '
                'or times out. Backend: check ML_GATEWAY_URL and its '
                '"document request failed" log.');
      case 'DEADLINE_EXCEEDED':
        // The app waits longer than the backend's own 130 s ML timeout, so the
        // backend should have answered "busy" (UNAVAILABLE) before this.
        add(
            IssueOwner.backend,
            'No answer from the backend in '
            '${documentCheckDeadline(twoSided: run.twoSided).inSeconds} s',
            '$backendError\nThe backend gives ML 130 s, then answers '
                'UNAVAILABLE. Silence past that means the backend (or Kong in '
                'front of it) held the call. Compare with the ML gateway '
                'trace: if it answered, the answer got stuck after ML.');
      case 'RESOURCE_EXHAUSTED':
        add(IssueOwner.conditions, 'Too many checks in a minute',
            '$backendError\nThe backend allows 10 per minute. Wait and retry.');
      case 'ABORTED':
        add(IssueOwner.app, 'The same document was checked twice at once',
            backendError);
      case 'FAILED_PRECONDITION':
        add(IssueOwner.app, 'Backend refused to check this upload',
            '$backendError\n"upload window expired": checked over 30 min after '
                'the upload. "file not uploaded yet": the file never reached '
                'storage. "refused" or "already processed": upload a new file.');
      case 'INVALID_ARGUMENT':
        add(IssueOwner.app, 'Backend rejected the request', backendError);
      case 'PERMISSION_DENIED' || 'UNAUTHENTICATED':
        add(IssueOwner.backend, 'Backend refused the request (sign-in or role)',
            backendError);
      default:
        add(IssueOwner.backend, 'Backend failed on its own side',
            '$backendError\nBackend log: "document request failed".');
    }
  }

  final b = run.backend;
  if (b != null) {
    if (b.accepted && b.documentId.isEmpty) {
      add(IssueOwner.backend, 'Accepted, but no document id came back');
    }
    if (!b.accepted) {
      if (b.status == 'wrong_type') {
        final seen = b.detectedType.isEmpty ? 'another document' : b.detectedType;
        add(IssueOwner.conditions, 'M4 saw $seen, not a $type',
            'Upload the right document. If this file really is a $type, ML: '
                'the type check is wrong.');
      } else if (b.reason == 'mrz_not_found') {
        add(IssueOwner.conditions, 'MRZ not readable',
            'Retake the whole page flat, without glare. If the photo is '
                'clear, ML: the MRZ read failed.');
      } else {
        add(IssueOwner.ml, 'M4 could not recognise this $type',
            'status=${b.status}, reason=${b.reason}. If the file is clear, ML: '
                'recognition failed.');
      }
    }
  }

  if (run.statusChecked) {
    final doc = run.document;
    final documentError = run.documentError;
    if (documentError != null) {
      add(IssueOwner.backend, 'Could not read the document status',
          '$documentError\nListWorkerDocuments failed for this worker.');
    } else if (doc == null) {
      add(IssueOwner.backend, 'Checked document is missing from the list',
          'document_id ${b?.documentId} is not in ListWorkerDocuments.');
    } else if (doc.status == 'REJECTED') {
      add(IssueOwner.ml, 'M4 rejected this document',
          'Final status REJECTED = M4 verdict REJECT. If the document is '
              'genuine, ML: false reject. The reason is in document_checks.'
              'result, which the backend does not return yet.');
    } else if (!_settled.contains(doc.status)) {
      add(IssueOwner.backend,
          'Status still ${doc.status} ${_sec(_statusPolls.fold(0, (t, d) => t + d.inMilliseconds))} after the check',
          'The check was answered but never applied to the document. '
              'Backend: the upload workflow and its DocumentChecked signal.');
    }
  }

  return issues;
}

/// Why it passed or failed, in one sentence, from the backend's answers.
String documentWhy(DocumentCheckRun run) {
  final error = run.backendError;
  if (error != null) return 'No answer from the check: $error';
  final b = run.backend;
  if (b == null) return 'Waiting for the backend…';
  if (!b.accepted) {
    return 'Refused at upload (${b.status}/${b.reason})'
        '${b.message.isEmpty ? '' : ': ${b.message}'}';
  }
  final doc = run.document;
  if (doc != null) {
    return '${doc.status}: ${statusMeaning[doc.status] ?? 'unknown status'}';
  }
  if (run.followingStatus) {
    return 'Accepted as ${b.detectedType}; reading the final status…';
  }
  final documentError = run.documentError;
  return 'Accepted as ${b.detectedType}; final status unknown'
      '${documentError == null ? '' : ' ($documentError)'}';
}

Map<String, String> backendFields(DocumentCheckRun run) {
  final b = run.backend;
  if (b == null) {
    return {'error': run.backendError ?? 'no answer yet'};
  }
  return {
    for (final e in {
      'accepted': b.accepted,
      'status': b.status,
      'reason': b.reason,
      'detected': b.detectedType,
      'message': b.message,
      'document id': b.documentId,
      'time': _sec(run.backendMs),
    }.entries)
      if ('${e.value}'.isNotEmpty) e.key: '${e.value}',
  };
}

/// The document as ListWorkerDocuments returns it.
Map<String, String> statusFields(DocumentCheckRun run) {
  if (run.followingStatus) return {'state': 'reading…'};
  final documentError = run.documentError;
  if (documentError != null) return {'error': documentError};
  final doc = run.document;
  if (doc == null) {
    return {
      'state': run.statusChecked ? 'not in the list' : 'not read',
    };
  }
  return {
    'status': doc.status,
    'meaning': statusMeaning[doc.status] ?? 'unknown status',
    if (doc.expiryDate.isNotEmpty) 'expiry date (read from it)': doc.expiryDate,
    'confidence': doc.confidenceScore.toStringAsFixed(2),
  };
}

/// One line: the backend's answer and the final status.
String documentSummary(DocumentCheckRun run) {
  final b = run.backend;
  if (b == null) {
    final error = run.backendError;
    return error == null
        ? 'Backend checking…'
        : 'Backend error ${error.split(':').first}';
  }
  final answer = 'Backend ${b.accepted ? 'accepted' : 'refused (${b.status})'}';
  final doc = run.document;
  return doc == null ? answer : '$answer · ${doc.status}';
}

/// The report as plain text, ready to paste into a message.
String renderDocumentReport(DocumentCheckRun run) {
  final b = StringBuffer()
    ..writeln('DOCUMENT CHECK DEBUG REPORT')
    ..writeln('${run.expectedType}${run.withBack ? ' (front + back)' : ''}')
    ..writeln('started ${localAndUtc(run.startedAt)} (server logs are UTC)')
    ..writeln('WHY: ${documentWhy(run)}')
    ..writeln()
    ..writeln('FIND IT IN THE SERVER LOGS');
  final documentId = run.backend?.documentId ?? '';
  if (documentId.isNotEmpty) {
    b.writeln('  ML gateway log: grep $documentId (document_id)');
  }
  b
    ..writeln('  backend log:    grep ${run.fileName} (object key)')
    ..writeln();
  writeIssues(b, diagnoseDocument(run));
  void section(String title, Map<String, String> fields) {
    b
      ..writeln()
      ..writeln(title);
    fields.forEach((k, v) => b.writeln('  $k: $v'));
  }

  b
    ..writeln()
    ..writeln('TRACE (app, UTC)')
    ..writeln(run.trace.render());
  section('BACKEND ANSWER (VerifyDocumentUpload)', backendFields(run));
  section('FINAL STATUS (ListWorkerDocuments)', statusFields(run));
  b
    ..writeln()
    ..writeln('MRZ / OCR')
    ..writeln('  Not returned by the backend. The real values of this check are '
        'stored in document_checks.result'
        '${documentId.isEmpty ? '' : ' (document_id $documentId)'}; the '
        'backend has no RPC that returns them yet.');
  return b.toString();
}
