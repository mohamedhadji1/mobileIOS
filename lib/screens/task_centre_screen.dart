import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../services/re_verify_service.dart';
import '../utils/error_logger.dart';
import 're_verify_screen.dart';

class TaskCentreScreen extends StatefulWidget {
  const TaskCentreScreen({super.key});

  @override
  State<TaskCentreScreen> createState() => _TaskCentreScreenState();
}

class _TaskCentreScreenState extends State<TaskCentreScreen> {
  late final ReVerifyService _reVerifyService;
  List<ReVerifyTask> _reVerifyTasks = [];
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _reVerifyService = ReVerifyService();
    _loadReVerifyTasks();
  }

  Future<void> _loadReVerifyTasks() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final tasks = await _reVerifyService.fetchPendingTasks();
      if (!mounted) return;
      setState(() {
        _reVerifyTasks = tasks;
        _loading = false;
      });
    } on ReVerifyAuthException {
      if (!mounted) return;
      setState(() {
        _error = 'Your session has expired. Please sign in again.';
        _loading = false;
      });
    } on Exception catch (e, stack) {
      ErrorLogger.log('Task Centre - Load Re-verification Tasks', e, stack);
      if (!mounted) return;
      // Deliberately generic: raw gRPC status text means nothing to a worker and
      // can leak backend detail. The specifics go to ErrorLogger.
      setState(() {
        _error = "Couldn't load your re-verification tasks.";
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WTPage(
      appBar: AppBar(title: const Text('Task Centre')),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(AppTheme.s4),
            children: [
              // Deployment / objective summary card
              WTCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('DAILY OBJECTIVE', style: AppTheme.label),
                    const SizedBox(height: AppTheme.s2),
                    Text('Maintain Secure Perimeter', style: AppTheme.h1),
                    const SizedBox(height: AppTheme.s4),
                    Row(
                      children: [
                        const Expanded(child: WTProgressBar(value: 0.75)),
                        const SizedBox(width: AppTheme.s3),
                        Text('75%',
                            style: TextStyle(
                                color: AppTheme.accentLight,
                                fontSize: 13,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.s4),
              const WTSectionLabel('Active Tasks'),
              _taskCard(
                title: 'Upload ADR Certificate',
                subtitle: 'Requested by Acme Logistics HR',
                progress: 0.6,
                icon: Icons.description_rounded,
                tag: const WTTag('Action', kind: WTTagKind.amber),
                accent: AppTheme.warn,
              ),
              _taskCard(
                title: 'Confirm next deployment',
                subtitle: 'Frankfurt Hub · Jun 15',
                progress: 0.2,
                icon: Icons.location_on_rounded,
                tag: const WTTag('Pending', kind: WTTagKind.blue),
                accent: AppTheme.accent,
              ),
              // Re-verification is compliance-critical and time-boxed: a silent
              // failure here used to render as an absent section, which reads
              // identically to "you have nothing to do". Loading and error now
              // both have a visible state.
              if (_loading) ...[
                const SizedBox(height: AppTheme.s4),
                const WTSectionLabel('Re-verification Required'),
                const WTSkeletonList(count: 2),
              ] else if (_error != null) ...[
                const SizedBox(height: AppTheme.s4),
                const WTSectionLabel('Re-verification Required'),
                WTCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: AppTheme.warn, size: 16),
                          const SizedBox(width: AppTheme.s2),
                          Expanded(
                            child: Text(_error!,
                                style: TextStyle(
                                    color: AppTheme.ink, fontSize: 13)),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.s3),
                      OutlinedButton(
                        onPressed: _loadReVerifyTasks,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ] else if (_reVerifyTasks.isNotEmpty) ...[
                const SizedBox(height: AppTheme.s4),
                const WTSectionLabel('Re-verification Required'),
                ..._reVerifyTasks.map((task) => MergeSemantics(
                    child: Semantics(
                        button: true,
                        hint: 'Opens the re-verification',
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            platformRoute(
                                builder: (_) => ReVerifyScreen(task: task)),
                          ),
                          child: _taskCard(
                            title: 'Re-verify: ${task.reason}',
                            subtitle:
                                '${timeLeft(task.deadlineAt.difference(DateTime.now()))} remaining',
                            progress: 0,
                            icon: Icons.shield_rounded,
                            tag: const WTTag('Urgent', kind: WTTagKind.red),
                            accent: AppTheme.error,
                          ),
                        )))),
              ],
              const SizedBox(height: AppTheme.s4),
              const WTSectionLabel('Completed'),
              _taskCard(
                title: 'Initial Enrollment',
                subtitle: 'Face and fingerprint registered',
                progress: 1.0,
                icon: Icons.check_rounded,
                tag: const WTTag('Done', kind: WTTagKind.green),
                accent: AppTheme.success,
                completed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskCard({
    required String title,
    required String subtitle,
    required double progress,
    required IconData icon,
    required Widget tag,
    required Color accent,
    bool completed = false,
  }) {
    return WTCard(
      small: true,
      leftAccent: accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                    color: AppTheme.tint(accent), shape: BoxShape.circle),
                child: Icon(icon, color: accent, size: 18),
              ),
              const SizedBox(width: AppTheme.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: AppTheme.ink,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTheme.caption),
                  ],
                ),
              ),
              tag,
            ],
          ),
          if (!completed) ...[
            const SizedBox(height: AppTheme.s3),
            Row(
              children: [
                Expanded(child: WTProgressBar(value: progress, color: accent)),
                const SizedBox(width: AppTheme.s3),
                Text('${(progress * 100).toInt()}%',
                    style: TextStyle(
                        color: accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
