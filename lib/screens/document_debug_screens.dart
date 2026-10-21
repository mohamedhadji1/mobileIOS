import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:intl/intl.dart';

import '../services/notification_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/document_debug_report.dart';
import 'debug_report_screen.dart';

/// Tester-only: a small "Docs n" pill over every screen once a document check
/// has run. It never pushes by itself, so the upload screens' own navigation is
/// left alone; the tester opens the reports when ready.
class DebugDock extends StatelessWidget {
  const DebugDock({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ValueListenableBuilder<List<DocumentCheckRun>>(
          valueListenable: DocumentDebugLog.instance.runs,
          builder: (context, runs, _) {
            if (runs.isEmpty) return const SizedBox.shrink();
            final pending = runs.any((r) => r.pending);
            final inset = MediaQuery.paddingOf(context);
            return Positioned(
              right: 12 + inset.right,
              bottom: 96 + inset.bottom,
              // Above the Navigator there is no page Material, and bare Text
              // falls back to the framework's yellow-underlined error style.
              child: Material(
                type: MaterialType.transparency,
                child: Semantics(
                  button: true,
                  label: 'Document debug reports, ${runs.length}',
                  excludeSemantics: true,
                  child: GestureDetector(
                    onTap: () => NotificationService()
                        .navigatorKey
                        .currentState
                        ?.push(platformRoute(
                            builder: (_) => const DocumentReportsScreen())),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppTheme.ink.withValues(alpha: 0.88),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.bug_report_rounded,
                              color: AppTheme.bg, size: 14),
                          const SizedBox(width: 6),
                          Text(
                            'Docs ${runs.length}${pending ? ' …' : ''}',
                            style: TextStyle(
                              color: AppTheme.bg,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// Every recorded upload check, newest first.
class DocumentReportsScreen extends StatelessWidget {
  const DocumentReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final log = DocumentDebugLog.instance;
    return WTPage(
      appBar: AppBar(
        title: const Text('Document checks'),
        actions: [
          TextButton.icon(
            onPressed: () {
              log.clear();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete_rounded),
            label: const Text('Clear'),
          ),
        ],
      ),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: ValueListenableBuilder<List<DocumentCheckRun>>(
            valueListenable: log.runs,
            builder: (context, runs, _) => ListView.separated(
              padding: const EdgeInsets.all(AppTheme.s4),
              itemCount: runs.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppTheme.s3),
              itemBuilder: (context, i) => _RunRow(run: runs[i]),
            ),
          ),
        ),
      ),
    );
  }
}

class _RunRow extends StatelessWidget {
  const _RunRow({required this.run});
  final DocumentCheckRun run;

  @override
  Widget build(BuildContext context) {
    final issues = diagnoseDocument(run);
    final owners = {for (final i in issues) i.owner};
    return WTCard(
      small: true,
      onTap: () => Navigator.push(
        context,
        platformRoute(builder: (_) => DocumentReportScreen(run: run)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${run.expectedType}${run.withBack ? ' (front + back)' : ''}',
                  style: TextStyle(
                      color: AppTheme.ink,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(DateFormat('HH:mm:ss').format(run.startedAt),
                  style: AppTheme.caption),
            ],
          ),
          const SizedBox(height: 4),
          Text(documentSummary(run), style: AppTheme.bodyMuted),
          const SizedBox(height: AppTheme.s2),
          Wrap(
            spacing: AppTheme.s2,
            runSpacing: AppTheme.s2,
            children: [
              if (issues.isEmpty && !run.pending)
                const WTTag('No problems', kind: WTTagKind.green),
              for (final owner in IssueOwner.values)
                if (owners.contains(owner))
                  WTTag(
                    '${owner.label}: '
                    '${issues.where((i) => i.owner == owner).length}',
                    kind: DebugReportScreen.kindOf(owner),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}

/// One check in full. Rebuilds when the backend answers.
class DocumentReportScreen extends StatelessWidget {
  const DocumentReportScreen({super.key, required this.run});
  final DocumentCheckRun run;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<DocumentCheckRun>>(
      valueListenable: DocumentDebugLog.instance.runs,
      builder: (context, _, __) => DebugReportScreen(
        title: 'Document check: ${run.expectedType}',
        summary: documentWhy(run),
        issues: diagnoseDocument(run),
        report: renderDocumentReport(run),
        busy: !run.pending
            ? null
            : run.followingStatus
                ? 'Reading the final status…'
                : 'Waiting for the backend…',
        sections: [
          DebugFields(
              title: 'Final status (ListWorkerDocuments)',
              fields: statusFields(run)),
          DebugFields(
              title: 'Backend answer (VerifyDocumentUpload)',
              fields: backendFields(run)),
        ],
      ),
    );
  }
}
