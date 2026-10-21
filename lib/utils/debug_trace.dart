import 'dart:convert';

import 'package:intl/intl.dart';

/// How a step ended, in the ML gateway trace's words.
enum TraceStatus { ok, miss, fail }

/// One step of a trace: what ran, when it ended (UTC), how long it took.
class TraceStep {
  TraceStep(this.step, this.status,
      {this.ms, this.why = '', this.data = const {}, DateTime? at})
      : at = (at ?? DateTime.now()).toUtc();

  final DateTime at;
  final String step;
  final TraceStatus status;
  final int? ms;
  final String why;
  final Map<String, Object?> data;
}

final _stamp = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');

/// UTC, like the ML and backend logs: "2026-09-17 10:59:43.033Z".
String utcStamp(DateTime t) => '${_stamp.format(t.toUtc())}Z';

/// "11:59:42 local = 10:59:42 UTC", to find the same moment in server logs.
String localAndUtc(DateTime t) => '${DateFormat('HH:mm:ss').format(t.toLocal())}'
    ' local = ${DateFormat('HH:mm:ss').format(t.toUtc())} UTC';

/// The app's side of a check, in the ML gateway's own trace format so app,
/// backend and ML lines can be laid side by side:
///
///     2026-09-17 10:59:43.033Z trace rid=c3baa45a step=app.put ms=812 status=ok {"kb":77.6}
///     trace-summary rid=c3baa45a what=app.document total_ms=… path=[app.put:ok:812 > …]
class DebugTrace {
  DebugTrace(this.what, [this.rid = '']);

  final String what;
  String rid;
  final steps = <TraceStep>[];

  void add(String step, TraceStatus status,
          {int? ms,
          String why = '',
          Map<String, Object?> data = const {},
          DateTime? at}) =>
      insert(TraceStep(step, status, ms: ms, why: why, data: data, at: at));

  /// Keeps the steps in time order, and steps of the same moment in the order
  /// they were added.
  void insert(TraceStep s) {
    final i = steps.indexWhere((x) => x.at.isAfter(s.at));
    i < 0 ? steps.add(s) : steps.insert(i, s);
  }

  void addAll(Iterable<TraceStep> more) => more.forEach(insert);

  TraceStep? get firstProblem {
    for (final s in steps) {
      if (s.status != TraceStatus.ok) return s;
    }
    return null;
  }

  String line(TraceStep s) {
    final data = {
      ...s.data,
      if (s.why.isNotEmpty) 'why': s.why,
    };
    return '${utcStamp(s.at)} trace rid=$rid step=${s.step} '
        'ms=${s.ms ?? '-'} status=${s.status.name}'
        '${data.isEmpty ? '' : ' ${jsonEncode(data, toEncodable: (o) => '$o')}'}';
  }

  String summary() {
    if (steps.isEmpty) return 'trace-summary rid=$rid what=$what steps=0';
    final first = steps.first;
    final start = first.at.subtract(Duration(milliseconds: first.ms ?? 0));
    final total = steps.last.at.difference(start).inMilliseconds;
    final timed = steps.where((s) => s.ms != null).toList()
      ..sort((a, b) => b.ms!.compareTo(a.ms!));
    final problem = firstProblem;
    final path = steps
        .map((s) => '${s.step}:${s.status.name}${s.ms == null ? '' : ':${s.ms}'}')
        .join(' > ');
    return 'trace-summary rid=$rid what=$what total_ms=$total '
        'steps=${steps.length} '
        'slowest=${timed.isEmpty ? '-' : '${timed.first.step}(${timed.first.ms}ms)'} '
        'first_problem=${problem == null ? 'none' : '${problem.step}:${problem.status.name}'} '
        'path=[$path]';
  }

  /// Every step, then the summary line.
  String render() => [...steps.map(line), summary()].join('\n');
}
