import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cypurge_mobile/main.dart' show CypurgeApp;
import '../services/enrollment_service.dart';
import '../services/device_identity_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'worker_nav.dart';

/// Profile / settings — mirrors the HTML mockup's Profile tab. Identity facts
/// come from secure storage + the live status service; settings toggles are
/// local UI state (no persistence layer exists for them yet).
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _storage = const FlutterSecureStorage();
  final _service = EnrollmentService();

  String _name = 'Worker';
  String _tenant = 'Maritime Trust';
  WTTagKind _statusKind = WTTagKind.amber;
  String _statusLabel = 'Pending';

  bool _notifications = true;
  bool _biometricLogin = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final name = await _storage.read(key: 'cypurge_worker_name');
    final tenant = await _storage.read(key: 'tenant_slug') ?? await _storage.read(key: 'tenant_id');
    if (mounted) {
      setState(() {
        if (name != null && name.trim().isNotEmpty) _name = name.trim();
        if (tenant != null && tenant.isNotEmpty) _tenant = tenant;
      });
    }
    try {
      final s = await _service.getWorkerStatus();
      if (!mounted) return;
      setState(() {
        _statusLabel = (s['status_title'] ?? 'PENDING').toString();
        _statusKind = switch (s['status_color']) {
          'green' => WTTagKind.green,
          'red' => WTTagKind.red,
          'amber' => WTTagKind.amber,
          _ => WTTagKind.blue,
        };
      });
    } on Exception {
      // Keep the default pending status if the service is unreachable.
    }
  }

  Future<void> _signOut() async {
    await _storage.deleteAll();
    if (mounted) Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
  }

  /// Worker wants to move to a new phone. Devices are bound to a worker at
  /// enrollment, so a new phone needs HR approval before it can enroll. This
  /// sends a device-change request HR reviews in the portal.
  Future<void> _requestDeviceChange() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => ContentDialog(
        title: const Text('Request new device'),
        content: const Text(
          'Your account is locked to this phone for security. To move to a new '
          'phone, HR must approve it first. Send a request to HR now?',
        ),
        actions: [
          Button(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(ctx, false),
          ),
          FilledButton(
            child: const Text('Send request'),
            onPressed: () => Navigator.pop(ctx, true),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final ok = await DeviceIdentityService()
        .requestDeviceChange(reason: 'Worker requested device change');
    if (!mounted) return;
    await displayInfoBar(
      context,
      builder: (ctx, close) => InfoBar(
        title: Text(ok ? 'Request sent' : 'Could not send request'),
        content: Text(ok
            ? 'HR has been notified. They will approve your new device.'
            : 'No connection to the server. Try again later.'),
        severity: ok ? InfoBarSeverity.success : InfoBarSeverity.warning,
        onClose: close,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: wtStagger([
                      Row(
                        children: [
                          Expanded(child: Text('Profile', style: AppTheme.display)),
                          IconButton(
                            icon: Icon(AppTheme.light ? FluentIcons.clear_night : FluentIcons.sunny,
                                color: AppTheme.muted, size: 20),
                            onPressed: () {
                              AppTheme.light = !AppTheme.light;
                              CypurgeApp.themeNotifier.value = AppTheme.brightness;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.s3),
                      _header(),
                      const SizedBox(height: AppTheme.s5),
                      const WTSectionLabel('Personal info'),
                      WTCard(
                        small: true,
                        child: Column(children: [
                          WTListRow(label: 'Organisation', valueText: _tenant),
                          WTListRow(label: 'Verification', valueText: _statusLabel, last: true),
                        ]),
                      ),
                      const SizedBox(height: AppTheme.s2),
                      const WTSectionLabel('Settings'),
                      WTCard(
                        small: true,
                        child: Column(children: [
                          _toggleRow('Notifications', _notifications, (v) => setState(() => _notifications = v)),
                          _toggleRow('Biometric login', _biometricLogin, (v) => setState(() => _biometricLogin = v), last: true),
                        ]),
                      ),
                      const SizedBox(height: AppTheme.s4),
                      WTButton(
                        label: 'Replay onboarding flow',
                        kind: WTButtonKind.subtle,
                        icon: FluentIcons.play,
                        small: true,
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false),
                      ),
                      const SizedBox(height: AppTheme.s2),
                      WTButton(
                        label: 'Request new device (Contact HR)',
                        kind: WTButtonKind.subtle,
                        icon: FluentIcons.cell_phone,
                        small: true,
                        onPressed: _requestDeviceChange,
                      ),
                      const SizedBox(height: AppTheme.s2),
                      WTButton(
                        label: 'Sign out',
                        kind: WTButtonKind.danger,
                        icon: FluentIcons.sign_out,
                        small: true,
                        onPressed: _signOut,
                      ),
                    ]),
                  ),
                ),
              ),
              WTBottomNav(items: workerNavItems(context, 4), activeIndex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    final initials = _name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).take(2).map((p) => p.characters.first).join().toUpperCase();
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(colors: [AppTheme.accent, AppTheme.accentLight]),
            boxShadow: [BoxShadow(color: AppTheme.accent.withValues(alpha: 0.4), blurRadius: 18, offset: const Offset(0, 6))],
          ),
          child: Center(
            child: Text(initials.isEmpty ? '—' : initials,
                style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
          ),
        ),
        const SizedBox(height: AppTheme.s3),
        Text(_name, style: AppTheme.h1),
        const SizedBox(height: 4),
        Text('worker · $_tenant', style: AppTheme.caption),
        const SizedBox(height: AppTheme.s3),
        WTTag(_statusLabel, kind: _statusKind),
      ],
    );
  }

  Widget _toggleRow(String label, bool value, ValueChanged<bool> onChanged, {bool last = false}) {
    return WTListRow(
      last: last,
      leading: Text(label, style: TextStyle(color: AppTheme.ink, fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: ToggleSwitch(checked: value, onChanged: onChanged),
    );
  }
}
