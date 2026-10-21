import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

/// Who has to fix a problem found by a tester debug report.
enum IssueOwner {
  ml('ML'),
  backend('Backend'),
  app('App'),
  conditions('Test conditions');

  const IssueOwner(this.label);
  final String label;
}

/// One problem in a tester debug report.
@immutable
class DebugIssue {
  const DebugIssue(this.owner, this.title, [this.detail = '']);
  final IssueOwner owner;
  final String title;
  final String detail;
}

/// "ML 2 · Backend 1", or "no problems".
String ownerCounts(List<DebugIssue> issues) {
  final parts = [
    for (final owner in IssueOwner.values)
      if (issues.any((i) => i.owner == owner))
        '${owner.label} ${issues.where((i) => i.owner == owner).length}',
  ];
  return parts.isEmpty ? 'no problems' : parts.join(' · ');
}

/// Sends a finished report to Flutter DevTools (Logging tab, filter
/// "cypurge") and to the console.
///
/// DevTools lists one entry per report under `cypurge.<kind>`: the headline and
/// owner counts on the row, the full report in its details, red when ML or
/// Backend owns a problem. The problems also go out as a `cypurge.<kind>`
/// event, as structured data.
void publishDebugReport({
  required String kind,
  required String headline,
  required String report,
  required List<DebugIssue> issues,
}) {
  debugPrint(report);
  final serverSide = issues.any(
      (i) => i.owner == IssueOwner.ml || i.owner == IssueOwner.backend);
  developer.log(
    '$headline · ${ownerCounts(issues)}\n\n$report',
    name: 'cypurge.$kind',
    level: serverSide
        ? 1000
        : issues.isEmpty
            ? 800
            : 900,
  );
  developer.postEvent('cypurge.$kind', {
    'headline': headline,
    'issues': [
      for (final i in issues)
        {'owner': i.owner.label, 'title': i.title, 'detail': i.detail},
    ],
    'report': report,
  });
}

/// Writes [issues] grouped by owner, each tagged `[Owner] title`, with the
/// detail indented under it.
void writeIssues(StringBuffer b, List<DebugIssue> issues) {
  b.writeln(issues.isEmpty ? 'PROBLEMS: none found' : 'PROBLEMS');
  for (final owner in IssueOwner.values) {
    for (final issue in issues.where((i) => i.owner == owner)) {
      b.writeln('[${owner.label}] ${issue.title}');
      if (issue.detail.isEmpty) continue;
      for (final line in issue.detail.split('\n')) {
        b.writeln('    $line');
      }
    }
  }
}
