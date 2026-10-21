// This is a generated file - do not edit.
//
// Generated from case/v1/case.proto.

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

import 'case.pb.dart' as $0;

export 'case.pb.dart';

@$pb.GrpcServiceName('case.v1.CaseService')
class CaseServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CaseServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetCaseResponse> getCase(
    $0.GetCaseRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListCasesResponse> listCases(
    $0.ListCasesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listCases, request, options: options);
  }

  $grpc.ResponseFuture<$0.AssignCaseResponse> assignCase(
    $0.AssignCaseRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$assignCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddEvidenceResponse> addEvidence(
    $0.AddEvidenceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addEvidence, request, options: options);
  }

  $grpc.ResponseFuture<$0.GenerateEvidenceUploadURLResponse>
      generateEvidenceUploadURL(
    $0.GenerateEvidenceUploadURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateEvidenceUploadURL, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetEvidenceDownloadURLResponse>
      getEvidenceDownloadURL(
    $0.GetEvidenceDownloadURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getEvidenceDownloadURL, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.AddCommentResponse> addComment(
    $0.AddCommentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResolveCaseResponse> resolveCase(
    $0.ResolveCaseRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resolveCase, request, options: options);
  }

  $grpc.ResponseFuture<$0.SubmitAppealResponse> submitAppeal(
    $0.SubmitAppealRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitAppeal, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCaseTimelineResponse> getCaseTimeline(
    $0.GetCaseTimelineRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCaseTimeline, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListReverificationQueueResponse>
      listReverificationQueue(
    $0.ListReverificationQueueRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listReverificationQueue, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.RequestReverificationResponse> requestReverification(
    $0.RequestReverificationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestReverification, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListReverificationRequestsResponse>
      listReverificationRequests(
    $0.ListReverificationRequestsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listReverificationRequests, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.AddCommentResponse> addCaseComment(
    $0.AddCommentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addCaseComment, request, options: options);
  }

  // method descriptors

  static final _$getCase =
      $grpc.ClientMethod<$0.GetCaseRequest, $0.GetCaseResponse>(
          '/case.v1.CaseService/GetCase',
          ($0.GetCaseRequest value) => value.writeToBuffer(),
          $0.GetCaseResponse.fromBuffer);
  static final _$listCases =
      $grpc.ClientMethod<$0.ListCasesRequest, $0.ListCasesResponse>(
          '/case.v1.CaseService/ListCases',
          ($0.ListCasesRequest value) => value.writeToBuffer(),
          $0.ListCasesResponse.fromBuffer);
  static final _$assignCase =
      $grpc.ClientMethod<$0.AssignCaseRequest, $0.AssignCaseResponse>(
          '/case.v1.CaseService/AssignCase',
          ($0.AssignCaseRequest value) => value.writeToBuffer(),
          $0.AssignCaseResponse.fromBuffer);
  static final _$addEvidence =
      $grpc.ClientMethod<$0.AddEvidenceRequest, $0.AddEvidenceResponse>(
          '/case.v1.CaseService/AddEvidence',
          ($0.AddEvidenceRequest value) => value.writeToBuffer(),
          $0.AddEvidenceResponse.fromBuffer);
  static final _$generateEvidenceUploadURL = $grpc.ClientMethod<
          $0.GenerateEvidenceUploadURLRequest,
          $0.GenerateEvidenceUploadURLResponse>(
      '/case.v1.CaseService/GenerateEvidenceUploadURL',
      ($0.GenerateEvidenceUploadURLRequest value) => value.writeToBuffer(),
      $0.GenerateEvidenceUploadURLResponse.fromBuffer);
  static final _$getEvidenceDownloadURL = $grpc.ClientMethod<
          $0.GetEvidenceDownloadURLRequest, $0.GetEvidenceDownloadURLResponse>(
      '/case.v1.CaseService/GetEvidenceDownloadURL',
      ($0.GetEvidenceDownloadURLRequest value) => value.writeToBuffer(),
      $0.GetEvidenceDownloadURLResponse.fromBuffer);
  static final _$addComment =
      $grpc.ClientMethod<$0.AddCommentRequest, $0.AddCommentResponse>(
          '/case.v1.CaseService/AddComment',
          ($0.AddCommentRequest value) => value.writeToBuffer(),
          $0.AddCommentResponse.fromBuffer);
  static final _$resolveCase =
      $grpc.ClientMethod<$0.ResolveCaseRequest, $0.ResolveCaseResponse>(
          '/case.v1.CaseService/ResolveCase',
          ($0.ResolveCaseRequest value) => value.writeToBuffer(),
          $0.ResolveCaseResponse.fromBuffer);
  static final _$submitAppeal =
      $grpc.ClientMethod<$0.SubmitAppealRequest, $0.SubmitAppealResponse>(
          '/case.v1.CaseService/SubmitAppeal',
          ($0.SubmitAppealRequest value) => value.writeToBuffer(),
          $0.SubmitAppealResponse.fromBuffer);
  static final _$getCaseTimeline =
      $grpc.ClientMethod<$0.GetCaseTimelineRequest, $0.GetCaseTimelineResponse>(
          '/case.v1.CaseService/GetCaseTimeline',
          ($0.GetCaseTimelineRequest value) => value.writeToBuffer(),
          $0.GetCaseTimelineResponse.fromBuffer);
  static final _$listReverificationQueue = $grpc.ClientMethod<
          $0.ListReverificationQueueRequest,
          $0.ListReverificationQueueResponse>(
      '/case.v1.CaseService/ListReverificationQueue',
      ($0.ListReverificationQueueRequest value) => value.writeToBuffer(),
      $0.ListReverificationQueueResponse.fromBuffer);
  static final _$requestReverification = $grpc.ClientMethod<
          $0.RequestReverificationRequest, $0.RequestReverificationResponse>(
      '/case.v1.CaseService/RequestReverification',
      ($0.RequestReverificationRequest value) => value.writeToBuffer(),
      $0.RequestReverificationResponse.fromBuffer);
  static final _$listReverificationRequests = $grpc.ClientMethod<
          $0.ListReverificationRequestsRequest,
          $0.ListReverificationRequestsResponse>(
      '/case.v1.CaseService/ListReverificationRequests',
      ($0.ListReverificationRequestsRequest value) => value.writeToBuffer(),
      $0.ListReverificationRequestsResponse.fromBuffer);
  static final _$addCaseComment =
      $grpc.ClientMethod<$0.AddCommentRequest, $0.AddCommentResponse>(
          '/case.v1.CaseService/AddCaseComment',
          ($0.AddCommentRequest value) => value.writeToBuffer(),
          $0.AddCommentResponse.fromBuffer);
}

@$pb.GrpcServiceName('case.v1.CaseService')
abstract class CaseServiceBase extends $grpc.Service {
  $core.String get $name => 'case.v1.CaseService';

  CaseServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetCaseRequest, $0.GetCaseResponse>(
        'GetCase',
        getCase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCaseRequest.fromBuffer(value),
        ($0.GetCaseResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCasesRequest, $0.ListCasesResponse>(
        'ListCases',
        listCases_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListCasesRequest.fromBuffer(value),
        ($0.ListCasesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AssignCaseRequest, $0.AssignCaseResponse>(
        'AssignCase',
        assignCase_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AssignCaseRequest.fromBuffer(value),
        ($0.AssignCaseResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AddEvidenceRequest, $0.AddEvidenceResponse>(
            'AddEvidence',
            addEvidence_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddEvidenceRequest.fromBuffer(value),
            ($0.AddEvidenceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateEvidenceUploadURLRequest,
            $0.GenerateEvidenceUploadURLResponse>(
        'GenerateEvidenceUploadURL',
        generateEvidenceUploadURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateEvidenceUploadURLRequest.fromBuffer(value),
        ($0.GenerateEvidenceUploadURLResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEvidenceDownloadURLRequest,
            $0.GetEvidenceDownloadURLResponse>(
        'GetEvidenceDownloadURL',
        getEvidenceDownloadURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetEvidenceDownloadURLRequest.fromBuffer(value),
        ($0.GetEvidenceDownloadURLResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddCommentRequest, $0.AddCommentResponse>(
        'AddComment',
        addComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddCommentRequest.fromBuffer(value),
        ($0.AddCommentResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ResolveCaseRequest, $0.ResolveCaseResponse>(
            'ResolveCase',
            resolveCase_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ResolveCaseRequest.fromBuffer(value),
            ($0.ResolveCaseResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.SubmitAppealRequest, $0.SubmitAppealResponse>(
            'SubmitAppeal',
            submitAppeal_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.SubmitAppealRequest.fromBuffer(value),
            ($0.SubmitAppealResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCaseTimelineRequest,
            $0.GetCaseTimelineResponse>(
        'GetCaseTimeline',
        getCaseTimeline_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetCaseTimelineRequest.fromBuffer(value),
        ($0.GetCaseTimelineResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListReverificationQueueRequest,
            $0.ListReverificationQueueResponse>(
        'ListReverificationQueue',
        listReverificationQueue_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListReverificationQueueRequest.fromBuffer(value),
        ($0.ListReverificationQueueResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestReverificationRequest,
            $0.RequestReverificationResponse>(
        'RequestReverification',
        requestReverification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestReverificationRequest.fromBuffer(value),
        ($0.RequestReverificationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListReverificationRequestsRequest,
            $0.ListReverificationRequestsResponse>(
        'ListReverificationRequests',
        listReverificationRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListReverificationRequestsRequest.fromBuffer(value),
        ($0.ListReverificationRequestsResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddCommentRequest, $0.AddCommentResponse>(
        'AddCaseComment',
        addCaseComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddCommentRequest.fromBuffer(value),
        ($0.AddCommentResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetCaseResponse> getCase_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetCaseRequest> $request) async {
    return getCase($call, await $request);
  }

  $async.Future<$0.GetCaseResponse> getCase(
      $grpc.ServiceCall call, $0.GetCaseRequest request);

  $async.Future<$0.ListCasesResponse> listCases_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListCasesRequest> $request) async {
    return listCases($call, await $request);
  }

  $async.Future<$0.ListCasesResponse> listCases(
      $grpc.ServiceCall call, $0.ListCasesRequest request);

  $async.Future<$0.AssignCaseResponse> assignCase_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AssignCaseRequest> $request) async {
    return assignCase($call, await $request);
  }

  $async.Future<$0.AssignCaseResponse> assignCase(
      $grpc.ServiceCall call, $0.AssignCaseRequest request);

  $async.Future<$0.AddEvidenceResponse> addEvidence_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddEvidenceRequest> $request) async {
    return addEvidence($call, await $request);
  }

  $async.Future<$0.AddEvidenceResponse> addEvidence(
      $grpc.ServiceCall call, $0.AddEvidenceRequest request);

  $async.Future<$0.GenerateEvidenceUploadURLResponse>
      generateEvidenceUploadURL_Pre($grpc.ServiceCall $call,
          $async.Future<$0.GenerateEvidenceUploadURLRequest> $request) async {
    return generateEvidenceUploadURL($call, await $request);
  }

  $async.Future<$0.GenerateEvidenceUploadURLResponse> generateEvidenceUploadURL(
      $grpc.ServiceCall call, $0.GenerateEvidenceUploadURLRequest request);

  $async.Future<$0.GetEvidenceDownloadURLResponse> getEvidenceDownloadURL_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetEvidenceDownloadURLRequest> $request) async {
    return getEvidenceDownloadURL($call, await $request);
  }

  $async.Future<$0.GetEvidenceDownloadURLResponse> getEvidenceDownloadURL(
      $grpc.ServiceCall call, $0.GetEvidenceDownloadURLRequest request);

  $async.Future<$0.AddCommentResponse> addComment_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddCommentRequest> $request) async {
    return addComment($call, await $request);
  }

  $async.Future<$0.AddCommentResponse> addComment(
      $grpc.ServiceCall call, $0.AddCommentRequest request);

  $async.Future<$0.ResolveCaseResponse> resolveCase_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ResolveCaseRequest> $request) async {
    return resolveCase($call, await $request);
  }

  $async.Future<$0.ResolveCaseResponse> resolveCase(
      $grpc.ServiceCall call, $0.ResolveCaseRequest request);

  $async.Future<$0.SubmitAppealResponse> submitAppeal_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitAppealRequest> $request) async {
    return submitAppeal($call, await $request);
  }

  $async.Future<$0.SubmitAppealResponse> submitAppeal(
      $grpc.ServiceCall call, $0.SubmitAppealRequest request);

  $async.Future<$0.GetCaseTimelineResponse> getCaseTimeline_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetCaseTimelineRequest> $request) async {
    return getCaseTimeline($call, await $request);
  }

  $async.Future<$0.GetCaseTimelineResponse> getCaseTimeline(
      $grpc.ServiceCall call, $0.GetCaseTimelineRequest request);

  $async.Future<$0.ListReverificationQueueResponse> listReverificationQueue_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListReverificationQueueRequest> $request) async {
    return listReverificationQueue($call, await $request);
  }

  $async.Future<$0.ListReverificationQueueResponse> listReverificationQueue(
      $grpc.ServiceCall call, $0.ListReverificationQueueRequest request);

  $async.Future<$0.RequestReverificationResponse> requestReverification_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RequestReverificationRequest> $request) async {
    return requestReverification($call, await $request);
  }

  $async.Future<$0.RequestReverificationResponse> requestReverification(
      $grpc.ServiceCall call, $0.RequestReverificationRequest request);

  $async.Future<$0.ListReverificationRequestsResponse>
      listReverificationRequests_Pre($grpc.ServiceCall $call,
          $async.Future<$0.ListReverificationRequestsRequest> $request) async {
    return listReverificationRequests($call, await $request);
  }

  $async.Future<$0.ListReverificationRequestsResponse>
      listReverificationRequests(
          $grpc.ServiceCall call, $0.ListReverificationRequestsRequest request);

  $async.Future<$0.AddCommentResponse> addCaseComment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AddCommentRequest> $request) async {
    return addCaseComment($call, await $request);
  }

  $async.Future<$0.AddCommentResponse> addCaseComment(
      $grpc.ServiceCall call, $0.AddCommentRequest request);
}
