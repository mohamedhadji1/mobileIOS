// This is a generated file - do not edit.
//
// Generated from case/v1/case.proto.

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

@$core.Deprecated('Use caseDescriptor instead')
const Case$json = {
  '1': 'Case',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'ring_candidate_id', '3': 4, '4': 1, '5': 9, '10': 'ringCandidateId'},
    {
      '1': 're_verification_request_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'reVerificationRequestId'
    },
    {'1': 'case_type', '3': 6, '4': 1, '5': 9, '10': 'caseType'},
    {'1': 'state', '3': 7, '4': 1, '5': 9, '10': 'state'},
    {'1': 'priority', '3': 8, '4': 1, '5': 9, '10': 'priority'},
    {
      '1': 'temporal_workflow_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'temporalWorkflowId'
    },
    {
      '1': 'sla_deadline',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'slaDeadline'
    },
    {
      '1': 'opened_at',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'openedAt'
    },
    {
      '1': 'closed_at',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'closedAt'
    },
    {'1': 'resolution', '3': 13, '4': 1, '5': 9, '10': 'resolution'},
    {
      '1': 'events',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.case.v1.CaseEvent',
      '10': 'events'
    },
    {
      '1': 'evidence',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.case.v1.CaseEvidence',
      '10': 'evidence'
    },
    {
      '1': 'current_assignment',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.case.v1.AnalystAssignment',
      '10': 'currentAssignment'
    },
  ],
};

/// Descriptor for `Case`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caseDescriptor = $convert.base64Decode(
    'CgRDYXNlEg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlcklkEhsKCX'
    'RlbmFudF9pZBgDIAEoCVIIdGVuYW50SWQSKgoRcmluZ19jYW5kaWRhdGVfaWQYBCABKAlSD3Jp'
    'bmdDYW5kaWRhdGVJZBI7ChpyZV92ZXJpZmljYXRpb25fcmVxdWVzdF9pZBgFIAEoCVIXcmVWZX'
    'JpZmljYXRpb25SZXF1ZXN0SWQSGwoJY2FzZV90eXBlGAYgASgJUghjYXNlVHlwZRIUCgVzdGF0'
    'ZRgHIAEoCVIFc3RhdGUSGgoIcHJpb3JpdHkYCCABKAlSCHByaW9yaXR5EjAKFHRlbXBvcmFsX3'
    'dvcmtmbG93X2lkGAkgASgJUhJ0ZW1wb3JhbFdvcmtmbG93SWQSPQoMc2xhX2RlYWRsaW5lGAog'
    'ASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILc2xhRGVhZGxpbmUSNwoJb3BlbmVkX2'
    'F0GAsgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIb3BlbmVkQXQSNwoJY2xvc2Vk'
    'X2F0GAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIY2xvc2VkQXQSHgoKcmVzb2'
    'x1dGlvbhgNIAEoCVIKcmVzb2x1dGlvbhIqCgZldmVudHMYDiADKAsyEi5jYXNlLnYxLkNhc2VF'
    'dmVudFIGZXZlbnRzEjEKCGV2aWRlbmNlGA8gAygLMhUuY2FzZS52MS5DYXNlRXZpZGVuY2VSCG'
    'V2aWRlbmNlEkkKEmN1cnJlbnRfYXNzaWdubWVudBgQIAEoCzIaLmNhc2UudjEuQW5hbHlzdEFz'
    'c2lnbm1lbnRSEWN1cnJlbnRBc3NpZ25tZW50');

@$core.Deprecated('Use caseEventDescriptor instead')
const CaseEvent$json = {
  '1': 'CaseEvent',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'case_id', '3': 2, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'actor_id', '3': 3, '4': 1, '5': 9, '10': 'actorId'},
    {'1': 'event_type', '3': 4, '4': 1, '5': 9, '10': 'eventType'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    {'1': 'details', '3': 6, '4': 1, '5': 9, '10': 'details'},
    {
      '1': 'created_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `CaseEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caseEventDescriptor = $convert.base64Decode(
    'CglDYXNlRXZlbnQSDgoCaWQYASABKAlSAmlkEhcKB2Nhc2VfaWQYAiABKAlSBmNhc2VJZBIZCg'
    'hhY3Rvcl9pZBgDIAEoCVIHYWN0b3JJZBIdCgpldmVudF90eXBlGAQgASgJUglldmVudFR5cGUS'
    'FgoGc3RhdHVzGAUgASgJUgZzdGF0dXMSGAoHZGV0YWlscxgGIAEoCVIHZGV0YWlscxI5Cgpjcm'
    'VhdGVkX2F0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');

@$core.Deprecated('Use caseEvidenceDescriptor instead')
const CaseEvidence$json = {
  '1': 'CaseEvidence',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'case_id', '3': 2, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'uploaded_by', '3': 3, '4': 1, '5': 9, '10': 'uploadedBy'},
    {'1': 'file_key', '3': 4, '4': 1, '5': 9, '10': 'fileKey'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    {
      '1': 'uploaded_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'uploadedAt'
    },
  ],
};

/// Descriptor for `CaseEvidence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List caseEvidenceDescriptor = $convert.base64Decode(
    'CgxDYXNlRXZpZGVuY2USDgoCaWQYASABKAlSAmlkEhcKB2Nhc2VfaWQYAiABKAlSBmNhc2VJZB'
    'IfCgt1cGxvYWRlZF9ieRgDIAEoCVIKdXBsb2FkZWRCeRIZCghmaWxlX2tleRgEIAEoCVIHZmls'
    'ZUtleRIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SOwoLdXBsb2FkZWRfYXQYBi'
    'ABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgp1cGxvYWRlZEF0');

@$core.Deprecated('Use analystAssignmentDescriptor instead')
const AnalystAssignment$json = {
  '1': 'AnalystAssignment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'case_id', '3': 2, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'analyst_id', '3': 3, '4': 1, '5': 9, '10': 'analystId'},
    {
      '1': 'assigned_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'assignedAt'
    },
    {
      '1': 'unassigned_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'unassignedAt'
    },
  ],
};

/// Descriptor for `AnalystAssignment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analystAssignmentDescriptor = $convert.base64Decode(
    'ChFBbmFseXN0QXNzaWdubWVudBIOCgJpZBgBIAEoCVICaWQSFwoHY2FzZV9pZBgCIAEoCVIGY2'
    'FzZUlkEh0KCmFuYWx5c3RfaWQYAyABKAlSCWFuYWx5c3RJZBI7Cgthc3NpZ25lZF9hdBgEIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCmFzc2lnbmVkQXQSPwoNdW5hc3NpZ25lZF'
    '9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSDHVuYXNzaWduZWRBdA==');

@$core.Deprecated('Use getCaseRequestDescriptor instead')
const GetCaseRequest$json = {
  '1': 'GetCaseRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `GetCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCaseRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRDYXNlUmVxdWVzdBIXCgdjYXNlX2lkGAEgASgJUgZjYXNlSWQSGwoJdGVuYW50X2lkGA'
    'IgASgJUgh0ZW5hbnRJZA==');

@$core.Deprecated('Use getCaseResponseDescriptor instead')
const GetCaseResponse$json = {
  '1': 'GetCaseResponse',
  '2': [
    {'1': 'case', '3': 1, '4': 1, '5': 11, '6': '.case.v1.Case', '10': 'case'},
  ],
};

/// Descriptor for `GetCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCaseResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRDYXNlUmVzcG9uc2USIQoEY2FzZRgBIAEoCzINLmNhc2UudjEuQ2FzZVIEY2FzZQ==');

@$core.Deprecated('Use listCasesRequestDescriptor instead')
const ListCasesRequest$json = {
  '1': 'ListCasesRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'state', '3': 3, '4': 1, '5': 9, '10': 'state'},
    {'1': 'priority', '3': 4, '4': 1, '5': 9, '10': 'priority'},
    {'1': 'case_type', '3': 5, '4': 1, '5': 9, '10': 'caseType'},
    {'1': 'page', '3': 6, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 7, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'date_from', '3': 8, '4': 1, '5': 9, '10': 'dateFrom'},
    {'1': 'date_to', '3': 9, '4': 1, '5': 9, '10': 'dateTo'},
  ],
};

/// Descriptor for `ListCasesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCasesRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0Q2FzZXNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQSGwoJd29ya2'
    'VyX2lkGAIgASgJUgh3b3JrZXJJZBIUCgVzdGF0ZRgDIAEoCVIFc3RhdGUSGgoIcHJpb3JpdHkY'
    'BCABKAlSCHByaW9yaXR5EhsKCWNhc2VfdHlwZRgFIAEoCVIIY2FzZVR5cGUSEgoEcGFnZRgGIA'
    'EoBVIEcGFnZRIUCgVsaW1pdBgHIAEoBVIFbGltaXQSGwoJZGF0ZV9mcm9tGAggASgJUghkYXRl'
    'RnJvbRIXCgdkYXRlX3RvGAkgASgJUgZkYXRlVG8=');

@$core.Deprecated('Use listCasesResponseDescriptor instead')
const ListCasesResponse$json = {
  '1': 'ListCasesResponse',
  '2': [
    {
      '1': 'cases',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.case.v1.Case',
      '10': 'cases'
    },
    {'1': 'total_items', '3': 2, '4': 1, '5': 5, '10': 'totalItems'},
    {'1': 'total_pages', '3': 3, '4': 1, '5': 5, '10': 'totalPages'},
    {'1': 'current_page', '3': 4, '4': 1, '5': 5, '10': 'currentPage'},
  ],
};

/// Descriptor for `ListCasesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCasesResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0Q2FzZXNSZXNwb25zZRIjCgVjYXNlcxgBIAMoCzINLmNhc2UudjEuQ2FzZVIFY2FzZX'
    'MSHwoLdG90YWxfaXRlbXMYAiABKAVSCnRvdGFsSXRlbXMSHwoLdG90YWxfcGFnZXMYAyABKAVS'
    'CnRvdGFsUGFnZXMSIQoMY3VycmVudF9wYWdlGAQgASgFUgtjdXJyZW50UGFnZQ==');

@$core.Deprecated('Use assignCaseRequestDescriptor instead')
const AssignCaseRequest$json = {
  '1': 'AssignCaseRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'analyst_id', '3': 3, '4': 1, '5': 9, '10': 'analystId'},
  ],
};

/// Descriptor for `AssignCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignCaseRequestDescriptor = $convert.base64Decode(
    'ChFBc3NpZ25DYXNlUmVxdWVzdBIXCgdjYXNlX2lkGAEgASgJUgZjYXNlSWQSGwoJdGVuYW50X2'
    'lkGAIgASgJUgh0ZW5hbnRJZBIdCgphbmFseXN0X2lkGAMgASgJUglhbmFseXN0SWQ=');

@$core.Deprecated('Use assignCaseResponseDescriptor instead')
const AssignCaseResponse$json = {
  '1': 'AssignCaseResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AssignCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assignCaseResponseDescriptor =
    $convert.base64Decode(
        'ChJBc3NpZ25DYXNlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use addEvidenceRequestDescriptor instead')
const AddEvidenceRequest$json = {
  '1': 'AddEvidenceRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'file_key', '3': 3, '4': 1, '5': 9, '10': 'fileKey'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'object_key', '3': 5, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `AddEvidenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEvidenceRequestDescriptor = $convert.base64Decode(
    'ChJBZGRFdmlkZW5jZVJlcXVlc3QSFwoHY2FzZV9pZBgBIAEoCVIGY2FzZUlkEhsKCXRlbmFudF'
    '9pZBgCIAEoCVIIdGVuYW50SWQSGQoIZmlsZV9rZXkYAyABKAlSB2ZpbGVLZXkSIAoLZGVzY3Jp'
    'cHRpb24YBCABKAlSC2Rlc2NyaXB0aW9uEh0KCm9iamVjdF9rZXkYBSABKAlSCW9iamVjdEtleQ'
    '==');

@$core.Deprecated('Use addEvidenceResponseDescriptor instead')
const AddEvidenceResponse$json = {
  '1': 'AddEvidenceResponse',
  '2': [
    {'1': 'evidence_id', '3': 1, '4': 1, '5': 9, '10': 'evidenceId'},
  ],
};

/// Descriptor for `AddEvidenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addEvidenceResponseDescriptor = $convert.base64Decode(
    'ChNBZGRFdmlkZW5jZVJlc3BvbnNlEh8KC2V2aWRlbmNlX2lkGAEgASgJUgpldmlkZW5jZUlk');

@$core.Deprecated('Use generateEvidenceUploadURLRequestDescriptor instead')
const GenerateEvidenceUploadURLRequest$json = {
  '1': 'GenerateEvidenceUploadURLRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'file_ext', '3': 3, '4': 1, '5': 9, '10': 'fileExt'},
    {'1': 'content_type', '3': 4, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `GenerateEvidenceUploadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateEvidenceUploadURLRequestDescriptor =
    $convert.base64Decode(
        'CiBHZW5lcmF0ZUV2aWRlbmNlVXBsb2FkVVJMUmVxdWVzdBIXCgdjYXNlX2lkGAEgASgJUgZjYX'
        'NlSWQSGwoJdGVuYW50X2lkGAIgASgJUgh0ZW5hbnRJZBIZCghmaWxlX2V4dBgDIAEoCVIHZmls'
        'ZUV4dBIhCgxjb250ZW50X3R5cGUYBCABKAlSC2NvbnRlbnRUeXBlEiAKC2Rlc2NyaXB0aW9uGA'
        'UgASgJUgtkZXNjcmlwdGlvbg==');

@$core.Deprecated('Use generateEvidenceUploadURLResponseDescriptor instead')
const GenerateEvidenceUploadURLResponse$json = {
  '1': 'GenerateEvidenceUploadURLResponse',
  '2': [
    {'1': 'upload_url', '3': 1, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'object_key', '3': 2, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 5, '10': 'expiresIn'},
    {
      '1': 'required_headers',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.case.v1.GenerateEvidenceUploadURLResponse.RequiredHeadersEntry',
      '10': 'requiredHeaders'
    },
  ],
  '3': [GenerateEvidenceUploadURLResponse_RequiredHeadersEntry$json],
};

@$core.Deprecated('Use generateEvidenceUploadURLResponseDescriptor instead')
const GenerateEvidenceUploadURLResponse_RequiredHeadersEntry$json = {
  '1': 'RequiredHeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GenerateEvidenceUploadURLResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateEvidenceUploadURLResponseDescriptor = $convert.base64Decode(
    'CiFHZW5lcmF0ZUV2aWRlbmNlVXBsb2FkVVJMUmVzcG9uc2USHQoKdXBsb2FkX3VybBgBIAEoCV'
    'IJdXBsb2FkVXJsEh0KCm9iamVjdF9rZXkYAiABKAlSCW9iamVjdEtleRIdCgpleHBpcmVzX2lu'
    'GAMgASgFUglleHBpcmVzSW4SagoQcmVxdWlyZWRfaGVhZGVycxgEIAMoCzI/LmNhc2UudjEuR2'
    'VuZXJhdGVFdmlkZW5jZVVwbG9hZFVSTFJlc3BvbnNlLlJlcXVpcmVkSGVhZGVyc0VudHJ5Ug9y'
    'ZXF1aXJlZEhlYWRlcnMaQgoUUmVxdWlyZWRIZWFkZXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZX'
    'kSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use getEvidenceDownloadURLRequestDescriptor instead')
const GetEvidenceDownloadURLRequest$json = {
  '1': 'GetEvidenceDownloadURLRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'evidence_id', '3': 3, '4': 1, '5': 9, '10': 'evidenceId'},
  ],
};

/// Descriptor for `GetEvidenceDownloadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEvidenceDownloadURLRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXRFdmlkZW5jZURvd25sb2FkVVJMUmVxdWVzdBIXCgdjYXNlX2lkGAEgASgJUgZjYXNlSW'
        'QSGwoJdGVuYW50X2lkGAIgASgJUgh0ZW5hbnRJZBIfCgtldmlkZW5jZV9pZBgDIAEoCVIKZXZp'
        'ZGVuY2VJZA==');

@$core.Deprecated('Use getEvidenceDownloadURLResponseDescriptor instead')
const GetEvidenceDownloadURLResponse$json = {
  '1': 'GetEvidenceDownloadURLResponse',
  '2': [
    {'1': 'download_url', '3': 1, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'expires_in', '3': 2, '4': 1, '5': 5, '10': 'expiresIn'},
  ],
};

/// Descriptor for `GetEvidenceDownloadURLResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEvidenceDownloadURLResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZXRFdmlkZW5jZURvd25sb2FkVVJMUmVzcG9uc2USIQoMZG93bmxvYWRfdXJsGAEgASgJUg'
        'tkb3dubG9hZFVybBIdCgpleHBpcmVzX2luGAIgASgFUglleHBpcmVzSW4=');

@$core.Deprecated('Use addCommentRequestDescriptor instead')
const AddCommentRequest$json = {
  '1': 'AddCommentRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `AddCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCommentRequestDescriptor = $convert.base64Decode(
    'ChFBZGRDb21tZW50UmVxdWVzdBIXCgdjYXNlX2lkGAEgASgJUgZjYXNlSWQSGwoJdGVuYW50X2'
    'lkGAIgASgJUgh0ZW5hbnRJZBIYCgdjb21tZW50GAMgASgJUgdjb21tZW50');

@$core.Deprecated('Use addCommentResponseDescriptor instead')
const AddCommentResponse$json = {
  '1': 'AddCommentResponse',
  '2': [
    {'1': 'event_id', '3': 1, '4': 1, '5': 9, '10': 'eventId'},
  ],
};

/// Descriptor for `AddCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addCommentResponseDescriptor =
    $convert.base64Decode(
        'ChJBZGRDb21tZW50UmVzcG9uc2USGQoIZXZlbnRfaWQYASABKAlSB2V2ZW50SWQ=');

@$core.Deprecated('Use resolveCaseRequestDescriptor instead')
const ResolveCaseRequest$json = {
  '1': 'ResolveCaseRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'resolution_json', '3': 3, '4': 1, '5': 9, '10': 'resolutionJson'},
    {'1': 'final_state', '3': 4, '4': 1, '5': 9, '10': 'finalState'},
  ],
};

/// Descriptor for `ResolveCaseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolveCaseRequestDescriptor = $convert.base64Decode(
    'ChJSZXNvbHZlQ2FzZVJlcXVlc3QSFwoHY2FzZV9pZBgBIAEoCVIGY2FzZUlkEhsKCXRlbmFudF'
    '9pZBgCIAEoCVIIdGVuYW50SWQSJwoPcmVzb2x1dGlvbl9qc29uGAMgASgJUg5yZXNvbHV0aW9u'
    'SnNvbhIfCgtmaW5hbF9zdGF0ZRgEIAEoCVIKZmluYWxTdGF0ZQ==');

@$core.Deprecated('Use resolveCaseResponseDescriptor instead')
const ResolveCaseResponse$json = {
  '1': 'ResolveCaseResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ResolveCaseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resolveCaseResponseDescriptor =
    $convert.base64Decode(
        'ChNSZXNvbHZlQ2FzZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use submitAppealRequestDescriptor instead')
const SubmitAppealRequest$json = {
  '1': 'SubmitAppealRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `SubmitAppealRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitAppealRequestDescriptor = $convert.base64Decode(
    'ChNTdWJtaXRBcHBlYWxSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQSGwoJd2'
    '9ya2VyX2lkGAIgASgJUgh3b3JrZXJJZBIWCgZyZWFzb24YAyABKAlSBnJlYXNvbhIgCgtkZXNj'
    'cmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24=');

@$core.Deprecated('Use submitAppealResponseDescriptor instead')
const SubmitAppealResponse$json = {
  '1': 'SubmitAppealResponse',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {
      '1': 're_verification_request_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'reVerificationRequestId'
    },
  ],
};

/// Descriptor for `SubmitAppealResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitAppealResponseDescriptor = $convert.base64Decode(
    'ChRTdWJtaXRBcHBlYWxSZXNwb25zZRIXCgdjYXNlX2lkGAEgASgJUgZjYXNlSWQSOwoacmVfdm'
    'VyaWZpY2F0aW9uX3JlcXVlc3RfaWQYAiABKAlSF3JlVmVyaWZpY2F0aW9uUmVxdWVzdElk');

@$core.Deprecated('Use getCaseTimelineRequestDescriptor instead')
const GetCaseTimelineRequest$json = {
  '1': 'GetCaseTimelineRequest',
  '2': [
    {'1': 'case_id', '3': 1, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `GetCaseTimelineRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCaseTimelineRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRDYXNlVGltZWxpbmVSZXF1ZXN0EhcKB2Nhc2VfaWQYASABKAlSBmNhc2VJZBIbCgl0ZW'
        '5hbnRfaWQYAiABKAlSCHRlbmFudElk');

@$core.Deprecated('Use getCaseTimelineResponseDescriptor instead')
const GetCaseTimelineResponse$json = {
  '1': 'GetCaseTimelineResponse',
  '2': [
    {
      '1': 'events',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.case.v1.CaseEvent',
      '10': 'events'
    },
  ],
};

/// Descriptor for `GetCaseTimelineResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCaseTimelineResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRDYXNlVGltZWxpbmVSZXNwb25zZRIqCgZldmVudHMYASADKAsyEi5jYXNlLnYxLkNhc2'
        'VFdmVudFIGZXZlbnRz');

@$core.Deprecated('Use listReverificationQueueRequestDescriptor instead')
const ListReverificationQueueRequest$json = {
  '1': 'ListReverificationQueueRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListReverificationQueueRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReverificationQueueRequestDescriptor =
    $convert.base64Decode(
        'Ch5MaXN0UmV2ZXJpZmljYXRpb25RdWV1ZVJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZA==');

@$core.Deprecated('Use reverificationRequestDescriptor instead')
const ReverificationRequest$json = {
  '1': 'ReverificationRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'case_id', '3': 4, '4': 1, '5': 9, '10': 'caseId'},
    {'1': 'trigger_reason', '3': 5, '4': 1, '5': 9, '10': 'triggerReason'},
    {'1': 'trigger_module', '3': 6, '4': 1, '5': 9, '10': 'triggerModule'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {'1': 'deadline', '3': 8, '4': 1, '5': 9, '10': 'deadline'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'completed_at', '3': 10, '4': 1, '5': 9, '10': 'completedAt'},
    {
      '1': 'flagged_documents',
      '3': 11,
      '4': 3,
      '5': 9,
      '10': 'flaggedDocuments'
    },
  ],
};

/// Descriptor for `ReverificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reverificationRequestDescriptor = $convert.base64Decode(
    'ChVSZXZlcmlmaWNhdGlvblJlcXVlc3QSDgoCaWQYASABKAlSAmlkEhsKCXdvcmtlcl9pZBgCIA'
    'EoCVIId29ya2VySWQSGwoJdGVuYW50X2lkGAMgASgJUgh0ZW5hbnRJZBIXCgdjYXNlX2lkGAQg'
    'ASgJUgZjYXNlSWQSJQoOdHJpZ2dlcl9yZWFzb24YBSABKAlSDXRyaWdnZXJSZWFzb24SJQoOdH'
    'JpZ2dlcl9tb2R1bGUYBiABKAlSDXRyaWdnZXJNb2R1bGUSFgoGc3RhdHVzGAcgASgJUgZzdGF0'
    'dXMSGgoIZGVhZGxpbmUYCCABKAlSCGRlYWRsaW5lEh0KCmNyZWF0ZWRfYXQYCSABKAlSCWNyZW'
    'F0ZWRBdBIhCgxjb21wbGV0ZWRfYXQYCiABKAlSC2NvbXBsZXRlZEF0EisKEWZsYWdnZWRfZG9j'
    'dW1lbnRzGAsgAygJUhBmbGFnZ2VkRG9jdW1lbnRz');

@$core.Deprecated('Use listReverificationQueueResponseDescriptor instead')
const ListReverificationQueueResponse$json = {
  '1': 'ListReverificationQueueResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.case.v1.ReverificationRequest',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListReverificationQueueResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReverificationQueueResponseDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0UmV2ZXJpZmljYXRpb25RdWV1ZVJlc3BvbnNlEjQKBWl0ZW1zGAEgAygLMh4uY2FzZS'
        '52MS5SZXZlcmlmaWNhdGlvblJlcXVlc3RSBWl0ZW1z');

@$core.Deprecated('Use requestReverificationRequestDescriptor instead')
const RequestReverificationRequest$json = {
  '1': 'RequestReverificationRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {
      '1': 'flagged_documents',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'flaggedDocuments'
    },
    {'1': 'deadline_days', '3': 3, '4': 1, '5': 5, '10': 'deadlineDays'},
    {'1': 'justification', '3': 4, '4': 1, '5': 9, '10': 'justification'},
  ],
};

/// Descriptor for `RequestReverificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReverificationRequestDescriptor = $convert.base64Decode(
    'ChxSZXF1ZXN0UmV2ZXJpZmljYXRpb25SZXF1ZXN0EhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2'
    'VySWQSKwoRZmxhZ2dlZF9kb2N1bWVudHMYAiADKAlSEGZsYWdnZWREb2N1bWVudHMSIwoNZGVh'
    'ZGxpbmVfZGF5cxgDIAEoBVIMZGVhZGxpbmVEYXlzEiQKDWp1c3RpZmljYXRpb24YBCABKAlSDW'
    'p1c3RpZmljYXRpb24=');

@$core.Deprecated('Use requestReverificationResponseDescriptor instead')
const RequestReverificationResponse$json = {
  '1': 'RequestReverificationResponse',
  '2': [
    {
      '1': 're_verification_request_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'reVerificationRequestId'
    },
  ],
};

/// Descriptor for `RequestReverificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestReverificationResponseDescriptor =
    $convert.base64Decode(
        'Ch1SZXF1ZXN0UmV2ZXJpZmljYXRpb25SZXNwb25zZRI7ChpyZV92ZXJpZmljYXRpb25fcmVxdW'
        'VzdF9pZBgBIAEoCVIXcmVWZXJpZmljYXRpb25SZXF1ZXN0SWQ=');

@$core.Deprecated('Use listReverificationRequestsRequestDescriptor instead')
const ListReverificationRequestsRequest$json = {
  '1': 'ListReverificationRequestsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListReverificationRequestsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReverificationRequestsRequestDescriptor =
    $convert.base64Decode(
        'CiFMaXN0UmV2ZXJpZmljYXRpb25SZXF1ZXN0c1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUg'
        'h0ZW5hbnRJZA==');

@$core.Deprecated('Use listReverificationRequestsResponseDescriptor instead')
const ListReverificationRequestsResponse$json = {
  '1': 'ListReverificationRequestsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.case.v1.ReverificationRequest',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListReverificationRequestsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReverificationRequestsResponseDescriptor =
    $convert.base64Decode(
        'CiJMaXN0UmV2ZXJpZmljYXRpb25SZXF1ZXN0c1Jlc3BvbnNlEjQKBWl0ZW1zGAEgAygLMh4uY2'
        'FzZS52MS5SZXZlcmlmaWNhdGlvblJlcXVlc3RSBWl0ZW1z');
