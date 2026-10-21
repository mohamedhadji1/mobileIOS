import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// The reviewer's message behind a block, kept on this device.
///
/// When an analyst blocks a worker the backend pushes `ENROLLMENT_REJECTED`
/// with the analyst's message in `cypurge::data.reason`. That push is the only
/// place the reason ever reaches the phone — `GetRiskAssessment` carries no
/// justification — so it is saved the moment the push arrives and read back by
/// the suspended screen, however the worker gets there: tapping the
/// notification, or simply opening the app a day later.

/// What a notification means for the stored note.
enum DecisionNoteAction { save, clear, ignore }

const _blockTypes = {'ENROLLMENT_REJECTED', 'ACCOUNT_SUSPENDED'};
const _clearTypes = {'ENROLLMENT_APPROVED', 'ACCOUNT_REINSTATED'};

String _colour(Map<String, dynamic> data) =>
    '${data['colour'] ?? ''}'.trim().toUpperCase();

/// True for a notification that tells the worker they are blocked.
bool isBlockDecision(String? type, Map<String, dynamic> data) {
  final t = (type ?? '').toUpperCase();
  return _blockTypes.contains(t) ||
      (t == 'TRUST_STATUS_CHANGED' && _colour(data) == 'RED');
}

/// Save on a block that carries a reason; clear on a block without one (an
/// older reason must not explain a newer decision) and on any reinstatement.
DecisionNoteAction decisionNoteAction(String? type, Map<String, dynamic> data) {
  final t = (type ?? '').toUpperCase();
  if (isBlockDecision(type, data)) {
    return '${data['reason'] ?? ''}'.trim().isEmpty
        ? DecisionNoteAction.clear
        : DecisionNoteAction.save;
  }
  final colour = _colour(data);
  if (_clearTypes.contains(t) ||
      (t == 'TRUST_STATUS_CHANGED' &&
          (colour == 'GREEN' || colour == 'YELLOW'))) {
    return DecisionNoteAction.clear;
  }
  return DecisionNoteAction.ignore;
}

class DecisionNote {
  const DecisionNote({required this.reason, this.at});
  final String reason;
  final DateTime? at;
}

class DecisionNoteStore {
  const DecisionNoteStore([this._storage = const FlutterSecureStorage()]);

  static const _key = 'decision_note';
  final FlutterSecureStorage _storage;

  /// Never throws: this runs inside notification dispatch, where a storage
  /// failure must not cost the worker the notification itself.
  Future<void> apply(String? type, Map<String, dynamic> data) async {
    try {
      switch (decisionNoteAction(type, data)) {
        case DecisionNoteAction.save:
          await _storage.write(
            key: _key,
            value: jsonEncode({
              'reason': '${data['reason']}'.trim(),
              'at': DateTime.now().toIso8601String(),
            }),
          );
        case DecisionNoteAction.clear:
          await _storage.delete(key: _key);
        case DecisionNoteAction.ignore:
          break;
      }
    } on Exception {
      // Storage unavailable — the push still shows; the screen falls back to
      // its generic wording.
    }
  }

  Future<DecisionNote?> read() async {
    try {
      final raw = await _storage.read(key: _key);
      if (raw == null || raw.isEmpty) return null;
      final m = jsonDecode(raw);
      if (m is! Map || '${m['reason'] ?? ''}'.trim().isEmpty) return null;
      return DecisionNote(
        reason: '${m['reason']}'.trim(),
        at: DateTime.tryParse('${m['at'] ?? ''}'),
      );
    } on Exception {
      return null;
    }
  }
}
