import 'package:cypurge_mobile/generated/document/v1/document.pb.dart';
import 'package:cypurge_mobile/utils/document_debug_report.dart';
import 'package:flutter_test/flutter_test.dart';

// Synthetic values only: no real person's document data.
DocumentCheckRun passportRun() => DocumentCheckRun(
      expectedType: 'passport',
      objectKey: 'tenant/worker/doc.jpg',
    )..backend = VerifyDocumentUploadResponse(
        accepted: true,
        status: 'match',
        reason: 'recognised',
        expectedType: 'passport',
        detectedType: 'passport',
        documentId: 'doc-1',
      );

List<IssueOwner> ownersOf(DocumentCheckRun run) =>
    diagnoseDocument(run).map((i) => i.owner).toList();

void main() {
  test('an accepted check has no problems and shows only the backend', () {
    final run = passportRun();
    expect(diagnoseDocument(run), isEmpty);
    expect(documentSummary(run), 'Backend accepted');
    final report = renderDocumentReport(run);
    expect(report, contains('document id: doc-1'));
    expect(report, isNot(contains('ML DIRECT')));
  });

  test('a check still waiting says so', () {
    final run = DocumentCheckRun(expectedType: 'cv', objectKey: 'k');
    expect(run.pending, isTrue);
    expect(documentSummary(run), 'Backend checking…');
  });

  test('backend errors go to the side that raised them', () {
    IssueOwner ownerOf(String error) => ownersOf(passportRun()
          ..backend = null
          ..backendError = error)
        .single;
    expect(ownerOf('UNAVAILABLE: document check is busy'), IssueOwner.ml);
    expect(ownerOf('INTERNAL: internal error'), IssueOwner.backend);
    // The app outwaits the backend's own ML timeout: silence is the backend's.
    expect(ownerOf('DEADLINE_EXCEEDED: Deadline exceeded'), IssueOwner.backend);
    expect(ownerOf('ABORTED: already being checked'), IssueOwner.app);
    expect(ownerOf('RESOURCE_EXHAUSTED: too many document checks'),
        IssueOwner.conditions);
  });

  test('a wrong document and an unreadable MRZ are test conditions', () {
    DocumentCheckRun refused(String status, String reason) => passportRun()
      ..backend = VerifyDocumentUploadResponse(
          accepted: false, status: status, reason: reason, detectedType: 'cv');
    expect(ownersOf(refused('wrong_type', 'other_type_detected')),
        [IssueOwner.conditions]);
    expect(ownersOf(refused('unreadable', 'mrz_not_found')),
        [IssueOwner.conditions]);
    expect(ownersOf(refused('unreadable', 'not_recognised')), [IssueOwner.ml]);
  });

  test('upload steps join the check trace in time order, with the why', () {
    final log = DocumentDebugLog.instance..clear();
    log
      ..note('t/w/back-0001.jpg', 'app.put', TraceStatus.ok, ms: 300)
      ..note('t/w/front-0001.jpg', 'app.upload_url', TraceStatus.ok, ms: 40);
    final run = log.begin(
        expectedType: 'national_id',
        objectKey: 't/w/front-0001.jpg',
        backObjectKey: 't/w/back-0001.jpg')
      ..answered(
          VerifyDocumentUploadResponse(
              accepted: true,
              status: 'match',
              reason: 'recognised',
              detectedType: 'national_id',
              documentId: 'doc-9'),
          52000)
      ..document = TenantDocument(
          id: 'doc-9', status: 'NEEDS_REVIEW', expiryDate: '2030-01-01')
      ..statusChecked = true;

    expect(documentWhy(run), startsWith('NEEDS_REVIEW: sent to HR review'));
    expect(diagnoseDocument(run), isEmpty);
    final text = renderDocumentReport(run);
    expect(text, contains('grep doc-9'));
    expect(text, contains('grep front-0001.jpg'));
    expect(text, contains('rid=front-00'));
    final order = [
      'step=app.put',
      'step=app.upload_url',
      'step=app.check.send',
      'step=backend.verify_upload',
    ].map(text.indexOf).toList();
    expect(order, everyElement(greaterThan(0)));
    expect(order, orderedEquals([...order]..sort()));
    expect(statusFields(run)['expiry date (read from it)'], '2030-01-01');
  });

  test('a rejected document is ML; a status that never settles is Backend',
      () {
    DocumentCheckRun withStatus(String status) => passportRun()
      ..document = TenantDocument(id: 'doc-1', status: status)
      ..statusChecked = true;
    expect(ownersOf(withStatus('REJECTED')), [IssueOwner.ml]);
    expect(ownersOf(withStatus('AWAITING_CHECK')), [IssueOwner.backend]);
    expect(ownersOf(withStatus('VERIFIED')), isEmpty);
    expect(documentWhy(withStatus('VERIFIED')), startsWith('VERIFIED: passed'));
  });

  test('the DevTools headline counts problems per owner', () {
    expect(ownerCounts(const []), 'no problems');
    expect(
        ownerCounts(const [
          DebugIssue(IssueOwner.backend, 'b'),
          DebugIssue(IssueOwner.ml, 'm1'),
          DebugIssue(IssueOwner.ml, 'm2'),
        ]),
        'ML 2 · Backend 1');
  });
}
