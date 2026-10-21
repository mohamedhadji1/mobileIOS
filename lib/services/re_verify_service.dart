import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../utils/resubmission_message.dart';
import 'cypurge_grpc_service.dart';
import 'enrollment_service.dart';

/// Thrown when the worker has no usable session. Distinct from a transport
/// failure so callers can tell "logged out" apart from "backend unreachable"
/// instead of collapsing both into a generic error.
class ReVerifyAuthException implements Exception {
  const ReVerifyAuthException([this.message = 'Not authenticated']);
  final String message;
  @override
  String toString() => message;
}

/// Thrown for the parts of re-verification the backend does not implement yet.
class ReVerifyUnsupportedException implements Exception {
  const ReVerifyUnsupportedException(this.message);
  final String message;
  @override
  String toString() => message;
}

class ReVerifyTask {
  final String id;
  final String reason;
  final DateTime deadlineAt;
  final String status; // PENDING | COMPLETED
  final List<String> flaggedDocuments;
  final String? result; // PASS | FAIL | null

  ReVerifyTask({
    required this.id,
    required this.reason,
    required this.deadlineAt,
    required this.status,
    required this.flaggedDocuments,
    this.result,
  });
}

/// Worker-facing view of `case.v1.CaseService` re-verification.
///
/// This previously spoke REST to `https://api.cypurge.local` — a host that is
/// not the deployed gateway — using secure-storage key `auth_token`, which
/// nothing in the app has ever written (the app writes `access_token`). Both
/// calls therefore always threw `Not authenticated`, so re-verification had
/// never worked. It now goes through the same gRPC gateway as every other
/// service.
class ReVerifyService {
  ReVerifyService({
    CypurgeGrpcService? grpc,
    EnrollmentService? enrollment,
    this.storage = const FlutterSecureStorage(),
  })  : _grpc = grpc ?? CypurgeGrpcService(),
        _enrollment = enrollment ?? EnrollmentService();

  final CypurgeGrpcService _grpc;
  final EnrollmentService _enrollment;
  final FlutterSecureStorage storage;

  /// Re-verification requests for the signed-in worker.
  ///
  /// `ListReverificationRequests` is scoped to a TENANT — the proto carries no
  /// worker_id filter — so the tenant's rows are narrowed to this worker here.
  /// That is presentation, not authorization: the RPC still returns other
  /// workers' rows over the wire, which is recorded as a backend authz gap in
  /// BACKEND_HANDOFF_GETCHALLENGE.md.
  Future<List<ReVerifyTask>> fetchPendingTasks() async {
    final token = await _enrollment.getValidAccessToken();
    if (token == null) throw const ReVerifyAuthException();

    final workerId = _enrollment.workerIdFromToken(token) ??
        await storage.read(key: 'worker_id');
    if (workerId == null || workerId.isEmpty) {
      throw const ReVerifyAuthException('No worker identity on this device');
    }
    final tenantId = await storage.read(key: 'tenant_id');
    if (tenantId == null || tenantId.isEmpty) {
      throw const ReVerifyAuthException('No tenant on this device');
    }

    _grpc.init(useGateway: true);
    final res = await _grpc.listReverificationRequests(
      token: token,
      tenantId: tenantId,
    );

    return res.items
        .where((r) => r.workerId == workerId)
        .map((r) => ReVerifyTask(
              id: r.id,
              reason: r.triggerReason,
              // `deadline` arrives as an RFC-3339 string. A malformed or absent
              // value must not take the whole task list down, so fall back to
              // now (renders as overdue) instead of throwing.
              deadlineAt: DateTime.tryParse(r.deadline) ?? DateTime.now(),
              status: r.status,
              // The request's own list when the backend sends one; else the
              // list the dashboard writes into the reason text (older backend).
              flaggedDocuments: r.flaggedDocuments.isNotEmpty
                  ? List.unmodifiable(r.flaggedDocuments)
                  : parseFlaggedDocuments(r.triggerReason),
            ))
        .toList(growable: false);
  }

  // ponytail: no background polling for requests. The worker hears about a
  // request from the REVERIFICATION_DUE push; the poll it replaced could never
  // work (WORKER has no case:read, and the RPC returns the whole tenant).

  /// Completing a re-verification is NOT implemented backend-side.
  ///
  /// `case.v1.CaseService` exposes only `RequestReverification` (create) plus
  /// the two list RPCs — no handler anywhere in worker-trust-development updates
  /// a `re_verification_requests` row's status. The REST endpoint this used to
  /// call (`/api/workers/me/re-verify-submit`) has no counterpart in the Go
  /// services either.
  ///
  /// Failing loudly and specifically beats POSTing into a host that does not
  /// exist and telling the worker their session expired.
  Future<Map<String, dynamic>> submitReVerify({
    required String requestId,
    required String selfieBase64,
  }) async {
    throw const ReVerifyUnsupportedException(
      'Re-verification submission is not available yet. Your task is recorded — '
      'please contact your compliance officer.',
    );
  }
}
