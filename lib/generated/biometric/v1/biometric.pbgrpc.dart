// This is a generated file - do not edit.
//
// Generated from biometric/v1/biometric.proto.

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

import 'biometric.pb.dart' as $0;

export 'biometric.pb.dart';

@$pb.GrpcServiceName('biometric.v1.BiometricService')
class BiometricServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  BiometricServiceClient(super.channel, {super.options, super.interceptors});

  /// Enroll a new worker's face embedding
  $grpc.ResponseFuture<$0.EnrollFaceResponse> enrollFace(
    $0.EnrollFaceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$enrollFace, request, options: options);
  }

  /// Search for hash collisions against existing workers and blocklist
  $grpc.ResponseFuture<$0.SearchCollisionsResponse> searchCollisions(
    $0.SearchCollisionsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$searchCollisions, request, options: options);
  }

  /// Permanently block a face embedding hash
  $grpc.ResponseFuture<$0.BlockFaceResponse> blockFace(
    $0.BlockFaceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$blockFace, request, options: options);
  }

  /// Remove a block from a face embedding hash
  $grpc.ResponseFuture<$0.UnblockFaceResponse> unblockFace(
    $0.UnblockFaceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$unblockFace, request, options: options);
  }

  /// Get embedding hash for a worker
  $grpc.ResponseFuture<$0.GetWorkerEmbeddingResponse> getWorkerEmbedding(
    $0.GetWorkerEmbeddingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWorkerEmbedding, request, options: options);
  }

  /// Get a random liveness challenge
  $grpc.ResponseFuture<$0.GetChallengeResponse> getChallenge(
    $0.GetChallengeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getChallenge, request, options: options);
  }

  /// Interactive sequential liveness. Client streams JPEG frames (~6 fps); server
  /// streams step transitions and a final combined result. Bridged to M5 /m5/stream.
  $grpc.ResponseStream<$0.LivenessServerMsg> streamLiveness(
    $async.Stream<$0.LivenessClientMsg> request, {
    $grpc.CallOptions? options,
  }) {
    return $createStreamingCall(_$streamLiveness, request, options: options);
  }

  /// Get biometrics that require manual analyst review
  $grpc.ResponseFuture<$0.ListBiometricReviewQueueResponse>
      listBiometricReviewQueue(
    $0.ListBiometricReviewQueueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listBiometricReviewQueue, request,
        options: options);
  }

  /// List biometric results for a tenant (used to populate the workers table
  /// face-match column).
  $grpc.ResponseFuture<$0.ListBiometricResultsResponse> listBiometricResults(
    $0.ListBiometricResultsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listBiometricResults, request, options: options);
  }

  /// Get a short-lived presigned GET URL for the selfie frame retained as
  /// enrollment-review case evidence.
  $grpc.ResponseFuture<$0.GetBiometricEvidenceURLResponse>
      getBiometricEvidenceURL(
    $0.GetBiometricEvidenceURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBiometricEvidenceURL, request,
        options: options);
  }

  /// Delete the retained selfie frame once its review case is closed.
  $grpc.ResponseFuture<$0.DeleteBiometricEvidenceResponse>
      deleteBiometricEvidence(
    $0.DeleteBiometricEvidenceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteBiometricEvidence, request,
        options: options);
  }

  // method descriptors

  static final _$enrollFace =
      $grpc.ClientMethod<$0.EnrollFaceRequest, $0.EnrollFaceResponse>(
          '/biometric.v1.BiometricService/EnrollFace',
          ($0.EnrollFaceRequest value) => value.writeToBuffer(),
          $0.EnrollFaceResponse.fromBuffer);
  static final _$searchCollisions = $grpc.ClientMethod<
          $0.SearchCollisionsRequest, $0.SearchCollisionsResponse>(
      '/biometric.v1.BiometricService/SearchCollisions',
      ($0.SearchCollisionsRequest value) => value.writeToBuffer(),
      $0.SearchCollisionsResponse.fromBuffer);
  static final _$blockFace =
      $grpc.ClientMethod<$0.BlockFaceRequest, $0.BlockFaceResponse>(
          '/biometric.v1.BiometricService/BlockFace',
          ($0.BlockFaceRequest value) => value.writeToBuffer(),
          $0.BlockFaceResponse.fromBuffer);
  static final _$unblockFace =
      $grpc.ClientMethod<$0.UnblockFaceRequest, $0.UnblockFaceResponse>(
          '/biometric.v1.BiometricService/UnblockFace',
          ($0.UnblockFaceRequest value) => value.writeToBuffer(),
          $0.UnblockFaceResponse.fromBuffer);
  static final _$getWorkerEmbedding = $grpc.ClientMethod<
          $0.GetWorkerEmbeddingRequest, $0.GetWorkerEmbeddingResponse>(
      '/biometric.v1.BiometricService/GetWorkerEmbedding',
      ($0.GetWorkerEmbeddingRequest value) => value.writeToBuffer(),
      $0.GetWorkerEmbeddingResponse.fromBuffer);
  static final _$getChallenge =
      $grpc.ClientMethod<$0.GetChallengeRequest, $0.GetChallengeResponse>(
          '/biometric.v1.BiometricService/GetChallenge',
          ($0.GetChallengeRequest value) => value.writeToBuffer(),
          $0.GetChallengeResponse.fromBuffer);
  static final _$streamLiveness =
      $grpc.ClientMethod<$0.LivenessClientMsg, $0.LivenessServerMsg>(
          '/biometric.v1.BiometricService/StreamLiveness',
          ($0.LivenessClientMsg value) => value.writeToBuffer(),
          $0.LivenessServerMsg.fromBuffer);
  static final _$listBiometricReviewQueue = $grpc.ClientMethod<
          $0.ListBiometricReviewQueueRequest,
          $0.ListBiometricReviewQueueResponse>(
      '/biometric.v1.BiometricService/ListBiometricReviewQueue',
      ($0.ListBiometricReviewQueueRequest value) => value.writeToBuffer(),
      $0.ListBiometricReviewQueueResponse.fromBuffer);
  static final _$listBiometricResults = $grpc.ClientMethod<
          $0.ListBiometricResultsRequest, $0.ListBiometricResultsResponse>(
      '/biometric.v1.BiometricService/ListBiometricResults',
      ($0.ListBiometricResultsRequest value) => value.writeToBuffer(),
      $0.ListBiometricResultsResponse.fromBuffer);
  static final _$getBiometricEvidenceURL = $grpc.ClientMethod<
          $0.GetBiometricEvidenceURLRequest,
          $0.GetBiometricEvidenceURLResponse>(
      '/biometric.v1.BiometricService/GetBiometricEvidenceURL',
      ($0.GetBiometricEvidenceURLRequest value) => value.writeToBuffer(),
      $0.GetBiometricEvidenceURLResponse.fromBuffer);
  static final _$deleteBiometricEvidence = $grpc.ClientMethod<
          $0.DeleteBiometricEvidenceRequest,
          $0.DeleteBiometricEvidenceResponse>(
      '/biometric.v1.BiometricService/DeleteBiometricEvidence',
      ($0.DeleteBiometricEvidenceRequest value) => value.writeToBuffer(),
      $0.DeleteBiometricEvidenceResponse.fromBuffer);
}

@$pb.GrpcServiceName('biometric.v1.BiometricService')
abstract class BiometricServiceBase extends $grpc.Service {
  $core.String get $name => 'biometric.v1.BiometricService';

  BiometricServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EnrollFaceRequest, $0.EnrollFaceResponse>(
        'EnrollFace',
        enrollFace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EnrollFaceRequest.fromBuffer(value),
        ($0.EnrollFaceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SearchCollisionsRequest,
            $0.SearchCollisionsResponse>(
        'SearchCollisions',
        searchCollisions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SearchCollisionsRequest.fromBuffer(value),
        ($0.SearchCollisionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BlockFaceRequest, $0.BlockFaceResponse>(
        'BlockFace',
        blockFace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BlockFaceRequest.fromBuffer(value),
        ($0.BlockFaceResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UnblockFaceRequest, $0.UnblockFaceResponse>(
            'UnblockFace',
            unblockFace_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UnblockFaceRequest.fromBuffer(value),
            ($0.UnblockFaceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetWorkerEmbeddingRequest,
            $0.GetWorkerEmbeddingResponse>(
        'GetWorkerEmbedding',
        getWorkerEmbedding_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetWorkerEmbeddingRequest.fromBuffer(value),
        ($0.GetWorkerEmbeddingResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetChallengeRequest, $0.GetChallengeResponse>(
            'GetChallenge',
            getChallenge_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetChallengeRequest.fromBuffer(value),
            ($0.GetChallengeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LivenessClientMsg, $0.LivenessServerMsg>(
        'StreamLiveness',
        streamLiveness,
        true,
        true,
        ($core.List<$core.int> value) => $0.LivenessClientMsg.fromBuffer(value),
        ($0.LivenessServerMsg value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBiometricReviewQueueRequest,
            $0.ListBiometricReviewQueueResponse>(
        'ListBiometricReviewQueue',
        listBiometricReviewQueue_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListBiometricReviewQueueRequest.fromBuffer(value),
        ($0.ListBiometricReviewQueueResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListBiometricResultsRequest,
            $0.ListBiometricResultsResponse>(
        'ListBiometricResults',
        listBiometricResults_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListBiometricResultsRequest.fromBuffer(value),
        ($0.ListBiometricResultsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBiometricEvidenceURLRequest,
            $0.GetBiometricEvidenceURLResponse>(
        'GetBiometricEvidenceURL',
        getBiometricEvidenceURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetBiometricEvidenceURLRequest.fromBuffer(value),
        ($0.GetBiometricEvidenceURLResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteBiometricEvidenceRequest,
            $0.DeleteBiometricEvidenceResponse>(
        'DeleteBiometricEvidence',
        deleteBiometricEvidence_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteBiometricEvidenceRequest.fromBuffer(value),
        ($0.DeleteBiometricEvidenceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.EnrollFaceResponse> enrollFace_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EnrollFaceRequest> $request) async {
    return enrollFace($call, await $request);
  }

  $async.Future<$0.EnrollFaceResponse> enrollFace(
      $grpc.ServiceCall call, $0.EnrollFaceRequest request);

  $async.Future<$0.SearchCollisionsResponse> searchCollisions_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SearchCollisionsRequest> $request) async {
    return searchCollisions($call, await $request);
  }

  $async.Future<$0.SearchCollisionsResponse> searchCollisions(
      $grpc.ServiceCall call, $0.SearchCollisionsRequest request);

  $async.Future<$0.BlockFaceResponse> blockFace_Pre($grpc.ServiceCall $call,
      $async.Future<$0.BlockFaceRequest> $request) async {
    return blockFace($call, await $request);
  }

  $async.Future<$0.BlockFaceResponse> blockFace(
      $grpc.ServiceCall call, $0.BlockFaceRequest request);

  $async.Future<$0.UnblockFaceResponse> unblockFace_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UnblockFaceRequest> $request) async {
    return unblockFace($call, await $request);
  }

  $async.Future<$0.UnblockFaceResponse> unblockFace(
      $grpc.ServiceCall call, $0.UnblockFaceRequest request);

  $async.Future<$0.GetWorkerEmbeddingResponse> getWorkerEmbedding_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetWorkerEmbeddingRequest> $request) async {
    return getWorkerEmbedding($call, await $request);
  }

  $async.Future<$0.GetWorkerEmbeddingResponse> getWorkerEmbedding(
      $grpc.ServiceCall call, $0.GetWorkerEmbeddingRequest request);

  $async.Future<$0.GetChallengeResponse> getChallenge_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetChallengeRequest> $request) async {
    return getChallenge($call, await $request);
  }

  $async.Future<$0.GetChallengeResponse> getChallenge(
      $grpc.ServiceCall call, $0.GetChallengeRequest request);

  $async.Stream<$0.LivenessServerMsg> streamLiveness(
      $grpc.ServiceCall call, $async.Stream<$0.LivenessClientMsg> request);

  $async.Future<$0.ListBiometricReviewQueueResponse>
      listBiometricReviewQueue_Pre($grpc.ServiceCall $call,
          $async.Future<$0.ListBiometricReviewQueueRequest> $request) async {
    return listBiometricReviewQueue($call, await $request);
  }

  $async.Future<$0.ListBiometricReviewQueueResponse> listBiometricReviewQueue(
      $grpc.ServiceCall call, $0.ListBiometricReviewQueueRequest request);

  $async.Future<$0.ListBiometricResultsResponse> listBiometricResults_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListBiometricResultsRequest> $request) async {
    return listBiometricResults($call, await $request);
  }

  $async.Future<$0.ListBiometricResultsResponse> listBiometricResults(
      $grpc.ServiceCall call, $0.ListBiometricResultsRequest request);

  $async.Future<$0.GetBiometricEvidenceURLResponse> getBiometricEvidenceURL_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetBiometricEvidenceURLRequest> $request) async {
    return getBiometricEvidenceURL($call, await $request);
  }

  $async.Future<$0.GetBiometricEvidenceURLResponse> getBiometricEvidenceURL(
      $grpc.ServiceCall call, $0.GetBiometricEvidenceURLRequest request);

  $async.Future<$0.DeleteBiometricEvidenceResponse> deleteBiometricEvidence_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteBiometricEvidenceRequest> $request) async {
    return deleteBiometricEvidence($call, await $request);
  }

  $async.Future<$0.DeleteBiometricEvidenceResponse> deleteBiometricEvidence(
      $grpc.ServiceCall call, $0.DeleteBiometricEvidenceRequest request);
}
