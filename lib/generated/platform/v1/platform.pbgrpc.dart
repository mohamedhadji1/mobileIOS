// This is a generated file - do not edit.
//
// Generated from platform/v1/platform.proto.

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

import 'platform.pb.dart' as $0;

export 'platform.pb.dart';

@$pb.GrpcServiceName('platform.v1.PlatformService')
class PlatformServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PlatformServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SyncUserResponse> syncUser(
    $0.SyncUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$syncUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserProfileResponse> getUserProfile(
    $0.GetUserProfileRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getUserProfile, request, options: options);
  }

  // method descriptors

  static final _$syncUser =
      $grpc.ClientMethod<$0.SyncUserRequest, $0.SyncUserResponse>(
          '/platform.v1.PlatformService/SyncUser',
          ($0.SyncUserRequest value) => value.writeToBuffer(),
          $0.SyncUserResponse.fromBuffer);
  static final _$getUserProfile =
      $grpc.ClientMethod<$0.GetUserProfileRequest, $0.GetUserProfileResponse>(
          '/platform.v1.PlatformService/GetUserProfile',
          ($0.GetUserProfileRequest value) => value.writeToBuffer(),
          $0.GetUserProfileResponse.fromBuffer);
}

@$pb.GrpcServiceName('platform.v1.PlatformService')
abstract class PlatformServiceBase extends $grpc.Service {
  $core.String get $name => 'platform.v1.PlatformService';

  PlatformServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SyncUserRequest, $0.SyncUserResponse>(
        'SyncUser',
        syncUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SyncUserRequest.fromBuffer(value),
        ($0.SyncUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserProfileRequest,
            $0.GetUserProfileResponse>(
        'GetUserProfile',
        getUserProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetUserProfileRequest.fromBuffer(value),
        ($0.GetUserProfileResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SyncUserResponse> syncUser_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SyncUserRequest> $request) async {
    return syncUser($call, await $request);
  }

  $async.Future<$0.SyncUserResponse> syncUser(
      $grpc.ServiceCall call, $0.SyncUserRequest request);

  $async.Future<$0.GetUserProfileResponse> getUserProfile_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetUserProfileRequest> $request) async {
    return getUserProfile($call, await $request);
  }

  $async.Future<$0.GetUserProfileResponse> getUserProfile(
      $grpc.ServiceCall call, $0.GetUserProfileRequest request);
}
