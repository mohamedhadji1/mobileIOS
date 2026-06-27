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
}
