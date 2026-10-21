import 'dart:convert';

// Uint8List comes through foundation.dart, so a dart:typed_data import here is
// flagged redundant by the analyzer.
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../services/cypurge_grpc_service.dart';
import '../services/enrollment_service.dart';

/// The enrollment selfie, kept for display on Home and Profile.
///
/// Deliberately a SECOND copy rather than a read of `enroll_selfie`. That key
/// is the doc_face anchor for one enrollment attempt, and the liveness screen
/// deletes it the moment enrollment succeeds ("consumed; fresh on re-enroll"),
/// so anything showing the worker's face has to keep its own copy or it would
/// go blank at exactly the moment enrollment completes.
///
/// Stored base64 because flutter_secure_storage is a string store. It is
/// cleared along with everything else by `deleteAll()` on sign-out, so the next
/// worker on a shared phone never sees the previous one's face.
const profileSelfieKey = 'profile_selfie';

/// Saves the selfie for display. Never throws — failing to store a picture must
/// not fail the capture that produced it.
Future<void> saveProfileSelfie(
  Uint8List jpeg, {
  FlutterSecureStorage storage = const FlutterSecureStorage(),
}) async {
  try {
    await storage.write(key: profileSelfieKey, value: base64Encode(jpeg));
  } on Exception catch (e) {
    debugPrint('profile selfie not saved: $e');
  }
}

/// Stores [jpeg] only when there is no photo yet.
///
/// For sources that are verified but not posed — a frame lifted out of the
/// liveness walk, where the worker may be mid-wink or holding fingers up. Good
/// enough when the alternative is a blank avatar, but it must never overwrite
/// the selfie the worker actually sat for.
Future<void> saveProfileSelfieIfMissing(
  Uint8List jpeg, {
  FlutterSecureStorage storage = const FlutterSecureStorage(),
}) async {
  if (await readProfileSelfie(storage: storage) != null) return;
  await saveProfileSelfie(jpeg, storage: storage);
}

/// Pulls the selfie the backend retained in MinIO, and caches it locally.
///
/// The only path that covers a worker who enrolled BEFORE the app kept a copy:
/// their `enroll_selfie` was consumed at enrollment and nothing is left on the
/// device. Server-side the same image survives as `doc_face.jpg`, copied to a
/// durable `biometric-evidence/{tenant}/{worker}/` key, reachable through
/// `GetBiometricEvidenceURL`.
///
/// One round trip per install, not one per screen build — a hit is cached and
/// [readProfileSelfie] answers from then on.
///
/// Returns null on every failure, silently: no worker id yet, no token, the
/// backend declining, an unreachable URL. The avatar shows initials instead,
/// which is a fine outcome for a missing picture and a terrible reason to fail
/// a screen.
Future<Uint8List?> fetchProfileSelfieFromServer({
  FlutterSecureStorage storage = const FlutterSecureStorage(),
}) async {
  try {
    // tenant_id, not tenant_slug: the RPC keys on the tenant UUID.
    final tenantId = await storage.read(key: 'tenant_id');
    final workerId = await storage.read(key: 'worker_id');
    if (tenantId == null ||
        tenantId.isEmpty ||
        workerId == null ||
        workerId.isEmpty) {
      return null;
    }

    final token = await EnrollmentService().getValidAccessToken();
    if (token == null) return null;

    final service = CypurgeGrpcService();
    service.init(useGateway: true);
    final url = await service.getBiometricEvidenceUrl(
        token: token, tenantId: tenantId, workerId: workerId);
    if (url == null) return null;

    // Presigned URL — carries its own auth, so no bearer token here. Timed,
    // because an unreachable MinIO host would otherwise hang the avatar load.
    final res =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    if (res.statusCode != 200 || res.bodyBytes.isEmpty) {
      debugPrint('🖼️ evidence fetch HTTP ${res.statusCode}');
      return null;
    }

    await saveProfileSelfie(res.bodyBytes, storage: storage);
    return res.bodyBytes;
  } on Exception catch (e) {
    debugPrint('🖼️ evidence fetch failed: $e');
    return null;
  }
}

/// What screens should call: the local copy, or one attempt at the backend.
Future<Uint8List?> loadProfileSelfie({
  FlutterSecureStorage storage = const FlutterSecureStorage(),
}) async =>
    await readProfileSelfie(storage: storage) ??
    await fetchProfileSelfieFromServer(storage: storage);

/// Decoded selfie, or null when there is none — before enrollment, or for a
/// worker who enrolled before this was stored. Callers fall back to initials.
Future<Uint8List?> readProfileSelfie({
  FlutterSecureStorage storage = const FlutterSecureStorage(),
}) async {
  try {
    final b64 = await storage.read(key: profileSelfieKey);
    if (b64 == null || b64.isEmpty) return null;
    return base64Decode(b64);
  } on Exception catch (e) {
    // Unreadable or corrupt — the avatar falls back to initials rather than
    // taking the whole screen down with it.
    debugPrint('profile selfie unreadable: $e');
    return null;
  }
}
