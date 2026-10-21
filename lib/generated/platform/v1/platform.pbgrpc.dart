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

  $grpc.ResponseFuture<$0.CheckPermissionResponse> checkPermission(
    $0.CheckPermissionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$checkPermission, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuditWriteResponse> auditWrite(
    $0.AuditWriteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$auditWrite, request, options: options);
  }

  $grpc.ResponseFuture<$0.GivePermissionResponse> givePermission(
    $0.GivePermissionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$givePermission, request, options: options);
  }

  $grpc.ResponseFuture<$0.OnboardTenantResponse> onboardTenant(
    $0.OnboardTenantRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$onboardTenant, request, options: options);
  }

  $grpc.ResponseFuture<$0.ForgotPasswordResponse> forgotPassword(
    $0.ForgotPasswordRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$forgotPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePasswordResponse> updatePassword(
    $0.UpdatePasswordRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updatePassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterWebhookEndpointResponse>
      registerWebhookEndpoint(
    $0.RegisterWebhookEndpointRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$registerWebhookEndpoint, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListWebhookEndpointsResponse> listWebhookEndpoints(
    $0.ListWebhookEndpointsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listWebhookEndpoints, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetHRIntegrationConfigResponse>
      getHRIntegrationConfig(
    $0.GetHRIntegrationConfigRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getHRIntegrationConfig, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.UpdateTenantConfigResponse> updateTenantConfig(
    $0.UpdateTenantConfigRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateTenantConfig, request, options: options);
  }

  /// Read the tenant's config document, so a dashboard can show what it is
  /// about to edit (e.g. institution_outreach_template) instead of overwriting
  /// it blind.
  $grpc.ResponseFuture<$0.GetTenantConfigResponse> getTenantConfig(
    $0.GetTenantConfigRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getTenantConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateRealmSettingsResponse> updateRealmSettings(
    $0.UpdateRealmSettingsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateRealmSettings, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateKeycloakUserResponse> createKeycloakUser(
    $0.CreateKeycloakUserRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createKeycloakUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.SetKeycloakUserAttributeResponse>
      setKeycloakUserAttribute(
    $0.SetKeycloakUserAttributeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setKeycloakUserAttribute, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListTenantsResponse> listTenants(
    $0.ListTenantsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTenants, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResolveRealmResponse> resolveRealm(
    $0.ResolveRealmRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resolveRealm, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExportAuditReportResponse> exportAuditReport(
    $0.ExportAuditReportRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$exportAuditReport, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExportWorkerAuditBundleResponse>
      exportWorkerAuditBundle(
    $0.ExportWorkerAuditBundleRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$exportWorkerAuditBundle, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListTenantUsersResponse> listTenantUsers(
    $0.ListTenantUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listTenantUsers, request, options: options);
  }

  /// Async report generation (US-036): request a report, poll for a presigned
  /// download. Generation runs on the platform-tasks Temporal queue.
  $grpc.ResponseFuture<$0.CreateReportResponse> createReport(
    $0.CreateReportRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createReport, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetReportResponse> getReport(
    $0.GetReportRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getReport, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListReportsResponse> listReports(
    $0.ListReportsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listReports, request, options: options);
  }

  /// Directory integration (LDAP / Azure AD / Entra ID) — configure, test, browse.
  $grpc.ResponseFuture<$0.UpsertDirectoryIntegrationResponse>
      upsertDirectoryIntegration(
    $0.UpsertDirectoryIntegrationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$upsertDirectoryIntegration, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.GetDirectoryIntegrationResponse>
      getDirectoryIntegration(
    $0.GetDirectoryIntegrationRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getDirectoryIntegration, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.TestDirectoryConnectionResponse>
      testDirectoryConnection(
    $0.TestDirectoryConnectionRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$testDirectoryConnection, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.ListDirectoryUsersResponse> listDirectoryUsers(
    $0.ListDirectoryUsersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listDirectoryUsers, request, options: options);
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
  static final _$checkPermission =
      $grpc.ClientMethod<$0.CheckPermissionRequest, $0.CheckPermissionResponse>(
          '/platform.v1.PlatformService/CheckPermission',
          ($0.CheckPermissionRequest value) => value.writeToBuffer(),
          $0.CheckPermissionResponse.fromBuffer);
  static final _$auditWrite =
      $grpc.ClientMethod<$0.AuditWriteRequest, $0.AuditWriteResponse>(
          '/platform.v1.PlatformService/AuditWrite',
          ($0.AuditWriteRequest value) => value.writeToBuffer(),
          $0.AuditWriteResponse.fromBuffer);
  static final _$givePermission =
      $grpc.ClientMethod<$0.GivePermissionRequest, $0.GivePermissionResponse>(
          '/platform.v1.PlatformService/GivePermission',
          ($0.GivePermissionRequest value) => value.writeToBuffer(),
          $0.GivePermissionResponse.fromBuffer);
  static final _$onboardTenant =
      $grpc.ClientMethod<$0.OnboardTenantRequest, $0.OnboardTenantResponse>(
          '/platform.v1.PlatformService/OnboardTenant',
          ($0.OnboardTenantRequest value) => value.writeToBuffer(),
          $0.OnboardTenantResponse.fromBuffer);
  static final _$forgotPassword =
      $grpc.ClientMethod<$0.ForgotPasswordRequest, $0.ForgotPasswordResponse>(
          '/platform.v1.PlatformService/ForgotPassword',
          ($0.ForgotPasswordRequest value) => value.writeToBuffer(),
          $0.ForgotPasswordResponse.fromBuffer);
  static final _$updatePassword =
      $grpc.ClientMethod<$0.UpdatePasswordRequest, $0.UpdatePasswordResponse>(
          '/platform.v1.PlatformService/UpdatePassword',
          ($0.UpdatePasswordRequest value) => value.writeToBuffer(),
          $0.UpdatePasswordResponse.fromBuffer);
  static final _$registerWebhookEndpoint = $grpc.ClientMethod<
          $0.RegisterWebhookEndpointRequest,
          $0.RegisterWebhookEndpointResponse>(
      '/platform.v1.PlatformService/RegisterWebhookEndpoint',
      ($0.RegisterWebhookEndpointRequest value) => value.writeToBuffer(),
      $0.RegisterWebhookEndpointResponse.fromBuffer);
  static final _$listWebhookEndpoints = $grpc.ClientMethod<
          $0.ListWebhookEndpointsRequest, $0.ListWebhookEndpointsResponse>(
      '/platform.v1.PlatformService/ListWebhookEndpoints',
      ($0.ListWebhookEndpointsRequest value) => value.writeToBuffer(),
      $0.ListWebhookEndpointsResponse.fromBuffer);
  static final _$getHRIntegrationConfig = $grpc.ClientMethod<
          $0.GetHRIntegrationConfigRequest, $0.GetHRIntegrationConfigResponse>(
      '/platform.v1.PlatformService/GetHRIntegrationConfig',
      ($0.GetHRIntegrationConfigRequest value) => value.writeToBuffer(),
      $0.GetHRIntegrationConfigResponse.fromBuffer);
  static final _$updateTenantConfig = $grpc.ClientMethod<
          $0.UpdateTenantConfigRequest, $0.UpdateTenantConfigResponse>(
      '/platform.v1.PlatformService/UpdateTenantConfig',
      ($0.UpdateTenantConfigRequest value) => value.writeToBuffer(),
      $0.UpdateTenantConfigResponse.fromBuffer);
  static final _$getTenantConfig =
      $grpc.ClientMethod<$0.GetTenantConfigRequest, $0.GetTenantConfigResponse>(
          '/platform.v1.PlatformService/GetTenantConfig',
          ($0.GetTenantConfigRequest value) => value.writeToBuffer(),
          $0.GetTenantConfigResponse.fromBuffer);
  static final _$updateRealmSettings = $grpc.ClientMethod<
          $0.UpdateRealmSettingsRequest, $0.UpdateRealmSettingsResponse>(
      '/platform.v1.PlatformService/UpdateRealmSettings',
      ($0.UpdateRealmSettingsRequest value) => value.writeToBuffer(),
      $0.UpdateRealmSettingsResponse.fromBuffer);
  static final _$createKeycloakUser = $grpc.ClientMethod<
          $0.CreateKeycloakUserRequest, $0.CreateKeycloakUserResponse>(
      '/platform.v1.PlatformService/CreateKeycloakUser',
      ($0.CreateKeycloakUserRequest value) => value.writeToBuffer(),
      $0.CreateKeycloakUserResponse.fromBuffer);
  static final _$setKeycloakUserAttribute = $grpc.ClientMethod<
          $0.SetKeycloakUserAttributeRequest,
          $0.SetKeycloakUserAttributeResponse>(
      '/platform.v1.PlatformService/SetKeycloakUserAttribute',
      ($0.SetKeycloakUserAttributeRequest value) => value.writeToBuffer(),
      $0.SetKeycloakUserAttributeResponse.fromBuffer);
  static final _$listTenants =
      $grpc.ClientMethod<$0.ListTenantsRequest, $0.ListTenantsResponse>(
          '/platform.v1.PlatformService/ListTenants',
          ($0.ListTenantsRequest value) => value.writeToBuffer(),
          $0.ListTenantsResponse.fromBuffer);
  static final _$resolveRealm =
      $grpc.ClientMethod<$0.ResolveRealmRequest, $0.ResolveRealmResponse>(
          '/platform.v1.PlatformService/ResolveRealm',
          ($0.ResolveRealmRequest value) => value.writeToBuffer(),
          $0.ResolveRealmResponse.fromBuffer);
  static final _$exportAuditReport = $grpc.ClientMethod<
          $0.ExportAuditReportRequest, $0.ExportAuditReportResponse>(
      '/platform.v1.PlatformService/ExportAuditReport',
      ($0.ExportAuditReportRequest value) => value.writeToBuffer(),
      $0.ExportAuditReportResponse.fromBuffer);
  static final _$exportWorkerAuditBundle = $grpc.ClientMethod<
          $0.ExportWorkerAuditBundleRequest,
          $0.ExportWorkerAuditBundleResponse>(
      '/platform.v1.PlatformService/ExportWorkerAuditBundle',
      ($0.ExportWorkerAuditBundleRequest value) => value.writeToBuffer(),
      $0.ExportWorkerAuditBundleResponse.fromBuffer);
  static final _$listTenantUsers =
      $grpc.ClientMethod<$0.ListTenantUsersRequest, $0.ListTenantUsersResponse>(
          '/platform.v1.PlatformService/ListTenantUsers',
          ($0.ListTenantUsersRequest value) => value.writeToBuffer(),
          $0.ListTenantUsersResponse.fromBuffer);
  static final _$createReport =
      $grpc.ClientMethod<$0.CreateReportRequest, $0.CreateReportResponse>(
          '/platform.v1.PlatformService/CreateReport',
          ($0.CreateReportRequest value) => value.writeToBuffer(),
          $0.CreateReportResponse.fromBuffer);
  static final _$getReport =
      $grpc.ClientMethod<$0.GetReportRequest, $0.GetReportResponse>(
          '/platform.v1.PlatformService/GetReport',
          ($0.GetReportRequest value) => value.writeToBuffer(),
          $0.GetReportResponse.fromBuffer);
  static final _$listReports =
      $grpc.ClientMethod<$0.ListReportsRequest, $0.ListReportsResponse>(
          '/platform.v1.PlatformService/ListReports',
          ($0.ListReportsRequest value) => value.writeToBuffer(),
          $0.ListReportsResponse.fromBuffer);
  static final _$upsertDirectoryIntegration = $grpc.ClientMethod<
          $0.UpsertDirectoryIntegrationRequest,
          $0.UpsertDirectoryIntegrationResponse>(
      '/platform.v1.PlatformService/UpsertDirectoryIntegration',
      ($0.UpsertDirectoryIntegrationRequest value) => value.writeToBuffer(),
      $0.UpsertDirectoryIntegrationResponse.fromBuffer);
  static final _$getDirectoryIntegration = $grpc.ClientMethod<
          $0.GetDirectoryIntegrationRequest,
          $0.GetDirectoryIntegrationResponse>(
      '/platform.v1.PlatformService/GetDirectoryIntegration',
      ($0.GetDirectoryIntegrationRequest value) => value.writeToBuffer(),
      $0.GetDirectoryIntegrationResponse.fromBuffer);
  static final _$testDirectoryConnection = $grpc.ClientMethod<
          $0.TestDirectoryConnectionRequest,
          $0.TestDirectoryConnectionResponse>(
      '/platform.v1.PlatformService/TestDirectoryConnection',
      ($0.TestDirectoryConnectionRequest value) => value.writeToBuffer(),
      $0.TestDirectoryConnectionResponse.fromBuffer);
  static final _$listDirectoryUsers = $grpc.ClientMethod<
          $0.ListDirectoryUsersRequest, $0.ListDirectoryUsersResponse>(
      '/platform.v1.PlatformService/ListDirectoryUsers',
      ($0.ListDirectoryUsersRequest value) => value.writeToBuffer(),
      $0.ListDirectoryUsersResponse.fromBuffer);
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
    $addMethod($grpc.ServiceMethod<$0.CheckPermissionRequest,
            $0.CheckPermissionResponse>(
        'CheckPermission',
        checkPermission_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CheckPermissionRequest.fromBuffer(value),
        ($0.CheckPermissionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuditWriteRequest, $0.AuditWriteResponse>(
        'AuditWrite',
        auditWrite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuditWriteRequest.fromBuffer(value),
        ($0.AuditWriteResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GivePermissionRequest,
            $0.GivePermissionResponse>(
        'GivePermission',
        givePermission_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GivePermissionRequest.fromBuffer(value),
        ($0.GivePermissionResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.OnboardTenantRequest, $0.OnboardTenantResponse>(
            'OnboardTenant',
            onboardTenant_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.OnboardTenantRequest.fromBuffer(value),
            ($0.OnboardTenantResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ForgotPasswordRequest,
            $0.ForgotPasswordResponse>(
        'ForgotPassword',
        forgotPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ForgotPasswordRequest.fromBuffer(value),
        ($0.ForgotPasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePasswordRequest,
            $0.UpdatePasswordResponse>(
        'UpdatePassword',
        updatePassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdatePasswordRequest.fromBuffer(value),
        ($0.UpdatePasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterWebhookEndpointRequest,
            $0.RegisterWebhookEndpointResponse>(
        'RegisterWebhookEndpoint',
        registerWebhookEndpoint_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RegisterWebhookEndpointRequest.fromBuffer(value),
        ($0.RegisterWebhookEndpointResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListWebhookEndpointsRequest,
            $0.ListWebhookEndpointsResponse>(
        'ListWebhookEndpoints',
        listWebhookEndpoints_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListWebhookEndpointsRequest.fromBuffer(value),
        ($0.ListWebhookEndpointsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetHRIntegrationConfigRequest,
            $0.GetHRIntegrationConfigResponse>(
        'GetHRIntegrationConfig',
        getHRIntegrationConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetHRIntegrationConfigRequest.fromBuffer(value),
        ($0.GetHRIntegrationConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTenantConfigRequest,
            $0.UpdateTenantConfigResponse>(
        'UpdateTenantConfig',
        updateTenantConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateTenantConfigRequest.fromBuffer(value),
        ($0.UpdateTenantConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTenantConfigRequest,
            $0.GetTenantConfigResponse>(
        'GetTenantConfig',
        getTenantConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTenantConfigRequest.fromBuffer(value),
        ($0.GetTenantConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateRealmSettingsRequest,
            $0.UpdateRealmSettingsResponse>(
        'UpdateRealmSettings',
        updateRealmSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateRealmSettingsRequest.fromBuffer(value),
        ($0.UpdateRealmSettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateKeycloakUserRequest,
            $0.CreateKeycloakUserResponse>(
        'CreateKeycloakUser',
        createKeycloakUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateKeycloakUserRequest.fromBuffer(value),
        ($0.CreateKeycloakUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetKeycloakUserAttributeRequest,
            $0.SetKeycloakUserAttributeResponse>(
        'SetKeycloakUserAttribute',
        setKeycloakUserAttribute_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SetKeycloakUserAttributeRequest.fromBuffer(value),
        ($0.SetKeycloakUserAttributeResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListTenantsRequest, $0.ListTenantsResponse>(
            'ListTenants',
            listTenants_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListTenantsRequest.fromBuffer(value),
            ($0.ListTenantsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ResolveRealmRequest, $0.ResolveRealmResponse>(
            'ResolveRealm',
            resolveRealm_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ResolveRealmRequest.fromBuffer(value),
            ($0.ResolveRealmResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExportAuditReportRequest,
            $0.ExportAuditReportResponse>(
        'ExportAuditReport',
        exportAuditReport_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ExportAuditReportRequest.fromBuffer(value),
        ($0.ExportAuditReportResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExportWorkerAuditBundleRequest,
            $0.ExportWorkerAuditBundleResponse>(
        'ExportWorkerAuditBundle',
        exportWorkerAuditBundle_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ExportWorkerAuditBundleRequest.fromBuffer(value),
        ($0.ExportWorkerAuditBundleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListTenantUsersRequest,
            $0.ListTenantUsersResponse>(
        'ListTenantUsers',
        listTenantUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListTenantUsersRequest.fromBuffer(value),
        ($0.ListTenantUsersResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.CreateReportRequest, $0.CreateReportResponse>(
            'CreateReport',
            createReport_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateReportRequest.fromBuffer(value),
            ($0.CreateReportResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetReportRequest, $0.GetReportResponse>(
        'GetReport',
        getReport_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetReportRequest.fromBuffer(value),
        ($0.GetReportResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListReportsRequest, $0.ListReportsResponse>(
            'ListReports',
            listReports_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListReportsRequest.fromBuffer(value),
            ($0.ListReportsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpsertDirectoryIntegrationRequest,
            $0.UpsertDirectoryIntegrationResponse>(
        'UpsertDirectoryIntegration',
        upsertDirectoryIntegration_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpsertDirectoryIntegrationRequest.fromBuffer(value),
        ($0.UpsertDirectoryIntegrationResponse value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDirectoryIntegrationRequest,
            $0.GetDirectoryIntegrationResponse>(
        'GetDirectoryIntegration',
        getDirectoryIntegration_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetDirectoryIntegrationRequest.fromBuffer(value),
        ($0.GetDirectoryIntegrationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TestDirectoryConnectionRequest,
            $0.TestDirectoryConnectionResponse>(
        'TestDirectoryConnection',
        testDirectoryConnection_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.TestDirectoryConnectionRequest.fromBuffer(value),
        ($0.TestDirectoryConnectionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListDirectoryUsersRequest,
            $0.ListDirectoryUsersResponse>(
        'ListDirectoryUsers',
        listDirectoryUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListDirectoryUsersRequest.fromBuffer(value),
        ($0.ListDirectoryUsersResponse value) => value.writeToBuffer()));
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

  $async.Future<$0.CheckPermissionResponse> checkPermission_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CheckPermissionRequest> $request) async {
    return checkPermission($call, await $request);
  }

  $async.Future<$0.CheckPermissionResponse> checkPermission(
      $grpc.ServiceCall call, $0.CheckPermissionRequest request);

  $async.Future<$0.AuditWriteResponse> auditWrite_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AuditWriteRequest> $request) async {
    return auditWrite($call, await $request);
  }

  $async.Future<$0.AuditWriteResponse> auditWrite(
      $grpc.ServiceCall call, $0.AuditWriteRequest request);

  $async.Future<$0.GivePermissionResponse> givePermission_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GivePermissionRequest> $request) async {
    return givePermission($call, await $request);
  }

  $async.Future<$0.GivePermissionResponse> givePermission(
      $grpc.ServiceCall call, $0.GivePermissionRequest request);

  $async.Future<$0.OnboardTenantResponse> onboardTenant_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.OnboardTenantRequest> $request) async {
    return onboardTenant($call, await $request);
  }

  $async.Future<$0.OnboardTenantResponse> onboardTenant(
      $grpc.ServiceCall call, $0.OnboardTenantRequest request);

  $async.Future<$0.ForgotPasswordResponse> forgotPassword_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ForgotPasswordRequest> $request) async {
    return forgotPassword($call, await $request);
  }

  $async.Future<$0.ForgotPasswordResponse> forgotPassword(
      $grpc.ServiceCall call, $0.ForgotPasswordRequest request);

  $async.Future<$0.UpdatePasswordResponse> updatePassword_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdatePasswordRequest> $request) async {
    return updatePassword($call, await $request);
  }

  $async.Future<$0.UpdatePasswordResponse> updatePassword(
      $grpc.ServiceCall call, $0.UpdatePasswordRequest request);

  $async.Future<$0.RegisterWebhookEndpointResponse> registerWebhookEndpoint_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RegisterWebhookEndpointRequest> $request) async {
    return registerWebhookEndpoint($call, await $request);
  }

  $async.Future<$0.RegisterWebhookEndpointResponse> registerWebhookEndpoint(
      $grpc.ServiceCall call, $0.RegisterWebhookEndpointRequest request);

  $async.Future<$0.ListWebhookEndpointsResponse> listWebhookEndpoints_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListWebhookEndpointsRequest> $request) async {
    return listWebhookEndpoints($call, await $request);
  }

  $async.Future<$0.ListWebhookEndpointsResponse> listWebhookEndpoints(
      $grpc.ServiceCall call, $0.ListWebhookEndpointsRequest request);

  $async.Future<$0.GetHRIntegrationConfigResponse> getHRIntegrationConfig_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetHRIntegrationConfigRequest> $request) async {
    return getHRIntegrationConfig($call, await $request);
  }

  $async.Future<$0.GetHRIntegrationConfigResponse> getHRIntegrationConfig(
      $grpc.ServiceCall call, $0.GetHRIntegrationConfigRequest request);

  $async.Future<$0.UpdateTenantConfigResponse> updateTenantConfig_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdateTenantConfigRequest> $request) async {
    return updateTenantConfig($call, await $request);
  }

  $async.Future<$0.UpdateTenantConfigResponse> updateTenantConfig(
      $grpc.ServiceCall call, $0.UpdateTenantConfigRequest request);

  $async.Future<$0.GetTenantConfigResponse> getTenantConfig_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetTenantConfigRequest> $request) async {
    return getTenantConfig($call, await $request);
  }

  $async.Future<$0.GetTenantConfigResponse> getTenantConfig(
      $grpc.ServiceCall call, $0.GetTenantConfigRequest request);

  $async.Future<$0.UpdateRealmSettingsResponse> updateRealmSettings_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdateRealmSettingsRequest> $request) async {
    return updateRealmSettings($call, await $request);
  }

  $async.Future<$0.UpdateRealmSettingsResponse> updateRealmSettings(
      $grpc.ServiceCall call, $0.UpdateRealmSettingsRequest request);

  $async.Future<$0.CreateKeycloakUserResponse> createKeycloakUser_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateKeycloakUserRequest> $request) async {
    return createKeycloakUser($call, await $request);
  }

  $async.Future<$0.CreateKeycloakUserResponse> createKeycloakUser(
      $grpc.ServiceCall call, $0.CreateKeycloakUserRequest request);

  $async.Future<$0.SetKeycloakUserAttributeResponse>
      setKeycloakUserAttribute_Pre($grpc.ServiceCall $call,
          $async.Future<$0.SetKeycloakUserAttributeRequest> $request) async {
    return setKeycloakUserAttribute($call, await $request);
  }

  $async.Future<$0.SetKeycloakUserAttributeResponse> setKeycloakUserAttribute(
      $grpc.ServiceCall call, $0.SetKeycloakUserAttributeRequest request);

  $async.Future<$0.ListTenantsResponse> listTenants_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListTenantsRequest> $request) async {
    return listTenants($call, await $request);
  }

  $async.Future<$0.ListTenantsResponse> listTenants(
      $grpc.ServiceCall call, $0.ListTenantsRequest request);

  $async.Future<$0.ResolveRealmResponse> resolveRealm_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ResolveRealmRequest> $request) async {
    return resolveRealm($call, await $request);
  }

  $async.Future<$0.ResolveRealmResponse> resolveRealm(
      $grpc.ServiceCall call, $0.ResolveRealmRequest request);

  $async.Future<$0.ExportAuditReportResponse> exportAuditReport_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ExportAuditReportRequest> $request) async {
    return exportAuditReport($call, await $request);
  }

  $async.Future<$0.ExportAuditReportResponse> exportAuditReport(
      $grpc.ServiceCall call, $0.ExportAuditReportRequest request);

  $async.Future<$0.ExportWorkerAuditBundleResponse> exportWorkerAuditBundle_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ExportWorkerAuditBundleRequest> $request) async {
    return exportWorkerAuditBundle($call, await $request);
  }

  $async.Future<$0.ExportWorkerAuditBundleResponse> exportWorkerAuditBundle(
      $grpc.ServiceCall call, $0.ExportWorkerAuditBundleRequest request);

  $async.Future<$0.ListTenantUsersResponse> listTenantUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListTenantUsersRequest> $request) async {
    return listTenantUsers($call, await $request);
  }

  $async.Future<$0.ListTenantUsersResponse> listTenantUsers(
      $grpc.ServiceCall call, $0.ListTenantUsersRequest request);

  $async.Future<$0.CreateReportResponse> createReport_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateReportRequest> $request) async {
    return createReport($call, await $request);
  }

  $async.Future<$0.CreateReportResponse> createReport(
      $grpc.ServiceCall call, $0.CreateReportRequest request);

  $async.Future<$0.GetReportResponse> getReport_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetReportRequest> $request) async {
    return getReport($call, await $request);
  }

  $async.Future<$0.GetReportResponse> getReport(
      $grpc.ServiceCall call, $0.GetReportRequest request);

  $async.Future<$0.ListReportsResponse> listReports_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListReportsRequest> $request) async {
    return listReports($call, await $request);
  }

  $async.Future<$0.ListReportsResponse> listReports(
      $grpc.ServiceCall call, $0.ListReportsRequest request);

  $async.Future<$0.UpsertDirectoryIntegrationResponse>
      upsertDirectoryIntegration_Pre($grpc.ServiceCall $call,
          $async.Future<$0.UpsertDirectoryIntegrationRequest> $request) async {
    return upsertDirectoryIntegration($call, await $request);
  }

  $async.Future<$0.UpsertDirectoryIntegrationResponse>
      upsertDirectoryIntegration(
          $grpc.ServiceCall call, $0.UpsertDirectoryIntegrationRequest request);

  $async.Future<$0.GetDirectoryIntegrationResponse> getDirectoryIntegration_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetDirectoryIntegrationRequest> $request) async {
    return getDirectoryIntegration($call, await $request);
  }

  $async.Future<$0.GetDirectoryIntegrationResponse> getDirectoryIntegration(
      $grpc.ServiceCall call, $0.GetDirectoryIntegrationRequest request);

  $async.Future<$0.TestDirectoryConnectionResponse> testDirectoryConnection_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.TestDirectoryConnectionRequest> $request) async {
    return testDirectoryConnection($call, await $request);
  }

  $async.Future<$0.TestDirectoryConnectionResponse> testDirectoryConnection(
      $grpc.ServiceCall call, $0.TestDirectoryConnectionRequest request);

  $async.Future<$0.ListDirectoryUsersResponse> listDirectoryUsers_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ListDirectoryUsersRequest> $request) async {
    return listDirectoryUsers($call, await $request);
  }

  $async.Future<$0.ListDirectoryUsersResponse> listDirectoryUsers(
      $grpc.ServiceCall call, $0.ListDirectoryUsersRequest request);
}
