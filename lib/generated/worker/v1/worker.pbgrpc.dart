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

  /// Extract suggested work-experience and qualification entries from a CV
  /// (PDF, Word or image) the worker uploaded via DocumentService.GenerateUploadURL
  /// and that passed DocumentService.VerifyDocumentUpload (FAILED_PRECONDITION
  /// otherwise). The ML gateway (M7) reads the file. Every entry is a suggestion
  /// for the worker to review; nothing is persisted.
  $grpc.ResponseFuture<$0.ParseCvResponse> parseCv(
    $0.ParseCvRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$parseCv, request, options: options);
  }

  /// The worker's latest diploma (with fields extracted from the uploaded
  /// document), the tenant's outreach email template, and the latest outreach
  /// sent for that diploma.
  $grpc.ResponseFuture<$0.GetInstitutionOutreachResponse>
      getInstitutionOutreach(
    $0.GetInstitutionOutreachRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getInstitutionOutreach, request,
        options: options);
  }

  /// Email an institution to verify a worker's qualification.
  $grpc.ResponseFuture<$0.SendInstitutionOutreachResponse>
      sendInstitutionOutreach(
    $0.SendInstitutionOutreachRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendInstitutionOutreach, request,
        options: options);
  }

  /// Institution replies received since a point in time, newest first.
  $grpc.ResponseFuture<$0.ListOutreachRepliesResponse> listOutreachReplies(
    $0.ListOutreachRepliesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listOutreachReplies, request, options: options);
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
  static final _$parseCv =
      $grpc.ClientMethod<$0.ParseCvRequest, $0.ParseCvResponse>(
          '/worker.v1.QualificationService/ParseCv',
          ($0.ParseCvRequest value) => value.writeToBuffer(),
          $0.ParseCvResponse.fromBuffer);
  static final _$getInstitutionOutreach = $grpc.ClientMethod<
          $0.GetInstitutionOutreachRequest, $0.GetInstitutionOutreachResponse>(
      '/worker.v1.QualificationService/GetInstitutionOutreach',
      ($0.GetInstitutionOutreachRequest value) => value.writeToBuffer(),
      $0.GetInstitutionOutreachResponse.fromBuffer);
  static final _$sendInstitutionOutreach = $grpc.ClientMethod<
          $0.SendInstitutionOutreachRequest,
          $0.SendInstitutionOutreachResponse>(
      '/worker.v1.QualificationService/SendInstitutionOutreach',
      ($0.SendInstitutionOutreachRequest value) => value.writeToBuffer(),
      $0.SendInstitutionOutreachResponse.fromBuffer);
  static final _$listOutreachReplies = $grpc.ClientMethod<
          $0.ListOutreachRepliesRequest, $0.ListOutreachRepliesResponse>(
      '/worker.v1.QualificationService/ListOutreachReplies',
      ($0.ListOutreachRepliesRequest value) => value.writeToBuffer(),
      $0.ListOutreachRepliesResponse.fromBuffer);
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
    $addMethod($grpc.ServiceMethod<$0.ParseCvRequest, $0.ParseCvResponse>(
        'ParseCv',
        parseCv_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ParseCvRequest.fromBuffer(value),
        ($0.ParseCvResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInstitutionOutreachRequest,
            $0.GetInstitutionOutreachResponse>(
        'GetInstitutionOutreach',
        getInstitutionOutreach_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetInstitutionOutreachRequest.fromBuffer(value),
        ($0.GetInstitutionOutreachResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendInstitutionOutreachRequest,
            $0.SendInstitutionOutreachResponse>(
        'SendInstitutionOutreach',
        sendInstitutionOutreach_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendInstitutionOutreachRequest.fromBuffer(value),
        ($0.SendInstitutionOutreachResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListOutreachRepliesRequest,
            $0.ListOutreachRepliesResponse>(
        'ListOutreachReplies',
        listOutreachReplies_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListOutreachRepliesRequest.fromBuffer(value),
        ($0.ListOutreachRepliesResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.ParseCvResponse> parseCv_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ParseCvRequest> $request) async {
    return parseCv($call, await $request);
  }

  $async.Future<$0.ParseCvResponse> parseCv(
      $grpc.ServiceCall call, $0.ParseCvRequest request);

  $async.Future<$0.GetInstitutionOutreachResponse> getInstitutionOutreach_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetInstitutionOutreachRequest> $request) async {
    return getInstitutionOutreach($call, await $request);
  }

  $async.Future<$0.GetInstitutionOutreachResponse> getInstitutionOutreach(
      $grpc.ServiceCall call, $0.GetInstitutionOutreachRequest request);

  $async.Future<$0.SendInstitutionOutreachResponse> sendInstitutionOutreach_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SendInstitutionOutreachRequest> $request) async {
    return sendInstitutionOutreach($call, await $request);
  }

  $async.Future<$0.SendInstitutionOutreachResponse> sendInstitutionOutreach(
      $grpc.ServiceCall call, $0.SendInstitutionOutreachRequest request);

  $async.Future<$0.ListOutreachRepliesResponse> listOutreachReplies_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListOutreachRepliesRequest> $request) async {
    return listOutreachReplies($call, await $request);
  }

  $async.Future<$0.ListOutreachRepliesResponse> listOutreachReplies(
      $grpc.ServiceCall call, $0.ListOutreachRepliesRequest request);
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

  /// Give a saved work-experience entry the employer's address and send the
  /// reference request now. The app saves experience without a referee email
  /// (status UNVERIFIED); HR completes it from the dashboard.
  $grpc.ResponseFuture<$0.SendReferenceRequestResponse> sendReferenceRequest(
    $0.SendReferenceRequestRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendReferenceRequest, request, options: options);
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
  static final _$sendReferenceRequest = $grpc.ClientMethod<
          $0.SendReferenceRequestRequest, $0.SendReferenceRequestResponse>(
      '/worker.v1.EmploymentService/SendReferenceRequest',
      ($0.SendReferenceRequestRequest value) => value.writeToBuffer(),
      $0.SendReferenceRequestResponse.fromBuffer);
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
    $addMethod($grpc.ServiceMethod<$0.SendReferenceRequestRequest,
            $0.SendReferenceRequestResponse>(
        'SendReferenceRequest',
        sendReferenceRequest_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendReferenceRequestRequest.fromBuffer(value),
        ($0.SendReferenceRequestResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.SendReferenceRequestResponse> sendReferenceRequest_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SendReferenceRequestRequest> $request) async {
    return sendReferenceRequest($call, await $request);
  }

  $async.Future<$0.SendReferenceRequestResponse> sendReferenceRequest(
      $grpc.ServiceCall call, $0.SendReferenceRequestRequest request);
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

  /// Invite a set of users selected from the tenant's directory (LDAP / Azure AD).
  $grpc.ResponseFuture<$0.InviteDirectoryUsersResponse> inviteDirectoryUsers(
    $0.InviteDirectoryUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$inviteDirectoryUsers, request, options: options);
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

  /// Register (or refresh) a device's Gotify push token. Mobile-reported path.
  $grpc.ResponseFuture<$0.RegisterPushTokenResponse> registerPushToken(
    $0.RegisterPushTokenRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$registerPushToken, request, options: options);
  }

  /// Provision (or return) this device's per-worker Gotify receive credential.
  $grpc.ResponseFuture<$0.ProvisionPushTargetResponse> provisionPushTarget(
    $0.ProvisionPushTargetRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$provisionPushTarget, request, options: options);
  }

  /// Subcontractor Management
  $grpc.ResponseFuture<$0.CreateSubcontractorResponse> createSubcontractor(
    $0.CreateSubcontractorRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createSubcontractor, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListSubcontractorsResponse> listSubcontractors(
    $0.ListSubcontractorsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listSubcontractors, request, options: options);
  }

  /// Pending Invitations
  $grpc.ResponseFuture<$0.ListInvitationsResponse> listInvitations(
    $0.ListInvitationsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listInvitations, request, options: options);
  }

  /// Bulk Invitations (Excel/CSV upload)
  $grpc.ResponseFuture<$0.GenerateInvitationBatchUploadURLResponse>
      generateInvitationBatchUploadURL(
    $0.GenerateInvitationBatchUploadURLRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$generateInvitationBatchUploadURL, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.StartInvitationBatchResponse> startInvitationBatch(
    $0.StartInvitationBatchRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$startInvitationBatch, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInvitationBatchStatusResponse>
      getInvitationBatchStatus(
    $0.GetInvitationBatchStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getInvitationBatchStatus, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListInvitationBatchesResponse> listInvitationBatches(
    $0.ListInvitationBatchesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listInvitationBatches, request, options: options);
  }

  /// References & Qualifications Lists
  $grpc.ResponseFuture<$0.ListEmployerReferencesResponse>
      listEmployerReferences(
    $0.ListEmployerReferencesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listEmployerReferences, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListQualificationsResponse> listQualifications(
    $0.ListQualificationsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listQualifications, request, options: options);
  }

  /// Device Change Management
  $grpc.ResponseFuture<$0.ListDeviceChangeRequestsResponse>
      listDeviceChangeRequests(
    $0.ListDeviceChangeRequestsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDeviceChangeRequests, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.DecideDeviceChangeResponse> decideDeviceChange(
    $0.DecideDeviceChangeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$decideDeviceChange, request, options: options);
  }

  /// PRE-WIRED (frontend contract, backend to implement). The worker asks HR for
  /// a new phone FROM THE PHONE BOUND NOW. RegisterDevice from the new phone then
  /// matches the open request: no colour change. A new phone without a request
  /// makes the worker YELLOW.
  $grpc.ResponseFuture<$0.RequestDeviceSwapResponse> requestDeviceSwap(
    $0.RequestDeviceSwapRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$requestDeviceSwap, request, options: options);
  }

  /// PRE-WIRED. What the backend holds for this phone, so the app picks its
  /// screen and an old phone signs itself out after an approved swap.
  $grpc.ResponseFuture<$0.GetMyDeviceStatusResponse> getMyDeviceStatus(
    $0.GetMyDeviceStatusRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getMyDeviceStatus, request, options: options);
  }

  /// PRE-WIRED. Shift check-in, done on the bound phone right after a face
  /// check. The backend accepts it only when this worker's latest liveness
  /// result is PASS and under 2 minutes old (FAILED_PRECONDITION otherwise), so
  /// a lent phone cannot start someone else's shift.
  $grpc.ResponseFuture<$0.StartShiftResponse> startShift(
    $0.StartShiftRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$startShift, request, options: options);
  }

  $grpc.ResponseFuture<$0.EndShiftResponse> endShift(
    $0.EndShiftRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$endShift, request, options: options);
  }

  /// Subcontractor Portal
  $grpc.ResponseFuture<$0.SubmitDeploymentListResponse> submitDeploymentList(
    $0.SubmitDeploymentListRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$submitDeploymentList, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListSubcontractorWorkforceResponse>
      listSubcontractorWorkforce(
    $0.ListSubcontractorWorkforceRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listSubcontractorWorkforce, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetDeploymentValidationResponse>
      getDeploymentValidation(
    $0.GetDeploymentValidationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDeploymentValidation, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListDeploymentsResponse> listDeployments(
    $0.ListDeploymentsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDeployments, request, options: options);
  }

  $grpc.ResponseFuture<$0.SendSubcontractorMessageResponse>
      sendSubcontractorMessage(
    $0.SendSubcontractorMessageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendSubcontractorMessage, request,
        options: options);
  }

  /// Reminders & Worker Actions
  $grpc.ResponseFuture<$0.SendDocumentReminderResponse> sendDocumentReminder(
    $0.SendDocumentReminderRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendDocumentReminder, request, options: options);
  }

  $grpc.ResponseFuture<$0.AdjudicateWorkerResponse> adjudicateWorker(
    $0.AdjudicateWorkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$adjudicateWorker, request, options: options);
  }

  $grpc.ResponseFuture<$0.EscalateWorkerResponse> escalateWorker(
    $0.EscalateWorkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$escalateWorker, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveWorkerFromTenantResponse>
      removeWorkerFromTenant(
    $0.RemoveWorkerFromTenantRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeWorkerFromTenant, request,
        options: options);
  }

  /// Device inventory + telemetry for the devices tab.
  $grpc.ResponseFuture<$0.ListDevicesResponse> listDevices(
    $0.ListDevicesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDevices, request, options: options);
  }

  /// Device signal batches (telemetry audit events) for a tenant.
  $grpc.ResponseFuture<$0.ListDeviceSignalBatchesResponse>
      listDeviceSignalBatches(
    $0.ListDeviceSignalBatchesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDeviceSignalBatches, request,
        options: options);
  }

  /// Bulk-check a list of worker identifiers (uuid or name) against the tenant.
  $grpc.ResponseFuture<$0.ValidateWorkersResponse> validateWorkers(
    $0.ValidateWorkersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$validateWorkers, request, options: options);
  }

  /// Re-trigger the background-check workflows for a worker.
  $grpc.ResponseFuture<$0.RerunBackgroundChecksResponse> rerunBackgroundChecks(
    $0.RerunBackgroundChecksRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$rerunBackgroundChecks, request, options: options);
  }

  /// Soft Delete & Restore
  /// Soft-delete a worker (reversible; stamps deleted_at/deleted_by/deletion_reason).
  $grpc.ResponseFuture<$0.DeleteWorkerResponse> deleteWorker(
    $0.DeleteWorkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteWorker, request, options: options);
  }

  /// Restore a soft-deleted worker.
  $grpc.ResponseFuture<$0.RestoreWorkerResponse> restoreWorker(
    $0.RestoreWorkerRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$restoreWorker, request, options: options);
  }

  /// List soft-deleted workers for a tenant.
  $grpc.ResponseFuture<$0.ListDeletedWorkersResponse> listDeletedWorkers(
    $0.ListDeletedWorkersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDeletedWorkers, request, options: options);
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
  static final _$inviteDirectoryUsers = $grpc.ClientMethod<
          $0.InviteDirectoryUsersRequest, $0.InviteDirectoryUsersResponse>(
      '/worker.v1.WorkerService/InviteDirectoryUsers',
      ($0.InviteDirectoryUsersRequest value) => value.writeToBuffer(),
      $0.InviteDirectoryUsersResponse.fromBuffer);
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
  static final _$registerPushToken = $grpc.ClientMethod<
          $0.RegisterPushTokenRequest, $0.RegisterPushTokenResponse>(
      '/worker.v1.WorkerService/RegisterPushToken',
      ($0.RegisterPushTokenRequest value) => value.writeToBuffer(),
      $0.RegisterPushTokenResponse.fromBuffer);
  static final _$provisionPushTarget = $grpc.ClientMethod<
          $0.ProvisionPushTargetRequest, $0.ProvisionPushTargetResponse>(
      '/worker.v1.WorkerService/ProvisionPushTarget',
      ($0.ProvisionPushTargetRequest value) => value.writeToBuffer(),
      $0.ProvisionPushTargetResponse.fromBuffer);
  static final _$createSubcontractor = $grpc.ClientMethod<
          $0.CreateSubcontractorRequest, $0.CreateSubcontractorResponse>(
      '/worker.v1.WorkerService/CreateSubcontractor',
      ($0.CreateSubcontractorRequest value) => value.writeToBuffer(),
      $0.CreateSubcontractorResponse.fromBuffer);
  static final _$listSubcontractors = $grpc.ClientMethod<
          $0.ListSubcontractorsRequest, $0.ListSubcontractorsResponse>(
      '/worker.v1.WorkerService/ListSubcontractors',
      ($0.ListSubcontractorsRequest value) => value.writeToBuffer(),
      $0.ListSubcontractorsResponse.fromBuffer);
  static final _$listInvitations =
      $grpc.ClientMethod<$0.ListInvitationsRequest, $0.ListInvitationsResponse>(
          '/worker.v1.WorkerService/ListInvitations',
          ($0.ListInvitationsRequest value) => value.writeToBuffer(),
          $0.ListInvitationsResponse.fromBuffer);
  static final _$generateInvitationBatchUploadURL = $grpc.ClientMethod<
          $0.GenerateInvitationBatchUploadURLRequest,
          $0.GenerateInvitationBatchUploadURLResponse>(
      '/worker.v1.WorkerService/GenerateInvitationBatchUploadURL',
      ($0.GenerateInvitationBatchUploadURLRequest value) =>
          value.writeToBuffer(),
      $0.GenerateInvitationBatchUploadURLResponse.fromBuffer);
  static final _$startInvitationBatch = $grpc.ClientMethod<
          $0.StartInvitationBatchRequest, $0.StartInvitationBatchResponse>(
      '/worker.v1.WorkerService/StartInvitationBatch',
      ($0.StartInvitationBatchRequest value) => value.writeToBuffer(),
      $0.StartInvitationBatchResponse.fromBuffer);
  static final _$getInvitationBatchStatus = $grpc.ClientMethod<
          $0.GetInvitationBatchStatusRequest,
          $0.GetInvitationBatchStatusResponse>(
      '/worker.v1.WorkerService/GetInvitationBatchStatus',
      ($0.GetInvitationBatchStatusRequest value) => value.writeToBuffer(),
      $0.GetInvitationBatchStatusResponse.fromBuffer);
  static final _$listInvitationBatches = $grpc.ClientMethod<
          $0.ListInvitationBatchesRequest, $0.ListInvitationBatchesResponse>(
      '/worker.v1.WorkerService/ListInvitationBatches',
      ($0.ListInvitationBatchesRequest value) => value.writeToBuffer(),
      $0.ListInvitationBatchesResponse.fromBuffer);
  static final _$listEmployerReferences = $grpc.ClientMethod<
          $0.ListEmployerReferencesRequest, $0.ListEmployerReferencesResponse>(
      '/worker.v1.WorkerService/ListEmployerReferences',
      ($0.ListEmployerReferencesRequest value) => value.writeToBuffer(),
      $0.ListEmployerReferencesResponse.fromBuffer);
  static final _$listQualifications = $grpc.ClientMethod<
          $0.ListQualificationsRequest, $0.ListQualificationsResponse>(
      '/worker.v1.WorkerService/ListQualifications',
      ($0.ListQualificationsRequest value) => value.writeToBuffer(),
      $0.ListQualificationsResponse.fromBuffer);
  static final _$listDeviceChangeRequests = $grpc.ClientMethod<
          $0.ListDeviceChangeRequestsRequest,
          $0.ListDeviceChangeRequestsResponse>(
      '/worker.v1.WorkerService/ListDeviceChangeRequests',
      ($0.ListDeviceChangeRequestsRequest value) => value.writeToBuffer(),
      $0.ListDeviceChangeRequestsResponse.fromBuffer);
  static final _$decideDeviceChange = $grpc.ClientMethod<
          $0.DecideDeviceChangeRequest, $0.DecideDeviceChangeResponse>(
      '/worker.v1.WorkerService/DecideDeviceChange',
      ($0.DecideDeviceChangeRequest value) => value.writeToBuffer(),
      $0.DecideDeviceChangeResponse.fromBuffer);
  static final _$requestDeviceSwap = $grpc.ClientMethod<
          $0.RequestDeviceSwapRequest, $0.RequestDeviceSwapResponse>(
      '/worker.v1.WorkerService/RequestDeviceSwap',
      ($0.RequestDeviceSwapRequest value) => value.writeToBuffer(),
      $0.RequestDeviceSwapResponse.fromBuffer);
  static final _$getMyDeviceStatus = $grpc.ClientMethod<
          $0.GetMyDeviceStatusRequest, $0.GetMyDeviceStatusResponse>(
      '/worker.v1.WorkerService/GetMyDeviceStatus',
      ($0.GetMyDeviceStatusRequest value) => value.writeToBuffer(),
      $0.GetMyDeviceStatusResponse.fromBuffer);
  static final _$startShift =
      $grpc.ClientMethod<$0.StartShiftRequest, $0.StartShiftResponse>(
          '/worker.v1.WorkerService/StartShift',
          ($0.StartShiftRequest value) => value.writeToBuffer(),
          $0.StartShiftResponse.fromBuffer);
  static final _$endShift =
      $grpc.ClientMethod<$0.EndShiftRequest, $0.EndShiftResponse>(
          '/worker.v1.WorkerService/EndShift',
          ($0.EndShiftRequest value) => value.writeToBuffer(),
          $0.EndShiftResponse.fromBuffer);
  static final _$submitDeploymentList = $grpc.ClientMethod<
          $0.SubmitDeploymentListRequest, $0.SubmitDeploymentListResponse>(
      '/worker.v1.WorkerService/SubmitDeploymentList',
      ($0.SubmitDeploymentListRequest value) => value.writeToBuffer(),
      $0.SubmitDeploymentListResponse.fromBuffer);
  static final _$listSubcontractorWorkforce = $grpc.ClientMethod<
          $0.ListSubcontractorWorkforceRequest,
          $0.ListSubcontractorWorkforceResponse>(
      '/worker.v1.WorkerService/ListSubcontractorWorkforce',
      ($0.ListSubcontractorWorkforceRequest value) => value.writeToBuffer(),
      $0.ListSubcontractorWorkforceResponse.fromBuffer);
  static final _$getDeploymentValidation = $grpc.ClientMethod<
          $0.GetDeploymentValidationRequest,
          $0.GetDeploymentValidationResponse>(
      '/worker.v1.WorkerService/GetDeploymentValidation',
      ($0.GetDeploymentValidationRequest value) => value.writeToBuffer(),
      $0.GetDeploymentValidationResponse.fromBuffer);
  static final _$listDeployments =
      $grpc.ClientMethod<$0.ListDeploymentsRequest, $0.ListDeploymentsResponse>(
          '/worker.v1.WorkerService/ListDeployments',
          ($0.ListDeploymentsRequest value) => value.writeToBuffer(),
          $0.ListDeploymentsResponse.fromBuffer);
  static final _$sendSubcontractorMessage = $grpc.ClientMethod<
          $0.SendSubcontractorMessageRequest,
          $0.SendSubcontractorMessageResponse>(
      '/worker.v1.WorkerService/SendSubcontractorMessage',
      ($0.SendSubcontractorMessageRequest value) => value.writeToBuffer(),
      $0.SendSubcontractorMessageResponse.fromBuffer);
  static final _$sendDocumentReminder = $grpc.ClientMethod<
          $0.SendDocumentReminderRequest, $0.SendDocumentReminderResponse>(
      '/worker.v1.WorkerService/SendDocumentReminder',
      ($0.SendDocumentReminderRequest value) => value.writeToBuffer(),
      $0.SendDocumentReminderResponse.fromBuffer);
  static final _$adjudicateWorker = $grpc.ClientMethod<
          $0.AdjudicateWorkerRequest, $0.AdjudicateWorkerResponse>(
      '/worker.v1.WorkerService/AdjudicateWorker',
      ($0.AdjudicateWorkerRequest value) => value.writeToBuffer(),
      $0.AdjudicateWorkerResponse.fromBuffer);
  static final _$escalateWorker =
      $grpc.ClientMethod<$0.EscalateWorkerRequest, $0.EscalateWorkerResponse>(
          '/worker.v1.WorkerService/EscalateWorker',
          ($0.EscalateWorkerRequest value) => value.writeToBuffer(),
          $0.EscalateWorkerResponse.fromBuffer);
  static final _$removeWorkerFromTenant = $grpc.ClientMethod<
          $0.RemoveWorkerFromTenantRequest, $0.RemoveWorkerFromTenantResponse>(
      '/worker.v1.WorkerService/RemoveWorkerFromTenant',
      ($0.RemoveWorkerFromTenantRequest value) => value.writeToBuffer(),
      $0.RemoveWorkerFromTenantResponse.fromBuffer);
  static final _$listDevices =
      $grpc.ClientMethod<$0.ListDevicesRequest, $0.ListDevicesResponse>(
          '/worker.v1.WorkerService/ListDevices',
          ($0.ListDevicesRequest value) => value.writeToBuffer(),
          $0.ListDevicesResponse.fromBuffer);
  static final _$listDeviceSignalBatches = $grpc.ClientMethod<
          $0.ListDeviceSignalBatchesRequest,
          $0.ListDeviceSignalBatchesResponse>(
      '/worker.v1.WorkerService/ListDeviceSignalBatches',
      ($0.ListDeviceSignalBatchesRequest value) => value.writeToBuffer(),
      $0.ListDeviceSignalBatchesResponse.fromBuffer);
  static final _$validateWorkers =
      $grpc.ClientMethod<$0.ValidateWorkersRequest, $0.ValidateWorkersResponse>(
          '/worker.v1.WorkerService/ValidateWorkers',
          ($0.ValidateWorkersRequest value) => value.writeToBuffer(),
          $0.ValidateWorkersResponse.fromBuffer);
  static final _$rerunBackgroundChecks = $grpc.ClientMethod<
          $0.RerunBackgroundChecksRequest, $0.RerunBackgroundChecksResponse>(
      '/worker.v1.WorkerService/RerunBackgroundChecks',
      ($0.RerunBackgroundChecksRequest value) => value.writeToBuffer(),
      $0.RerunBackgroundChecksResponse.fromBuffer);
  static final _$deleteWorker =
      $grpc.ClientMethod<$0.DeleteWorkerRequest, $0.DeleteWorkerResponse>(
          '/worker.v1.WorkerService/DeleteWorker',
          ($0.DeleteWorkerRequest value) => value.writeToBuffer(),
          $0.DeleteWorkerResponse.fromBuffer);
  static final _$restoreWorker =
      $grpc.ClientMethod<$0.RestoreWorkerRequest, $0.RestoreWorkerResponse>(
          '/worker.v1.WorkerService/RestoreWorker',
          ($0.RestoreWorkerRequest value) => value.writeToBuffer(),
          $0.RestoreWorkerResponse.fromBuffer);
  static final _$listDeletedWorkers = $grpc.ClientMethod<
          $0.ListDeletedWorkersRequest, $0.ListDeletedWorkersResponse>(
      '/worker.v1.WorkerService/ListDeletedWorkers',
      ($0.ListDeletedWorkersRequest value) => value.writeToBuffer(),
      $0.ListDeletedWorkersResponse.fromBuffer);
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
    $addMethod($grpc.ServiceMethod<$0.InviteDirectoryUsersRequest,
            $0.InviteDirectoryUsersResponse>(
        'InviteDirectoryUsers',
        inviteDirectoryUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InviteDirectoryUsersRequest.fromBuffer(value),
        ($0.InviteDirectoryUsersResponse value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.RegisterPushTokenRequest,
            $0.RegisterPushTokenResponse>(
        'RegisterPushToken',
        registerPushToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterPushTokenRequest.fromBuffer(value),
        ($0.RegisterPushTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProvisionPushTargetRequest,
            $0.ProvisionPushTargetResponse>(
        'ProvisionPushTarget',
        provisionPushTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ProvisionPushTargetRequest.fromBuffer(value),
        ($0.ProvisionPushTargetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateSubcontractorRequest,
            $0.CreateSubcontractorResponse>(
        'CreateSubcontractor',
        createSubcontractor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateSubcontractorRequest.fromBuffer(value),
        ($0.CreateSubcontractorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListSubcontractorsRequest,
            $0.ListSubcontractorsResponse>(
        'ListSubcontractors',
        listSubcontractors_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListSubcontractorsRequest.fromBuffer(value),
        ($0.ListSubcontractorsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListInvitationsRequest,
            $0.ListInvitationsResponse>(
        'ListInvitations',
        listInvitations_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListInvitationsRequest.fromBuffer(value),
        ($0.ListInvitationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GenerateInvitationBatchUploadURLRequest,
            $0.GenerateInvitationBatchUploadURLResponse>(
        'GenerateInvitationBatchUploadURL',
        generateInvitationBatchUploadURL_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GenerateInvitationBatchUploadURLRequest.fromBuffer(value),
        ($0.GenerateInvitationBatchUploadURLResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartInvitationBatchRequest,
            $0.StartInvitationBatchResponse>(
        'StartInvitationBatch',
        startInvitationBatch_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.StartInvitationBatchRequest.fromBuffer(value),
        ($0.StartInvitationBatchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInvitationBatchStatusRequest,
            $0.GetInvitationBatchStatusResponse>(
        'GetInvitationBatchStatus',
        getInvitationBatchStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetInvitationBatchStatusRequest.fromBuffer(value),
        ($0.GetInvitationBatchStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListInvitationBatchesRequest,
            $0.ListInvitationBatchesResponse>(
        'ListInvitationBatches',
        listInvitationBatches_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListInvitationBatchesRequest.fromBuffer(value),
        ($0.ListInvitationBatchesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListEmployerReferencesRequest,
            $0.ListEmployerReferencesResponse>(
        'ListEmployerReferences',
        listEmployerReferences_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListEmployerReferencesRequest.fromBuffer(value),
        ($0.ListEmployerReferencesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListQualificationsRequest,
            $0.ListQualificationsResponse>(
        'ListQualifications',
        listQualifications_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListQualificationsRequest.fromBuffer(value),
        ($0.ListQualificationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDeviceChangeRequestsRequest,
            $0.ListDeviceChangeRequestsResponse>(
        'ListDeviceChangeRequests',
        listDeviceChangeRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDeviceChangeRequestsRequest.fromBuffer(value),
        ($0.ListDeviceChangeRequestsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DecideDeviceChangeRequest,
            $0.DecideDeviceChangeResponse>(
        'DecideDeviceChange',
        decideDeviceChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DecideDeviceChangeRequest.fromBuffer(value),
        ($0.DecideDeviceChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestDeviceSwapRequest,
            $0.RequestDeviceSwapResponse>(
        'RequestDeviceSwap',
        requestDeviceSwap_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestDeviceSwapRequest.fromBuffer(value),
        ($0.RequestDeviceSwapResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMyDeviceStatusRequest,
            $0.GetMyDeviceStatusResponse>(
        'GetMyDeviceStatus',
        getMyDeviceStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetMyDeviceStatusRequest.fromBuffer(value),
        ($0.GetMyDeviceStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartShiftRequest, $0.StartShiftResponse>(
        'StartShift',
        startShift_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StartShiftRequest.fromBuffer(value),
        ($0.StartShiftResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EndShiftRequest, $0.EndShiftResponse>(
        'EndShift',
        endShift_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EndShiftRequest.fromBuffer(value),
        ($0.EndShiftResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SubmitDeploymentListRequest,
            $0.SubmitDeploymentListResponse>(
        'SubmitDeploymentList',
        submitDeploymentList_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SubmitDeploymentListRequest.fromBuffer(value),
        ($0.SubmitDeploymentListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListSubcontractorWorkforceRequest,
            $0.ListSubcontractorWorkforceResponse>(
        'ListSubcontractorWorkforce',
        listSubcontractorWorkforce_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListSubcontractorWorkforceRequest.fromBuffer(value),
        ($0.ListSubcontractorWorkforceResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDeploymentValidationRequest,
            $0.GetDeploymentValidationResponse>(
        'GetDeploymentValidation',
        getDeploymentValidation_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetDeploymentValidationRequest.fromBuffer(value),
        ($0.GetDeploymentValidationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDeploymentsRequest,
            $0.ListDeploymentsResponse>(
        'ListDeployments',
        listDeployments_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDeploymentsRequest.fromBuffer(value),
        ($0.ListDeploymentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendSubcontractorMessageRequest,
            $0.SendSubcontractorMessageResponse>(
        'SendSubcontractorMessage',
        sendSubcontractorMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendSubcontractorMessageRequest.fromBuffer(value),
        ($0.SendSubcontractorMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendDocumentReminderRequest,
            $0.SendDocumentReminderResponse>(
        'SendDocumentReminder',
        sendDocumentReminder_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendDocumentReminderRequest.fromBuffer(value),
        ($0.SendDocumentReminderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AdjudicateWorkerRequest,
            $0.AdjudicateWorkerResponse>(
        'AdjudicateWorker',
        adjudicateWorker_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AdjudicateWorkerRequest.fromBuffer(value),
        ($0.AdjudicateWorkerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EscalateWorkerRequest,
            $0.EscalateWorkerResponse>(
        'EscalateWorker',
        escalateWorker_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.EscalateWorkerRequest.fromBuffer(value),
        ($0.EscalateWorkerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveWorkerFromTenantRequest,
            $0.RemoveWorkerFromTenantResponse>(
        'RemoveWorkerFromTenant',
        removeWorkerFromTenant_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveWorkerFromTenantRequest.fromBuffer(value),
        ($0.RemoveWorkerFromTenantResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListDevicesRequest, $0.ListDevicesResponse>(
            'ListDevices',
            listDevices_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListDevicesRequest.fromBuffer(value),
            ($0.ListDevicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDeviceSignalBatchesRequest,
            $0.ListDeviceSignalBatchesResponse>(
        'ListDeviceSignalBatches',
        listDeviceSignalBatches_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDeviceSignalBatchesRequest.fromBuffer(value),
        ($0.ListDeviceSignalBatchesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ValidateWorkersRequest,
            $0.ValidateWorkersResponse>(
        'ValidateWorkers',
        validateWorkers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ValidateWorkersRequest.fromBuffer(value),
        ($0.ValidateWorkersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RerunBackgroundChecksRequest,
            $0.RerunBackgroundChecksResponse>(
        'RerunBackgroundChecks',
        rerunBackgroundChecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RerunBackgroundChecksRequest.fromBuffer(value),
        ($0.RerunBackgroundChecksResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeleteWorkerRequest, $0.DeleteWorkerResponse>(
            'DeleteWorker',
            deleteWorker_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeleteWorkerRequest.fromBuffer(value),
            ($0.DeleteWorkerResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.RestoreWorkerRequest, $0.RestoreWorkerResponse>(
            'RestoreWorker',
            restoreWorker_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.RestoreWorkerRequest.fromBuffer(value),
            ($0.RestoreWorkerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDeletedWorkersRequest,
            $0.ListDeletedWorkersResponse>(
        'ListDeletedWorkers',
        listDeletedWorkers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDeletedWorkersRequest.fromBuffer(value),
        ($0.ListDeletedWorkersResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.InviteDirectoryUsersResponse> inviteDirectoryUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.InviteDirectoryUsersRequest> $request) async {
    return inviteDirectoryUsers($call, await $request);
  }

  $async.Future<$0.InviteDirectoryUsersResponse> inviteDirectoryUsers(
      $grpc.ServiceCall call, $0.InviteDirectoryUsersRequest request);

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

  $async.Future<$0.RegisterPushTokenResponse> registerPushToken_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RegisterPushTokenRequest> $request) async {
    return registerPushToken($call, await $request);
  }

  $async.Future<$0.RegisterPushTokenResponse> registerPushToken(
      $grpc.ServiceCall call, $0.RegisterPushTokenRequest request);

  $async.Future<$0.ProvisionPushTargetResponse> provisionPushTarget_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ProvisionPushTargetRequest> $request) async {
    return provisionPushTarget($call, await $request);
  }

  $async.Future<$0.ProvisionPushTargetResponse> provisionPushTarget(
      $grpc.ServiceCall call, $0.ProvisionPushTargetRequest request);

  $async.Future<$0.CreateSubcontractorResponse> createSubcontractor_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateSubcontractorRequest> $request) async {
    return createSubcontractor($call, await $request);
  }

  $async.Future<$0.CreateSubcontractorResponse> createSubcontractor(
      $grpc.ServiceCall call, $0.CreateSubcontractorRequest request);

  $async.Future<$0.ListSubcontractorsResponse> listSubcontractors_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListSubcontractorsRequest> $request) async {
    return listSubcontractors($call, await $request);
  }

  $async.Future<$0.ListSubcontractorsResponse> listSubcontractors(
      $grpc.ServiceCall call, $0.ListSubcontractorsRequest request);

  $async.Future<$0.ListInvitationsResponse> listInvitations_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListInvitationsRequest> $request) async {
    return listInvitations($call, await $request);
  }

  $async.Future<$0.ListInvitationsResponse> listInvitations(
      $grpc.ServiceCall call, $0.ListInvitationsRequest request);

  $async.Future<$0.GenerateInvitationBatchUploadURLResponse>
      generateInvitationBatchUploadURL_Pre(
          $grpc.ServiceCall $call,
          $async.Future<$0.GenerateInvitationBatchUploadURLRequest>
              $request) async {
    return generateInvitationBatchUploadURL($call, await $request);
  }

  $async.Future<$0.GenerateInvitationBatchUploadURLResponse>
      generateInvitationBatchUploadURL($grpc.ServiceCall call,
          $0.GenerateInvitationBatchUploadURLRequest request);

  $async.Future<$0.StartInvitationBatchResponse> startInvitationBatch_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.StartInvitationBatchRequest> $request) async {
    return startInvitationBatch($call, await $request);
  }

  $async.Future<$0.StartInvitationBatchResponse> startInvitationBatch(
      $grpc.ServiceCall call, $0.StartInvitationBatchRequest request);

  $async.Future<$0.GetInvitationBatchStatusResponse>
      getInvitationBatchStatus_Pre($grpc.ServiceCall $call,
          $async.Future<$0.GetInvitationBatchStatusRequest> $request) async {
    return getInvitationBatchStatus($call, await $request);
  }

  $async.Future<$0.GetInvitationBatchStatusResponse> getInvitationBatchStatus(
      $grpc.ServiceCall call, $0.GetInvitationBatchStatusRequest request);

  $async.Future<$0.ListInvitationBatchesResponse> listInvitationBatches_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListInvitationBatchesRequest> $request) async {
    return listInvitationBatches($call, await $request);
  }

  $async.Future<$0.ListInvitationBatchesResponse> listInvitationBatches(
      $grpc.ServiceCall call, $0.ListInvitationBatchesRequest request);

  $async.Future<$0.ListEmployerReferencesResponse> listEmployerReferences_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListEmployerReferencesRequest> $request) async {
    return listEmployerReferences($call, await $request);
  }

  $async.Future<$0.ListEmployerReferencesResponse> listEmployerReferences(
      $grpc.ServiceCall call, $0.ListEmployerReferencesRequest request);

  $async.Future<$0.ListQualificationsResponse> listQualifications_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListQualificationsRequest> $request) async {
    return listQualifications($call, await $request);
  }

  $async.Future<$0.ListQualificationsResponse> listQualifications(
      $grpc.ServiceCall call, $0.ListQualificationsRequest request);

  $async.Future<$0.ListDeviceChangeRequestsResponse>
      listDeviceChangeRequests_Pre($grpc.ServiceCall $call,
          $async.Future<$0.ListDeviceChangeRequestsRequest> $request) async {
    return listDeviceChangeRequests($call, await $request);
  }

  $async.Future<$0.ListDeviceChangeRequestsResponse> listDeviceChangeRequests(
      $grpc.ServiceCall call, $0.ListDeviceChangeRequestsRequest request);

  $async.Future<$0.DecideDeviceChangeResponse> decideDeviceChange_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DecideDeviceChangeRequest> $request) async {
    return decideDeviceChange($call, await $request);
  }

  $async.Future<$0.DecideDeviceChangeResponse> decideDeviceChange(
      $grpc.ServiceCall call, $0.DecideDeviceChangeRequest request);

  $async.Future<$0.RequestDeviceSwapResponse> requestDeviceSwap_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RequestDeviceSwapRequest> $request) async {
    return requestDeviceSwap($call, await $request);
  }

  $async.Future<$0.RequestDeviceSwapResponse> requestDeviceSwap(
      $grpc.ServiceCall call, $0.RequestDeviceSwapRequest request);

  $async.Future<$0.GetMyDeviceStatusResponse> getMyDeviceStatus_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetMyDeviceStatusRequest> $request) async {
    return getMyDeviceStatus($call, await $request);
  }

  $async.Future<$0.GetMyDeviceStatusResponse> getMyDeviceStatus(
      $grpc.ServiceCall call, $0.GetMyDeviceStatusRequest request);

  $async.Future<$0.StartShiftResponse> startShift_Pre($grpc.ServiceCall $call,
      $async.Future<$0.StartShiftRequest> $request) async {
    return startShift($call, await $request);
  }

  $async.Future<$0.StartShiftResponse> startShift(
      $grpc.ServiceCall call, $0.StartShiftRequest request);

  $async.Future<$0.EndShiftResponse> endShift_Pre($grpc.ServiceCall $call,
      $async.Future<$0.EndShiftRequest> $request) async {
    return endShift($call, await $request);
  }

  $async.Future<$0.EndShiftResponse> endShift(
      $grpc.ServiceCall call, $0.EndShiftRequest request);

  $async.Future<$0.SubmitDeploymentListResponse> submitDeploymentList_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SubmitDeploymentListRequest> $request) async {
    return submitDeploymentList($call, await $request);
  }

  $async.Future<$0.SubmitDeploymentListResponse> submitDeploymentList(
      $grpc.ServiceCall call, $0.SubmitDeploymentListRequest request);

  $async.Future<$0.ListSubcontractorWorkforceResponse>
      listSubcontractorWorkforce_Pre($grpc.ServiceCall $call,
          $async.Future<$0.ListSubcontractorWorkforceRequest> $request) async {
    return listSubcontractorWorkforce($call, await $request);
  }

  $async.Future<$0.ListSubcontractorWorkforceResponse>
      listSubcontractorWorkforce(
          $grpc.ServiceCall call, $0.ListSubcontractorWorkforceRequest request);

  $async.Future<$0.GetDeploymentValidationResponse> getDeploymentValidation_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetDeploymentValidationRequest> $request) async {
    return getDeploymentValidation($call, await $request);
  }

  $async.Future<$0.GetDeploymentValidationResponse> getDeploymentValidation(
      $grpc.ServiceCall call, $0.GetDeploymentValidationRequest request);

  $async.Future<$0.ListDeploymentsResponse> listDeployments_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDeploymentsRequest> $request) async {
    return listDeployments($call, await $request);
  }

  $async.Future<$0.ListDeploymentsResponse> listDeployments(
      $grpc.ServiceCall call, $0.ListDeploymentsRequest request);

  $async.Future<$0.SendSubcontractorMessageResponse>
      sendSubcontractorMessage_Pre($grpc.ServiceCall $call,
          $async.Future<$0.SendSubcontractorMessageRequest> $request) async {
    return sendSubcontractorMessage($call, await $request);
  }

  $async.Future<$0.SendSubcontractorMessageResponse> sendSubcontractorMessage(
      $grpc.ServiceCall call, $0.SendSubcontractorMessageRequest request);

  $async.Future<$0.SendDocumentReminderResponse> sendDocumentReminder_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SendDocumentReminderRequest> $request) async {
    return sendDocumentReminder($call, await $request);
  }

  $async.Future<$0.SendDocumentReminderResponse> sendDocumentReminder(
      $grpc.ServiceCall call, $0.SendDocumentReminderRequest request);

  $async.Future<$0.AdjudicateWorkerResponse> adjudicateWorker_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.AdjudicateWorkerRequest> $request) async {
    return adjudicateWorker($call, await $request);
  }

  $async.Future<$0.AdjudicateWorkerResponse> adjudicateWorker(
      $grpc.ServiceCall call, $0.AdjudicateWorkerRequest request);

  $async.Future<$0.EscalateWorkerResponse> escalateWorker_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.EscalateWorkerRequest> $request) async {
    return escalateWorker($call, await $request);
  }

  $async.Future<$0.EscalateWorkerResponse> escalateWorker(
      $grpc.ServiceCall call, $0.EscalateWorkerRequest request);

  $async.Future<$0.RemoveWorkerFromTenantResponse> removeWorkerFromTenant_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RemoveWorkerFromTenantRequest> $request) async {
    return removeWorkerFromTenant($call, await $request);
  }

  $async.Future<$0.RemoveWorkerFromTenantResponse> removeWorkerFromTenant(
      $grpc.ServiceCall call, $0.RemoveWorkerFromTenantRequest request);

  $async.Future<$0.ListDevicesResponse> listDevices_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListDevicesRequest> $request) async {
    return listDevices($call, await $request);
  }

  $async.Future<$0.ListDevicesResponse> listDevices(
      $grpc.ServiceCall call, $0.ListDevicesRequest request);

  $async.Future<$0.ListDeviceSignalBatchesResponse> listDeviceSignalBatches_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDeviceSignalBatchesRequest> $request) async {
    return listDeviceSignalBatches($call, await $request);
  }

  $async.Future<$0.ListDeviceSignalBatchesResponse> listDeviceSignalBatches(
      $grpc.ServiceCall call, $0.ListDeviceSignalBatchesRequest request);

  $async.Future<$0.ValidateWorkersResponse> validateWorkers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ValidateWorkersRequest> $request) async {
    return validateWorkers($call, await $request);
  }

  $async.Future<$0.ValidateWorkersResponse> validateWorkers(
      $grpc.ServiceCall call, $0.ValidateWorkersRequest request);

  $async.Future<$0.RerunBackgroundChecksResponse> rerunBackgroundChecks_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RerunBackgroundChecksRequest> $request) async {
    return rerunBackgroundChecks($call, await $request);
  }

  $async.Future<$0.RerunBackgroundChecksResponse> rerunBackgroundChecks(
      $grpc.ServiceCall call, $0.RerunBackgroundChecksRequest request);

  $async.Future<$0.DeleteWorkerResponse> deleteWorker_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeleteWorkerRequest> $request) async {
    return deleteWorker($call, await $request);
  }

  $async.Future<$0.DeleteWorkerResponse> deleteWorker(
      $grpc.ServiceCall call, $0.DeleteWorkerRequest request);

  $async.Future<$0.RestoreWorkerResponse> restoreWorker_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RestoreWorkerRequest> $request) async {
    return restoreWorker($call, await $request);
  }

  $async.Future<$0.RestoreWorkerResponse> restoreWorker(
      $grpc.ServiceCall call, $0.RestoreWorkerRequest request);

  $async.Future<$0.ListDeletedWorkersResponse> listDeletedWorkers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDeletedWorkersRequest> $request) async {
    return listDeletedWorkers($call, await $request);
  }

  $async.Future<$0.ListDeletedWorkersResponse> listDeletedWorkers(
      $grpc.ServiceCall call, $0.ListDeletedWorkersRequest request);
}
