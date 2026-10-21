import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/enrollment_service.dart';
import '../utils/error_humanizer.dart';
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
    // Clear the old error, or a Retry that succeeds still shows the error.
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final data = await _service.getWorkerStatus();
      if (!mounted) return;
      setState(() {
        _statusData = data;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = humanizeError(e, action: 'load your status');
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
    final failed = !_isLoading && _error != null;
    return WTPage(
      appBar: AppBar(
        title: const Text('My status'),
        // The error view has its own Retry; one way to try again is enough.
        actions: [
          if (!failed)
            TextButton.icon(
              onPressed: _isLoading ? null : _fetchStatus,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Refresh'),
            ),
        ],
      ),
      nav: WTBottomNav(items: workerNavItems(context, 2), activeIndex: 2),
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: WTSwitcher(
                  stateKey: _isLoading
                      ? 'loading'
                      : failed
                          ? 'error'
                          : 'body',
                  child: _isLoading
                      ? _buildLoadingSkeleton()
                      : failed
                          ? _buildErrorView()
                          : _buildBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Mirrors _buildBody's shape: traffic-light hero, then factor rows.
  Widget _buildLoadingSkeleton() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
          AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s6),
      child: Semantics(
        label: 'Loading your status',
        liveRegion: true,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WTSkeleton(height: 132, radius: AppTheme.rLg),
            SizedBox(height: AppTheme.s5),
            WTSkeleton(width: 150, height: 12),
            SizedBox(height: AppTheme.s3),
            WTSkeletonList(count: 3, leading: false),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    final factors = (_statusData!['factors'] as List?) ?? const [];
    final title =
        (_statusData!['status_title'] ?? 'PENDING').toString().toUpperCase();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
          AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Traffic-light hero (.tl-big)
          WTTrafficLight(
            kind: _statusKind,
            label: title,
            subtitle: _statusKind == WTTagKind.green
                ? 'Verified · Last checked ${_formatScannedAt()}'
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
                  _factorRow(factors[i].toString(),
                      last: i == factors.length - 1),
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
    final isNegative =
        factor.startsWith('MISSING') || factor.startsWith('PENDING');
    final isMissingFace =
        factor.contains('Face') || factor.contains('liveness');
    final isMissingDoc = factor.contains('document') ||
        factor.contains('Document') ||
        factor.contains('ID') ||
        factor.contains('Passport') ||
        factor.contains('License');
    final clean =
        factor.replaceFirst(RegExp(r'^(MISSING|PENDING|VERIFIED):\s*'), '');
    final showLink = isNegative && (isMissingDoc || isMissingFace);

    return WTListRow(
      last: last,
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(clean,
              style: TextStyle(
                  color: AppTheme.ink,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
          if (showLink) ...[
            const SizedBox(height: 3),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                  context, isMissingFace ? '/enroll/face' : '/documents'),
              child: Text(
                isMissingFace ? 'Complete face scan' : 'Upload documents now ',
                style: TextStyle(
                    color: AppTheme.accentLight,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
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
      return DateFormat('MMM d · HH:mm')
          .format(DateTime.parse(_statusData!['scanned_at']));
    } catch (_) {
      return '—';
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
              child: Icon(Icons.error_outline_rounded,
                  color: AppTheme.error, size: 36),
            ),
            const SizedBox(height: AppTheme.s5),
            Text(_error!,
                textAlign: TextAlign.center, style: AppTheme.bodyMuted),
            const SizedBox(height: AppTheme.s5),
            WTButton(
                label: 'Retry',
                icon: Icons.refresh_rounded,
                onPressed: _fetchStatus),
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
        trailingIcon: Icons.chevron_right_rounded,
        onPressed: () => Navigator.pushNamed(context, '/enroll'),
      );
    }

    if (colorKey == 'red' || colorKey == 'amber') {
      return WTButton(
        label: 'Dispute status / Submit appeal',
        kind: WTButtonKind.danger,
        icon: Icons.warning_amber_rounded,
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
