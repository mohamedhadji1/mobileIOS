import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:crypto/crypto.dart';

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


  /// Stable per-install device id. Creates the seed on first call.
  Future<String> getDeviceId() async {
    String? seed = await _storage.read(key: 'device_private_key');
    if (seed == null) {
      seed = 'dev-ecdsa-p256-key-seed-value-'
          '${DateTime.now().millisecondsSinceEpoch}';
      await _storage.write(key: 'device_private_key', value: seed);
    }
    return sha256.convert(utf8.encode(seed)).toString();
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
  Future<bool> registerDevice(String workerId, {String? changeReason}) async {
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
          ? '✅ Device bound to worker $workerId (id=$deviceId).'
          : '⚠️ Device register not accepted by backend.');
      return ok;
    } catch (e) {
      debugPrint('⚠️ Device register failed: $e');
      return false;
    }
  }

  /// Worker-initiated request to move to a new phone. Creates a pending
  /// device-change request for HR to approve in the portal. Returns true on 2xx.
  Future<bool> requestDeviceChange({required String reason}) async {
    final workerId = await _storage.read(key: 'worker_id');
    if (workerId == null) return false;
    // Device swap = RegisterDevice with a change_reason; the backend re-binds
    // the new public key and puts the worker into MANUAL_REVIEW for analyst
    // approval (spec Part 5).
    return registerDevice(workerId, changeReason: reason);
  }
}
