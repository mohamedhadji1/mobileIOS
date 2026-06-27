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

  /// Step 5 (Security / Audit):
  /// Downloads the raw, encrypted ciphertext from storage directly (without decrypting).
  $grpc.ResponseFuture<$0.DownloadEncryptedResponse> downloadEncrypted(
    $0.DownloadEncryptedRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$downloadEncrypted, request, options: options);
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
  static final _$downloadEncrypted = $grpc.ClientMethod<
          $0.DownloadEncryptedRequest, $0.DownloadEncryptedResponse>(
      '/document.v1.DocumentService/DownloadEncrypted',
      ($0.DownloadEncryptedRequest value) => value.writeToBuffer(),
      $0.DownloadEncryptedResponse.fromBuffer);
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
    $addMethod($grpc.ServiceMethod<$0.DownloadEncryptedRequest,
            $0.DownloadEncryptedResponse>(
        'DownloadEncrypted',
        downloadEncrypted_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DownloadEncryptedRequest.fromBuffer(value),
        ($0.DownloadEncryptedResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.DownloadEncryptedResponse> downloadEncrypted_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DownloadEncryptedRequest> $request) async {
    return downloadEncrypted($call, await $request);
  }

  $async.Future<$0.DownloadEncryptedResponse> downloadEncrypted(
      $grpc.ServiceCall call, $0.DownloadEncryptedRequest request);
}
