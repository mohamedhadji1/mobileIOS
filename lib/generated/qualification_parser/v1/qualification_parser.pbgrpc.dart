// This is a generated file - do not edit.
//
// Generated from qualification_parser/v1/qualification_parser.proto.

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

import 'qualification_parser.pb.dart' as $0;

export 'qualification_parser.pb.dart';

@$pb.GrpcServiceName('qualification_parser.v1.QualificationParserService')
class QualificationParserServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  QualificationParserServiceClient(super.channel,
      {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.ParseQualificationResponse> parseQualification(
    $0.ParseQualificationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$parseQualification, request, options: options);
  }

  // method descriptors

  static final _$parseQualification = $grpc.ClientMethod<
          $0.ParseQualificationRequest, $0.ParseQualificationResponse>(
      '/qualification_parser.v1.QualificationParserService/ParseQualification',
      ($0.ParseQualificationRequest value) => value.writeToBuffer(),
      $0.ParseQualificationResponse.fromBuffer);
}

@$pb.GrpcServiceName('qualification_parser.v1.QualificationParserService')
abstract class QualificationParserServiceBase extends $grpc.Service {
  $core.String get $name =>
      'qualification_parser.v1.QualificationParserService';

  QualificationParserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ParseQualificationRequest,
            $0.ParseQualificationResponse>(
        'ParseQualification',
        parseQualification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ParseQualificationRequest.fromBuffer(value),
        ($0.ParseQualificationResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ParseQualificationResponse> parseQualification_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ParseQualificationRequest> $request) async {
    return parseQualification($call, await $request);
  }

  $async.Future<$0.ParseQualificationResponse> parseQualification(
      $grpc.ServiceCall call, $0.ParseQualificationRequest request);
}
