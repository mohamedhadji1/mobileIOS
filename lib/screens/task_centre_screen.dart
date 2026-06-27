import 'package:fluent_ui/fluent_ui.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../services/re_verify_service.dart';
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
    setState(() => _loading = true);
    try {
      final tasks = await _reVerifyService.fetchPendingTasks();
      setState(() {
        _reVerifyTasks = tasks;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            icon: Icon(FluentIcons.chevron_left, color: AppTheme.ink, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text('Task Centre', style: AppTheme.h2),
      ),
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
                            style: TextStyle(color: AppTheme.accentLight, fontSize: 13, fontWeight: FontWeight.w700)),
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
                icon: FluentIcons.document,
                tag: const WTTag('Action', kind: WTTagKind.amber),
                accent: AppTheme.warn,
              ),
              _taskCard(
                title: 'Confirm next deployment',
                subtitle: 'Frankfurt Hub Â· Jun 15',
                progress: 0.2,
                icon: FluentIcons.location,
                tag: const WTTag('Pending', kind: WTTagKind.blue),
                accent: AppTheme.accent,
              ),
              if (_reVerifyTasks.isNotEmpty) ...[
                const SizedBox(height: AppTheme.s4),
                const WTSectionLabel('Re-verification Required'),
                ..._reVerifyTasks.map((task) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    FluentPageRoute(builder: (_) => ReVerifyScreen(task: task)),
                  ),
                  child: _taskCard(
                    title: 'Re-verify: ${task.reason}',
                    subtitle:
                        '${task.deadlineAt.difference(DateTime.now()).inHours}h remaining',
                    progress: 0,
                    icon: FluentIcons.shield,
                    tag: const WTTag('Urgent', kind: WTTagKind.red),
                    accent: AppTheme.error,
                  ),
                )),
              ],
              const SizedBox(height: AppTheme.s4),
              const WTSectionLabel('Completed'),
              _taskCard(
                title: 'Initial Enrollment',
                subtitle: 'Face and fingerprint registered',
                progress: 1.0,
                icon: FluentIcons.check_mark,
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
                decoration: BoxDecoration(color: AppTheme.tint(accent), shape: BoxShape.circle),
                child: Icon(icon, color: accent, size: 18),
              ),
              const SizedBox(width: AppTheme.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(color: AppTheme.ink, fontSize: 14, fontWeight: FontWeight.w600)),
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
                    style: TextStyle(color: accent, fontSize: 12, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
