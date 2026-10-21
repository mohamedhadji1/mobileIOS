import 'dart:async';
import 'dart:convert';

// Restore with livenessDebugReport below (kDebugMode).
// import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../generated/biometric/v1/biometric.pb.dart';
import 'debug_issue.dart';
import 'debug_trace.dart';

export 'debug_issue.dart';
export 'debug_trace.dart' show TraceStatus;

/// Tester-only: after each liveness run, show a report saying what went wrong
/// and whose side has to fix it. On in debug builds; override with
/// `--dart-define=LIVENESS_DEBUG=true` (or `false`).
// Off for the demo recording. Restore the line below to bring it back.
const livenessDebugReport = false;
// const livenessDebugReport =
//     bool.fromEnvironment('LIVENESS_DEBUG', defaultValue: kDebugMode);

/// The ML gateway whose M5 runs the backend's liveness sessions (the
/// backend's ML_GATEWAY_URL). The report reads M5's own debug view of the
/// session from it, by the session's real challenge id: an id M5 does not know
/// means another server or an expired session, and the report says so.
/// Override with `--dart-define=M5_DEBUG_URL=http://host:8090`.
const m5DebugUrl = String.fromEnvironment('M5_DEBUG_URL',
    defaultValue: 'http://192.168.253.41:8090');

/// A result arriving later than this after the last step is reported as slow.
/// The app gives up after 30 s of silence.
const slowResultMs = 20000;

/// Why M5 decided [r], in one sentence.
String resultWhy(LivenessResult r) {
  final match = '${r.matchScore.toStringAsFixed(3)} (${r.matchReason})';
  if (!r.livenessPassed) return 'not live: spoof=${r.spoofClassification}';
  return switch (r.verdict) {
    'REJECT' => 'live, but the face does not match the document portrait: '
        'match $match',
    'REVIEW' => 'live, sent to review: match $match, '
        'deepfake ${r.deepfakeVerdict}',
    _ => 'live and matches the document portrait: match $match',
  };
}

/// Everything one liveness run did, recorded while it happens.
// ponytail: a plain mutable log; it lives for one run inside one screen.
class LivenessRunLog {
  final startedAt = DateTime.now();
  final trace = DebugTrace('app.liveness');
  final timeouts = <({int step, int attempt, String instruction})>[];

  /// M5's debug view of the live session, as it answered, per moment asked.
  final m5Snapshots = <({String reason, String body})>[];
  final _pendingSnapshots = <Future<void>>[];

  final _stepClock = Stopwatch();
  final _tailClock = Stopwatch();

  String challengeId = '';
  String? appError;
  String? cameraError;
  String? challengeError;

  /// A LivenessError message on the stream (M5's own, or the backend's).
  String? serverError;

  /// The gRPC failure that ended the stream, as "CODE: message".
  String? grpcError;
  bool idleTimeout = false;
  bool allStepsPassed = false;
  LivenessResult? result;

  int framesSent = 0;
  int maxSendFps = 0;
  double fps = 0;
  int walkMs = 0;
  int tailMs = 0;
  int totalMs = 0;
  Map<String, Object?> camera = const {};
  Map<String, Object?> cameraStats = const {};

  /// The id the backend and M5 put in their logs: the challenge id's first 8
  /// characters.
  String get cid =>
      challengeId.length > 8 ? challengeId.substring(0, 8) : challengeId;

  void challengeIssued(String id, int ms) {
    challengeId = id;
    trace
      ..rid = cid
      ..add('backend.get_challenge', TraceStatus.ok,
          ms: ms, data: {'challenge_id': id});
  }

  void challengeFailed(String error, int ms) {
    challengeError = error;
    trace.add('backend.get_challenge', TraceStatus.fail, ms: ms, why: error);
  }

  void streamStarted() => trace.add('app.stream_start', TraceStatus.ok, data: {
        'camera': '${camera['width'] ?? '-'}x${camera['height'] ?? '-'}',
        'fps_cap': maxSendFps == 0 ? 'none' : maxSendFps,
      });

  void stepIssued(int index, int total, String instruction, int attempt) {
    _stepClock
      ..reset()
      ..start();
    trace.add('m5.step', TraceStatus.ok, data: {
      'step': index + 1,
      'of': total,
      'instruction': instruction,
      'attempt': attempt,
    });
  }

  void stepPassed(int index) => trace.add('m5.step_passed', TraceStatus.ok,
      ms: _stepClock.elapsedMilliseconds, data: {'step': index + 1});

  void stepTimedOut(int index, int attempt, String instruction) {
    timeouts.add((step: index + 1, attempt: attempt, instruction: instruction));
    trace.add('m5.step_timeout', TraceStatus.miss,
        ms: _stepClock.elapsedMilliseconds,
        why: 'M5 did not detect the gesture in time',
        data: {'step': index + 1, 'attempt': attempt, 'instruction': instruction});
  }

  /// The walk is over: no more frames go to M5, its verdict tail starts.
  void framesStopped(int sent, int walk) {
    _tailClock.start();
    trace.add('app.frames_stop', TraceStatus.ok,
        ms: walk, data: {'frames_sent': sent});
  }

  void resultReceived(LivenessResult r) {
    result = r;
    trace.add(
      'm5.result',
      switch (r.verdict) {
        'ACCEPT' => TraceStatus.ok,
        'REVIEW' => TraceStatus.miss,
        _ => TraceStatus.fail,
      },
      ms: _tailClock.isRunning ? _tailClock.elapsedMilliseconds : null,
      why: resultWhy(r),
      data: {
        'verdict': r.verdict,
        'live': r.livenessPassed,
        'spoof': r.spoofClassification,
        'match': double.parse(r.matchScore.toStringAsFixed(3)),
        'match_reason': r.matchReason,
        'matched': r.matched,
        'deepfake': r.deepfakeVerdict,
      },
    );
  }

  void serverErrored(String message) {
    serverError = message;
    trace.add('m5.error', TraceStatus.fail, why: message);
  }

  void idle(int seconds) {
    idleTimeout = true;
    trace.add('app.stream_idle', TraceStatus.fail,
        ms: seconds * 1000, why: 'no server message for $seconds s');
  }

  void streamFailed(String error) {
    grpcError = error;
    trace.add('backend.stream', TraceStatus.fail, why: error);
  }

  void streamEnded(Map<String, Object?> stats) =>
      trace.add('app.stream_end', TraceStatus.ok, ms: totalMs, data: {
        'frames_sent': framesSent,
        'fps': double.parse(fps.toStringAsFixed(2)),
        'walk_ms': walkMs,
        'tail_ms': tailMs,
        'encode_ms': stats['encodeMs'],
        'dropped': stats['dropped'],
        'luma': stats['luma'],
      });

  /// Asks M5 for its debug view of this session now, while it is still live.
  void snapshotM5(String reason) {
    if (!livenessDebugReport || challengeId.isEmpty) return;
    _pendingSnapshots.add(_snapshot(reason));
  }

  Future<void> _snapshot(String reason) async {
    final clock = Stopwatch()..start();
    try {
      final res = await http
          .get(Uri.parse('$m5DebugUrl/m5/challenge/debug/$challengeId'))
          .timeout(const Duration(seconds: 5));
      final ms = clock.elapsedMilliseconds;
      if (res.statusCode == 200) {
        m5Snapshots.add((reason: reason, body: _pretty(res.body)));
        trace.add('m5.debug_snapshot', TraceStatus.ok,
            ms: ms, data: {'reason': reason});
      } else {
        final body = res.body.length > 200
            ? '${res.body.substring(0, 200)}…'
            : res.body;
        trace.add('m5.debug_snapshot', TraceStatus.miss,
            ms: ms,
            why: 'HTTP ${res.statusCode} from $m5DebugUrl: $body. "unknown '
                'or expired challenge_id" = the session is over or ran on '
                'another ML server; a bare 404 = M5_CHALLENGE_DEBUG is off.',
            data: {'reason': reason});
      }
    } on Exception catch (e) {
      trace.add('m5.debug_snapshot', TraceStatus.fail,
          ms: clock.elapsedMilliseconds,
          why: 'phone could not reach $m5DebugUrl: $e',
          data: {'reason': reason});
    }
  }

  /// Waits (briefly) for M5 snapshots still in flight.
  Future<void> settle() => Future.wait(_pendingSnapshots)
      .timeout(const Duration(seconds: 6), onTimeout: () => const []);
}

String _pretty(String body) {
  try {
    final text = const JsonEncoder.withIndent('  ').convert(jsonDecode(body));
    return text.length > 4000 ? '${text.substring(0, 4000)}\n…' : text;
  } on FormatException {
    return body;
  }
}

String _sec(int ms) => '${(ms / 1000).toStringAsFixed(1)} s';

/// What went wrong in [run], each problem tagged with the side that owns it.
List<DebugIssue> diagnose(LivenessRunLog run) {
  final issues = <DebugIssue>[];
  void add(IssueOwner owner, String title, [String detail = '']) =>
      issues.add(DebugIssue(owner, title, detail));
  final cidHint = run.cid.isEmpty ? '' : ' for cid ${run.cid}';

  final appError = run.appError;
  if (appError != null) {
    add(IssueOwner.app, 'The check could not start on the phone', appError);
  }
  final cameraError = run.cameraError;
  if (cameraError != null) {
    add(IssueOwner.app, 'Camera did not start', cameraError);
  }

  final challengeError = run.challengeError;
  if (challengeError != null) {
    if (challengeError.contains('Valkey')) {
      add(IssueOwner.backend, 'Backend could not store the challenge',
          challengeError);
    } else if (challengeError.contains('M5')) {
      add(IssueOwner.ml, 'M5 did not issue a challenge',
          '$challengeError\nBackend: confirm ML_GATEWAY_URL points at a running M5.');
    } else {
      add(IssueOwner.backend, 'GetChallenge failed', challengeError);
    }
  }

  final serverError = run.serverError;
  if (serverError != null) {
    if (serverError.contains('invalid or expired challenge')) {
      add(IssueOwner.backend, 'Backend refused the challenge',
          '"$serverError": the id was not in the challenge store (expired, '
              'already used, or never saved).');
    } else {
      add(IssueOwner.ml, 'M5 ended the session with an error',
          '"$serverError"\nBackend log: "liveness stream: M5 error"$cidHint.');
    }
  }

  final grpcError = run.grpcError;
  // An M5 error frame is followed by UNAVAILABLE; the frame says more.
  if (grpcError != null && serverError == null) {
    final g = grpcError.toLowerCase();
    if (g.contains('closed without a result')) {
      add(IssueOwner.ml, 'M5 closed the session without a result', grpcError);
    } else if (g.contains('liveness service unavailable')) {
      add(IssueOwner.ml, 'Backend could not reach M5',
          '$grpcError\nML: is M5 up? Backend: check ML_GATEWAY_URL and the '
              '"M5 connect failed" / "M5 start failed" log$cidHint.');
    } else if (g.contains('interrupted')) {
      add(IssueOwner.ml, 'Connection to M5 dropped during the check',
          '$grpcError\nBackend log: "liveness stream: relay failed"$cidHint.');
    } else if (g.contains('record the liveness result') ||
        g.contains('challenge validation')) {
      add(IssueOwner.backend, 'Backend failed on its own side', grpcError);
    } else if (g.contains('unauthenticated') || g.contains('permission')) {
      add(IssueOwner.backend, 'Backend refused the request (sign-in or role)',
          grpcError);
    } else {
      add(IssueOwner.backend,
          'Connection between the phone and the backend failed', grpcError);
    }
  }

  if (run.idleTimeout) {
    if (run.allStepsPassed) {
      add(IssueOwner.ml, 'No result 30 s after the last step',
          'Every step passed, then M5 sent nothing. Backend log$cidHint shows '
              'whether M5 answered.');
    } else {
      add(IssueOwner.ml, 'M5 stopped sending steps during the walk',
          'Frames kept flowing but nothing came back for 30 s. Backend '
              'log$cidHint shows whether M5 or the relay went quiet.');
    }
  }

  for (final t in run.timeouts) {
    final isEye =
        RegExp(r'\b(wink|eye)\b', caseSensitive: false).hasMatch(t.instruction);
    add(
      IssueOwner.ml,
      'M5: step ${t.step} not detected: "${t.instruction}" (attempt ${t.attempt})',
      isEye
          ? 'Frames were flowing. Ask ML which eye LEFT/RIGHT means: the '
              'worker\'s own eye or the image side (frames are not mirrored). '
              'M5\'s own view of this moment is under M5 SESSION below.'
          : 'Frames were flowing, so M5 received the gesture but did not '
              'accept it. M5\'s own view of this moment is under M5 SESSION '
              'below.',
    );
  }

  final r = run.result;
  if (r != null) {
    if (!r.livenessPassed) {
      final spoof = r.spoofClassification;
      if (spoof == 'spoof_2d' || spoof == 'spoof_3d') {
        add(IssueOwner.ml, 'Anti-spoof flagged the face as $spoof',
            'If a real person did the check, this is an M5 false positive.');
      } else if (run.timeouts.isNotEmpty) {
        add(IssueOwner.ml, 'Liveness failed: a step ran out of attempts',
            'See the step problems above.');
      } else {
        add(IssueOwner.ml, 'Liveness failed although every step passed',
            'spoof=$spoof. The backend log gesture_reason$cidHint says why.');
      }
    } else if (r.verdict == 'REJECT') {
      add(
          IssueOwner.ml,
          'Face does not match the document portrait',
          'match ${r.matchScore.toStringAsFixed(3)} (${r.matchReason}). '
              'Expected when the document belongs to someone else. Otherwise '
              'ML checks the match and Backend checks which portrait it sent.');
    }
    if (r.matchReason == 'no_document_face_supplied' ||
        r.matchReason == 'document_face_unusable') {
      add(IssueOwner.backend, 'No usable document portrait reached M5',
          'match_reason=${r.matchReason}. The worker has no accepted identity '
              'document with a face, or the portrait lookup failed.');
    }
    final deepfake = r.deepfakeVerdict;
    if (deepfake.startsWith('REJECT') || deepfake.startsWith('RETRY')) {
      add(IssueOwner.ml, 'Deepfake check said: $deepfake',
          'HR sees this, the worker does not. Worth checking if the person was real.');
    }
  }

  if (run.allStepsPassed && !run.idleTimeout && run.tailMs > slowResultMs) {
    add(IssueOwner.ml, 'Result took ${_sec(run.tailMs)} after the last step',
        'The app gives up after 30 s of silence.');
  }

  if (run.framesSent > 0 &&
      run.maxSendFps > 0 &&
      run.fps < run.maxSendFps * 0.6) {
    add(
        IssueOwner.app,
        'Phone sent only ${run.fps.toStringAsFixed(1)} fps '
            '(target ${run.maxSendFps})',
        'encode ${run.cameraStats['encodeMs'] ?? '-'} ms, dropped '
            '${run.cameraStats['dropped'] ?? '-'} frames.');
  }

  final luma = run.cameraStats['luma'];
  if (luma is num && luma < 60) {
    add(IssueOwner.conditions, 'Too dark (brightness $luma/255)',
        'Retry in better light before reporting a detection bug.');
  } else if (luma is num && luma > 225) {
    add(IssueOwner.conditions, 'Overexposed (brightness $luma/255)',
        'Move away from direct light before reporting a detection bug.');
  }

  return issues;
}

/// The report as plain text, ready to paste into a message.
String renderReport(LivenessRunLog run, List<DebugIssue> issues) {
  final r = run.result;
  final b = StringBuffer()
    ..writeln('LIVENESS DEBUG REPORT')
    ..writeln('started ${localAndUtc(run.startedAt)} (server logs are UTC)')
    ..writeln('cid ${run.cid.isEmpty ? '-' : run.cid}  '
        'challenge ${run.challengeId.isEmpty ? '-' : run.challengeId}')
    ..writeln(r == null
        ? 'WHY: no result'
        : 'WHY: ${r.verdict}: ${resultWhy(r)}')
    ..writeln();
  if (run.cid.isNotEmpty) {
    b
      ..writeln('FIND IT IN THE SERVER LOGS')
      ..writeln('  backend log: grep cid=${run.cid}')
      ..writeln('  ML (M5) log: grep ${run.challengeId}')
      ..writeln();
  }
  writeIssues(b, issues);

  final cam = run.camera;
  final stats = run.cameraStats;
  b
    ..writeln()
    ..writeln('RUN')
    ..writeln('frames: ${run.framesSent} sent, '
        '${run.fps.toStringAsFixed(2)} fps '
        '(cap ${run.maxSendFps == 0 ? 'none' : run.maxSendFps})')
    ..writeln('camera: ${cam['width'] ?? '-'}x${cam['height'] ?? '-'}, '
        'max ${cam['fpsMax'] ?? '-'} fps, encode ${stats['encodeMs'] ?? '-'} ms '
        'on ${stats['encoders'] ?? '-'} threads, dropped '
        '${stats['dropped'] ?? '-'}, brightness ${stats['luma'] ?? '-'}/255')
    ..writeln('walk ${_sec(run.walkMs)}, result wait ${_sec(run.tailMs)}, '
        'total ${_sec(run.totalMs)}')
    ..writeln()
    ..writeln('TRACE (app, UTC) step by step')
    ..writeln(run.trace.render());

  if (run.m5Snapshots.isNotEmpty) {
    b
      ..writeln()
      ..writeln('M5 SESSION (GET $m5DebugUrl/m5/challenge/debug/<id>)');
    for (final s in run.m5Snapshots) {
      b
        ..writeln('-- at ${s.reason}')
        ..writeln(s.body);
    }
  }
  return b.toString();
}
