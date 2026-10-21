import 'package:flutter/material.dart';
import 'package:cypurge_mobile/theme/platform.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:grpc/grpc.dart' show GrpcError, StatusCode;

import '../services/cypurge_grpc_service.dart';
import '../services/device_identity_service.dart';
import '../services/enrollment_service.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/error_humanizer.dart';
import 'face_liveness_screen.dart';

/// Start / end shift on Home. Starting asks for the worker's face first, so a
/// phone lent to someone else cannot start the owner's shift; the backend
/// double-checks that a fresh PASS exists before it records the shift.
class ShiftCard extends StatefulWidget {
  const ShiftCard({super.key});

  @override
  State<ShiftCard> createState() => _ShiftCardState();
}

/// Room for "Start shift" / "End shift" at the small size, with the 48dp
/// touch height WTButton already guarantees.
const _buttonWidth = 132.0;

class _ShiftCardState extends State<ShiftCard> {
  static const _storage = FlutterSecureStorage();
  String? _shiftId;
  DateTime? _startedAt;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final id = await _storage.read(key: 'shift_id');
    final at = await _storage.read(key: 'shift_started_at');
    if (mounted) {
      setState(() {
        _shiftId = id;
        _startedAt = at == null ? null : DateTime.tryParse(at)?.toLocal();
      });
    }
  }

  /// Last known fix only: no permission prompt, no wait. 0,0 without one.
  Future<(double, double)> _where() async {
    try {
      final p = await Geolocator.getLastKnownPosition();
      return (p?.latitude ?? 0, p?.longitude ?? 0);
    } catch (_) {
      return (0.0, 0.0);
    }
  }

  Future<void> _start() async {
    setState(() => _busy = true);
    try {
      final workerId = await EnrollmentService().resolveWorkerId();
      final token = await EnrollmentService().getValidAccessToken();
      if (!mounted || workerId == null || token == null) return;
      final faceOk = await Navigator.push(
        context,
        platformRoute(
            builder: (_) =>
                FaceLivenessScreen(fullLiveness: false, userId: workerId)),
      );
      if (!mounted || faceOk != true) return;
      final (lat, lon) = await _where();
      final res =
          await (CypurgeGrpcService()..init(useGateway: true)).startShift(
        token: token,
        workerId: workerId,
        deviceId: await DeviceIdentityService().getDeviceId(),
        latitude: lat,
        longitude: lon,
      );
      await _storage.write(key: 'shift_id', value: res.shiftId);
      await _storage.write(key: 'shift_started_at', value: res.startedAt);
      await _load();
    } on GrpcError catch (e) {
      _tell(switch (e.code) {
        StatusCode.unimplemented => 'Shift check-in isn’t available yet.',
        StatusCode.failedPrecondition =>
          'Your face check didn’t reach the server. Try again.',
        _ => humanizeError(e, action: 'start your shift'),
      });
    } catch (e) {
      _tell(humanizeError(e, action: 'start your shift'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _end() async {
    final shiftId = _shiftId;
    if (shiftId == null) return;
    setState(() => _busy = true);
    try {
      final workerId = await EnrollmentService().resolveWorkerId();
      final token = await EnrollmentService().getValidAccessToken();
      if (workerId == null || token == null) return;
      final (lat, lon) = await _where();
      await (CypurgeGrpcService()..init(useGateway: true)).endShift(
        token: token,
        workerId: workerId,
        shiftId: shiftId,
        latitude: lat,
        longitude: lon,
      );
      await _storage.delete(key: 'shift_id');
      await _storage.delete(key: 'shift_started_at');
      await _load();
    } catch (e) {
      _tell(humanizeError(e, action: 'end your shift'));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _tell(String message) {
    if (!mounted) return;
    wtInfoBar(context, message, severity: WTSeverity.warning);
  }

  @override
  Widget build(BuildContext context) {
    final at = _startedAt;
    final onShift = _shiftId != null;
    final since = at == null
        ? ''
        : ' since ${at.hour.toString().padLeft(2, '0')}:${at.minute.toString().padLeft(2, '0')}';
    return WTCard(
      small: true,
      child: Row(
        children: [
          Icon(Icons.schedule_rounded,
              size: 22, color: onShift ? AppTheme.success : AppTheme.muted),
          const SizedBox(width: AppTheme.s3),
          Expanded(
            child: Text(
              onShift ? 'On shift$since' : 'Not on shift',
              style: AppTheme.body,
            ),
          ),
          // WTButton fills its width (it is a full-width CTA everywhere else).
          // A Row gives it none to fill, so it asked for infinite width, layout
          // threw, and an approved worker's home screen painted nothing at all.
          SizedBox(
            width: _buttonWidth,
            child: WTButton(
              label: onShift ? 'End shift' : 'Start shift',
              kind: onShift ? WTButtonKind.subtle : WTButtonKind.primary,
              small: true,
              loading: _busy,
              onPressed: _busy ? null : (onShift ? _end : _start),
            ),
          ),
        ],
      ),
    );
  }
}
