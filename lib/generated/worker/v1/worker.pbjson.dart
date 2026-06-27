// This is a generated file - do not edit.
//
// Generated from worker/v1/worker.proto.

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

@$core.Deprecated('Use qualificationTypeDescriptor instead')
const QualificationType$json = {
  '1': 'QualificationType',
  '2': [
    {'1': 'QUALIFICATION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'QUALIFICATION_TYPE_DEGREE', '2': 1},
    {'1': 'QUALIFICATION_TYPE_CERTIFICATION', '2': 2},
    {'1': 'QUALIFICATION_TYPE_DIPLOMA', '2': 3},
    {'1': 'QUALIFICATION_TYPE_LICENSE', '2': 4},
    {'1': 'QUALIFICATION_TYPE_APPRENTICESHIP', '2': 5},
  ],
};

/// Descriptor for `QualificationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List qualificationTypeDescriptor = $convert.base64Decode(
    'ChFRdWFsaWZpY2F0aW9uVHlwZRIiCh5RVUFMSUZJQ0FUSU9OX1RZUEVfVU5TUEVDSUZJRUQQAB'
    'IdChlRVUFMSUZJQ0FUSU9OX1RZUEVfREVHUkVFEAESJAogUVVBTElGSUNBVElPTl9UWVBFX0NF'
    'UlRJRklDQVRJT04QAhIeChpRVUFMSUZJQ0FUSU9OX1RZUEVfRElQTE9NQRADEh4KGlFVQUxJRk'
    'lDQVRJT05fVFlQRV9MSUNFTlNFEAQSJQohUVVBTElGSUNBVElPTl9UWVBFX0FQUFJFTlRJQ0VT'
    'SElQEAU=');

@$core.Deprecated('Use profileTypeDescriptor instead')
const ProfileType$json = {
  '1': 'ProfileType',
  '2': [
    {'1': 'PROFILE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PROFILE_TYPE_PERMANENT', '2': 1},
    {'1': 'PROFILE_TYPE_CONTRACTOR', '2': 2},
    {'1': 'PROFILE_TYPE_SEASONAL', '2': 3},
    {'1': 'PROFILE_TYPE_TEMP', '2': 4},
  ],
};

/// Descriptor for `ProfileType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List profileTypeDescriptor = $convert.base64Decode(
    'CgtQcm9maWxlVHlwZRIcChhQUk9GSUxFX1RZUEVfVU5TUEVDSUZJRUQQABIaChZQUk9GSUxFX1'
    'RZUEVfUEVSTUFORU5UEAESGwoXUFJPRklMRV9UWVBFX0NPTlRSQUNUT1IQAhIZChVQUk9GSUxF'
    'X1RZUEVfU0VBU09OQUwQAxIVChFQUk9GSUxFX1RZUEVfVEVNUBAE');

@$core.Deprecated('Use workerPositionDescriptor instead')
const WorkerPosition$json = {
  '1': 'WorkerPosition',
  '2': [
    {'1': 'WORKER_POSITION_UNSPECIFIED', '2': 0},
    {'1': 'WORKER_POSITION_SECURITY_CRITICAL_FACILITY_ACCESS', '2': 1},
    {'1': 'WORKER_POSITION_IT_ADMINISTRATOR', '2': 2},
    {'1': 'WORKER_POSITION_CLOUD_ACCESS', '2': 3},
    {'1': 'WORKER_POSITION_NETWORK_ACCESS', '2': 4},
    {'1': 'WORKER_POSITION_FINANCIAL_ACCESS_CFO', '2': 5},
    {'1': 'WORKER_POSITION_SENSITIVE_DATA_ACCESS', '2': 6},
    {'1': 'WORKER_POSITION_CRITICAL_SUBCONTRACTOR_ELECTRICAL', '2': 7},
    {'1': 'WORKER_POSITION_CRITICAL_SUBCONTRACTOR_IT', '2': 8},
    {'1': 'WORKER_POSITION_CRITICAL_SUBCONTRACTOR_SECURITY', '2': 9},
    {'1': 'WORKER_POSITION_OFFICE_WORKER_SYSTEM_ACCESS', '2': 10},
    {'1': 'WORKER_POSITION_TECHNICAL_SPECIALIST', '2': 11},
    {'1': 'WORKER_POSITION_IT_SUPPORT', '2': 12},
    {'1': 'WORKER_POSITION_RESTRICTED_SUBCONTRACTOR', '2': 13},
    {'1': 'WORKER_POSITION_SUPPORT_STAFF', '2': 14},
    {'1': 'WORKER_POSITION_CLEANING_STAFF', '2': 15},
    {'1': 'WORKER_POSITION_LOGISTICS_STAFF', '2': 16},
    {'1': 'WORKER_POSITION_INTERN', '2': 17},
    {'1': 'WORKER_POSITION_VISITOR', '2': 18},
  ],
};

/// Descriptor for `WorkerPosition`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List workerPositionDescriptor = $convert.base64Decode(
    'Cg5Xb3JrZXJQb3NpdGlvbhIfChtXT1JLRVJfUE9TSVRJT05fVU5TUEVDSUZJRUQQABI1CjFXT1'
    'JLRVJfUE9TSVRJT05fU0VDVVJJVFlfQ1JJVElDQUxfRkFDSUxJVFlfQUNDRVNTEAESJAogV09S'
    'S0VSX1BPU0lUSU9OX0lUX0FETUlOSVNUUkFUT1IQAhIgChxXT1JLRVJfUE9TSVRJT05fQ0xPVU'
    'RfQUNDRVNTEAMSIgoeV09SS0VSX1BPU0lUSU9OX05FVFdPUktfQUNDRVNTEAQSKAokV09SS0VS'
    'X1BPU0lUSU9OX0ZJTkFOQ0lBTF9BQ0NFU1NfQ0ZPEAUSKQolV09SS0VSX1BPU0lUSU9OX1NFTl'
    'NJVElWRV9EQVRBX0FDQ0VTUxAGEjUKMVdPUktFUl9QT1NJVElPTl9DUklUSUNBTF9TVUJDT05U'
    'UkFDVE9SX0VMRUNUUklDQUwQBxItCilXT1JLRVJfUE9TSVRJT05fQ1JJVElDQUxfU1VCQ09OVF'
    'JBQ1RPUl9JVBAIEjMKL1dPUktFUl9QT1NJVElPTl9DUklUSUNBTF9TVUJDT05UUkFDVE9SX1NF'
    'Q1VSSVRZEAkSLworV09SS0VSX1BPU0lUSU9OX09GRklDRV9XT1JLRVJfU1lTVEVNX0FDQ0VTUx'
    'AKEigKJFdPUktFUl9QT1NJVElPTl9URUNITklDQUxfU1BFQ0lBTElTVBALEh4KGldPUktFUl9Q'
    'T1NJVElPTl9JVF9TVVBQT1JUEAwSLAooV09SS0VSX1BPU0lUSU9OX1JFU1RSSUNURURfU1VCQ0'
    '9OVFJBQ1RPUhANEiEKHVdPUktFUl9QT1NJVElPTl9TVVBQT1JUX1NUQUZGEA4SIgoeV09SS0VS'
    'X1BPU0lUSU9OX0NMRUFOSU5HX1NUQUZGEA8SIwofV09SS0VSX1BPU0lUSU9OX0xPR0lTVElDU1'
    '9TVEFGRhAQEhoKFldPUktFUl9QT1NJVElPTl9JTlRFUk4QERIbChdXT1JLRVJfUE9TSVRJT05f'
    'VklTSVRPUhAS');

@$core.Deprecated('Use sentViaDescriptor instead')
const SentVia$json = {
  '1': 'SentVia',
  '2': [
    {'1': 'SENT_VIA_UNSPECIFIED', '2': 0},
    {'1': 'SENT_VIA_EMAIL', '2': 1},
    {'1': 'SENT_VIA_SMS', '2': 2},
    {'1': 'SENT_VIA_WHATSAPP', '2': 3},
  ],
};

/// Descriptor for `SentVia`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sentViaDescriptor = $convert.base64Decode(
    'CgdTZW50VmlhEhgKFFNFTlRfVklBX1VOU1BFQ0lGSUVEEAASEgoOU0VOVF9WSUFfRU1BSUwQAR'
    'IQCgxTRU5UX1ZJQV9TTVMQAhIVChFTRU5UX1ZJQV9XSEFUU0FQUBAD');

@$core.Deprecated('Use submitQualificationRequestDescriptor instead')
const SubmitQualificationRequest$json = {
  '1': 'SubmitQualificationRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'document_id', '3': 3, '4': 1, '5': 9, '10': 'documentId'},
    {
      '1': 'qualification_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.QualificationType',
      '10': 'qualificationType'
    },
    {'1': 'institution', '3': 5, '4': 1, '5': 9, '10': 'institution'},
    {'1': 'stored_path', '3': 6, '4': 1, '5': 9, '10': 'storedPath'},
    {'1': 'contact_email', '3': 7, '4': 1, '5': 9, '10': 'contactEmail'},
  ],
};

/// Descriptor for `SubmitQualificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitQualificationRequestDescriptor = $convert.base64Decode(
    'ChpTdWJtaXRRdWFsaWZpY2F0aW9uUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudE'
    'lkEhsKCXdvcmtlcl9pZBgCIAEoCVIId29ya2VySWQSHwoLZG9jdW1lbnRfaWQYAyABKAlSCmRv'
    'Y3VtZW50SWQSSwoScXVhbGlmaWNhdGlvbl90eXBlGAQgASgOMhwud29ya2VyLnYxLlF1YWxpZm'
    'ljYXRpb25UeXBlUhFxdWFsaWZpY2F0aW9uVHlwZRIgCgtpbnN0aXR1dGlvbhgFIAEoCVILaW5z'
    'dGl0dXRpb24SHwoLc3RvcmVkX3BhdGgYBiABKAlSCnN0b3JlZFBhdGgSIwoNY29udGFjdF9lbW'
    'FpbBgHIAEoCVIMY29udGFjdEVtYWls');

@$core.Deprecated('Use submitQualificationResponseDescriptor instead')
const SubmitQualificationResponse$json = {
  '1': 'SubmitQualificationResponse',
  '2': [
    {'1': 'qualification_id', '3': 1, '4': 1, '5': 9, '10': 'qualificationId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `SubmitQualificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitQualificationResponseDescriptor =
    $convert.base64Decode(
        'ChtTdWJtaXRRdWFsaWZpY2F0aW9uUmVzcG9uc2USKQoQcXVhbGlmaWNhdGlvbl9pZBgBIAEoCV'
        'IPcXVhbGlmaWNhdGlvbklkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use getQualificationStatusRequestDescriptor instead')
const GetQualificationStatusRequest$json = {
  '1': 'GetQualificationStatusRequest',
  '2': [
    {'1': 'qualification_id', '3': 1, '4': 1, '5': 9, '10': 'qualificationId'},
  ],
};

/// Descriptor for `GetQualificationStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getQualificationStatusRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXRRdWFsaWZpY2F0aW9uU3RhdHVzUmVxdWVzdBIpChBxdWFsaWZpY2F0aW9uX2lkGAEgAS'
        'gJUg9xdWFsaWZpY2F0aW9uSWQ=');

@$core.Deprecated('Use getQualificationStatusResponseDescriptor instead')
const GetQualificationStatusResponse$json = {
  '1': 'GetQualificationStatusResponse',
  '2': [
    {'1': 'qualification_id', '3': 1, '4': 1, '5': 9, '10': 'qualificationId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'institution', '3': 3, '4': 1, '5': 9, '10': 'institution'},
    {'1': 'verified_at', '3': 4, '4': 1, '5': 9, '10': 'verifiedAt'},
  ],
};

/// Descriptor for `GetQualificationStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getQualificationStatusResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZXRRdWFsaWZpY2F0aW9uU3RhdHVzUmVzcG9uc2USKQoQcXVhbGlmaWNhdGlvbl9pZBgBIA'
        'EoCVIPcXVhbGlmaWNhdGlvbklkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVzEiAKC2luc3RpdHV0'
        'aW9uGAMgASgJUgtpbnN0aXR1dGlvbhIfCgt2ZXJpZmllZF9hdBgEIAEoCVIKdmVyaWZpZWRBdA'
        '==');

@$core.Deprecated('Use analystOverrideRequestDescriptor instead')
const AnalystOverrideRequest$json = {
  '1': 'AnalystOverrideRequest',
  '2': [
    {'1': 'qualification_id', '3': 1, '4': 1, '5': 9, '10': 'qualificationId'},
    {'1': 'justification', '3': 2, '4': 1, '5': 9, '10': 'justification'},
    {'1': 'approved', '3': 3, '4': 1, '5': 8, '10': 'approved'},
  ],
};

/// Descriptor for `AnalystOverrideRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analystOverrideRequestDescriptor = $convert.base64Decode(
    'ChZBbmFseXN0T3ZlcnJpZGVSZXF1ZXN0EikKEHF1YWxpZmljYXRpb25faWQYASABKAlSD3F1YW'
    'xpZmljYXRpb25JZBIkCg1qdXN0aWZpY2F0aW9uGAIgASgJUg1qdXN0aWZpY2F0aW9uEhoKCGFw'
    'cHJvdmVkGAMgASgIUghhcHByb3ZlZA==');

@$core.Deprecated('Use analystOverrideResponseDescriptor instead')
const AnalystOverrideResponse$json = {
  '1': 'AnalystOverrideResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `AnalystOverrideResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List analystOverrideResponseDescriptor =
    $convert.base64Decode(
        'ChdBbmFseXN0T3ZlcnJpZGVSZXNwb25zZRIWCgZzdGF0dXMYASABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use requestEmployerReferenceRequestDescriptor instead')
const RequestEmployerReferenceRequest$json = {
  '1': 'RequestEmployerReferenceRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'employer_name', '3': 3, '4': 1, '5': 9, '10': 'employerName'},
    {'1': 'contact_email', '3': 4, '4': 1, '5': 9, '10': 'contactEmail'},
    {'1': 'position', '3': 5, '4': 1, '5': 9, '10': 'position'},
    {'1': 'start_date', '3': 6, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 7, '4': 1, '5': 9, '10': 'endDate'},
  ],
};

/// Descriptor for `RequestEmployerReferenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestEmployerReferenceRequestDescriptor = $convert.base64Decode(
    'Ch9SZXF1ZXN0RW1wbG95ZXJSZWZlcmVuY2VSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdG'
    'VuYW50SWQSGwoJd29ya2VyX2lkGAIgASgJUgh3b3JrZXJJZBIjCg1lbXBsb3llcl9uYW1lGAMg'
    'ASgJUgxlbXBsb3llck5hbWUSIwoNY29udGFjdF9lbWFpbBgEIAEoCVIMY29udGFjdEVtYWlsEh'
    'oKCHBvc2l0aW9uGAUgASgJUghwb3NpdGlvbhIdCgpzdGFydF9kYXRlGAYgASgJUglzdGFydERh'
    'dGUSGQoIZW5kX2RhdGUYByABKAlSB2VuZERhdGU=');

@$core.Deprecated('Use requestEmployerReferenceResponseDescriptor instead')
const RequestEmployerReferenceResponse$json = {
  '1': 'RequestEmployerReferenceResponse',
  '2': [
    {'1': 'reference_id', '3': 1, '4': 1, '5': 9, '10': 'referenceId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `RequestEmployerReferenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestEmployerReferenceResponseDescriptor =
    $convert.base64Decode(
        'CiBSZXF1ZXN0RW1wbG95ZXJSZWZlcmVuY2VSZXNwb25zZRIhCgxyZWZlcmVuY2VfaWQYASABKA'
        'lSC3JlZmVyZW5jZUlkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use getEmployerReferenceStatusRequestDescriptor instead')
const GetEmployerReferenceStatusRequest$json = {
  '1': 'GetEmployerReferenceStatusRequest',
  '2': [
    {'1': 'reference_id', '3': 1, '4': 1, '5': 9, '10': 'referenceId'},
  ],
};

/// Descriptor for `GetEmployerReferenceStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEmployerReferenceStatusRequestDescriptor =
    $convert.base64Decode(
        'CiFHZXRFbXBsb3llclJlZmVyZW5jZVN0YXR1c1JlcXVlc3QSIQoMcmVmZXJlbmNlX2lkGAEgAS'
        'gJUgtyZWZlcmVuY2VJZA==');

@$core.Deprecated('Use getEmployerReferenceStatusResponseDescriptor instead')
const GetEmployerReferenceStatusResponse$json = {
  '1': 'GetEmployerReferenceStatusResponse',
  '2': [
    {'1': 'reference_id', '3': 1, '4': 1, '5': 9, '10': 'referenceId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'employer_name', '3': 3, '4': 1, '5': 9, '10': 'employerName'},
    {'1': 'chase_count', '3': 4, '4': 1, '5': 5, '10': 'chaseCount'},
    {
      '1': 'response_received_at',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'responseReceivedAt'
    },
  ],
};

/// Descriptor for `GetEmployerReferenceStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getEmployerReferenceStatusResponseDescriptor =
    $convert.base64Decode(
        'CiJHZXRFbXBsb3llclJlZmVyZW5jZVN0YXR1c1Jlc3BvbnNlEiEKDHJlZmVyZW5jZV9pZBgBIA'
        'EoCVILcmVmZXJlbmNlSWQSFgoGc3RhdHVzGAIgASgJUgZzdGF0dXMSIwoNZW1wbG95ZXJfbmFt'
        'ZRgDIAEoCVIMZW1wbG95ZXJOYW1lEh8KC2NoYXNlX2NvdW50GAQgASgFUgpjaGFzZUNvdW50Ej'
        'AKFHJlc3BvbnNlX3JlY2VpdmVkX2F0GAUgASgJUhJyZXNwb25zZVJlY2VpdmVkQXQ=');

@$core.Deprecated('Use enrollWorkerRequestDescriptor instead')
const EnrollWorkerRequest$json = {
  '1': 'EnrollWorkerRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'surname', '3': 2, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'given_names', '3': 3, '4': 1, '5': 9, '10': 'givenNames'},
    {'1': 'nationality', '3': 4, '4': 1, '5': 9, '10': 'nationality'},
    {
      '1': 'profile_type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.ProfileType',
      '10': 'profileType'
    },
    {
      '1': 'position',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.WorkerPosition',
      '10': 'position'
    },
  ],
};

/// Descriptor for `EnrollWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollWorkerRequestDescriptor = $convert.base64Decode(
    'ChNFbnJvbGxXb3JrZXJSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQSGAoHc3'
    'VybmFtZRgCIAEoCVIHc3VybmFtZRIfCgtnaXZlbl9uYW1lcxgDIAEoCVIKZ2l2ZW5OYW1lcxIg'
    'CgtuYXRpb25hbGl0eRgEIAEoCVILbmF0aW9uYWxpdHkSOQoMcHJvZmlsZV90eXBlGAUgASgOMh'
    'Yud29ya2VyLnYxLlByb2ZpbGVUeXBlUgtwcm9maWxlVHlwZRI1Cghwb3NpdGlvbhgGIAEoDjIZ'
    'Lndvcmtlci52MS5Xb3JrZXJQb3NpdGlvblIIcG9zaXRpb24=');

@$core.Deprecated('Use enrollWorkerResponseDescriptor instead')
const EnrollWorkerResponse$json = {
  '1': 'EnrollWorkerResponse',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `EnrollWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollWorkerResponseDescriptor =
    $convert.base64Decode(
        'ChRFbnJvbGxXb3JrZXJSZXNwb25zZRIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlcklk');

@$core.Deprecated('Use validateInvitationRequestDescriptor instead')
const ValidateInvitationRequest$json = {
  '1': 'ValidateInvitationRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'tenant', '3': 2, '4': 1, '5': 9, '10': 'tenant'},
  ],
};

/// Descriptor for `ValidateInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateInvitationRequestDescriptor =
    $convert.base64Decode(
        'ChlWYWxpZGF0ZUludml0YXRpb25SZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbhIWCgZ0ZW'
        '5hbnQYAiABKAlSBnRlbmFudA==');

@$core.Deprecated('Use validateInvitationResponseDescriptor instead')
const ValidateInvitationResponse$json = {
  '1': 'ValidateInvitationResponse',
  '2': [
    {'1': 'invitation_id', '3': 1, '4': 1, '5': 9, '10': 'invitationId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {
      '1': 'position',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.WorkerPosition',
      '10': 'position'
    },
  ],
};

/// Descriptor for `ValidateInvitationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateInvitationResponseDescriptor = $convert.base64Decode(
    'ChpWYWxpZGF0ZUludml0YXRpb25SZXNwb25zZRIjCg1pbnZpdGF0aW9uX2lkGAEgASgJUgxpbn'
    'ZpdGF0aW9uSWQSGwoJdGVuYW50X2lkGAIgASgJUgh0ZW5hbnRJZBIUCgVlbWFpbBgDIAEoCVIF'
    'ZW1haWwSFgoGc3RhdHVzGAQgASgJUgZzdGF0dXMSNQoIcG9zaXRpb24YBSABKA4yGS53b3JrZX'
    'IudjEuV29ya2VyUG9zaXRpb25SCHBvc2l0aW9u');

@$core.Deprecated('Use createInvitationRequestDescriptor instead')
const CreateInvitationRequest$json = {
  '1': 'CreateInvitationRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'subcontractor_id', '3': 2, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
    {
      '1': 'sent_via',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.SentVia',
      '10': 'sentVia'
    },
    {
      '1': 'position',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.WorkerPosition',
      '10': 'position'
    },
  ],
};

/// Descriptor for `CreateInvitationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInvitationRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVJbnZpdGF0aW9uUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudElkEi'
    'kKEHN1YmNvbnRyYWN0b3JfaWQYAiABKAlSD3N1YmNvbnRyYWN0b3JJZBIUCgVlbWFpbBgDIAEo'
    'CVIFZW1haWwSIQoMcGhvbmVfbnVtYmVyGAQgASgJUgtwaG9uZU51bWJlchItCghzZW50X3ZpYR'
    'gFIAEoDjISLndvcmtlci52MS5TZW50VmlhUgdzZW50VmlhEjUKCHBvc2l0aW9uGAYgASgOMhku'
    'd29ya2VyLnYxLldvcmtlclBvc2l0aW9uUghwb3NpdGlvbg==');

@$core.Deprecated('Use createInvitationResponseDescriptor instead')
const CreateInvitationResponse$json = {
  '1': 'CreateInvitationResponse',
  '2': [
    {'1': 'invitation_id', '3': 1, '4': 1, '5': 9, '10': 'invitationId'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {'1': 'invite_url', '3': 3, '4': 1, '5': 9, '10': 'inviteUrl'},
  ],
};

/// Descriptor for `CreateInvitationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInvitationResponseDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVJbnZpdGF0aW9uUmVzcG9uc2USIwoNaW52aXRhdGlvbl9pZBgBIAEoCVIMaW52aX'
    'RhdGlvbklkEhQKBXRva2VuGAIgASgJUgV0b2tlbhIdCgppbnZpdGVfdXJsGAMgASgJUglpbnZp'
    'dGVVcmw=');

@$core.Deprecated('Use getWorkersByTenantRequestDescriptor instead')
const GetWorkersByTenantRequest$json = {
  '1': 'GetWorkersByTenantRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `GetWorkersByTenantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWorkersByTenantRequestDescriptor =
    $convert.base64Decode(
        'ChlHZXRXb3JrZXJzQnlUZW5hbnRSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
        'QSEgoEcGFnZRgCIAEoBVIEcGFnZRIUCgVsaW1pdBgDIAEoBVIFbGltaXQ=');

@$core.Deprecated('Use workerProfileDescriptor instead')
const WorkerProfile$json = {
  '1': 'WorkerProfile',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'keycloak_user_id', '3': 3, '4': 1, '5': 9, '10': 'keycloakUserId'},
    {'1': 'surname', '3': 4, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'given_names', '3': 5, '4': 1, '5': 9, '10': 'givenNames'},
    {'1': 'nationality', '3': 6, '4': 1, '5': 9, '10': 'nationality'},
    {
      '1': 'profile_type',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.ProfileType',
      '10': 'profileType'
    },
    {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
    {'1': 'enrolled_at', '3': 9, '4': 1, '5': 9, '10': 'enrolledAt'},
    {'1': 'last_verified_at', '3': 10, '4': 1, '5': 9, '10': 'lastVerifiedAt'},
    {
      '1': 'position',
      '3': 11,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.WorkerPosition',
      '10': 'position'
    },
  ],
};

/// Descriptor for `WorkerProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerProfileDescriptor = $convert.base64Decode(
    'Cg1Xb3JrZXJQcm9maWxlEhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySWQSGwoJdGVuYW50X2'
    'lkGAIgASgJUgh0ZW5hbnRJZBIoChBrZXljbG9ha191c2VyX2lkGAMgASgJUg5rZXljbG9ha1Vz'
    'ZXJJZBIYCgdzdXJuYW1lGAQgASgJUgdzdXJuYW1lEh8KC2dpdmVuX25hbWVzGAUgASgJUgpnaX'
    'Zlbk5hbWVzEiAKC25hdGlvbmFsaXR5GAYgASgJUgtuYXRpb25hbGl0eRI5Cgxwcm9maWxlX3R5'
    'cGUYByABKA4yFi53b3JrZXIudjEuUHJvZmlsZVR5cGVSC3Byb2ZpbGVUeXBlEhYKBnN0YXR1cx'
    'gIIAEoCVIGc3RhdHVzEh8KC2Vucm9sbGVkX2F0GAkgASgJUgplbnJvbGxlZEF0EigKEGxhc3Rf'
    'dmVyaWZpZWRfYXQYCiABKAlSDmxhc3RWZXJpZmllZEF0EjUKCHBvc2l0aW9uGAsgASgOMhkud2'
    '9ya2VyLnYxLldvcmtlclBvc2l0aW9uUghwb3NpdGlvbg==');

@$core.Deprecated('Use getWorkersByTenantResponseDescriptor instead')
const GetWorkersByTenantResponse$json = {
  '1': 'GetWorkersByTenantResponse',
  '2': [
    {
      '1': 'workers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.WorkerProfile',
      '10': 'workers'
    },
    {'1': 'total_items', '3': 2, '4': 1, '5': 5, '10': 'totalItems'},
    {'1': 'total_pages', '3': 3, '4': 1, '5': 5, '10': 'totalPages'},
    {'1': 'current_page', '3': 4, '4': 1, '5': 5, '10': 'currentPage'},
  ],
};

/// Descriptor for `GetWorkersByTenantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWorkersByTenantResponseDescriptor = $convert.base64Decode(
    'ChpHZXRXb3JrZXJzQnlUZW5hbnRSZXNwb25zZRIyCgd3b3JrZXJzGAEgAygLMhgud29ya2VyLn'
    'YxLldvcmtlclByb2ZpbGVSB3dvcmtlcnMSHwoLdG90YWxfaXRlbXMYAiABKAVSCnRvdGFsSXRl'
    'bXMSHwoLdG90YWxfcGFnZXMYAyABKAVSCnRvdGFsUGFnZXMSIQoMY3VycmVudF9wYWdlGAQgAS'
    'gFUgtjdXJyZW50UGFnZQ==');

@$core.Deprecated('Use getNotificationHistoryRequestDescriptor instead')
const GetNotificationHistoryRequest$json = {
  '1': 'GetNotificationHistoryRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'page', '3': 3, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 4, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `GetNotificationHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationHistoryRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXROb3RpZmljYXRpb25IaXN0b3J5UmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbm'
        'FudElkEhsKCXdvcmtlcl9pZBgCIAEoCVIId29ya2VySWQSEgoEcGFnZRgDIAEoBVIEcGFnZRIU'
        'CgVsaW1pdBgEIAEoBVIFbGltaXQ=');

@$core.Deprecated('Use notificationLogDescriptor instead')
const NotificationLog$json = {
  '1': 'NotificationLog',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'channel', '3': 4, '4': 1, '5': 9, '10': 'channel'},
    {
      '1': 'notification_type',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'notificationType'
    },
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'failure_reason', '3': 7, '4': 1, '5': 9, '10': 'failureReason'},
    {'1': 'retry_count', '3': 8, '4': 1, '5': 5, '10': 'retryCount'},
    {'1': 'sent_at', '3': 9, '4': 1, '5': 9, '10': 'sentAt'},
    {'1': 'delivered_at', '3': 10, '4': 1, '5': 9, '10': 'deliveredAt'},
  ],
};

/// Descriptor for `NotificationLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationLogDescriptor = $convert.base64Decode(
    'Cg9Ob3RpZmljYXRpb25Mb2cSDgoCaWQYASABKAlSAmlkEhsKCXdvcmtlcl9pZBgCIAEoCVIId2'
    '9ya2VySWQSGwoJdGVuYW50X2lkGAMgASgJUgh0ZW5hbnRJZBIYCgdjaGFubmVsGAQgASgJUgdj'
    'aGFubmVsEisKEW5vdGlmaWNhdGlvbl90eXBlGAUgASgJUhBub3RpZmljYXRpb25UeXBlEhYKBn'
    'N0YXR1cxgGIAEoCVIGc3RhdHVzEiUKDmZhaWx1cmVfcmVhc29uGAcgASgJUg1mYWlsdXJlUmVh'
    'c29uEh8KC3JldHJ5X2NvdW50GAggASgFUgpyZXRyeUNvdW50EhcKB3NlbnRfYXQYCSABKAlSBn'
    'NlbnRBdBIhCgxkZWxpdmVyZWRfYXQYCiABKAlSC2RlbGl2ZXJlZEF0');

@$core.Deprecated('Use getNotificationHistoryResponseDescriptor instead')
const GetNotificationHistoryResponse$json = {
  '1': 'GetNotificationHistoryResponse',
  '2': [
    {
      '1': 'logs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.NotificationLog',
      '10': 'logs'
    },
    {'1': 'total_items', '3': 2, '4': 1, '5': 5, '10': 'totalItems'},
    {'1': 'total_pages', '3': 3, '4': 1, '5': 5, '10': 'totalPages'},
    {'1': 'current_page', '3': 4, '4': 1, '5': 5, '10': 'currentPage'},
  ],
};

/// Descriptor for `GetNotificationHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationHistoryResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZXROb3RpZmljYXRpb25IaXN0b3J5UmVzcG9uc2USLgoEbG9ncxgBIAMoCzIaLndvcmtlci'
        '52MS5Ob3RpZmljYXRpb25Mb2dSBGxvZ3MSHwoLdG90YWxfaXRlbXMYAiABKAVSCnRvdGFsSXRl'
        'bXMSHwoLdG90YWxfcGFnZXMYAyABKAVSCnRvdGFsUGFnZXMSIQoMY3VycmVudF9wYWdlGAQgAS'
        'gFUgtjdXJyZW50UGFnZQ==');

@$core.Deprecated('Use ingestTelemetryRequestDescriptor instead')
const IngestTelemetryRequest$json = {
  '1': 'IngestTelemetryRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'timestamp_ms', '3': 2, '4': 1, '5': 3, '10': 'timestampMs'},
    {'1': 'device_model', '3': 3, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'os_version', '3': 4, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'network_type', '3': 5, '4': 1, '5': 9, '10': 'networkType'},
    {'1': 'is_online', '3': 6, '4': 1, '5': 8, '10': 'isOnline'},
    {'1': 'is_airplane_mode', '3': 7, '4': 1, '5': 8, '10': 'isAirplaneMode'},
    {'1': 'wifi_ssid', '3': 8, '4': 1, '5': 9, '10': 'wifiSsid'},
    {'1': 'wifi_bssid', '3': 9, '4': 1, '5': 9, '10': 'wifiBssid'},
    {'1': 'wifi_ip', '3': 10, '4': 1, '5': 9, '10': 'wifiIp'},
    {'1': 'sim_carrier_name', '3': 11, '4': 1, '5': 9, '10': 'simCarrierName'},
    {'1': 'sim_mcc', '3': 12, '4': 1, '5': 9, '10': 'simMcc'},
    {'1': 'sim_mnc', '3': 13, '4': 1, '5': 9, '10': 'simMnc'},
    {
      '1': 'mobile_network_generation',
      '3': 14,
      '4': 1,
      '5': 9,
      '10': 'mobileNetworkGeneration'
    },
    {'1': 'sim_state', '3': 15, '4': 1, '5': 9, '10': 'simState'},
    {'1': 'gps_latitude', '3': 16, '4': 1, '5': 1, '10': 'gpsLatitude'},
    {'1': 'gps_longitude', '3': 17, '4': 1, '5': 1, '10': 'gpsLongitude'},
    {'1': 'gps_accuracy', '3': 18, '4': 1, '5': 1, '10': 'gpsAccuracy'},
    {'1': 'accel_x', '3': 19, '4': 1, '5': 1, '10': 'accelX'},
    {'1': 'accel_y', '3': 20, '4': 1, '5': 1, '10': 'accelY'},
    {'1': 'accel_z', '3': 21, '4': 1, '5': 1, '10': 'accelZ'},
    {'1': 'signature', '3': 22, '4': 1, '5': 9, '10': 'signature'},
    {'1': 'device_id', '3': 23, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `IngestTelemetryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingestTelemetryRequestDescriptor = $convert.base64Decode(
    'ChZJbmdlc3RUZWxlbWV0cnlSZXF1ZXN0EhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySWQSIQ'
    'oMdGltZXN0YW1wX21zGAIgASgDUgt0aW1lc3RhbXBNcxIhCgxkZXZpY2VfbW9kZWwYAyABKAlS'
    'C2RldmljZU1vZGVsEh0KCm9zX3ZlcnNpb24YBCABKAlSCW9zVmVyc2lvbhIhCgxuZXR3b3JrX3'
    'R5cGUYBSABKAlSC25ldHdvcmtUeXBlEhsKCWlzX29ubGluZRgGIAEoCFIIaXNPbmxpbmUSKAoQ'
    'aXNfYWlycGxhbmVfbW9kZRgHIAEoCFIOaXNBaXJwbGFuZU1vZGUSGwoJd2lmaV9zc2lkGAggAS'
    'gJUgh3aWZpU3NpZBIdCgp3aWZpX2Jzc2lkGAkgASgJUgl3aWZpQnNzaWQSFwoHd2lmaV9pcBgK'
    'IAEoCVIGd2lmaUlwEigKEHNpbV9jYXJyaWVyX25hbWUYCyABKAlSDnNpbUNhcnJpZXJOYW1lEh'
    'cKB3NpbV9tY2MYDCABKAlSBnNpbU1jYxIXCgdzaW1fbW5jGA0gASgJUgZzaW1NbmMSOgoZbW9i'
    'aWxlX25ldHdvcmtfZ2VuZXJhdGlvbhgOIAEoCVIXbW9iaWxlTmV0d29ya0dlbmVyYXRpb24SGw'
    'oJc2ltX3N0YXRlGA8gASgJUghzaW1TdGF0ZRIhCgxncHNfbGF0aXR1ZGUYECABKAFSC2dwc0xh'
    'dGl0dWRlEiMKDWdwc19sb25naXR1ZGUYESABKAFSDGdwc0xvbmdpdHVkZRIhCgxncHNfYWNjdX'
    'JhY3kYEiABKAFSC2dwc0FjY3VyYWN5EhcKB2FjY2VsX3gYEyABKAFSBmFjY2VsWBIXCgdhY2Nl'
    'bF95GBQgASgBUgZhY2NlbFkSFwoHYWNjZWxfehgVIAEoAVIGYWNjZWxaEhwKCXNpZ25hdHVyZR'
    'gWIAEoCVIJc2lnbmF0dXJlEhsKCWRldmljZV9pZBgXIAEoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use ingestTelemetryResponseDescriptor instead')
const IngestTelemetryResponse$json = {
  '1': 'IngestTelemetryResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
  ],
};

/// Descriptor for `IngestTelemetryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingestTelemetryResponseDescriptor =
    $convert.base64Decode(
        'ChdJbmdlc3RUZWxlbWV0cnlSZXNwb25zZRIaCghhY2NlcHRlZBgBIAEoCFIIYWNjZXB0ZWQ=');

@$core.Deprecated('Use raiseTelemetrySecurityEventRequestDescriptor instead')
const RaiseTelemetrySecurityEventRequest$json = {
  '1': 'RaiseTelemetrySecurityEventRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'timestamp_ms', '3': 2, '4': 1, '5': 3, '10': 'timestampMs'},
    {'1': 'device_model', '3': 3, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'os_version', '3': 4, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'gps_latitude', '3': 5, '4': 1, '5': 1, '10': 'gpsLatitude'},
    {'1': 'gps_longitude', '3': 6, '4': 1, '5': 1, '10': 'gpsLongitude'},
    {'1': 'signature', '3': 7, '4': 1, '5': 9, '10': 'signature'},
    {'1': 'device_id', '3': 8, '4': 1, '5': 9, '10': 'deviceId'},
    {
      '1': 'changes',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.RaiseTelemetrySecurityEventRequest.Change',
      '10': 'changes'
    },
  ],
  '3': [RaiseTelemetrySecurityEventRequest_Change$json],
};

@$core.Deprecated('Use raiseTelemetrySecurityEventRequestDescriptor instead')
const RaiseTelemetrySecurityEventRequest_Change$json = {
  '1': 'Change',
  '2': [
    {'1': 'field', '3': 1, '4': 1, '5': 9, '10': 'field'},
    {'1': 'from', '3': 2, '4': 1, '5': 9, '10': 'from'},
    {'1': 'to', '3': 3, '4': 1, '5': 9, '10': 'to'},
    {'1': 'severity', '3': 4, '4': 1, '5': 9, '10': 'severity'},
  ],
};

/// Descriptor for `RaiseTelemetrySecurityEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raiseTelemetrySecurityEventRequestDescriptor = $convert.base64Decode(
    'CiJSYWlzZVRlbGVtZXRyeVNlY3VyaXR5RXZlbnRSZXF1ZXN0EhsKCXdvcmtlcl9pZBgBIAEoCV'
    'IId29ya2VySWQSIQoMdGltZXN0YW1wX21zGAIgASgDUgt0aW1lc3RhbXBNcxIhCgxkZXZpY2Vf'
    'bW9kZWwYAyABKAlSC2RldmljZU1vZGVsEh0KCm9zX3ZlcnNpb24YBCABKAlSCW9zVmVyc2lvbh'
    'IhCgxncHNfbGF0aXR1ZGUYBSABKAFSC2dwc0xhdGl0dWRlEiMKDWdwc19sb25naXR1ZGUYBiAB'
    'KAFSDGdwc0xvbmdpdHVkZRIcCglzaWduYXR1cmUYByABKAlSCXNpZ25hdHVyZRIbCglkZXZpY2'
    'VfaWQYCCABKAlSCGRldmljZUlkEk4KB2NoYW5nZXMYCSADKAsyNC53b3JrZXIudjEuUmFpc2VU'
    'ZWxlbWV0cnlTZWN1cml0eUV2ZW50UmVxdWVzdC5DaGFuZ2VSB2NoYW5nZXMaXgoGQ2hhbmdlEh'
    'QKBWZpZWxkGAEgASgJUgVmaWVsZBISCgRmcm9tGAIgASgJUgRmcm9tEg4KAnRvGAMgASgJUgJ0'
    'bxIaCghzZXZlcml0eRgEIAEoCVIIc2V2ZXJpdHk=');

@$core.Deprecated('Use raiseTelemetrySecurityEventResponseDescriptor instead')
const RaiseTelemetrySecurityEventResponse$json = {
  '1': 'RaiseTelemetrySecurityEventResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
  ],
};

/// Descriptor for `RaiseTelemetrySecurityEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List raiseTelemetrySecurityEventResponseDescriptor =
    $convert.base64Decode(
        'CiNSYWlzZVRlbGVtZXRyeVNlY3VyaXR5RXZlbnRSZXNwb25zZRIaCghhY2NlcHRlZBgBIAEoCF'
        'IIYWNjZXB0ZWQ=');

@$core.Deprecated('Use registerDeviceRequestDescriptor instead')
const RegisterDeviceRequest$json = {
  '1': 'RegisterDeviceRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'public_key', '3': 3, '4': 1, '5': 9, '10': 'publicKey'},
    {'1': 'device_model', '3': 4, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'os_version', '3': 5, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'platform', '3': 6, '4': 1, '5': 9, '10': 'platform'},
    {'1': 'change_reason', '3': 7, '4': 1, '5': 9, '10': 'changeReason'},
  ],
};

/// Descriptor for `RegisterDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlckRldmljZVJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIbCg'
    'lkZXZpY2VfaWQYAiABKAlSCGRldmljZUlkEh0KCnB1YmxpY19rZXkYAyABKAlSCXB1YmxpY0tl'
    'eRIhCgxkZXZpY2VfbW9kZWwYBCABKAlSC2RldmljZU1vZGVsEh0KCm9zX3ZlcnNpb24YBSABKA'
    'lSCW9zVmVyc2lvbhIaCghwbGF0Zm9ybRgGIAEoCVIIcGxhdGZvcm0SIwoNY2hhbmdlX3JlYXNv'
    'bhgHIAEoCVIMY2hhbmdlUmVhc29u');

@$core.Deprecated('Use registerDeviceResponseDescriptor instead')
const RegisterDeviceResponse$json = {
  '1': 'RegisterDeviceResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
  ],
};

/// Descriptor for `RegisterDeviceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceResponseDescriptor =
    $convert.base64Decode(
        'ChZSZWdpc3RlckRldmljZVJlc3BvbnNlEhoKCGFjY2VwdGVkGAEgASgIUghhY2NlcHRlZA==');
