import 'dart:async';

import '../utils/document_debug_report.dart';
import 'cypurge_grpc_service.dart';

/// The ML gateway's upload buttons (VerifyDocumentUpload.expected_type), keyed
/// by the doc_type we upload under. Back sides have no entry: they are checked
/// together with their front, never alone.
const _expectedTypes = {
  'PASSPORT': 'passport',
  'NATIONAL_ID': 'national_id',
  'DRIVING_LICENSE': 'driving_licence',
  'WORK_PERMIT': 'work_permit',
  'VISA': 'visa',
  'CV': 'cv',
  'QUALIFICATION_CERT': 'diploma',
  // The education licence is a trade certificate to the gateway.
  'LICENSE': 'certificate',
  // ponytail: the gateway has no "other document" button; certificate is the
  // closest, so anything that is not a certificate is refused. Needs a new
  // gateway type if HR wants arbitrary files.
  'DOCUMENT': 'certificate',
};

/// The upload-check type for [docType], or null for a back side.
String? expectedTypeFor(String docType) => _expectedTypes[docType];

bool isTwoSided(String expectedType) =>
    expectedType == 'national_id' || expectedType == 'driving_licence';

/// The documents that carry the holder's photo, so a selfie sent with their
/// check is compared with it (ID photo vs selfie).
bool carriesPortrait(String expectedType) =>
    expectedType == 'passport' || isTwoSided(expectedType);

/// The backend refuses a larger selfie outright (MaxCheckSelfieBytes, 5 MB),
/// which would fail the whole document check; past it, leave the selfie out.
const maxCheckSelfieBytes = 5 << 20;

/// The selfie to send with a check of [expectedType], or null when it has no
/// photo to compare or the selfie is missing or too large.
List<int>? selfieFor(String expectedType, List<int>? selfie) =>
    carriesPortrait(expectedType) &&
            selfie != null &&
            selfie.isNotEmpty &&
            selfie.length <= maxCheckSelfieBytes
        ? selfie
        : null;

const _labels = {
  'passport': 'passport',
  'national_id': 'national ID card',
  'driving_licence': 'driving licence',
  'work_permit': 'work permit',
  'visa': 'visa',
  'cv': 'CV',
  'diploma': 'diploma',
  'certificate': 'certificate',
};

/// The worker-facing sentence for a refusal, used when the backend sent none.
/// Mirrors the gateway's own wording (FRONTEND_GUIDE §3.3).
String refusalText(String expected, String status, String detected) {
  final want = _labels[expected] ?? 'document';
  if (status == 'wrong_type' && _labels.containsKey(detected)) {
    return 'This looks like a ${_labels[detected]}, not a $want. '
        'Please upload your $want.';
  }
  if (expected == 'passport') {
    return "We couldn't read the two lines at the bottom of your passport. "
        'Take a clear, flat photo of the whole page, without glare.';
  }
  return "We couldn't recognise this as a $want. "
      'Please upload a clear photo or file of your $want.';
}

/// The worker uploaded the wrong document, or one that cannot be read.
/// [message] is ready to show. An outage is never reported this way.
class DocumentRefused implements Exception {
  const DocumentRefused(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Runs the upload check for an uploaded file and returns its document id.
///
/// Throws [DocumentRefused] when the file is the wrong or an unreadable
/// document; any other failure (service busy, timeout, too many checks) comes
/// out as the gRPC error, so it is never shown as "wrong document".
Future<String> checkUpload(
  CypurgeGrpcService grpc, {
  required String token,
  required String objectKey,
  required String docType,
  String backObjectKey = '',
  List<int>? selfie,
}) async {
  final expected = expectedTypeFor(docType);
  if (expected == null) {
    throw StateError('$docType is checked together with its front side');
  }
  final debug = documentDebugReport
      ? DocumentDebugLog.instance.begin(
          expectedType: expected,
          objectKey: objectKey,
          backObjectKey: backObjectKey,
        )
      : null;
  final clock = Stopwatch()..start();
  final res = await grpc
      .verifyDocumentUpload(
    token: token,
    objectKey: objectKey,
    expectedType: expected,
    backObjectKey: backObjectKey,
    selfie: selfieFor(expected, selfie),
  )
      .onError<Object>((e, stack) {
    debug?.failed(e, clock.elapsedMilliseconds);
    Error.throwWithStackTrace(e, stack);
  });
  if (debug != null) {
    debug.answered(res, clock.elapsedMilliseconds);
    unawaited(DocumentDebugLog.instance.followStatus(debug, grpc, token));
  }
  if (!res.accepted) {
    throw DocumentRefused(res.message.trim().isNotEmpty
        ? res.message.trim()
        : refusalText(expected, res.status, res.detectedType));
  }
  return res.documentId;
}
