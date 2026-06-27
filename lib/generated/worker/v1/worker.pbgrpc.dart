// This is a generated file - do not edit.
//
// Generated from worker/v1/worker.proto.

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

import 'worker.pb.dart' as $0;

export 'worker.pb.dart';

/// QualificationService handles educational and professional verification.
@$pb.GrpcServiceName('worker.v1.QualificationService')
class QualificationServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  QualificationServiceClient(super.channel,
      {super.options, super.interceptors});

  /// Submit a qualification for verification.
  $grpc.ResponseFuture<$0.SubmitQualificationResponse> submitQualification(
    $0.SubmitQualificationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitQualification, request, options: options);
  }

  /// Get the status of a qualification verification.
  $grpc.ResponseFuture<$0.GetQualificationStatusResponse>
      getQualificationStatus(
    $0.GetQualificationStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getQualificationStatus, request,
        options: options);
  }

  /// Manual override by an analyst.
  $grpc.ResponseFuture<$0.AnalystOverrideResponse> analystOverride(
    $0.AnalystOverrideRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$analystOverride, request, options: options);
  }

  // method descriptors

  static final _$submitQualification = $grpc.ClientMethod<
          $0.SubmitQualificationRequest, $0.SubmitQualificationResponse>(
      '/worker.v1.QualificationService/SubmitQualification',
      ($0.SubmitQualificationRequest value) => value.writeToBuffer(),
      $0.SubmitQualificationResponse.fromBuffer);
  static final _$getQualificationStatus = $grpc.ClientMethod<
          $0.GetQualificationStatusRequest, $0.GetQualificationStatusResponse>(
      '/worker.v1.QualificationService/GetQualificationStatus',
      ($0.GetQualificationStatusRequest value) => value.writeToBuffer(),
      $0.GetQualificationStatusResponse.fromBuffer);
  static final _$analystOverride =
      $grpc.ClientMethod<$0.AnalystOverrideRequest, $0.AnalystOverrideResponse>(
          '/worker.v1.QualificationService/AnalystOverride',
          ($0.AnalystOverrideRequest value) => value.writeToBuffer(),
          $0.AnalystOverrideResponse.fromBuffer);
}

@$pb.GrpcServiceName('worker.v1.QualificationService')
abstract class QualificationServiceBase extends $grpc.Service {
  $core.String get $name => 'worker.v1.QualificationService';

  QualificationServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SubmitQualificationRequest,
            $0.SubmitQualificationResponse>(
        'SubmitQualification',
        submitQualification_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitQualificationRequest.fromBuffer(value),
        ($0.SubmitQualificationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetQualificationStatusRequest,
            $0.GetQualificationStatusResponse>(
        'GetQualificationStatus',
        getQualificationStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetQualificationStatusRequest.fromBuffer(value),
        ($0.GetQualificationStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AnalystOverrideRequest,
            $0.AnalystOverrideResponse>(
        'AnalystOverride',
        analystOverride_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AnalystOverrideRequest.fromBuffer(value),
        ($0.AnalystOverrideResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SubmitQualificationResponse> submitQualification_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitQualificationRequest> $request) async {
    return submitQualification($call, await $request);
  }

  $async.Future<$0.SubmitQualificationResponse> submitQualification(
      $grpc.ServiceCall call, $0.SubmitQualificationRequest request);

  $async.Future<$0.GetQualificationStatusResponse> getQualificationStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetQualificationStatusRequest> $request) async {
    return getQualificationStatus($call, await $request);
  }

  $async.Future<$0.GetQualificationStatusResponse> getQualificationStatus(
      $grpc.ServiceCall call, $0.GetQualificationStatusRequest request);

  $async.Future<$0.AnalystOverrideResponse> analystOverride_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AnalystOverrideRequest> $request) async {
    return analystOverride($call, await $request);
  }

  $async.Future<$0.AnalystOverrideResponse> analystOverride(
      $grpc.ServiceCall call, $0.AnalystOverrideRequest request);
}

/// EmploymentService handles employer references and work history.
@$pb.GrpcServiceName('worker.v1.EmploymentService')
class EmploymentServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  EmploymentServiceClient(super.channel, {super.options, super.interceptors});

  /// Request a reference from a previous employer.
  $grpc.ResponseFuture<$0.RequestEmployerReferenceResponse>
      requestEmployerReference(
    $0.RequestEmployerReferenceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestEmployerReference, request,
        options: options);
  }

  /// Get the status of a specific reference request.
  $grpc.ResponseFuture<$0.GetEmployerReferenceStatusResponse>
      getEmployerReferenceStatus(
    $0.GetEmployerReferenceStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getEmployerReferenceStatus, request,
        options: options);
  }

  // method descriptors

  static final _$requestEmployerReference = $grpc.ClientMethod<
          $0.RequestEmployerReferenceRequest,
          $0.RequestEmployerReferenceResponse>(
      '/worker.v1.EmploymentService/RequestEmployerReference',
      ($0.RequestEmployerReferenceRequest value) => value.writeToBuffer(),
      $0.RequestEmployerReferenceResponse.fromBuffer);
  static final _$getEmployerReferenceStatus = $grpc.ClientMethod<
          $0.GetEmployerReferenceStatusRequest,
          $0.GetEmployerReferenceStatusResponse>(
      '/worker.v1.EmploymentService/GetEmployerReferenceStatus',
      ($0.GetEmployerReferenceStatusRequest value) => value.writeToBuffer(),
      $0.GetEmployerReferenceStatusResponse.fromBuffer);
}

@$pb.GrpcServiceName('worker.v1.EmploymentService')
abstract class EmploymentServiceBase extends $grpc.Service {
  $core.String get $name => 'worker.v1.EmploymentService';

  EmploymentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RequestEmployerReferenceRequest,
            $0.RequestEmployerReferenceResponse>(
        'RequestEmployerReference',
        requestEmployerReference_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestEmployerReferenceRequest.fromBuffer(value),
        ($0.RequestEmployerReferenceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetEmployerReferenceStatusRequest,
            $0.GetEmployerReferenceStatusResponse>(
        'GetEmployerReferenceStatus',
        getEmployerReferenceStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetEmployerReferenceStatusRequest.fromBuffer(value),
        ($0.GetEmployerReferenceStatusResponse value) =>
            value.writeToBuffer()));
  }

  $async.Future<$0.RequestEmployerReferenceResponse>
      requestEmployerReference_Pre($grpc.ServiceCall $call,
          $async.Future<$0.RequestEmployerReferenceRequest> $request) async {
    return requestEmployerReference($call, await $request);
  }

  $async.Future<$0.RequestEmployerReferenceResponse> requestEmployerReference(
      $grpc.ServiceCall call, $0.RequestEmployerReferenceRequest request);

  $async.Future<$0.GetEmployerReferenceStatusResponse>
      getEmployerReferenceStatus_Pre($grpc.ServiceCall $call,
          $async.Future<$0.GetEmployerReferenceStatusRequest> $request) async {
    return getEmployerReferenceStatus($call, await $request);
  }

  $async.Future<$0.GetEmployerReferenceStatusResponse>
      getEmployerReferenceStatus(
          $grpc.ServiceCall call, $0.GetEmployerReferenceStatusRequest request);
}

/// WorkerService handles worker onboarding and enrollment.
@$pb.GrpcServiceName('worker.v1.WorkerService')
class WorkerServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  WorkerServiceClient(super.channel, {super.options, super.interceptors});

  /// Enroll a new worker.
  $grpc.ResponseFuture<$0.EnrollWorkerResponse> enrollWorker(
    $0.EnrollWorkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$enrollWorker, request, options: options);
  }

  /// Validate an invitation token.
  $grpc.ResponseFuture<$0.ValidateInvitationResponse> validateInvitation(
    $0.ValidateInvitationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$validateInvitation, request, options: options);
  }

  /// Create and send an invitation.
  $grpc.ResponseFuture<$0.CreateInvitationResponse> createInvitation(
    $0.CreateInvitationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createInvitation, request, options: options);
  }

  /// Get all workers for a specific tenant.
  $grpc.ResponseFuture<$0.GetWorkersByTenantResponse> getWorkersByTenant(
    $0.GetWorkersByTenantRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getWorkersByTenant, request, options: options);
  }

  /// Get notification history for a worker.
  $grpc.ResponseFuture<$0.GetNotificationHistoryResponse>
      getNotificationHistory(
    $0.GetNotificationHistoryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getNotificationHistory, request,
        options: options);
  }

  /// Telemetry & Device Binding (M6)
  $grpc.ResponseFuture<$0.IngestTelemetryResponse> ingestTelemetry(
    $0.IngestTelemetryRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ingestTelemetry, request, options: options);
  }

  $grpc.ResponseFuture<$0.RaiseTelemetrySecurityEventResponse>
      raiseTelemetrySecurityEvent(
    $0.RaiseTelemetrySecurityEventRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$raiseTelemetrySecurityEvent, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.RegisterDeviceResponse> registerDevice(
    $0.RegisterDeviceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$registerDevice, request, options: options);
  }

  // method descriptors

  static final _$enrollWorker =
      $grpc.ClientMethod<$0.EnrollWorkerRequest, $0.EnrollWorkerResponse>(
          '/worker.v1.WorkerService/EnrollWorker',
          ($0.EnrollWorkerRequest value) => value.writeToBuffer(),
          $0.EnrollWorkerResponse.fromBuffer);
  static final _$validateInvitation = $grpc.ClientMethod<
          $0.ValidateInvitationRequest, $0.ValidateInvitationResponse>(
      '/worker.v1.WorkerService/ValidateInvitation',
      ($0.ValidateInvitationRequest value) => value.writeToBuffer(),
      $0.ValidateInvitationResponse.fromBuffer);
  static final _$createInvitation = $grpc.ClientMethod<
          $0.CreateInvitationRequest, $0.CreateInvitationResponse>(
      '/worker.v1.WorkerService/CreateInvitation',
      ($0.CreateInvitationRequest value) => value.writeToBuffer(),
      $0.CreateInvitationResponse.fromBuffer);
  static final _$getWorkersByTenant = $grpc.ClientMethod<
          $0.GetWorkersByTenantRequest, $0.GetWorkersByTenantResponse>(
      '/worker.v1.WorkerService/GetWorkersByTenant',
      ($0.GetWorkersByTenantRequest value) => value.writeToBuffer(),
      $0.GetWorkersByTenantResponse.fromBuffer);
  static final _$getNotificationHistory = $grpc.ClientMethod<
          $0.GetNotificationHistoryRequest, $0.GetNotificationHistoryResponse>(
      '/worker.v1.WorkerService/GetNotificationHistory',
      ($0.GetNotificationHistoryRequest value) => value.writeToBuffer(),
      $0.GetNotificationHistoryResponse.fromBuffer);
  static final _$ingestTelemetry =
      $grpc.ClientMethod<$0.IngestTelemetryRequest, $0.IngestTelemetryResponse>(
          '/worker.v1.WorkerService/IngestTelemetry',
          ($0.IngestTelemetryRequest value) => value.writeToBuffer(),
          $0.IngestTelemetryResponse.fromBuffer);
  static final _$raiseTelemetrySecurityEvent = $grpc.ClientMethod<
          $0.RaiseTelemetrySecurityEventRequest,
          $0.RaiseTelemetrySecurityEventResponse>(
      '/worker.v1.WorkerService/RaiseTelemetrySecurityEvent',
      ($0.RaiseTelemetrySecurityEventRequest value) => value.writeToBuffer(),
      $0.RaiseTelemetrySecurityEventResponse.fromBuffer);
  static final _$registerDevice =
      $grpc.ClientMethod<$0.RegisterDeviceRequest, $0.RegisterDeviceResponse>(
          '/worker.v1.WorkerService/RegisterDevice',
          ($0.RegisterDeviceRequest value) => value.writeToBuffer(),
          $0.RegisterDeviceResponse.fromBuffer);
}

@$pb.GrpcServiceName('worker.v1.WorkerService')
abstract class WorkerServiceBase extends $grpc.Service {
  $core.String get $name => 'worker.v1.WorkerService';

  WorkerServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.EnrollWorkerRequest, $0.EnrollWorkerResponse>(
            'EnrollWorker',
            enrollWorker_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.EnrollWorkerRequest.fromBuffer(value),
            ($0.EnrollWorkerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ValidateInvitationRequest,
            $0.ValidateInvitationResponse>(
        'ValidateInvitation',
        validateInvitation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ValidateInvitationRequest.fromBuffer(value),
        ($0.ValidateInvitationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateInvitationRequest,
            $0.CreateInvitationResponse>(
        'CreateInvitation',
        createInvitation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateInvitationRequest.fromBuffer(value),
        ($0.CreateInvitationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetWorkersByTenantRequest,
            $0.GetWorkersByTenantResponse>(
        'GetWorkersByTenant',
        getWorkersByTenant_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetWorkersByTenantRequest.fromBuffer(value),
        ($0.GetWorkersByTenantResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetNotificationHistoryRequest,
            $0.GetNotificationHistoryResponse>(
        'GetNotificationHistory',
        getNotificationHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetNotificationHistoryRequest.fromBuffer(value),
        ($0.GetNotificationHistoryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IngestTelemetryRequest,
            $0.IngestTelemetryResponse>(
        'IngestTelemetry',
        ingestTelemetry_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.IngestTelemetryRequest.fromBuffer(value),
        ($0.IngestTelemetryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RaiseTelemetrySecurityEventRequest,
            $0.RaiseTelemetrySecurityEventResponse>(
        'RaiseTelemetrySecurityEvent',
        raiseTelemetrySecurityEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RaiseTelemetrySecurityEventRequest.fromBuffer(value),
        ($0.RaiseTelemetrySecurityEventResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterDeviceRequest,
            $0.RegisterDeviceResponse>(
        'RegisterDevice',
        registerDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterDeviceRequest.fromBuffer(value),
        ($0.RegisterDeviceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.EnrollWorkerResponse> enrollWorker_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.EnrollWorkerRequest> $request) async {
    return enrollWorker($call, await $request);
  }

  $async.Future<$0.EnrollWorkerResponse> enrollWorker(
      $grpc.ServiceCall call, $0.EnrollWorkerRequest request);

  $async.Future<$0.ValidateInvitationResponse> validateInvitation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ValidateInvitationRequest> $request) async {
    return validateInvitation($call, await $request);
  }

  $async.Future<$0.ValidateInvitationResponse> validateInvitation(
      $grpc.ServiceCall call, $0.ValidateInvitationRequest request);

  $async.Future<$0.CreateInvitationResponse> createInvitation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateInvitationRequest> $request) async {
    return createInvitation($call, await $request);
  }

  $async.Future<$0.CreateInvitationResponse> createInvitation(
      $grpc.ServiceCall call, $0.CreateInvitationRequest request);

  $async.Future<$0.GetWorkersByTenantResponse> getWorkersByTenant_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetWorkersByTenantRequest> $request) async {
    return getWorkersByTenant($call, await $request);
  }

  $async.Future<$0.GetWorkersByTenantResponse> getWorkersByTenant(
      $grpc.ServiceCall call, $0.GetWorkersByTenantRequest request);

  $async.Future<$0.GetNotificationHistoryResponse> getNotificationHistory_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetNotificationHistoryRequest> $request) async {
    return getNotificationHistory($call, await $request);
  }

  $async.Future<$0.GetNotificationHistoryResponse> getNotificationHistory(
      $grpc.ServiceCall call, $0.GetNotificationHistoryRequest request);

  $async.Future<$0.IngestTelemetryResponse> ingestTelemetry_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.IngestTelemetryRequest> $request) async {
    return ingestTelemetry($call, await $request);
  }

  $async.Future<$0.IngestTelemetryResponse> ingestTelemetry(
      $grpc.ServiceCall call, $0.IngestTelemetryRequest request);

  $async.Future<$0.RaiseTelemetrySecurityEventResponse>
      raiseTelemetrySecurityEvent_Pre($grpc.ServiceCall $call,
          $async.Future<$0.RaiseTelemetrySecurityEventRequest> $request) async {
    return raiseTelemetrySecurityEvent($call, await $request);
  }

  $async.Future<$0.RaiseTelemetrySecurityEventResponse>
      raiseTelemetrySecurityEvent($grpc.ServiceCall call,
          $0.RaiseTelemetrySecurityEventRequest request);

  $async.Future<$0.RegisterDeviceResponse> registerDevice_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RegisterDeviceRequest> $request) async {
    return registerDevice($call, await $request);
  }

  $async.Future<$0.RegisterDeviceResponse> registerDevice(
      $grpc.ServiceCall call, $0.RegisterDeviceRequest request);
}
