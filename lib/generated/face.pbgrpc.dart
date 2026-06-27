// This is a generated file - do not edit.
//
// Generated from face.proto.

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

import 'face.pb.dart' as $0;

export 'face.pb.dart';

@$pb.GrpcServiceName('faceauth.FaceAuth')
class FaceAuthClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FaceAuthClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.EnrollResponse> enrollFace(
    $0.EnrollRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$enrollFace, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyResponse> verifyFace(
    $0.VerifyRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifyFace, request, options: options);
  }

  $grpc.ResponseFuture<$0.PingResponse> ping(
    $0.PingRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  // method descriptors

  static final _$enrollFace =
      $grpc.ClientMethod<$0.EnrollRequest, $0.EnrollResponse>(
          '/faceauth.FaceAuth/EnrollFace',
          ($0.EnrollRequest value) => value.writeToBuffer(),
          $0.EnrollResponse.fromBuffer);
  static final _$verifyFace =
      $grpc.ClientMethod<$0.VerifyRequest, $0.VerifyResponse>(
          '/faceauth.FaceAuth/VerifyFace',
          ($0.VerifyRequest value) => value.writeToBuffer(),
          $0.VerifyResponse.fromBuffer);
  static final _$ping = $grpc.ClientMethod<$0.PingRequest, $0.PingResponse>(
      '/faceauth.FaceAuth/Ping',
      ($0.PingRequest value) => value.writeToBuffer(),
      $0.PingResponse.fromBuffer);
}

@$pb.GrpcServiceName('faceauth.FaceAuth')
abstract class FaceAuthServiceBase extends $grpc.Service {
  $core.String get $name => 'faceauth.FaceAuth';

  FaceAuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.EnrollRequest, $0.EnrollResponse>(
        'EnrollFace',
        enrollFace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EnrollRequest.fromBuffer(value),
        ($0.EnrollResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyRequest, $0.VerifyResponse>(
        'VerifyFace',
        verifyFace_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyRequest.fromBuffer(value),
        ($0.VerifyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PingRequest, $0.PingResponse>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PingRequest.fromBuffer(value),
        ($0.PingResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.EnrollResponse> enrollFace_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.EnrollRequest> $request) async {
    return enrollFace($call, await $request);
  }

  $async.Future<$0.EnrollResponse> enrollFace(
      $grpc.ServiceCall call, $0.EnrollRequest request);

  $async.Future<$0.VerifyResponse> verifyFace_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.VerifyRequest> $request) async {
    return verifyFace($call, await $request);
  }

  $async.Future<$0.VerifyResponse> verifyFace(
      $grpc.ServiceCall call, $0.VerifyRequest request);

  $async.Future<$0.PingResponse> ping_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.PingRequest> $request) async {
    return ping($call, await $request);
  }

  $async.Future<$0.PingResponse> ping(
      $grpc.ServiceCall call, $0.PingRequest request);
}
