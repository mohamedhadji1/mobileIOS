// This is a generated file - do not edit.
//
// Generated from platform/v1/platform.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use directoryTypeDescriptor instead')
const DirectoryType$json = {
  '1': 'DirectoryType',
  '2': [
    {'1': 'DIRECTORY_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'DIRECTORY_TYPE_LDAP', '2': 1},
    {'1': 'DIRECTORY_TYPE_AZURE_AD', '2': 2},
  ],
};

/// Descriptor for `DirectoryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List directoryTypeDescriptor = $convert.base64Decode(
    'Cg1EaXJlY3RvcnlUeXBlEh4KGkRJUkVDVE9SWV9UWVBFX1VOU1BFQ0lGSUVEEAASFwoTRElSRU'
    'NUT1JZX1RZUEVfTERBUBABEhsKF0RJUkVDVE9SWV9UWVBFX0FaVVJFX0FEEAI=');

@$core.Deprecated('Use syncUserRequestDescriptor instead')
const SyncUserRequest$json = {
  '1': 'SyncUserRequest',
};

/// Descriptor for `SyncUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncUserRequestDescriptor =
    $convert.base64Decode('Cg9TeW5jVXNlclJlcXVlc3Q=');

@$core.Deprecated('Use syncUserResponseDescriptor instead')
const SyncUserResponse$json = {
  '1': 'SyncUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'created', '3': 2, '4': 1, '5': 8, '10': 'created'},
  ],
};

/// Descriptor for `SyncUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncUserResponseDescriptor = $convert.base64Decode(
    'ChBTeW5jVXNlclJlc3BvbnNlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIYCgdjcmVhdGVkGA'
    'IgASgIUgdjcmVhdGVk');

@$core.Deprecated('Use getUserProfileRequestDescriptor instead')
const GetUserProfileRequest$json = {
  '1': 'GetUserProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileRequestDescriptor =
    $convert.base64Decode(
        'ChVHZXRVc2VyUHJvZmlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse$json = {
  '1': 'GetUserProfileResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'full_name', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'active', '3': 4, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `GetUserProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileResponseDescriptor = $convert.base64Decode(
    'ChZHZXRVc2VyUHJvZmlsZVJlc3BvbnNlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVlbW'
    'FpbBgCIAEoCVIFZW1haWwSGwoJZnVsbF9uYW1lGAMgASgJUghmdWxsTmFtZRIWCgZhY3RpdmUY'
    'BCABKAhSBmFjdGl2ZQ==');

@$core.Deprecated('Use checkPermissionRequestDescriptor instead')
const CheckPermissionRequest$json = {
  '1': 'CheckPermissionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'action', '3': 2, '4': 1, '5': 9, '10': 'action'},
    {'1': 'resource_type', '3': 3, '4': 1, '5': 9, '10': 'resourceType'},
    {'1': 'tenant_id', '3': 4, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `CheckPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionRequestDescriptor = $convert.base64Decode(
    'ChZDaGVja1Blcm1pc3Npb25SZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIWCgZhY3'
    'Rpb24YAiABKAlSBmFjdGlvbhIjCg1yZXNvdXJjZV90eXBlGAMgASgJUgxyZXNvdXJjZVR5cGUS'
    'GwoJdGVuYW50X2lkGAQgASgJUgh0ZW5hbnRJZA==');

@$core.Deprecated('Use checkPermissionResponseDescriptor instead')
const CheckPermissionResponse$json = {
  '1': 'CheckPermissionResponse',
  '2': [
    {'1': 'allowed', '3': 1, '4': 1, '5': 8, '10': 'allowed'},
    {'1': 'denial_reason', '3': 2, '4': 1, '5': 9, '10': 'denialReason'},
  ],
};

/// Descriptor for `CheckPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionResponseDescriptor =
    $convert.base64Decode(
        'ChdDaGVja1Blcm1pc3Npb25SZXNwb25zZRIYCgdhbGxvd2VkGAEgASgIUgdhbGxvd2VkEiMKDW'
        'RlbmlhbF9yZWFzb24YAiABKAlSDGRlbmlhbFJlYXNvbg==');

@$core.Deprecated('Use auditWriteRequestDescriptor instead')
const AuditWriteRequest$json = {
  '1': 'AuditWriteRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'actor_id', '3': 2, '4': 1, '5': 9, '10': 'actorId'},
    {'1': 'actor_role', '3': 3, '4': 1, '5': 9, '10': 'actorRole'},
    {'1': 'action', '3': 4, '4': 1, '5': 9, '10': 'action'},
    {'1': 'target_type', '3': 5, '4': 1, '5': 9, '10': 'targetType'},
    {'1': 'target_id', '3': 6, '4': 1, '5': 9, '10': 'targetId'},
    {'1': 'source_ip', '3': 7, '4': 1, '5': 9, '10': 'sourceIp'},
    {'1': 'user_agent', '3': 8, '4': 1, '5': 9, '10': 'userAgent'},
    {'1': 'request_id', '3': 9, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'session_id', '3': 10, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `AuditWriteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List auditWriteRequestDescriptor = $convert.base64Decode(
    'ChFBdWRpdFdyaXRlUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudElkEhkKCGFjdG'
    '9yX2lkGAIgASgJUgdhY3RvcklkEh0KCmFjdG9yX3JvbGUYAyABKAlSCWFjdG9yUm9sZRIWCgZh'
    'Y3Rpb24YBCABKAlSBmFjdGlvbhIfCgt0YXJnZXRfdHlwZRgFIAEoCVIKdGFyZ2V0VHlwZRIbCg'
    'l0YXJnZXRfaWQYBiABKAlSCHRhcmdldElkEhsKCXNvdXJjZV9pcBgHIAEoCVIIc291cmNlSXAS'
    'HQoKdXNlcl9hZ2VudBgIIAEoCVIJdXNlckFnZW50Eh0KCnJlcXVlc3RfaWQYCSABKAlSCXJlcX'
    'Vlc3RJZBIdCgpzZXNzaW9uX2lkGAogASgJUglzZXNzaW9uSWQ=');

@$core.Deprecated('Use auditWriteResponseDescriptor instead')
const AuditWriteResponse$json = {
  '1': 'AuditWriteResponse',
  '2': [
    {'1': 'event_id', '3': 1, '4': 1, '5': 9, '10': 'eventId'},
  ],
};

/// Descriptor for `AuditWriteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List auditWriteResponseDescriptor =
    $convert.base64Decode(
        'ChJBdWRpdFdyaXRlUmVzcG9uc2USGQoIZXZlbnRfaWQYASABKAlSB2V2ZW50SWQ=');

@$core.Deprecated('Use givePermissionRequestDescriptor instead')
const GivePermissionRequest$json = {
  '1': 'GivePermissionRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'action', '3': 3, '4': 1, '5': 9, '10': 'action'},
    {'1': 'resource_type', '3': 4, '4': 1, '5': 9, '10': 'resourceType'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GivePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List givePermissionRequestDescriptor = $convert.base64Decode(
    'ChVHaXZlUGVybWlzc2lvblJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZBIXCg'
    'd1c2VyX2lkGAIgASgJUgZ1c2VySWQSFgoGYWN0aW9uGAMgASgJUgZhY3Rpb24SIwoNcmVzb3Vy'
    'Y2VfdHlwZRgEIAEoCVIMcmVzb3VyY2VUeXBlEhQKBWVtYWlsGAUgASgJUgVlbWFpbA==');

@$core.Deprecated('Use givePermissionResponseDescriptor instead')
const GivePermissionResponse$json = {
  '1': 'GivePermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `GivePermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List givePermissionResponseDescriptor =
    $convert.base64Decode(
        'ChZHaXZlUGVybWlzc2lvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use onboardTenantRequestDescriptor instead')
const OnboardTenantRequest$json = {
  '1': 'OnboardTenantRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'slug', '3': 2, '4': 1, '5': 9, '10': 'slug'},
    {
      '1': 'primary_contact_email',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'primaryContactEmail'
    },
    {'1': 'config_json', '3': 4, '4': 1, '5': 9, '10': 'configJson'},
  ],
};

/// Descriptor for `OnboardTenantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onboardTenantRequestDescriptor = $convert.base64Decode(
    'ChRPbmJvYXJkVGVuYW50UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhIKBHNsdWcYAiABKA'
    'lSBHNsdWcSMgoVcHJpbWFyeV9jb250YWN0X2VtYWlsGAMgASgJUhNwcmltYXJ5Q29udGFjdEVt'
    'YWlsEh8KC2NvbmZpZ19qc29uGAQgASgJUgpjb25maWdKc29u');

@$core.Deprecated('Use onboardTenantResponseDescriptor instead')
const OnboardTenantResponse$json = {
  '1': 'OnboardTenantResponse',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'keycloak_realm_id', '3': 2, '4': 1, '5': 9, '10': 'keycloakRealmId'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `OnboardTenantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List onboardTenantResponseDescriptor = $convert.base64Decode(
    'ChVPbmJvYXJkVGVuYW50UmVzcG9uc2USGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZBIqCh'
    'FrZXljbG9ha19yZWFsbV9pZBgCIAEoCVIPa2V5Y2xvYWtSZWFsbUlkEhgKB21lc3NhZ2UYAyAB'
    'KAlSB21lc3NhZ2U=');

@$core.Deprecated('Use forgotPasswordRequestDescriptor instead')
const ForgotPasswordRequest$json = {
  '1': 'ForgotPasswordRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ForgotPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordRequestDescriptor = $convert.base64Decode(
    'ChVGb3Jnb3RQYXNzd29yZFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhsKCXRlbmFudF'
    '9pZBgCIAEoCVIIdGVuYW50SWQ=');

@$core.Deprecated('Use forgotPasswordResponseDescriptor instead')
const ForgotPasswordResponse$json = {
  '1': 'ForgotPasswordResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ForgotPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordResponseDescriptor =
    $convert.base64Decode(
        'ChZGb3Jnb3RQYXNzd29yZFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use updatePasswordRequestDescriptor instead')
const UpdatePasswordRequest$json = {
  '1': 'UpdatePasswordRequest',
  '2': [
    {'1': 'old_password', '3': 1, '4': 1, '5': 9, '10': 'oldPassword'},
    {'1': 'new_password', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `UpdatePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePasswordRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQYXNzd29yZFJlcXVlc3QSIQoMb2xkX3Bhc3N3b3JkGAEgASgJUgtvbGRQYXNzd2'
    '9yZBIhCgxuZXdfcGFzc3dvcmQYAiABKAlSC25ld1Bhc3N3b3Jk');

@$core.Deprecated('Use updatePasswordResponseDescriptor instead')
const UpdatePasswordResponse$json = {
  '1': 'UpdatePasswordResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdatePasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePasswordResponseDescriptor =
    $convert.base64Decode(
        'ChZVcGRhdGVQYXNzd29yZFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use registerWebhookEndpointRequestDescriptor instead')
const RegisterWebhookEndpointRequest$json = {
  '1': 'RegisterWebhookEndpointRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {'1': 'hmac_key', '3': 3, '4': 1, '5': 9, '10': 'hmacKey'},
    {'1': 'event_types', '3': 4, '4': 3, '5': 9, '10': 'eventTypes'},
  ],
};

/// Descriptor for `RegisterWebhookEndpointRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerWebhookEndpointRequestDescriptor =
    $convert.base64Decode(
        'Ch5SZWdpc3RlcldlYmhvb2tFbmRwb2ludFJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZBIQCgN1cmwYAiABKAlSA3VybBIZCghobWFjX2tleRgDIAEoCVIHaG1hY0tleRIfCgtl'
        'dmVudF90eXBlcxgEIAMoCVIKZXZlbnRUeXBlcw==');

@$core.Deprecated('Use registerWebhookEndpointResponseDescriptor instead')
const RegisterWebhookEndpointResponse$json = {
  '1': 'RegisterWebhookEndpointResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `RegisterWebhookEndpointResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerWebhookEndpointResponseDescriptor =
    $convert.base64Decode(
        'Ch9SZWdpc3RlcldlYmhvb2tFbmRwb2ludFJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use listWebhookEndpointsRequestDescriptor instead')
const ListWebhookEndpointsRequest$json = {
  '1': 'ListWebhookEndpointsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListWebhookEndpointsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWebhookEndpointsRequestDescriptor =
    $convert.base64Decode(
        'ChtMaXN0V2ViaG9va0VuZHBvaW50c1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbn'
        'RJZA==');

@$core.Deprecated('Use webhookEndpointDescriptor instead')
const WebhookEndpoint$json = {
  '1': 'WebhookEndpoint',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {'1': 'hmac_key', '3': 3, '4': 1, '5': 9, '10': 'hmacKey'},
    {'1': 'event_types', '3': 4, '4': 3, '5': 9, '10': 'eventTypes'},
    {'1': 'active', '3': 5, '4': 1, '5': 8, '10': 'active'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'last_triggered_at', '3': 7, '4': 1, '5': 9, '10': 'lastTriggeredAt'},
  ],
};

/// Descriptor for `WebhookEndpoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webhookEndpointDescriptor = $convert.base64Decode(
    'Cg9XZWJob29rRW5kcG9pbnQSDgoCaWQYASABKAlSAmlkEhAKA3VybBgCIAEoCVIDdXJsEhkKCG'
    'htYWNfa2V5GAMgASgJUgdobWFjS2V5Eh8KC2V2ZW50X3R5cGVzGAQgAygJUgpldmVudFR5cGVz'
    'EhYKBmFjdGl2ZRgFIAEoCFIGYWN0aXZlEh0KCmNyZWF0ZWRfYXQYBiABKAlSCWNyZWF0ZWRBdB'
    'IqChFsYXN0X3RyaWdnZXJlZF9hdBgHIAEoCVIPbGFzdFRyaWdnZXJlZEF0');

@$core.Deprecated('Use listWebhookEndpointsResponseDescriptor instead')
const ListWebhookEndpointsResponse$json = {
  '1': 'ListWebhookEndpointsResponse',
  '2': [
    {
      '1': 'endpoints',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.WebhookEndpoint',
      '10': 'endpoints'
    },
  ],
};

/// Descriptor for `ListWebhookEndpointsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWebhookEndpointsResponseDescriptor =
    $convert.base64Decode(
        'ChxMaXN0V2ViaG9va0VuZHBvaW50c1Jlc3BvbnNlEjoKCWVuZHBvaW50cxgBIAMoCzIcLnBsYX'
        'Rmb3JtLnYxLldlYmhvb2tFbmRwb2ludFIJZW5kcG9pbnRz');

@$core.Deprecated('Use getHRIntegrationConfigRequestDescriptor instead')
const GetHRIntegrationConfigRequest$json = {
  '1': 'GetHRIntegrationConfigRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `GetHRIntegrationConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHRIntegrationConfigRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXRIUkludGVncmF0aW9uQ29uZmlnUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbm'
        'FudElk');

@$core.Deprecated('Use getHRIntegrationConfigResponseDescriptor instead')
const GetHRIntegrationConfigResponse$json = {
  '1': 'GetHRIntegrationConfigResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'hr_system', '3': 2, '4': 1, '5': 9, '10': 'hrSystem'},
    {'1': 'scim_endpoint_url', '3': 3, '4': 1, '5': 9, '10': 'scimEndpointUrl'},
    {
      '1': 'openbao_credential_path',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'openbaoCredentialPath'
    },
    {'1': 'field_mapping', '3': 5, '4': 1, '5': 9, '10': 'fieldMapping'},
    {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `GetHRIntegrationConfigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHRIntegrationConfigResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRIUkludGVncmF0aW9uQ29uZmlnUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhsKCWhyX3'
    'N5c3RlbRgCIAEoCVIIaHJTeXN0ZW0SKgoRc2NpbV9lbmRwb2ludF91cmwYAyABKAlSD3NjaW1F'
    'bmRwb2ludFVybBI2ChdvcGVuYmFvX2NyZWRlbnRpYWxfcGF0aBgEIAEoCVIVb3BlbmJhb0NyZW'
    'RlbnRpYWxQYXRoEiMKDWZpZWxkX21hcHBpbmcYBSABKAlSDGZpZWxkTWFwcGluZxIWCgZhY3Rp'
    'dmUYBiABKAhSBmFjdGl2ZQ==');

@$core.Deprecated('Use updateTenantConfigRequestDescriptor instead')
const UpdateTenantConfigRequest$json = {
  '1': 'UpdateTenantConfigRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'config_json', '3': 2, '4': 1, '5': 9, '10': 'configJson'},
  ],
};

/// Descriptor for `UpdateTenantConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTenantConfigRequestDescriptor =
    $convert.base64Decode(
        'ChlVcGRhdGVUZW5hbnRDb25maWdSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
        'QSHwoLY29uZmlnX2pzb24YAiABKAlSCmNvbmZpZ0pzb24=');

@$core.Deprecated('Use updateTenantConfigResponseDescriptor instead')
const UpdateTenantConfigResponse$json = {
  '1': 'UpdateTenantConfigResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'config_json', '3': 2, '4': 1, '5': 9, '10': 'configJson'},
  ],
};

/// Descriptor for `UpdateTenantConfigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTenantConfigResponseDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVUZW5hbnRDb25maWdSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh'
        '8KC2NvbmZpZ19qc29uGAIgASgJUgpjb25maWdKc29u');

@$core.Deprecated('Use getTenantConfigRequestDescriptor instead')
const GetTenantConfigRequest$json = {
  '1': 'GetTenantConfigRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `GetTenantConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTenantConfigRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRUZW5hbnRDb25maWdSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQ=');

@$core.Deprecated('Use getTenantConfigResponseDescriptor instead')
const GetTenantConfigResponse$json = {
  '1': 'GetTenantConfigResponse',
  '2': [
    {'1': 'config_json', '3': 1, '4': 1, '5': 9, '10': 'configJson'},
  ],
};

/// Descriptor for `GetTenantConfigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTenantConfigResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRUZW5hbnRDb25maWdSZXNwb25zZRIfCgtjb25maWdfanNvbhgBIAEoCVIKY29uZmlnSn'
        'Nvbg==');

@$core.Deprecated('Use updateRealmSettingsRequestDescriptor instead')
const UpdateRealmSettingsRequest$json = {
  '1': 'UpdateRealmSettingsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
  ],
};

/// Descriptor for `UpdateRealmSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRealmSettingsRequestDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVSZWFsbVNldHRpbmdzUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudE'
        'lkEiEKDGRpc3BsYXlfbmFtZRgCIAEoCVILZGlzcGxheU5hbWU=');

@$core.Deprecated('Use updateRealmSettingsResponseDescriptor instead')
const UpdateRealmSettingsResponse$json = {
  '1': 'UpdateRealmSettingsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateRealmSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateRealmSettingsResponseDescriptor =
    $convert.base64Decode(
        'ChtVcGRhdGVSZWFsbVNldHRpbmdzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

@$core.Deprecated('Use createKeycloakUserRequestDescriptor instead')
const CreateKeycloakUserRequest$json = {
  '1': 'CreateKeycloakUserRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'first_name', '3': 4, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 5, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'app_role', '3': 6, '4': 1, '5': 9, '10': 'appRole'},
    {
      '1': 'attributes',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.CreateKeycloakUserRequest.AttributesEntry',
      '10': 'attributes'
    },
  ],
  '3': [CreateKeycloakUserRequest_AttributesEntry$json],
};

@$core.Deprecated('Use createKeycloakUserRequestDescriptor instead')
const CreateKeycloakUserRequest_AttributesEntry$json = {
  '1': 'AttributesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CreateKeycloakUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createKeycloakUserRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVLZXljbG9ha1VzZXJSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
    'QSFAoFZW1haWwYAiABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAMgASgJUghwYXNzd29yZBIdCgpm'
    'aXJzdF9uYW1lGAQgASgJUglmaXJzdE5hbWUSGwoJbGFzdF9uYW1lGAUgASgJUghsYXN0TmFtZR'
    'IZCghhcHBfcm9sZRgGIAEoCVIHYXBwUm9sZRJWCgphdHRyaWJ1dGVzGAcgAygLMjYucGxhdGZv'
    'cm0udjEuQ3JlYXRlS2V5Y2xvYWtVc2VyUmVxdWVzdC5BdHRyaWJ1dGVzRW50cnlSCmF0dHJpYn'
    'V0ZXMaPQoPQXR0cmlidXRlc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJ'
    'UgV2YWx1ZToCOAE=');

@$core.Deprecated('Use createKeycloakUserResponseDescriptor instead')
const CreateKeycloakUserResponse$json = {
  '1': 'CreateKeycloakUserResponse',
  '2': [
    {'1': 'keycloak_user_id', '3': 1, '4': 1, '5': 9, '10': 'keycloakUserId'},
  ],
};

/// Descriptor for `CreateKeycloakUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createKeycloakUserResponseDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVLZXljbG9ha1VzZXJSZXNwb25zZRIoChBrZXljbG9ha191c2VyX2lkGAEgASgJUg'
        '5rZXljbG9ha1VzZXJJZA==');

@$core.Deprecated('Use setKeycloakUserAttributeRequestDescriptor instead')
const SetKeycloakUserAttributeRequest$json = {
  '1': 'SetKeycloakUserAttributeRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'keycloak_user_id', '3': 2, '4': 1, '5': 9, '10': 'keycloakUserId'},
    {'1': 'attribute_key', '3': 3, '4': 1, '5': 9, '10': 'attributeKey'},
    {'1': 'attribute_value', '3': 4, '4': 1, '5': 9, '10': 'attributeValue'},
  ],
};

/// Descriptor for `SetKeycloakUserAttributeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setKeycloakUserAttributeRequestDescriptor =
    $convert.base64Decode(
        'Ch9TZXRLZXljbG9ha1VzZXJBdHRyaWJ1dGVSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdG'
        'VuYW50SWQSKAoQa2V5Y2xvYWtfdXNlcl9pZBgCIAEoCVIOa2V5Y2xvYWtVc2VySWQSIwoNYXR0'
        'cmlidXRlX2tleRgDIAEoCVIMYXR0cmlidXRlS2V5EicKD2F0dHJpYnV0ZV92YWx1ZRgEIAEoCV'
        'IOYXR0cmlidXRlVmFsdWU=');

@$core.Deprecated('Use setKeycloakUserAttributeResponseDescriptor instead')
const SetKeycloakUserAttributeResponse$json = {
  '1': 'SetKeycloakUserAttributeResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SetKeycloakUserAttributeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setKeycloakUserAttributeResponseDescriptor =
    $convert.base64Decode(
        'CiBTZXRLZXljbG9ha1VzZXJBdHRyaWJ1dGVSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdW'
        'NjZXNz');

@$core.Deprecated('Use listTenantsRequestDescriptor instead')
const ListTenantsRequest$json = {
  '1': 'ListTenantsRequest',
};

/// Descriptor for `ListTenantsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTenantsRequestDescriptor =
    $convert.base64Decode('ChJMaXN0VGVuYW50c1JlcXVlc3Q=');

@$core.Deprecated('Use tenantDescriptor instead')
const Tenant$json = {
  '1': 'Tenant',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'slug', '3': 3, '4': 1, '5': 9, '10': 'slug'},
    {'1': 'keycloak_realm_id', '3': 4, '4': 1, '5': 9, '10': 'keycloakRealmId'},
    {
      '1': 'primary_contact_email',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'primaryContactEmail'
    },
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `Tenant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tenantDescriptor = $convert.base64Decode(
    'CgZUZW5hbnQSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSEgoEc2x1ZxgDIA'
    'EoCVIEc2x1ZxIqChFrZXljbG9ha19yZWFsbV9pZBgEIAEoCVIPa2V5Y2xvYWtSZWFsbUlkEjIK'
    'FXByaW1hcnlfY29udGFjdF9lbWFpbBgFIAEoCVITcHJpbWFyeUNvbnRhY3RFbWFpbBIWCgZzdG'
    'F0dXMYBiABKAlSBnN0YXR1cxIdCgpjcmVhdGVkX2F0GAcgASgJUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use listTenantsResponseDescriptor instead')
const ListTenantsResponse$json = {
  '1': 'ListTenantsResponse',
  '2': [
    {
      '1': 'tenants',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.Tenant',
      '10': 'tenants'
    },
  ],
};

/// Descriptor for `ListTenantsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTenantsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0VGVuYW50c1Jlc3BvbnNlEi0KB3RlbmFudHMYASADKAsyEy5wbGF0Zm9ybS52MS5UZW'
    '5hbnRSB3RlbmFudHM=');

@$core.Deprecated('Use resolveRealmRequestDescriptor instead')
const ResolveRealmRequest$json = {
  '1': 'ResolveRealmRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ResolveRealmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolveRealmRequestDescriptor = $convert.base64Decode(
    'ChNSZXNvbHZlUmVhbG1SZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBIbCgl0ZW5hbnRfaW'
    'QYAiABKAlSCHRlbmFudElk');

@$core.Deprecated('Use resolveRealmResponseDescriptor instead')
const ResolveRealmResponse$json = {
  '1': 'ResolveRealmResponse',
  '2': [
    {'1': 'keycloak_realm_id', '3': 1, '4': 1, '5': 9, '10': 'keycloakRealmId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'slug', '3': 3, '4': 1, '5': 9, '10': 'slug'},
  ],
};

/// Descriptor for `ResolveRealmResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolveRealmResponseDescriptor = $convert.base64Decode(
    'ChRSZXNvbHZlUmVhbG1SZXNwb25zZRIqChFrZXljbG9ha19yZWFsbV9pZBgBIAEoCVIPa2V5Y2'
    'xvYWtSZWFsbUlkEhsKCXRlbmFudF9pZBgCIAEoCVIIdGVuYW50SWQSEgoEc2x1ZxgDIAEoCVIE'
    'c2x1Zw==');

@$core.Deprecated('Use exportAuditReportRequestDescriptor instead')
const ExportAuditReportRequest$json = {
  '1': 'ExportAuditReportRequest',
  '2': [
    {'1': 'start_date', '3': 1, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 2, '4': 1, '5': 9, '10': 'endDate'},
  ],
};

/// Descriptor for `ExportAuditReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportAuditReportRequestDescriptor =
    $convert.base64Decode(
        'ChhFeHBvcnRBdWRpdFJlcG9ydFJlcXVlc3QSHQoKc3RhcnRfZGF0ZRgBIAEoCVIJc3RhcnREYX'
        'RlEhkKCGVuZF9kYXRlGAIgASgJUgdlbmREYXRl');

@$core.Deprecated('Use exportAuditReportResponseDescriptor instead')
const ExportAuditReportResponse$json = {
  '1': 'ExportAuditReportResponse',
  '2': [
    {'1': 'xlsx_data', '3': 1, '4': 1, '5': 12, '10': 'xlsxData'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'row_count', '3': 3, '4': 1, '5': 3, '10': 'rowCount'},
    {'1': 'truncated', '3': 4, '4': 1, '5': 8, '10': 'truncated'},
  ],
};

/// Descriptor for `ExportAuditReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportAuditReportResponseDescriptor = $convert.base64Decode(
    'ChlFeHBvcnRBdWRpdFJlcG9ydFJlc3BvbnNlEhsKCXhsc3hfZGF0YRgBIAEoDFIIeGxzeERhdG'
    'ESGgoIZmlsZW5hbWUYAiABKAlSCGZpbGVuYW1lEhsKCXJvd19jb3VudBgDIAEoA1IIcm93Q291'
    'bnQSHAoJdHJ1bmNhdGVkGAQgASgIUgl0cnVuY2F0ZWQ=');

@$core.Deprecated('Use exportWorkerAuditBundleRequestDescriptor instead')
const ExportWorkerAuditBundleRequest$json = {
  '1': 'ExportWorkerAuditBundleRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'start_date', '3': 2, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 3, '4': 1, '5': 9, '10': 'endDate'},
  ],
};

/// Descriptor for `ExportWorkerAuditBundleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportWorkerAuditBundleRequestDescriptor =
    $convert.base64Decode(
        'Ch5FeHBvcnRXb3JrZXJBdWRpdEJ1bmRsZVJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3'
        'JrZXJJZBIdCgpzdGFydF9kYXRlGAIgASgJUglzdGFydERhdGUSGQoIZW5kX2RhdGUYAyABKAlS'
        'B2VuZERhdGU=');

@$core.Deprecated('Use exportWorkerAuditBundleResponseDescriptor instead')
const ExportWorkerAuditBundleResponse$json = {
  '1': 'ExportWorkerAuditBundleResponse',
  '2': [
    {'1': 'zip_data', '3': 1, '4': 1, '5': 12, '10': 'zipData'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
  ],
};

/// Descriptor for `ExportWorkerAuditBundleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportWorkerAuditBundleResponseDescriptor =
    $convert.base64Decode(
        'Ch9FeHBvcnRXb3JrZXJBdWRpdEJ1bmRsZVJlc3BvbnNlEhkKCHppcF9kYXRhGAEgASgMUgd6aX'
        'BEYXRhEhoKCGZpbGVuYW1lGAIgASgJUghmaWxlbmFtZQ==');

@$core.Deprecated('Use listTenantUsersRequestDescriptor instead')
const ListTenantUsersRequest$json = {
  '1': 'ListTenantUsersRequest',
  '2': [
    {'1': 'role_filter', '3': 1, '4': 1, '5': 9, '10': 'roleFilter'},
  ],
};

/// Descriptor for `ListTenantUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTenantUsersRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0VGVuYW50VXNlcnNSZXF1ZXN0Eh8KC3JvbGVfZmlsdGVyGAEgASgJUgpyb2xlRmlsdG'
        'Vy');

@$core.Deprecated('Use listTenantUsersResponseDescriptor instead')
const ListTenantUsersResponse$json = {
  '1': 'ListTenantUsersResponse',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.TenantUser',
      '10': 'users'
    },
  ],
};

/// Descriptor for `ListTenantUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTenantUsersResponseDescriptor =
    $convert.base64Decode(
        'ChdMaXN0VGVuYW50VXNlcnNSZXNwb25zZRItCgV1c2VycxgBIAMoCzIXLnBsYXRmb3JtLnYxLl'
        'RlbmFudFVzZXJSBXVzZXJz');

@$core.Deprecated('Use tenantUserDescriptor instead')
const TenantUser$json = {
  '1': 'TenantUser',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'keycloak_user_id', '3': 2, '4': 1, '5': 9, '10': 'keycloakUserId'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'full_name', '3': 4, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'app_role', '3': 5, '4': 1, '5': 9, '10': 'appRole'},
    {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `TenantUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tenantUserDescriptor = $convert.base64Decode(
    'CgpUZW5hbnRVc2VyEg4KAmlkGAEgASgJUgJpZBIoChBrZXljbG9ha191c2VyX2lkGAIgASgJUg'
    '5rZXljbG9ha1VzZXJJZBIUCgVlbWFpbBgDIAEoCVIFZW1haWwSGwoJZnVsbF9uYW1lGAQgASgJ'
    'UghmdWxsTmFtZRIZCghhcHBfcm9sZRgFIAEoCVIHYXBwUm9sZRIWCgZhY3RpdmUYBiABKAhSBm'
    'FjdGl2ZQ==');

@$core.Deprecated('Use createReportRequestDescriptor instead')
const CreateReportRequest$json = {
  '1': 'CreateReportRequest',
  '2': [
    {'1': 'report_type', '3': 1, '4': 1, '5': 9, '10': 'reportType'},
    {'1': 'format', '3': 2, '4': 1, '5': 9, '10': 'format'},
    {'1': 'filters', '3': 3, '4': 1, '5': 9, '10': 'filters'},
    {'1': 'options', '3': 4, '4': 1, '5': 9, '10': 'options'},
  ],
};

/// Descriptor for `CreateReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReportRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVSZXBvcnRSZXF1ZXN0Eh8KC3JlcG9ydF90eXBlGAEgASgJUgpyZXBvcnRUeXBlEh'
    'YKBmZvcm1hdBgCIAEoCVIGZm9ybWF0EhgKB2ZpbHRlcnMYAyABKAlSB2ZpbHRlcnMSGAoHb3B0'
    'aW9ucxgEIAEoCVIHb3B0aW9ucw==');

@$core.Deprecated('Use createReportResponseDescriptor instead')
const CreateReportResponse$json = {
  '1': 'CreateReportResponse',
  '2': [
    {'1': 'report_id', '3': 1, '4': 1, '5': 9, '10': 'reportId'},
  ],
};

/// Descriptor for `CreateReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReportResponseDescriptor =
    $convert.base64Decode(
        'ChRDcmVhdGVSZXBvcnRSZXNwb25zZRIbCglyZXBvcnRfaWQYASABKAlSCHJlcG9ydElk');

@$core.Deprecated('Use getReportRequestDescriptor instead')
const GetReportRequest$json = {
  '1': 'GetReportRequest',
  '2': [
    {'1': 'report_id', '3': 1, '4': 1, '5': 9, '10': 'reportId'},
  ],
};

/// Descriptor for `GetReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReportRequestDescriptor = $convert.base64Decode(
    'ChBHZXRSZXBvcnRSZXF1ZXN0EhsKCXJlcG9ydF9pZBgBIAEoCVIIcmVwb3J0SWQ=');

@$core.Deprecated('Use getReportResponseDescriptor instead')
const GetReportResponse$json = {
  '1': 'GetReportResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'report_type', '3': 2, '4': 1, '5': 9, '10': 'reportType'},
    {'1': 'format', '3': 3, '4': 1, '5': 9, '10': 'format'},
    {'1': 'filename', '3': 4, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'download_url', '3': 5, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'error', '3': 6, '4': 1, '5': 9, '10': 'error'},
    {'1': 'row_count', '3': 7, '4': 1, '5': 3, '10': 'rowCount'},
    {'1': 'truncated', '3': 8, '4': 1, '5': 8, '10': 'truncated'},
  ],
};

/// Descriptor for `GetReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReportResponseDescriptor = $convert.base64Decode(
    'ChFHZXRSZXBvcnRSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIfCgtyZXBvcnRfdH'
    'lwZRgCIAEoCVIKcmVwb3J0VHlwZRIWCgZmb3JtYXQYAyABKAlSBmZvcm1hdBIaCghmaWxlbmFt'
    'ZRgEIAEoCVIIZmlsZW5hbWUSIQoMZG93bmxvYWRfdXJsGAUgASgJUgtkb3dubG9hZFVybBIUCg'
    'VlcnJvchgGIAEoCVIFZXJyb3ISGwoJcm93X2NvdW50GAcgASgDUghyb3dDb3VudBIcCgl0cnVu'
    'Y2F0ZWQYCCABKAhSCXRydW5jYXRlZA==');

@$core.Deprecated('Use listReportsRequestDescriptor instead')
const ListReportsRequest$json = {
  '1': 'ListReportsRequest',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ListReportsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReportsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UmVwb3J0c1JlcXVlc3QSEgoEcGFnZRgBIAEoBVIEcGFnZRIUCgVsaW1pdBgCIAEoBV'
    'IFbGltaXQ=');

@$core.Deprecated('Use listReportsResponseDescriptor instead')
const ListReportsResponse$json = {
  '1': 'ListReportsResponse',
  '2': [
    {
      '1': 'jobs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.ReportJobSummary',
      '10': 'jobs'
    },
    {'1': 'total_items', '3': 2, '4': 1, '5': 5, '10': 'totalItems'},
  ],
};

/// Descriptor for `ListReportsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReportsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UmVwb3J0c1Jlc3BvbnNlEjEKBGpvYnMYASADKAsyHS5wbGF0Zm9ybS52MS5SZXBvcn'
    'RKb2JTdW1tYXJ5UgRqb2JzEh8KC3RvdGFsX2l0ZW1zGAIgASgFUgp0b3RhbEl0ZW1z');

@$core.Deprecated('Use reportJobSummaryDescriptor instead')
const ReportJobSummary$json = {
  '1': 'ReportJobSummary',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'report_type', '3': 2, '4': 1, '5': 9, '10': 'reportType'},
    {'1': 'format', '3': 3, '4': 1, '5': 9, '10': 'format'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'completed_at', '3': 6, '4': 1, '5': 9, '10': 'completedAt'},
    {'1': 'error', '3': 7, '4': 1, '5': 9, '10': 'error'},
    {'1': 'range_start', '3': 8, '4': 1, '5': 9, '10': 'rangeStart'},
    {'1': 'range_end', '3': 9, '4': 1, '5': 9, '10': 'rangeEnd'},
  ],
};

/// Descriptor for `ReportJobSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportJobSummaryDescriptor = $convert.base64Decode(
    'ChBSZXBvcnRKb2JTdW1tYXJ5Eg4KAmlkGAEgASgJUgJpZBIfCgtyZXBvcnRfdHlwZRgCIAEoCV'
    'IKcmVwb3J0VHlwZRIWCgZmb3JtYXQYAyABKAlSBmZvcm1hdBIWCgZzdGF0dXMYBCABKAlSBnN0'
    'YXR1cxIdCgpjcmVhdGVkX2F0GAUgASgJUgljcmVhdGVkQXQSIQoMY29tcGxldGVkX2F0GAYgAS'
    'gJUgtjb21wbGV0ZWRBdBIUCgVlcnJvchgHIAEoCVIFZXJyb3ISHwoLcmFuZ2Vfc3RhcnQYCCAB'
    'KAlSCnJhbmdlU3RhcnQSGwoJcmFuZ2VfZW5kGAkgASgJUghyYW5nZUVuZA==');

@$core.Deprecated('Use ldapSettingsDescriptor instead')
const LdapSettings$json = {
  '1': 'LdapSettings',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'bind_dn', '3': 2, '4': 1, '5': 9, '10': 'bindDn'},
    {'1': 'base_dn', '3': 3, '4': 1, '5': 9, '10': 'baseDn'},
    {'1': 'user_filter', '3': 4, '4': 1, '5': 9, '10': 'userFilter'},
    {'1': 'start_tls', '3': 5, '4': 1, '5': 8, '10': 'startTls'},
    {'1': 'skip_verify', '3': 6, '4': 1, '5': 8, '10': 'skipVerify'},
  ],
};

/// Descriptor for `LdapSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ldapSettingsDescriptor = $convert.base64Decode(
    'CgxMZGFwU2V0dGluZ3MSEAoDdXJsGAEgASgJUgN1cmwSFwoHYmluZF9kbhgCIAEoCVIGYmluZE'
    'RuEhcKB2Jhc2VfZG4YAyABKAlSBmJhc2VEbhIfCgt1c2VyX2ZpbHRlchgEIAEoCVIKdXNlckZp'
    'bHRlchIbCglzdGFydF90bHMYBSABKAhSCHN0YXJ0VGxzEh8KC3NraXBfdmVyaWZ5GAYgASgIUg'
    'pza2lwVmVyaWZ5');

@$core.Deprecated('Use azureAdSettingsDescriptor instead')
const AzureAdSettings$json = {
  '1': 'AzureAdSettings',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'client_id', '3': 2, '4': 1, '5': 9, '10': 'clientId'},
  ],
};

/// Descriptor for `AzureAdSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List azureAdSettingsDescriptor = $convert.base64Decode(
    'Cg9BenVyZUFkU2V0dGluZ3MSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZBIbCgljbGllbn'
    'RfaWQYAiABKAlSCGNsaWVudElk');

@$core.Deprecated('Use directoryUserDescriptor instead')
const DirectoryUser$json = {
  '1': 'DirectoryUser',
  '2': [
    {'1': 'external_id', '3': 1, '4': 1, '5': 9, '10': 'externalId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'given_name', '3': 4, '4': 1, '5': 9, '10': 'givenName'},
    {'1': 'surname', '3': 5, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'department', '3': 6, '4': 1, '5': 9, '10': 'department'},
    {'1': 'enabled', '3': 7, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `DirectoryUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List directoryUserDescriptor = $convert.base64Decode(
    'Cg1EaXJlY3RvcnlVc2VyEh8KC2V4dGVybmFsX2lkGAEgASgJUgpleHRlcm5hbElkEhQKBWVtYW'
    'lsGAIgASgJUgVlbWFpbBIhCgxkaXNwbGF5X25hbWUYAyABKAlSC2Rpc3BsYXlOYW1lEh0KCmdp'
    'dmVuX25hbWUYBCABKAlSCWdpdmVuTmFtZRIYCgdzdXJuYW1lGAUgASgJUgdzdXJuYW1lEh4KCm'
    'RlcGFydG1lbnQYBiABKAlSCmRlcGFydG1lbnQSGAoHZW5hYmxlZBgHIAEoCFIHZW5hYmxlZA==');

@$core.Deprecated('Use upsertDirectoryIntegrationRequestDescriptor instead')
const UpsertDirectoryIntegrationRequest$json = {
  '1': 'UpsertDirectoryIntegrationRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.platform.v1.DirectoryType',
      '10': 'type'
    },
    {
      '1': 'ldap',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.platform.v1.LdapSettings',
      '10': 'ldap'
    },
    {
      '1': 'azure_ad',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.platform.v1.AzureAdSettings',
      '10': 'azureAd'
    },
    {'1': 'bind_password', '3': 5, '4': 1, '5': 9, '10': 'bindPassword'},
    {'1': 'client_secret', '3': 6, '4': 1, '5': 9, '10': 'clientSecret'},
    {
      '1': 'field_mapping',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.UpsertDirectoryIntegrationRequest.FieldMappingEntry',
      '10': 'fieldMapping'
    },
    {'1': 'active', '3': 8, '4': 1, '5': 8, '10': 'active'},
  ],
  '3': [UpsertDirectoryIntegrationRequest_FieldMappingEntry$json],
};

@$core.Deprecated('Use upsertDirectoryIntegrationRequestDescriptor instead')
const UpsertDirectoryIntegrationRequest_FieldMappingEntry$json = {
  '1': 'FieldMappingEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `UpsertDirectoryIntegrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertDirectoryIntegrationRequestDescriptor = $convert.base64Decode(
    'CiFVcHNlcnREaXJlY3RvcnlJbnRlZ3JhdGlvblJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUg'
    'h0ZW5hbnRJZBIuCgR0eXBlGAIgASgOMhoucGxhdGZvcm0udjEuRGlyZWN0b3J5VHlwZVIEdHlw'
    'ZRItCgRsZGFwGAMgASgLMhkucGxhdGZvcm0udjEuTGRhcFNldHRpbmdzUgRsZGFwEjcKCGF6dX'
    'JlX2FkGAQgASgLMhwucGxhdGZvcm0udjEuQXp1cmVBZFNldHRpbmdzUgdhenVyZUFkEiMKDWJp'
    'bmRfcGFzc3dvcmQYBSABKAlSDGJpbmRQYXNzd29yZBIjCg1jbGllbnRfc2VjcmV0GAYgASgJUg'
    'xjbGllbnRTZWNyZXQSZQoNZmllbGRfbWFwcGluZxgHIAMoCzJALnBsYXRmb3JtLnYxLlVwc2Vy'
    'dERpcmVjdG9yeUludGVncmF0aW9uUmVxdWVzdC5GaWVsZE1hcHBpbmdFbnRyeVIMZmllbGRNYX'
    'BwaW5nEhYKBmFjdGl2ZRgIIAEoCFIGYWN0aXZlGj8KEUZpZWxkTWFwcGluZ0VudHJ5EhAKA2tl'
    'eRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use upsertDirectoryIntegrationResponseDescriptor instead')
const UpsertDirectoryIntegrationResponse$json = {
  '1': 'UpsertDirectoryIntegrationResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `UpsertDirectoryIntegrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertDirectoryIntegrationResponseDescriptor =
    $convert.base64Decode(
        'CiJVcHNlcnREaXJlY3RvcnlJbnRlZ3JhdGlvblJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use getDirectoryIntegrationRequestDescriptor instead')
const GetDirectoryIntegrationRequest$json = {
  '1': 'GetDirectoryIntegrationRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `GetDirectoryIntegrationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDirectoryIntegrationRequestDescriptor =
    $convert.base64Decode(
        'Ch5HZXREaXJlY3RvcnlJbnRlZ3JhdGlvblJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZA==');

@$core.Deprecated('Use getDirectoryIntegrationResponseDescriptor instead')
const GetDirectoryIntegrationResponse$json = {
  '1': 'GetDirectoryIntegrationResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.platform.v1.DirectoryType',
      '10': 'type'
    },
    {
      '1': 'ldap',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.platform.v1.LdapSettings',
      '10': 'ldap'
    },
    {
      '1': 'azure_ad',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.platform.v1.AzureAdSettings',
      '10': 'azureAd'
    },
    {
      '1': 'field_mapping',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.GetDirectoryIntegrationResponse.FieldMappingEntry',
      '10': 'fieldMapping'
    },
    {'1': 'active', '3': 6, '4': 1, '5': 8, '10': 'active'},
    {
      '1': 'secret_configured',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'secretConfigured'
    },
  ],
  '3': [GetDirectoryIntegrationResponse_FieldMappingEntry$json],
};

@$core.Deprecated('Use getDirectoryIntegrationResponseDescriptor instead')
const GetDirectoryIntegrationResponse_FieldMappingEntry$json = {
  '1': 'FieldMappingEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetDirectoryIntegrationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDirectoryIntegrationResponseDescriptor = $convert.base64Decode(
    'Ch9HZXREaXJlY3RvcnlJbnRlZ3JhdGlvblJlc3BvbnNlEg4KAmlkGAEgASgJUgJpZBIuCgR0eX'
    'BlGAIgASgOMhoucGxhdGZvcm0udjEuRGlyZWN0b3J5VHlwZVIEdHlwZRItCgRsZGFwGAMgASgL'
    'MhkucGxhdGZvcm0udjEuTGRhcFNldHRpbmdzUgRsZGFwEjcKCGF6dXJlX2FkGAQgASgLMhwucG'
    'xhdGZvcm0udjEuQXp1cmVBZFNldHRpbmdzUgdhenVyZUFkEmMKDWZpZWxkX21hcHBpbmcYBSAD'
    'KAsyPi5wbGF0Zm9ybS52MS5HZXREaXJlY3RvcnlJbnRlZ3JhdGlvblJlc3BvbnNlLkZpZWxkTW'
    'FwcGluZ0VudHJ5UgxmaWVsZE1hcHBpbmcSFgoGYWN0aXZlGAYgASgIUgZhY3RpdmUSKwoRc2Vj'
    'cmV0X2NvbmZpZ3VyZWQYByABKAhSEHNlY3JldENvbmZpZ3VyZWQaPwoRRmllbGRNYXBwaW5nRW'
    '50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use testDirectoryConnectionRequestDescriptor instead')
const TestDirectoryConnectionRequest$json = {
  '1': 'TestDirectoryConnectionRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `TestDirectoryConnectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testDirectoryConnectionRequestDescriptor =
    $convert.base64Decode(
        'Ch5UZXN0RGlyZWN0b3J5Q29ubmVjdGlvblJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZA==');

@$core.Deprecated('Use testDirectoryConnectionResponseDescriptor instead')
const TestDirectoryConnectionResponse$json = {
  '1': 'TestDirectoryConnectionResponse',
  '2': [
    {'1': 'ok', '3': 1, '4': 1, '5': 8, '10': 'ok'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `TestDirectoryConnectionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testDirectoryConnectionResponseDescriptor =
    $convert.base64Decode(
        'Ch9UZXN0RGlyZWN0b3J5Q29ubmVjdGlvblJlc3BvbnNlEg4KAm9rGAEgASgIUgJvaxIUCgVlcn'
        'JvchgCIAEoCVIFZXJyb3I=');

@$core.Deprecated('Use listDirectoryUsersRequestDescriptor instead')
const ListDirectoryUsersRequest$json = {
  '1': 'ListDirectoryUsersRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'query', '3': 2, '4': 1, '5': 9, '10': 'query'},
    {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    {'1': 'page_size', '3': 4, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'cursor', '3': 5, '4': 1, '5': 9, '10': 'cursor'},
  ],
};

/// Descriptor for `ListDirectoryUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDirectoryUsersRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0RGlyZWN0b3J5VXNlcnNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
    'QSFAoFcXVlcnkYAiABKAlSBXF1ZXJ5EhIKBHBhZ2UYAyABKAVSBHBhZ2USGwoJcGFnZV9zaXpl'
    'GAQgASgFUghwYWdlU2l6ZRIWCgZjdXJzb3IYBSABKAlSBmN1cnNvcg==');

@$core.Deprecated('Use listDirectoryUsersResponseDescriptor instead')
const ListDirectoryUsersResponse$json = {
  '1': 'ListDirectoryUsersResponse',
  '2': [
    {
      '1': 'users',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.platform.v1.DirectoryUser',
      '10': 'users'
    },
    {'1': 'next_cursor', '3': 2, '4': 1, '5': 9, '10': 'nextCursor'},
  ],
};

/// Descriptor for `ListDirectoryUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDirectoryUsersResponseDescriptor =
    $convert.base64Decode(
        'ChpMaXN0RGlyZWN0b3J5VXNlcnNSZXNwb25zZRIwCgV1c2VycxgBIAMoCzIaLnBsYXRmb3JtLn'
        'YxLkRpcmVjdG9yeVVzZXJSBXVzZXJzEh8KC25leHRfY3Vyc29yGAIgASgJUgpuZXh0Q3Vyc29y');
