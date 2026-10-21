// This is a generated file - do not edit.
//
// Generated from document/v1/document.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'document.pb.dart' as $0;

export 'document.pb.dart';

/// DocumentService handles document upload/download via pre-signed URLs.
/// Files are NOT sent through gRPC — clients upload directly to storage (MinIO).
@$pb.GrpcServiceName('document.v1.DocumentService')
class DocumentServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  DocumentServiceClient(super.channel, {super.options, super.interceptors});

  /// Step 1:
  /// Generates a pre-signed URL for uploading a file directly to storage.
  /// The client must use the returned upload_url with HTTP PUT.
  $grpc.ResponseFuture<$0.GenerateUploadURLResponse> generateUploadURL(
    $0.GenerateUploadURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateUploadURL, request, options: options);
  }

  /// Step 3:
  /// Generates a pre-signed URL to download a previously uploaded file.
  $grpc.ResponseFuture<$0.GenerateDownloadURLResponse> generateDownloadURL(
    $0.GenerateDownloadURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateDownloadURL, request, options: options);
  }

  /// Step 4:
  /// Confirms an upload and extracts metadata (ETag) from storage.
  $grpc.ResponseFuture<$0.ConfirmUploadResponse> confirmUpload(
    $0.ConfirmUploadRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$confirmUpload, request, options: options);
  }

  /// Step 6:
  /// Generates a pre-signed URL to display a previously uploaded file inline in a browser.
  $grpc.ResponseFuture<$0.DisplayDocumentResponse> displayDocument(
    $0.DisplayDocumentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$displayDocument, request, options: options);
  }

  /// Deletes a document from database and storage.
  $grpc.ResponseFuture<$0.DeleteDocumentResponse> deleteDocument(
    $0.DeleteDocumentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteDocument, request, options: options);
  }

  /// List documents that are expiring soon
  $grpc.ResponseFuture<$0.ListExpiringDocumentsResponse> listExpiringDocuments(
    $0.ListExpiringDocumentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listExpiringDocuments, request, options: options);
  }

  /// List documents requiring manual reviewer adjudication
  $grpc.ResponseFuture<$0.ListDocumentReviewQueueResponse>
      listDocumentReviewQueue(
    $0.ListDocumentReviewQueueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDocumentReviewQueue, request,
        options: options);
  }

  /// List all documents for a tenant with their latest verification metadata
  /// (used to populate the workers table doc columns).
  $grpc.ResponseFuture<$0.ListDocumentsByTenantResponse> listDocumentsByTenant(
    $0.ListDocumentsByTenantRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDocumentsByTenant, request, options: options);
  }

  /// List a single worker's documents. A WORKER may read only their own (the
  /// worker_id claim); staff with document:view may pass any worker_id in-tenant.
  $grpc.ResponseFuture<$0.ListWorkerDocumentsResponse> listWorkerDocuments(
    $0.ListWorkerDocumentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listWorkerDocuments, request, options: options);
  }

  /// Step 3 (replaces ConfirmUpload for every enrolment document):
  /// Checks an uploaded file against the upload button (expected_type) and
  /// verifies it in the same call (ML gateway POST /documents/verify). Blocks
  /// until the answer is known — allow a deadline of at least 130 seconds.
  /// accepted=false means the user must upload the right document; show message.
  /// An upload that is never checked is not processed and expires.
  $grpc.ResponseFuture<$0.VerifyDocumentUploadResponse> verifyDocumentUpload(
    $0.VerifyDocumentUploadRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifyDocumentUpload, request, options: options);
  }

  /// Internal (biometric service → document service; not exposed by the gateway):
  /// the portrait cropped from the worker's latest accepted identity document,
  /// used as the reference face of the liveness check. NOT_FOUND when none.
  $grpc.ResponseFuture<$0.GetIdentityPortraitResponse> getIdentityPortrait(
    $0.GetIdentityPortraitRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getIdentityPortrait, request, options: options);
  }

  /// Internal (worker service → document service; not exposed by the gateway):
  /// the ML gateway's M7 reading of a supporting document (CV, diploma,
  /// certificate, visa, work permit) — the one its upload check stored, or a
  /// fresh one for a document uploaded before the check existed.
  /// FAILED_PRECONDITION when the document has not passed the upload check.
  $grpc.ResponseFuture<$0.GetDocumentExtractionResponse> getDocumentExtraction(
    $0.GetDocumentExtractionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDocumentExtraction, request, options: options);
  }

  /// HR's decision on one document (permission document:review). Allowed:
  /// NEEDS_REVIEW -> ACCEPT (VERIFIED) | REUPLOAD (REUPLOAD_REQUESTED) | REJECT
  /// (REJECTED), REJECTED -> ACCEPT (overturns the ML), and VERIFIED -> REUPLOAD
  /// for a clearer or newer copy, which also takes an identity document out of
  /// the risk input until the replacement is verified. Anything else is
  /// FAILED_PRECONDITION; repeating the decision a document already carries
  /// succeeds and changes nothing. A decision on an ID card's front applies to
  /// its back; a back is reviewed directly only when its front is gone.
  $grpc.ResponseFuture<$0.ReviewDocumentResponse> reviewDocument(
    $0.ReviewDocumentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$reviewDocument, request, options: options);
  }

  /// HR console (via the gateway; never the mobile app): the fields printed on an
  /// identity card that carries no MRZ (Tunisian CIN, most driving licences),
  /// read by OCR from the front and the back during the upload check. They are
  /// NOT verified — show them for a human to confirm, and never approve a worker
  /// on them. NOT_FOUND when the card had none.
  $grpc.ResponseFuture<$0.GetDocumentIdentityFieldsResponse>
      getDocumentIdentityFields(
    $0.GetDocumentIdentityFieldsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDocumentIdentityFields, request,
        options: options);
  }

  // method descriptors

  static final _$generateUploadURL = $grpc.ClientMethod<
          $0.GenerateUploadURLRequest, $0.GenerateUploadURLResponse>(
      '/document.v1.DocumentService/GenerateUploadURL',
      ($0.GenerateUploadURLRequest value) => value.writeToBuffer(),
      $0.GenerateUploadURLResponse.fromBuffer);
  static final _$generateDownloadURL = $grpc.ClientMethod<
          $0.GenerateDownloadURLRequest, $0.GenerateDownloadURLResponse>(
      '/document.v1.DocumentService/GenerateDownloadURL',
      ($0.GenerateDownloadURLRequest value) => value.writeToBuffer(),
      $0.GenerateDownloadURLResponse.fromBuffer);
  static final _$confirmUpload =
      $grpc.ClientMethod<$0.ConfirmUploadRequest, $0.ConfirmUploadResponse>(
          '/document.v1.DocumentService/ConfirmUpload',
          ($0.ConfirmUploadRequest value) => value.writeToBuffer(),
          $0.ConfirmUploadResponse.fromBuffer);
  static final _$displayDocument =
      $grpc.ClientMethod<$0.DisplayDocumentRequest, $0.DisplayDocumentResponse>(
          '/document.v1.DocumentService/DisplayDocument',
          ($0.DisplayDocumentRequest value) => value.writeToBuffer(),
          $0.DisplayDocumentResponse.fromBuffer);
  static final _$deleteDocument =
      $grpc.ClientMethod<$0.DeleteDocumentRequest, $0.DeleteDocumentResponse>(
          '/document.v1.DocumentService/DeleteDocument',
          ($0.DeleteDocumentRequest value) => value.writeToBuffer(),
          $0.DeleteDocumentResponse.fromBuffer);
  static final _$listExpiringDocuments = $grpc.ClientMethod<
          $0.ListExpiringDocumentsRequest, $0.ListExpiringDocumentsResponse>(
      '/document.v1.DocumentService/ListExpiringDocuments',
      ($0.ListExpiringDocumentsRequest value) => value.writeToBuffer(),
      $0.ListExpiringDocumentsResponse.fromBuffer);
  static final _$listDocumentReviewQueue = $grpc.ClientMethod<
          $0.ListDocumentReviewQueueRequest,
          $0.ListDocumentReviewQueueResponse>(
      '/document.v1.DocumentService/ListDocumentReviewQueue',
      ($0.ListDocumentReviewQueueRequest value) => value.writeToBuffer(),
      $0.ListDocumentReviewQueueResponse.fromBuffer);
  static final _$listDocumentsByTenant = $grpc.ClientMethod<
          $0.ListDocumentsByTenantRequest, $0.ListDocumentsByTenantResponse>(
      '/document.v1.DocumentService/ListDocumentsByTenant',
      ($0.ListDocumentsByTenantRequest value) => value.writeToBuffer(),
      $0.ListDocumentsByTenantResponse.fromBuffer);
  static final _$listWorkerDocuments = $grpc.ClientMethod<
          $0.ListWorkerDocumentsRequest, $0.ListWorkerDocumentsResponse>(
      '/document.v1.DocumentService/ListWorkerDocuments',
      ($0.ListWorkerDocumentsRequest value) => value.writeToBuffer(),
      $0.ListWorkerDocumentsResponse.fromBuffer);
  static final _$verifyDocumentUpload = $grpc.ClientMethod<
          $0.VerifyDocumentUploadRequest, $0.VerifyDocumentUploadResponse>(
      '/document.v1.DocumentService/VerifyDocumentUpload',
      ($0.VerifyDocumentUploadRequest value) => value.writeToBuffer(),
      $0.VerifyDocumentUploadResponse.fromBuffer);
  static final _$getIdentityPortrait = $grpc.ClientMethod<
          $0.GetIdentityPortraitRequest, $0.GetIdentityPortraitResponse>(
      '/document.v1.DocumentService/GetIdentityPortrait',
      ($0.GetIdentityPortraitRequest value) => value.writeToBuffer(),
      $0.GetIdentityPortraitResponse.fromBuffer);
  static final _$getDocumentExtraction = $grpc.ClientMethod<
          $0.GetDocumentExtractionRequest, $0.GetDocumentExtractionResponse>(
      '/document.v1.DocumentService/GetDocumentExtraction',
      ($0.GetDocumentExtractionRequest value) => value.writeToBuffer(),
      $0.GetDocumentExtractionResponse.fromBuffer);
  static final _$reviewDocument =
      $grpc.ClientMethod<$0.ReviewDocumentRequest, $0.ReviewDocumentResponse>(
          '/document.v1.DocumentService/ReviewDocument',
          ($0.ReviewDocumentRequest value) => value.writeToBuffer(),
          $0.ReviewDocumentResponse.fromBuffer);
  static final _$getDocumentIdentityFields = $grpc.ClientMethod<
          $0.GetDocumentIdentityFieldsRequest,
          $0.GetDocumentIdentityFieldsResponse>(
      '/document.v1.DocumentService/GetDocumentIdentityFields',
      ($0.GetDocumentIdentityFieldsRequest value) => value.writeToBuffer(),
      $0.GetDocumentIdentityFieldsResponse.fromBuffer);
}

@$pb.GrpcServiceName('document.v1.DocumentService')
abstract class DocumentServiceBase extends $grpc.Service {
  $core.String get $name => 'document.v1.DocumentService';

  DocumentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GenerateUploadURLRequest,
            $0.GenerateUploadURLResponse>(
        'GenerateUploadURL',
        generateUploadURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateUploadURLRequest.fromBuffer(value),
        ($0.GenerateUploadURLResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateDownloadURLRequest,
            $0.GenerateDownloadURLResponse>(
        'GenerateDownloadURL',
        generateDownloadURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateDownloadURLRequest.fromBuffer(value),
        ($0.GenerateDownloadURLResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ConfirmUploadRequest, $0.ConfirmUploadResponse>(
            'ConfirmUpload',
            confirmUpload_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ConfirmUploadRequest.fromBuffer(value),
            ($0.ConfirmUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DisplayDocumentRequest,
            $0.DisplayDocumentResponse>(
        'DisplayDocument',
        displayDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DisplayDocumentRequest.fromBuffer(value),
        ($0.DisplayDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteDocumentRequest,
            $0.DeleteDocumentResponse>(
        'DeleteDocument',
        deleteDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteDocumentRequest.fromBuffer(value),
        ($0.DeleteDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListExpiringDocumentsRequest,
            $0.ListExpiringDocumentsResponse>(
        'ListExpiringDocuments',
        listExpiringDocuments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListExpiringDocumentsRequest.fromBuffer(value),
        ($0.ListExpiringDocumentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDocumentReviewQueueRequest,
            $0.ListDocumentReviewQueueResponse>(
        'ListDocumentReviewQueue',
        listDocumentReviewQueue_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDocumentReviewQueueRequest.fromBuffer(value),
        ($0.ListDocumentReviewQueueResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDocumentsByTenantRequest,
            $0.ListDocumentsByTenantResponse>(
        'ListDocumentsByTenant',
        listDocumentsByTenant_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDocumentsByTenantRequest.fromBuffer(value),
        ($0.ListDocumentsByTenantResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListWorkerDocumentsRequest,
            $0.ListWorkerDocumentsResponse>(
        'ListWorkerDocuments',
        listWorkerDocuments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListWorkerDocumentsRequest.fromBuffer(value),
        ($0.ListWorkerDocumentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyDocumentUploadRequest,
            $0.VerifyDocumentUploadResponse>(
        'VerifyDocumentUpload',
        verifyDocumentUpload_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyDocumentUploadRequest.fromBuffer(value),
        ($0.VerifyDocumentUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetIdentityPortraitRequest,
            $0.GetIdentityPortraitResponse>(
        'GetIdentityPortrait',
        getIdentityPortrait_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetIdentityPortraitRequest.fromBuffer(value),
        ($0.GetIdentityPortraitResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDocumentExtractionRequest,
            $0.GetDocumentExtractionResponse>(
        'GetDocumentExtraction',
        getDocumentExtraction_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetDocumentExtractionRequest.fromBuffer(value),
        ($0.GetDocumentExtractionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ReviewDocumentRequest,
            $0.ReviewDocumentResponse>(
        'ReviewDocument',
        reviewDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ReviewDocumentRequest.fromBuffer(value),
        ($0.ReviewDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDocumentIdentityFieldsRequest,
            $0.GetDocumentIdentityFieldsResponse>(
        'GetDocumentIdentityFields',
        getDocumentIdentityFields_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetDocumentIdentityFieldsRequest.fromBuffer(value),
        ($0.GetDocumentIdentityFieldsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GenerateUploadURLResponse> generateUploadURL_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GenerateUploadURLRequest> $request) async {
    return generateUploadURL($call, await $request);
  }

  $async.Future<$0.GenerateUploadURLResponse> generateUploadURL(
      $grpc.ServiceCall call, $0.GenerateUploadURLRequest request);

  $async.Future<$0.GenerateDownloadURLResponse> generateDownloadURL_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GenerateDownloadURLRequest> $request) async {
    return generateDownloadURL($call, await $request);
  }

  $async.Future<$0.GenerateDownloadURLResponse> generateDownloadURL(
      $grpc.ServiceCall call, $0.GenerateDownloadURLRequest request);

  $async.Future<$0.ConfirmUploadResponse> confirmUpload_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ConfirmUploadRequest> $request) async {
    return confirmUpload($call, await $request);
  }

  $async.Future<$0.ConfirmUploadResponse> confirmUpload(
      $grpc.ServiceCall call, $0.ConfirmUploadRequest request);

  $async.Future<$0.DisplayDocumentResponse> displayDocument_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DisplayDocumentRequest> $request) async {
    return displayDocument($call, await $request);
  }

  $async.Future<$0.DisplayDocumentResponse> displayDocument(
      $grpc.ServiceCall call, $0.DisplayDocumentRequest request);

  $async.Future<$0.DeleteDocumentResponse> deleteDocument_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteDocumentRequest> $request) async {
    return deleteDocument($call, await $request);
  }

  $async.Future<$0.DeleteDocumentResponse> deleteDocument(
      $grpc.ServiceCall call, $0.DeleteDocumentRequest request);

  $async.Future<$0.ListExpiringDocumentsResponse> listExpiringDocuments_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListExpiringDocumentsRequest> $request) async {
    return listExpiringDocuments($call, await $request);
  }

  $async.Future<$0.ListExpiringDocumentsResponse> listExpiringDocuments(
      $grpc.ServiceCall call, $0.ListExpiringDocumentsRequest request);

  $async.Future<$0.ListDocumentReviewQueueResponse> listDocumentReviewQueue_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDocumentReviewQueueRequest> $request) async {
    return listDocumentReviewQueue($call, await $request);
  }

  $async.Future<$0.ListDocumentReviewQueueResponse> listDocumentReviewQueue(
      $grpc.ServiceCall call, $0.ListDocumentReviewQueueRequest request);

  $async.Future<$0.ListDocumentsByTenantResponse> listDocumentsByTenant_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDocumentsByTenantRequest> $request) async {
    return listDocumentsByTenant($call, await $request);
  }

  $async.Future<$0.ListDocumentsByTenantResponse> listDocumentsByTenant(
      $grpc.ServiceCall call, $0.ListDocumentsByTenantRequest request);

  $async.Future<$0.ListWorkerDocumentsResponse> listWorkerDocuments_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListWorkerDocumentsRequest> $request) async {
    return listWorkerDocuments($call, await $request);
  }

  $async.Future<$0.ListWorkerDocumentsResponse> listWorkerDocuments(
      $grpc.ServiceCall call, $0.ListWorkerDocumentsRequest request);

  $async.Future<$0.VerifyDocumentUploadResponse> verifyDocumentUpload_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.VerifyDocumentUploadRequest> $request) async {
    return verifyDocumentUpload($call, await $request);
  }

  $async.Future<$0.VerifyDocumentUploadResponse> verifyDocumentUpload(
      $grpc.ServiceCall call, $0.VerifyDocumentUploadRequest request);

  $async.Future<$0.GetIdentityPortraitResponse> getIdentityPortrait_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetIdentityPortraitRequest> $request) async {
    return getIdentityPortrait($call, await $request);
  }

  $async.Future<$0.GetIdentityPortraitResponse> getIdentityPortrait(
      $grpc.ServiceCall call, $0.GetIdentityPortraitRequest request);

  $async.Future<$0.GetDocumentExtractionResponse> getDocumentExtraction_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetDocumentExtractionRequest> $request) async {
    return getDocumentExtraction($call, await $request);
  }

  $async.Future<$0.GetDocumentExtractionResponse> getDocumentExtraction(
      $grpc.ServiceCall call, $0.GetDocumentExtractionRequest request);

  $async.Future<$0.ReviewDocumentResponse> reviewDocument_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ReviewDocumentRequest> $request) async {
    return reviewDocument($call, await $request);
  }

  $async.Future<$0.ReviewDocumentResponse> reviewDocument(
      $grpc.ServiceCall call, $0.ReviewDocumentRequest request);

  $async.Future<$0.GetDocumentIdentityFieldsResponse>
      getDocumentIdentityFields_Pre($grpc.ServiceCall $call,
          $async.Future<$0.GetDocumentIdentityFieldsRequest> $request) async {
    return getDocumentIdentityFields($call, await $request);
  }

  $async.Future<$0.GetDocumentIdentityFieldsResponse> getDocumentIdentityFields(
      $grpc.ServiceCall call, $0.GetDocumentIdentityFieldsRequest request);
}
