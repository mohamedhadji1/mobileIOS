// This is a generated file - do not edit.
//
// Generated from risk/v1/risk.proto.

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

import 'risk.pb.dart' as $0;

export 'risk.pb.dart';

/// RiskService handles the final aggregation and classification of worker risk.
@$pb.GrpcServiceName('risk.v1.RiskService')
class RiskServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  RiskServiceClient(super.channel, {super.options, super.interceptors});

  /// Get the current risk assessment for a worker.
  $grpc.ResponseFuture<$0.GetRiskAssessmentResponse> getRiskAssessment(
    $0.GetRiskAssessmentRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getRiskAssessment, request, options: options);
  }

  /// Submit a final decision by an analyst.
  $grpc.ResponseFuture<$0.SubmitFinalDecisionResponse> submitFinalDecision(
    $0.SubmitFinalDecisionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitFinalDecision, request, options: options);
  }

  /// Permanently block a worker and their biometric hash.
  $grpc.ResponseFuture<$0.SubmitBlockDecisionResponse> submitBlockDecision(
    $0.SubmitBlockDecisionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitBlockDecision, request, options: options);
  }

  /// Remove a worker from the blocklist.
  $grpc.ResponseFuture<$0.RemoveFromBlocklistResponse> removeFromBlocklist(
    $0.RemoveFromBlocklistRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeFromBlocklist, request, options: options);
  }

  /// Trigger a daily sanctions re-screen check.
  $grpc.ResponseFuture<$0.TriggerSanctionsReScreenResponse>
      triggerSanctionsReScreen(
    $0.TriggerSanctionsReScreenRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$triggerSanctionsReScreen, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListSanctionsHitsResponse> listSanctionsHits(
    $0.ListSanctionsHitsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listSanctionsHits, request, options: options);
  }

  $grpc.ResponseFuture<$0.TriggerSanctionsReScreenForWorkerResponse>
      triggerSanctionsReScreenForWorker(
    $0.TriggerSanctionsReScreenForWorkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$triggerSanctionsReScreenForWorker, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListTravelFlagsResponse> listTravelFlags(
    $0.ListTravelFlagsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTravelFlags, request, options: options);
  }

  /// List biometric blocklist entries for a tenant.
  $grpc.ResponseFuture<$0.ListBlocklistResponse> listBlocklist(
    $0.ListBlocklistRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listBlocklist, request, options: options);
  }

  /// List current traffic-light state for every worker in a tenant.
  $grpc.ResponseFuture<$0.ListTrafficLightsResponse> listTrafficLights(
    $0.ListTrafficLightsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTrafficLights, request, options: options);
  }

  // method descriptors

  static final _$getRiskAssessment = $grpc.ClientMethod<
          $0.GetRiskAssessmentRequest, $0.GetRiskAssessmentResponse>(
      '/risk.v1.RiskService/GetRiskAssessment',
      ($0.GetRiskAssessmentRequest value) => value.writeToBuffer(),
      $0.GetRiskAssessmentResponse.fromBuffer);
  static final _$submitFinalDecision = $grpc.ClientMethod<
          $0.SubmitFinalDecisionRequest, $0.SubmitFinalDecisionResponse>(
      '/risk.v1.RiskService/SubmitFinalDecision',
      ($0.SubmitFinalDecisionRequest value) => value.writeToBuffer(),
      $0.SubmitFinalDecisionResponse.fromBuffer);
  static final _$submitBlockDecision = $grpc.ClientMethod<
          $0.SubmitBlockDecisionRequest, $0.SubmitBlockDecisionResponse>(
      '/risk.v1.RiskService/SubmitBlockDecision',
      ($0.SubmitBlockDecisionRequest value) => value.writeToBuffer(),
      $0.SubmitBlockDecisionResponse.fromBuffer);
  static final _$removeFromBlocklist = $grpc.ClientMethod<
          $0.RemoveFromBlocklistRequest, $0.RemoveFromBlocklistResponse>(
      '/risk.v1.RiskService/RemoveFromBlocklist',
      ($0.RemoveFromBlocklistRequest value) => value.writeToBuffer(),
      $0.RemoveFromBlocklistResponse.fromBuffer);
  static final _$triggerSanctionsReScreen = $grpc.ClientMethod<
          $0.TriggerSanctionsReScreenRequest,
          $0.TriggerSanctionsReScreenResponse>(
      '/risk.v1.RiskService/TriggerSanctionsReScreen',
      ($0.TriggerSanctionsReScreenRequest value) => value.writeToBuffer(),
      $0.TriggerSanctionsReScreenResponse.fromBuffer);
  static final _$listSanctionsHits = $grpc.ClientMethod<
          $0.ListSanctionsHitsRequest, $0.ListSanctionsHitsResponse>(
      '/risk.v1.RiskService/ListSanctionsHits',
      ($0.ListSanctionsHitsRequest value) => value.writeToBuffer(),
      $0.ListSanctionsHitsResponse.fromBuffer);
  static final _$triggerSanctionsReScreenForWorker = $grpc.ClientMethod<
          $0.TriggerSanctionsReScreenForWorkerRequest,
          $0.TriggerSanctionsReScreenForWorkerResponse>(
      '/risk.v1.RiskService/TriggerSanctionsReScreenForWorker',
      ($0.TriggerSanctionsReScreenForWorkerRequest value) =>
          value.writeToBuffer(),
      $0.TriggerSanctionsReScreenForWorkerResponse.fromBuffer);
  static final _$listTravelFlags =
      $grpc.ClientMethod<$0.ListTravelFlagsRequest, $0.ListTravelFlagsResponse>(
          '/risk.v1.RiskService/ListTravelFlags',
          ($0.ListTravelFlagsRequest value) => value.writeToBuffer(),
          $0.ListTravelFlagsResponse.fromBuffer);
  static final _$listBlocklist =
      $grpc.ClientMethod<$0.ListBlocklistRequest, $0.ListBlocklistResponse>(
          '/risk.v1.RiskService/ListBlocklist',
          ($0.ListBlocklistRequest value) => value.writeToBuffer(),
          $0.ListBlocklistResponse.fromBuffer);
  static final _$listTrafficLights = $grpc.ClientMethod<
          $0.ListTrafficLightsRequest, $0.ListTrafficLightsResponse>(
      '/risk.v1.RiskService/ListTrafficLights',
      ($0.ListTrafficLightsRequest value) => value.writeToBuffer(),
      $0.ListTrafficLightsResponse.fromBuffer);
}

@$pb.GrpcServiceName('risk.v1.RiskService')
abstract class RiskServiceBase extends $grpc.Service {
  $core.String get $name => 'risk.v1.RiskService';

  RiskServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetRiskAssessmentRequest,
            $0.GetRiskAssessmentResponse>(
        'GetRiskAssessment',
        getRiskAssessment_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetRiskAssessmentRequest.fromBuffer(value),
        ($0.GetRiskAssessmentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubmitFinalDecisionRequest,
            $0.SubmitFinalDecisionResponse>(
        'SubmitFinalDecision',
        submitFinalDecision_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitFinalDecisionRequest.fromBuffer(value),
        ($0.SubmitFinalDecisionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubmitBlockDecisionRequest,
            $0.SubmitBlockDecisionResponse>(
        'SubmitBlockDecision',
        submitBlockDecision_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitBlockDecisionRequest.fromBuffer(value),
        ($0.SubmitBlockDecisionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveFromBlocklistRequest,
            $0.RemoveFromBlocklistResponse>(
        'RemoveFromBlocklist',
        removeFromBlocklist_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveFromBlocklistRequest.fromBuffer(value),
        ($0.RemoveFromBlocklistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TriggerSanctionsReScreenRequest,
            $0.TriggerSanctionsReScreenResponse>(
        'TriggerSanctionsReScreen',
        triggerSanctionsReScreen_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TriggerSanctionsReScreenRequest.fromBuffer(value),
        ($0.TriggerSanctionsReScreenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListSanctionsHitsRequest,
            $0.ListSanctionsHitsResponse>(
        'ListSanctionsHits',
        listSanctionsHits_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListSanctionsHitsRequest.fromBuffer(value),
        ($0.ListSanctionsHitsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TriggerSanctionsReScreenForWorkerRequest,
            $0.TriggerSanctionsReScreenForWorkerResponse>(
        'TriggerSanctionsReScreenForWorker',
        triggerSanctionsReScreenForWorker_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TriggerSanctionsReScreenForWorkerRequest.fromBuffer(value),
        ($0.TriggerSanctionsReScreenForWorkerResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTravelFlagsRequest,
            $0.ListTravelFlagsResponse>(
        'ListTravelFlags',
        listTravelFlags_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListTravelFlagsRequest.fromBuffer(value),
        ($0.ListTravelFlagsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListBlocklistRequest, $0.ListBlocklistResponse>(
            'ListBlocklist',
            listBlocklist_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListBlocklistRequest.fromBuffer(value),
            ($0.ListBlocklistResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTrafficLightsRequest,
            $0.ListTrafficLightsResponse>(
        'ListTrafficLights',
        listTrafficLights_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListTrafficLightsRequest.fromBuffer(value),
        ($0.ListTrafficLightsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetRiskAssessmentResponse> getRiskAssessment_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetRiskAssessmentRequest> $request) async {
    return getRiskAssessment($call, await $request);
  }

  $async.Future<$0.GetRiskAssessmentResponse> getRiskAssessment(
      $grpc.ServiceCall call, $0.GetRiskAssessmentRequest request);

  $async.Future<$0.SubmitFinalDecisionResponse> submitFinalDecision_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitFinalDecisionRequest> $request) async {
    return submitFinalDecision($call, await $request);
  }

  $async.Future<$0.SubmitFinalDecisionResponse> submitFinalDecision(
      $grpc.ServiceCall call, $0.SubmitFinalDecisionRequest request);

  $async.Future<$0.SubmitBlockDecisionResponse> submitBlockDecision_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitBlockDecisionRequest> $request) async {
    return submitBlockDecision($call, await $request);
  }

  $async.Future<$0.SubmitBlockDecisionResponse> submitBlockDecision(
      $grpc.ServiceCall call, $0.SubmitBlockDecisionRequest request);

  $async.Future<$0.RemoveFromBlocklistResponse> removeFromBlocklist_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RemoveFromBlocklistRequest> $request) async {
    return removeFromBlocklist($call, await $request);
  }

  $async.Future<$0.RemoveFromBlocklistResponse> removeFromBlocklist(
      $grpc.ServiceCall call, $0.RemoveFromBlocklistRequest request);

  $async.Future<$0.TriggerSanctionsReScreenResponse>
      triggerSanctionsReScreen_Pre($grpc.ServiceCall $call,
          $async.Future<$0.TriggerSanctionsReScreenRequest> $request) async {
    return triggerSanctionsReScreen($call, await $request);
  }

  $async.Future<$0.TriggerSanctionsReScreenResponse> triggerSanctionsReScreen(
      $grpc.ServiceCall call, $0.TriggerSanctionsReScreenRequest request);

  $async.Future<$0.ListSanctionsHitsResponse> listSanctionsHits_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListSanctionsHitsRequest> $request) async {
    return listSanctionsHits($call, await $request);
  }

  $async.Future<$0.ListSanctionsHitsResponse> listSanctionsHits(
      $grpc.ServiceCall call, $0.ListSanctionsHitsRequest request);

  $async.Future<$0.TriggerSanctionsReScreenForWorkerResponse>
      triggerSanctionsReScreenForWorker_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.TriggerSanctionsReScreenForWorkerRequest>
              $request) async {
    return triggerSanctionsReScreenForWorker($call, await $request);
  }

  $async.Future<$0.TriggerSanctionsReScreenForWorkerResponse>
      triggerSanctionsReScreenForWorker($grpc.ServiceCall call,
          $0.TriggerSanctionsReScreenForWorkerRequest request);

  $async.Future<$0.ListTravelFlagsResponse> listTravelFlags_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListTravelFlagsRequest> $request) async {
    return listTravelFlags($call, await $request);
  }

  $async.Future<$0.ListTravelFlagsResponse> listTravelFlags(
      $grpc.ServiceCall call, $0.ListTravelFlagsRequest request);

  $async.Future<$0.ListBlocklistResponse> listBlocklist_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListBlocklistRequest> $request) async {
    return listBlocklist($call, await $request);
  }

  $async.Future<$0.ListBlocklistResponse> listBlocklist(
      $grpc.ServiceCall call, $0.ListBlocklistRequest request);

  $async.Future<$0.ListTrafficLightsResponse> listTrafficLights_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListTrafficLightsRequest> $request) async {
    return listTrafficLights($call, await $request);
  }

  $async.Future<$0.ListTrafficLightsResponse> listTrafficLights(
      $grpc.ServiceCall call, $0.ListTrafficLightsRequest request);
}
