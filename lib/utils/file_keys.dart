import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'error_logger.dart';
import 'worker_files.dart';

/// Storage keys of the files this phone uploaded, by document id.
///
/// A fallback for an older backend. ListWorkerDocuments now sends a worker
/// `stored_path` for their own files, and that always wins; a backend from
/// before that left it empty, and a key cannot be rebuilt from a document id
/// (the id is a hash of the key). Every upload gets its key back, so the app
/// keeps it here, and with it DisplayDocument can still show the worker their
/// own file on such a backend.
class FileKeyStore {
  FileKeyStore._();

  static const storageKey = 'worker_file_keys';

  /// Oldest entries drop off past this; a worker uploads a handful of files.
  static const maxEntries = 200;

  static const _storage = FlutterSecureStorage();

  /// Remembers [objectKey] for [documentId]. Never throws: losing a key only
  /// costs the preview, and must not fail the upload that just succeeded.
  static Future<void> remember({
    required String documentId,
    required String objectKey,
  }) async {
    if (documentId.isEmpty || objectKey.isEmpty) return;
    try {
      final keys = {...await all()}
        ..remove(documentId)
        ..[documentId] = objectKey;
      final kept = keys.length <= maxEntries
          ? keys
          : Map.fromEntries(keys.entries.skip(keys.length - maxEntries));
      await _storage.write(key: storageKey, value: jsonEncode(kept));
    } on Exception catch (e, stack) {
      ErrorLogger.log('FileKeyStore.remember', e, stack);
    }
  }

  /// Every remembered key, oldest first. Empty when nothing is stored or the
  /// stored value is unreadable.
  static Future<Map<String, String>> all() async {
    try {
      final raw = await _storage.read(key: storageKey);
      if (raw == null || raw.isEmpty) return const {};
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return const {};
      return {
        for (final e in decoded.entries)
          if (e.value is String) e.key.toString(): e.value as String,
      };
    } on Exception catch (e, stack) {
      ErrorLogger.log('FileKeyStore.all', e, stack);
      return const {};
    }
  }
}

/// [files] with the keys this phone remembered filled in where the server
/// left `storedPath` empty (an older backend). A key the server sent is kept.
///
/// Only ids the server just listed for the signed-in worker are looked up, and
/// an id is a hash of its key, so a remembered key is only ever used for that
/// worker's own file — never a previous worker's on a shared phone. (A current
/// backend also refuses DisplayDocument for another worker's file.)
List<WorkerFile> withRememberedKeys(
    List<WorkerFile> files, Map<String, String> keys) {
  return List.unmodifiable([
    for (final f in files)
      f.storedPath.isEmpty && (keys[f.id] ?? '').isNotEmpty
          ? f.withStoredPath(keys[f.id]!)
          : f,
  ]);
}
