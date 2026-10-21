import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/debug_issue.dart';

/// Tester-only: a finished check, its problems grouped by the side that has to
/// fix them, optional detail tables, and the full text report to copy.
class DebugReportScreen extends StatelessWidget {
  const DebugReportScreen({
    super.key,
    required this.title,
    required this.summary,
    required this.issues,
    required this.report,
    this.sections = const [],
    this.busy,
  });

  final String title;

  /// One line: what the check concluded.
  final String summary;
  final List<DebugIssue> issues;
  final String report;

  /// Shown between the problems and the full report (answers, MRZ, …).
  final List<Widget> sections;

  /// Something still running, e.g. "Asking ML directly…".
  final String? busy;

  static WTTagKind kindOf(IssueOwner owner) => switch (owner) {
        IssueOwner.ml => WTTagKind.blue,
        IssueOwner.backend => WTTagKind.amber,
        IssueOwner.app => WTTagKind.red,
        IssueOwner.conditions => WTTagKind.neutral,
      };

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: report));
    if (context.mounted) wtInfoBar(context, 'Report copied');
  }

  @override
  Widget build(BuildContext context) {
    final owners = {for (final i in issues) i.owner};
    final waiting = busy;
    return WTPage(
      appBar: AppBar(title: Text(title)),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(AppTheme.s4),
                  children: [
                    Text(summary, style: AppTheme.bodyMuted),
                    if (waiting != null) ...[
                      const SizedBox(height: AppTheme.s3),
                      Row(children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: WTSpinner(
                              strokeWidth: 2, activeColor: AppTheme.accent),
                        ),
                        const SizedBox(width: AppTheme.s2),
                        Expanded(child: Text(waiting, style: AppTheme.caption)),
                      ]),
                    ],
                    const SizedBox(height: AppTheme.s3),
                    if (issues.isEmpty)
                      const Align(
                        alignment: Alignment.centerLeft,
                        child:
                            WTTag('No problems found', kind: WTTagKind.green),
                      )
                    else
                      Wrap(
                        spacing: AppTheme.s2,
                        runSpacing: AppTheme.s2,
                        children: [
                          for (final owner in IssueOwner.values)
                            if (owners.contains(owner))
                              WTTag(
                                '${owner.label}: '
                                '${issues.where((i) => i.owner == owner).length}',
                                kind: kindOf(owner),
                              ),
                        ],
                      ),
                    const SizedBox(height: AppTheme.s4),
                    for (final issue in issues) ...[
                      _IssueCard(issue: issue),
                      const SizedBox(height: AppTheme.s3),
                    ],
                    ...sections,
                    const WTSectionLabel('Full report', topGap: AppTheme.s3),
                    Container(
                      padding: const EdgeInsets.all(AppTheme.s3),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceAlt,
                        borderRadius: BorderRadius.circular(AppTheme.rSm),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: SelectableText(
                        report,
                        style: TextStyle(
                          color: AppTheme.ink,
                          fontFamily: 'monospace',
                          fontSize: 12,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    AppTheme.s4, AppTheme.s2, AppTheme.s4, AppTheme.s4),
                child: Row(
                  children: [
                    Expanded(
                      child: WTButton(
                        label: 'Copy report',
                        icon: Icons.content_copy_rounded,
                        onPressed: () => _copy(context),
                      ),
                    ),
                    const SizedBox(width: AppTheme.s3),
                    Expanded(
                      child: WTButton(
                        label: 'Done',
                        kind: WTButtonKind.subtle,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IssueCard extends StatelessWidget {
  const _IssueCard({required this.issue});
  final DebugIssue issue;

  @override
  Widget build(BuildContext context) {
    return WTCard(
      small: true,
      semanticLabel: '${issue.owner.label}: ${issue.title}. ${issue.detail}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WTTag(issue.owner.label, kind: DebugReportScreen.kindOf(issue.owner)),
          const SizedBox(height: AppTheme.s2),
          Text(issue.title,
              style: TextStyle(
                  color: AppTheme.ink,
                  fontSize: 15,
                  fontWeight: FontWeight.w600)),
          if (issue.detail.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(issue.detail, style: AppTheme.bodyMuted),
          ],
        ],
      ),
    );
  }
}

/// A titled table of label/value rows, e.g. the MRZ fields.
class DebugFields extends StatelessWidget {
  const DebugFields({super.key, required this.title, required this.fields});

  final String title;
  final Map<String, String> fields;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.s3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WTSectionLabel(title, topGap: AppTheme.s2),
          WTCard(
            small: true,
            child: fields.isEmpty
                ? Text('Nothing', style: AppTheme.caption)
                : Column(
                    children: [
                      for (final e in fields.entries)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(e.key, style: AppTheme.caption),
                              ),
                              const SizedBox(width: AppTheme.s2),
                              Expanded(
                                flex: 3,
                                child: SelectableText(
                                  e.value,
                                  style: TextStyle(
                                    color: AppTheme.ink,
                                    fontFamily: 'monospace',
                                    fontSize: 12.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
