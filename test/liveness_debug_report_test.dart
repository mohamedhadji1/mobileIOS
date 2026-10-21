import 'package:cypurge_mobile/generated/biometric/v1/biometric.pb.dart';
import 'package:cypurge_mobile/utils/liveness_debug_report.dart';
import 'package:flutter_test/flutter_test.dart';

List<IssueOwner> ownersOf(LivenessRunLog run) =>
    diagnose(run).map((i) => i.owner).toList();

LivenessRunLog cleanRun() => LivenessRunLog()
  ..challengeId = '5713faa23d9547e5bf47918eedb0a8a7'
  ..maxSendFps = 6
  ..framesSent = 90
  ..fps = 5.04
  ..walkMs = 17844
  ..tailMs = 12000
  ..allStepsPassed = true
  ..cameraStats = const {'luma': 175, 'dropped': 0}
  ..result = LivenessResult(
      verdict: 'PASS',
      livenessPassed: true,
      spoofClassification: 'real',
      matchReason: 'match',
      deepfakeVerdict: 'ACCEPT — likely genuine');

void main() {
  test('a clean pass reports nothing', () {
    expect(diagnose(cleanRun()), isEmpty);
  });

  test('a missed wink is ML, and asks which eye LEFT means', () {
    final run = cleanRun()
      ..allStepsPassed = false
      ..timeouts.add((
        step: 4,
        attempt: 1,
        instruction: 'Wink — close your LEFT eye',
      ));
    final issues = diagnose(run);
    expect(issues.single.owner, IssueOwner.ml);
    expect(issues.single.detail, contains('LEFT/RIGHT'));
  });

  test('an M5 error frame is ML; an expired challenge is Backend', () {
    expect(
        ownersOf(cleanRun()
          ..result = null
          ..serverError = 'frame decode failed'),
        [IssueOwner.ml]);
    expect(
        ownersOf(cleanRun()
          ..result = null
          ..serverError = 'invalid or expired challenge'),
        [IssueOwner.backend]);
  });

  test('gRPC failures go to the side that raised them', () {
    IssueOwner ownerOf(String grpc) => ownersOf(cleanRun()
          ..result = null
          ..grpcError = grpc)
        .single;
    expect(ownerOf('UNAVAILABLE: M5 closed without a result'), IssueOwner.ml);
    expect(ownerOf('UNAVAILABLE: liveness service unavailable; try again'),
        IssueOwner.ml);
    expect(ownerOf('INTERNAL: failed to record the liveness result'),
        IssueOwner.backend);
    expect(ownerOf('PERMISSION_DENIED: not your worker'), IssueOwner.backend);
  });

  test('GetChallenge: M5 down is ML, Valkey down is Backend', () {
    expect(
        ownersOf(LivenessRunLog()
          ..challengeError = 'UNKNOWN: failed to get challenge from M5: EOF'),
        [IssueOwner.ml]);
    expect(
        ownersOf(LivenessRunLog()
          ..challengeError =
              'UNKNOWN: failed to save challenge in Valkey: timeout'),
        [IssueOwner.backend]);
  });

  test('a face mismatch is ML; a missing portrait is Backend', () {
    final mismatch = cleanRun()
      ..result = LivenessResult(
          verdict: 'REJECT',
          livenessPassed: true,
          matchScore: -0.031,
          matchReason: 'below_threshold');
    expect(ownersOf(mismatch), [IssueOwner.ml]);

    final noPortrait = cleanRun()
      ..result = LivenessResult(
          verdict: 'REVIEW',
          livenessPassed: true,
          matchReason: 'no_document_face_supplied');
    expect(ownersOf(noPortrait), [IssueOwner.backend]);
  });

  test('slow result is ML, low fps is App, darkness is test conditions', () {
    expect(ownersOf(cleanRun()..tailMs = 25000), [IssueOwner.ml]);
    expect(ownersOf(cleanRun()..fps = 2.1), [IssueOwner.app]);
    expect(ownersOf(cleanRun()..cameraStats = const {'luma': 30}),
        [IssueOwner.conditions]);
  });

  test('the text report names the cid and tags each problem', () {
    final run = cleanRun()
      ..stepTimedOut(3, 2, 'Wink — close your LEFT eye');
    final text = renderReport(run, diagnose(run));
    expect(text, contains('cid 5713faa2'));
    expect(text, contains('[ML] M5: step 4 not detected'));
    expect(text, contains('step=m5.step_timeout'));
    expect(text, contains('"attempt":2'));
  });

  test('the trace lists every step in order, with the result and why', () {
    final run = LivenessRunLog()
      ..challengeIssued('5713faa23d9547e5bf47918eedb0a8a7', 120)
      ..streamStarted()
      ..stepIssued(0, 2, 'Turn your head LEFT', 1)
      ..stepPassed(0)
      ..stepIssued(1, 2, 'Blink twice', 1)
      ..stepPassed(1)
      ..framesStopped(40, 8000)
      ..resultReceived(LivenessResult(
          verdict: 'REJECT',
          livenessPassed: true,
          matchScore: -0.031,
          matchReason: 'below_threshold'));
    final text = renderReport(run, diagnose(run));
    final order = [
      'step=backend.get_challenge',
      'step=app.stream_start',
      'step=m5.step ',
      'step=m5.step_passed',
      'step=app.frames_stop',
      'step=m5.result',
    ].map(text.indexOf).toList();
    expect(order, everyElement(greaterThan(0)));
    expect(order, orderedEquals([...order]..sort()));
    expect(text, contains('rid=5713faa2'));
    expect(text, contains('WHY: REJECT: live, but the face does not match'));
    expect(text, contains('first_problem=m5.result:fail'));
    expect(text, contains('UTC'));
  });
}
