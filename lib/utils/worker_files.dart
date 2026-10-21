import 'dart:io' show HttpException;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../config/constants.dart';
import '../generated/document/v1/document.pb.dart';
import '../services/cypurge_grpc_service.dart';
import '../services/enrollment_service.dart';
import '../theme/app_widgets.dart' show WTTagKind;
import 'file_keys.dart';

/// One file the worker has on record, as DocumentService.ListWorkerDocuments
/// returns it (the caller's own documents; REPLACED ones are left out).
@immutable
class WorkerFile {
  const WorkerFile({
    required this.id,
    required this.docType,
    required this.status,
    this.uploadedAt,
    this.expiresOn,
    this.reviewMessage = '',
    this.storedPath = '',
  });

  factory WorkerFile.fromProto(TenantDocument d) => WorkerFile(
        id: d.id,
        docType: d.docType,
        status: d.status,
        uploadedAt: d.uploadedAt.trim().isEmpty
            ? null
            : DateTime.tryParse(d.uploadedAt.trim())?.toLocal(),
        expiresOn: d.expiryDate.trim().isEmpty
            ? null
            : DateTime.tryParse(d.expiryDate.trim()),
        reviewMessage: d.reviewMessage.trim(),
        storedPath: d.storedPath.trim(),
      );

  final String id;

  /// Wire value: 'PASSPORT', 'National ID (Back)', 'CV'…
  final String docType;

  /// Wire value: 'VERIFIED', 'UPLOAD_EXPIRED'…
  final String status;

  /// TenantDocument.uploaded_at. Null when the server sends none (unknown, or
  /// an older backend).
  final DateTime? uploadedAt;

  /// Expiry date read from the document, when it has one.
  final DateTime? expiresOn;

  /// What HR told the worker about this file (re-upload instructions, the
  /// rejection's sentence). Never the staff reason.
  final String reviewMessage;

  /// The file's object key: the server's stored_path, else the one this phone
  /// remembered at upload (an older backend withholds it from a worker; see
  /// withRememberedKeys). Empty when neither has it: no preview then.
  final String storedPath;

  String get typeLabel => documentTypeLabel(docType);
  FileStatus get statusInfo => fileStatusFor(status);

  WorkerFile withStoredPath(String path) => WorkerFile(
        id: id,
        docType: docType,
        status: status,
        uploadedAt: uploadedAt,
        expiresOn: expiresOn,
        reviewMessage: reviewMessage,
        storedPath: path,
      );
}

/// Plain-words names, keyed by [_typeKey]. Titles match the upload screens so a
/// worker sees the same name for a document everywhere.
const _typeLabels = {
  'passport': 'Passport',
  'national_id': 'National ID (Front)',
  'national_id_front': 'National ID (Front)',
  'id': 'National ID (Front)',
  'id_front': 'National ID (Front)',
  'national_id_back': 'National ID (Back)',
  'id_back': 'National ID (Back)',
  'driving_license': "Driver's License (Front)",
  'driving_licence': "Driver's License (Front)",
  'driving_license_front': "Driver's License (Front)",
  'license_front': "Driver's License (Front)",
  'driving_license_back': "Driver's License (Back)",
  'driving_licence_back': "Driver's License (Back)",
  'license_back': "Driver's License (Back)",
  'work_permit': 'Work Permit',
  'visa': 'Visa',
  'qualification_cert': 'Diploma or certificate',
  'diploma': 'Diploma',
  'certificate': 'Certificate',
  'license': 'Education License',
  'education_license': 'Education License',
  'cv': 'CV',
  'document': 'Other Supporting Document',
  'other_document': 'Other Supporting Document',
};

/// 'National ID (Back)' -> 'national_id_back', 'PASSPORT' -> 'passport'.
String _typeKey(String raw) => raw
    .trim()
    .toLowerCase()
    .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
    .replaceAll(RegExp(r'^_+|_+$'), '');

/// 'lease_agreement' -> 'Lease agreement'; '' -> [empty].
String _sentence(String key, String empty) {
  if (key.isEmpty) return empty;
  final words = key.replaceAll('_', ' ');
  return words[0].toUpperCase() + words.substring(1);
}

/// The document type in plain words. An unknown wire value is still shown,
/// tidied ('LEASE_AGREEMENT' -> 'Lease agreement'), never dropped.
String documentTypeLabel(String raw) {
  final key = _typeKey(raw);
  return _typeLabels[key] ?? _sentence(key, 'Document');
}

/// The one icon per document type, used by every screen that lists documents
/// (Docs tab, Your files, enrollment upload, re-verification), so a worker
/// sees the same picture for a passport wherever it appears. Accepts a wire
/// value ('PASSPORT'), a step id ('license_front') or a display title
/// ("Driver's License (Front)").
IconData documentTypeIcon(String raw) {
  final key = _typeKey(raw);
  // The passport booklet, not an aeroplane: this is a document, not travel.
  if (key.contains('passport')) return Icons.menu_book_rounded;
  if (key == 'cv') return Icons.description_rounded;
  if (key == 'visa') return Icons.approval_rounded;
  if (key == 'work_permit') return Icons.work_rounded;
  if (key.contains('driving') ||
      key.contains('driver') ||
      key.startsWith('license_')) {
    return Icons.directions_car_rounded;
  }
  if (key == 'id' ||
      key.contains('national_id') ||
      key.startsWith('id_') ||
      key.contains('identity')) {
    return Icons.badge_rounded;
  }
  if (key.contains('license') ||
      key.contains('diploma') ||
      key.contains('cert')) {
    return Icons.school_rounded;
  }
  return Icons.insert_drive_file_rounded;
}

/// How a status reads to the worker: words, colour and icon together, never
/// colour alone.
@immutable
class FileStatus {
  const FileStatus(this.label, this.description, this.kind, this.icon);

  final String label;
  final String description;
  final WTTagKind kind;
  final IconData icon;
}

/// UPLOAD_EXPIRED does not mean the file is gone (older uploads keep theirs),
/// so nothing here hides a file or its Open action.
FileStatus fileStatusFor(String status) {
  switch (status.trim().toUpperCase()) {
    case 'VERIFIED':
      return const FileStatus('Verified', 'Checked and accepted.',
          WTTagKind.green, Icons.verified_rounded);
    case 'NEEDS_REVIEW':
      return const FileStatus('In review', 'HR is checking this file.',
          WTTagKind.amber, Icons.hourglass_top_rounded);
    case 'AWAITING_CHECK':
    case 'PENDING_OCR':
    case 'PROCESSING':
      return const FileStatus('Checking', 'We are checking this file.',
          WTTagKind.blue, Icons.autorenew_rounded);
    case 'REUPLOAD_REQUESTED':
      return const FileStatus('Upload again', 'HR asked for a new copy.',
          WTTagKind.amber, Icons.refresh_rounded);
    case 'UPLOAD_EXPIRED':
      return const FileStatus(
          'Not checked',
          'It was not checked in time. Send it again if HR asks.',
          WTTagKind.amber,
          Icons.schedule_rounded);
    case 'AWAITING_UPLOAD':
      return const FileStatus('Not received', 'The upload did not finish.',
          WTTagKind.neutral, Icons.cloud_off_rounded);
    case 'REFUSED':
      return const FileStatus(
          'Not accepted',
          'It looked like the wrong document, or it could not be read.',
          WTTagKind.red,
          Icons.block_rounded);
    case 'REJECTED':
      return const FileStatus('Rejected', 'This document was not accepted.',
          WTTagKind.red, Icons.cancel_rounded);
  }
  return FileStatus(_sentence(_typeKey(status), 'Unknown'),
      'Status from the server.', WTTagKind.neutral, Icons.help_outline_rounded);
}

/// A file's bytes, fetched for the preview.
typedef WorkerFileBytes = ({Uint8List bytes, bool isPdf});

/// Reads the bytes of a file for the preview ([fetchWorkerFile] in the app).
typedef WorkerFileFetcher = Future<WorkerFileBytes> Function(WorkerFile file);

bool looksLikePdf(Uint8List bytes) =>
    bytes.length >= 4 &&
    bytes[0] == 0x25 && // %
    bytes[1] == 0x50 && // P
    bytes[2] == 0x44 && // D
    bytes[3] == 0x46; // F

/// Whether a fetched file is a PDF: DisplayDocumentResponse.content_type when
/// it says PDF or image, else the file's own signature (an older backend sends
/// no type; one taken from a stored header may be generic).
bool isPdfFile(String contentType, Uint8List bytes) {
  final type = contentType.split(';').first.trim().toLowerCase();
  if (type == 'application/pdf') return true;
  if (type.startsWith('image/')) return false;
  return looksLikePdf(bytes);
}

/// One document type and every copy of it on record.
@immutable
class WorkerFileGroup {
  const WorkerFileGroup(this.latest, this.earlier);

  /// The newest copy: the one that counts now.
  final WorkerFile latest;

  /// Older copies of the same type, newest first. Folded away, never dropped:
  /// they are still on record and HR can still see them.
  final List<WorkerFile> earlier;
}

/// Groups [files] by document type, keeping the server's newest-first order,
/// so seven uploads of one CV read as one CV with six earlier copies. Types
/// are matched by their plain-words name, so 'PASSPORT' and 'passport' are
/// one document.
List<WorkerFileGroup> groupWorkerFiles(List<WorkerFile> files) {
  final byType = <String, List<WorkerFile>>{};
  for (final file in files) {
    byType.putIfAbsent(file.typeLabel, () => []).add(file);
  }
  return List.unmodifiable([
    for (final copies in byType.values)
      WorkerFileGroup(copies.first, List.unmodifiable(copies.skip(1))),
  ]);
}

/// The signed-in worker's own files, newest first (the server's order).
Future<List<WorkerFile>> loadWorkerFiles() async {
  const storage = FlutterSecureStorage();
  final token = await EnrollmentService().getDocumentBearerToken();
  if (token == null || token.isEmpty) {
    throw const AuthRequiredException(
        'Your session has expired. Please sign in again.');
  }
  final tenantId = await storage.read(key: 'tenant_id') ?? '';
  final grpc = CypurgeGrpcService()..init(useGateway: true);
  final res = await grpc.listWorkerDocuments(token: token, tenantId: tenantId);
  return withRememberedKeys(res.documents.map(WorkerFile.fromProto).toList(),
      await FileKeyStore.all());
}

/// Reads one of the worker's own files for the preview: DisplayDocument for a
/// short-lived link, then a GET. The link names the storage host the phone
/// cannot resolve, so — exactly as for uploads — the request goes to the node
/// with the original Host header kept, which the link's signature covers.
Future<WorkerFileBytes> fetchWorkerFile(WorkerFile file) async {
  if (file.storedPath.isEmpty) {
    throw StateError('No storage key for document ${file.id}.');
  }
  final token = await EnrollmentService().getDocumentBearerToken();
  if (token == null || token.isEmpty) {
    throw const AuthRequiredException(
        'Your session has expired. Please sign in again.');
  }
  final grpc = CypurgeGrpcService()..init(useGateway: true);
  final res =
      await grpc.displayDocument(token: token, objectKey: file.storedPath);
  final link = Uri.parse(res.displayUrl);
  final reachable = Uri.parse(
      res.displayUrl.replaceAll('minio.workertrust.local', AppConfig.host));
  final got = await http.get(reachable,
      headers: {'Host': link.authority}).timeout(const Duration(seconds: 30));
  if (got.statusCode != 200) {
    throw HttpException('Download failed (${got.statusCode})', uri: reachable);
  }
  final bytes = got.bodyBytes;
  return (bytes: bytes, isPdf: isPdfFile(res.contentType, bytes));
}
