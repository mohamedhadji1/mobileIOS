import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'dart:io';

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

  factory ReVerifyTask.fromJson(Map<String, dynamic> json) {
    return ReVerifyTask(
      id: json['id'] as String,
      reason: json['reason'] as String,
      deadlineAt: DateTime.parse(json['deadline_at'] as String),
      status: json['status'] as String,
      flaggedDocuments: List<String>.from(json['flagged_documents'] as List? ?? []),
      result: json['result'] as String?,
    );
  }
}

class ReVerifyService {
  ReVerifyService({
    String? apiBase,
    this.storage = const FlutterSecureStorage(),
  }) : _apiBase = apiBase ?? 'https://api.cypurge.local';

  final String _apiBase;
  final FlutterSecureStorage storage;

  Future<String?> _getToken() => storage.read(key: 'auth_token');

  Future<List<ReVerifyTask>> fetchPendingTasks() async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final res = await HttpClient().getUrl(
      Uri.parse('$_apiBase/api/workers/me/re-verify-tasks'),
    ).then((req) {
      req.headers.set('Authorization', 'Bearer $token');
      return req.close();
    });

    if (res.statusCode != 200) throw Exception('Failed to fetch re-verify tasks');

    final body = await res.transform(utf8.decoder).join();
    final json = jsonDecode(body) as Map<String, dynamic>;
    final tasks = (json['tasks'] as List).map((t) => ReVerifyTask.fromJson(t as Map<String, dynamic>)).toList();
    return tasks;
  }

  Future<Map<String, dynamic>> submitReVerify({
    required String requestId,
    required String selfieBase64,
  }) async {
    final token = await _getToken();
    if (token == null) throw Exception('Not authenticated');

    final req = await HttpClient().postUrl(
      Uri.parse('$_apiBase/api/workers/me/re-verify-submit'),
    );
    req.headers.set('Authorization', 'Bearer $token');
    req.headers.set('Content-Type', 'application/json');

    req.write(jsonEncode({
      'request_id': requestId,
      'biometric_blob': selfieBase64,
    }));

    final res = await req.close();
    final body = await res.transform(utf8.decoder).join();
    final json = jsonDecode(body) as Map<String, dynamic>;

    if (res.statusCode != 200) throw Exception(json['error'] ?? 'Submission failed');

    return json;
  }
}
