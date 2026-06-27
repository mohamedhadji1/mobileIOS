import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';
import '../services/enrollment_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'worker_nav.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  final _service = EnrollmentService();

  Map<String, dynamic>? _statusData;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchStatus();
  }

  Future<void> _fetchStatus() async {
    setState(() => _isLoading = true);
    try {
      final data = await _service.getWorkerStatus();
      setState(() {
        _statusData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString().replaceAll('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  WTTagKind get _statusKind => switch (_statusData?['status_color']) {
        'green' => WTTagKind.green,
        'red' => WTTagKind.red,
        'amber' => WTTagKind.amber,
        _ => WTTagKind.blue,
      };

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
        commandBar: CommandBar(
          mainAxisAlignment: MainAxisAlignment.end,
          primaryItems: [
            CommandBarButton(
              icon: Icon(FluentIcons.refresh, color: AppTheme.accent),
              label: Text('Refresh', style: TextStyle(color: AppTheme.accent)),
              onPressed: _fetchStatus,
            ),
          ],
        ),
      ),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _isLoading
                    ? Center(child: ProgressRing(activeColor: AppTheme.accent))
                    : _error != null
                        ? _buildErrorView()
                        : _buildBody(),
              ),
              WTBottomNav(items: workerNavItems(context, 2), activeIndex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    final factors = (_statusData!['factors'] as List?) ?? const [];
    final title = (_statusData!['status_title'] ?? 'PENDING').toString().toUpperCase();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Traffic-light hero (.tl-big)
          WTTrafficLight(
            kind: _statusKind,
            label: title,
            subtitle: _statusKind == WTTagKind.green
                ? 'Verified Â· Last checked ${_formatScannedAt()}'
                : 'Last checked ${_formatScannedAt()}',
          ),
          const SizedBox(height: AppTheme.s3),

          // Check Results card (.slbl + .card-sm with .lrow rows)
          const WTSectionLabel('Check Results'),
          WTCard(
            small: true,
            child: Column(
              children: [
                for (int i = 0; i < factors.length; i++)
                  _factorRow(factors[i].toString(), last: i == factors.length - 1),
              ],
            ),
          ),
          const SizedBox(height: AppTheme.s4),

          _buildPrimaryAction(),
          const SizedBox(height: AppTheme.s4),
          _buildDisclaimer(),
        ],
      ),
    );
  }

  /// Renders one factor as an .lrow: label on the left (with an inline action
  /// link when something is missing) and a status tag on the right.
  Widget _factorRow(String factor, {required bool last}) {
    final isNegative = factor.startsWith('MISSING') || factor.startsWith('PENDING');
    final isMissingFace = factor.contains('Face') || factor.contains('liveness');
    final isMissingDoc = factor.contains('document') ||
        factor.contains('Document') ||
        factor.contains('ID') ||
        factor.contains('Passport') ||
        factor.contains('License');
    final clean = factor.replaceFirst(RegExp(r'^(MISSING|PENDING|VERIFIED):\s*'), '');
    final showLink = isNegative && (isMissingDoc || isMissingFace);

    return WTListRow(
      last: last,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(clean, style: TextStyle(color: AppTheme.ink, fontSize: 13, fontWeight: FontWeight.w500)),
          if (showLink) ...[
            const SizedBox(height: 3),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, isMissingFace ? '/enroll/face' : '/documents'),
              child: Text(
                isMissingFace ? 'Complete face scan' : 'Upload documents now ',
                style: TextStyle(color: AppTheme.accentLight, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ],
      ),
      trailing: WTTag(
        isNegative ? 'Pending' : 'Pass',
        kind: isNegative ? WTTagKind.amber : WTTagKind.green,
      ),
    );
  }

  String _formatScannedAt() {
    try {
      return DateFormat('MMM d Â· HH:mm').format(DateTime.parse(_statusData!['scanned_at']));
    } catch (_) {
      return 'â€”';
    }
  }

  Widget _buildErrorView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.s4),
              decoration: BoxDecoration(
                color: AppTheme.tint(AppTheme.error),
                shape: BoxShape.circle,
              ),
              child: Icon(FluentIcons.error, color: AppTheme.error, size: 36),
            ),
            const SizedBox(height: AppTheme.s5),
            Text(_error!, textAlign: TextAlign.center, style: AppTheme.bodyMuted),
            const SizedBox(height: AppTheme.s5),
            WTButton(label: 'Retry', icon: FluentIcons.refresh, onPressed: _fetchStatus),
          ],
        ),
      ),
    );
  }

  Widget _buildPrimaryAction() {
    final title = _statusData!['status_title'];
    final colorKey = _statusData!['status_color'];

    if (title == 'NOT ENROLLED') {
      return WTButton(
        label: 'Start enrollment',
        trailingIcon: FluentIcons.chevron_right,
        onPressed: () => Navigator.pushNamed(context, '/enroll'),
      );
    }

    if (colorKey == 'red' || colorKey == 'amber') {
      return WTButton(
        label: 'Dispute status / Submit appeal',
        kind: WTButtonKind.danger,
        icon: FluentIcons.warning,
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/enroll/appeal');
          if (result == true) _fetchStatus();
        },
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildDisclaimer() {
    return const WTAlert(
      'Status is derived in real time from the risk subsystem. Any anomaly triggers immediate re-verification.',
      kind: WTAlertKind.info,
    );
  }
}
