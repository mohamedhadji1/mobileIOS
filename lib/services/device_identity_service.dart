import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:crypto/crypto.dart';
import 'package:grpc/grpc.dart' show GrpcError, StatusCode;

import 'device_key_service.dart';
import 'cypurge_grpc_service.dart';
import 'enrollment_service.dart';

/// Owns the device's stable cryptographic identity and its binding to a worker.
///
/// Identity model (dev): `device_id = SHA-256(device_private_key)` where the
/// seed lives in hardware-backed secure storage (Keystore/Keychain) and is
/// generated once per install. This gives a stable, non-guessable device id
/// without exposing OS hardware identifiers (IMEI/serial are privacy-gated).
/// Production upgrade: replace the HMAC seed with an ECDSA P-256 keypair and
/// register the PUBLIC key as the device id — see backend spec Part 3.
class DeviceIdentityService {
  static final DeviceIdentityService _instance =
      DeviceIdentityService._internal();
  factory DeviceIdentityService() => _instance;
  DeviceIdentityService._internal();

  final _storage = const FlutterSecureStorage();
  final _deviceInfo = DeviceInfoPlugin();


  /// Secure-storage keys that ARE the phone's identity. Sign-out keeps them:
  /// wiping them made the same phone look new at the next sign-in, which the
  /// backend now treats as an unannounced device swap (worker YELLOW).
  static const deviceKeys = {'device_private_key', 'device_ec_priv_d_hex'};

  /// Stable per-install device id. Creates the seed on first call.
  Future<String> getDeviceId() async {
    String? seed = await _storage.read(key: 'device_private_key');
    if (seed == null) {
      seed = 'dev-ecdsa-p256-key-seed-value-'
          '${DateTime.now().millisecondsSinceEpoch}';
      await _storage.write(key: 'device_private_key', value: seed);
    }
    final id = sha256.convert(utf8.encode(seed)).toString();
    CypurgeGrpcService.deviceId = id;
    return id;
  }

  /// Signs the worker out of this phone: every stored value goes except the
  /// phone's own identity ([deviceKeys]).
  Future<void> clearSessionKeepDevice() async {
    final all = await _storage.readAll();
    for (final key in all.keys) {
      if (!deviceKeys.contains(key)) await _storage.delete(key: key);
    }
  }

  Future<Map<String, String>> _deviceMetadata() async {
    String model = 'Unknown';
    String osVersion = 'Unknown';
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final info = await _deviceInfo.androidInfo;
        model = info.model;
        osVersion = 'Android ${info.version.release}';
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        final info = await _deviceInfo.iosInfo;
        model = info.utsname.machine;
        osVersion = 'iOS ${info.systemVersion}';
      }
    } catch (e) {
      debugPrint('⚠️ Device metadata read failed ($e)');
    }
    return {'device_model': model, 'os_version': osVersion};
  }


  /// Binds this device to the enrolled worker. Call once at the end of
  /// first-time enrollment. Backend creates the `devices` row (status ACTIVE)
  /// and rejects if the device id is already bound to a different worker.
  /// Returns true on 2xx.
  Future<bool> registerDevice(String workerId, {String? changeReason}) async =>
      await bind(workerId, changeReason: changeReason) == DeviceBindResult.ok;

  /// RegisterDevice with the reason it failed. On a phone that is not the
  /// worker's bound one the backend saves it as pending (a swap) and still
  /// answers ok — [status] then says PENDING.
  Future<DeviceBindResult> bind(String workerId, {String? changeReason}) async {
    try {
      final deviceId = await getDeviceId();
      final meta = await _deviceMetadata();
      final publicKeyPem = await DeviceKeyService().publicKeyPem();
      final token = await EnrollmentService().getValidAccessToken() ??
          await _storage.read(key: 'access_token') ??
          '';

      final grpc = CypurgeGrpcService()..init(useGateway: true);
      final ok = await grpc.registerDevice(
        token: token,
        workerId: workerId,
        deviceId: deviceId,
        publicKeyPem: publicKeyPem,
        deviceModel: meta['device_model'] ?? 'Unknown',
        osVersion: meta['os_version'] ?? 'Unknown',
        platform: defaultTargetPlatform.name,
        changeReason: changeReason,
      );
      debugPrint(ok
          ? '✅ Device registered for worker $workerId (id=$deviceId).'
          : '⚠️ Device register not accepted by backend.');
      return ok ? DeviceBindResult.ok : DeviceBindResult.failed;
    } on GrpcError catch (e) {
      debugPrint('⚠️ Device register failed: $e');
      // The backend's only FAILED_PRECONDITION here: this phone is bound to
      // another worker's account.
      return e.code == StatusCode.failedPrecondition
          ? DeviceBindResult.registeredToAnotherAccount
          : DeviceBindResult.failed;
    } catch (e) {
      debugPrint('⚠️ Device register failed: $e');
      return DeviceBindResult.failed;
    }
  }

  /// What the backend holds for this phone. [DeviceState.unknown] when it
  /// could not say — a backend without GetMyDeviceStatus, or no connection —
  /// so callers fail open instead of locking a worker out.
  Future<DeviceStatus> status() async {
    try {
      final workerId = await EnrollmentService().resolveWorkerId();
      final token = await EnrollmentService().getValidAccessToken();
      if (workerId == null || token == null) return const DeviceStatus(DeviceState.unknown);
      final res = await (CypurgeGrpcService()..init(useGateway: true)).getMyDeviceStatus(
        token: token,
        workerId: workerId,
        deviceId: await getDeviceId(),
      );
      return DeviceStatus(
        DeviceState.values.asNameMap()[res.status.toLowerCase()] ?? DeviceState.unknown,
        swapRequested: res.swapRequested,
        swapRequestOpen: res.swapRequestOpen,
      );
    } catch (e) {
      debugPrint('⚠️ Device status unavailable: $e');
      return const DeviceStatus(DeviceState.unknown);
    }
  }

  /// Asks HR for a new phone, sent from this (the bound) phone. The new phone
  /// then registers with no colour change; without a request it makes the
  /// worker YELLOW.
  Future<SwapRequestResult> requestDeviceSwap({required String reason}) async {
    try {
      final workerId = await EnrollmentService().resolveWorkerId();
      final token = await EnrollmentService().getValidAccessToken();
      if (workerId == null || token == null) return SwapRequestResult.failed;
      final res = await (CypurgeGrpcService()..init(useGateway: true)).requestDeviceSwap(
        token: token,
        workerId: workerId,
        deviceId: await getDeviceId(),
        reason: reason,
      );
      return res.success ? SwapRequestResult.sent : SwapRequestResult.failed;
    } on GrpcError catch (e) {
      debugPrint('⚠️ Device swap request failed: $e');
      return switch (e.code) {
        StatusCode.unimplemented => SwapRequestResult.notAvailable,
        StatusCode.failedPrecondition => SwapRequestResult.notBoundPhone,
        _ => SwapRequestResult.failed,
      };
    } catch (e) {
      debugPrint('⚠️ Device swap request failed: $e');
      return SwapRequestResult.failed;
    }
  }
}

enum DeviceBindResult { ok, registeredToAnotherAccount, failed }

/// GetMyDeviceStatus.status, plus [unknown] when the backend could not say.
enum DeviceState { active, pending, rejected, replaced, none, unknown }

class DeviceStatus {
  final DeviceState state;
  final bool swapRequested;
  final bool swapRequestOpen;
  const DeviceStatus(this.state, {this.swapRequested = false, this.swapRequestOpen = false});
}

enum SwapRequestResult { sent, notAvailable, notBoundPhone, failed }
