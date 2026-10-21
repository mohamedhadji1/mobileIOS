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

@$core.Deprecated('Use parseCvRequestDescriptor instead')
const ParseCvRequest$json = {
  '1': 'ParseCvRequest',
  '2': [
    {'1': 'stored_path', '3': 1, '4': 1, '5': 9, '10': 'storedPath'},
    {'1': 'worker_id', '3': 3, '4': 1, '5': 9, '10': 'workerId'},
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
  '10': ['bucket_name'],
};

/// Descriptor for `ParseCvRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseCvRequestDescriptor = $convert.base64Decode(
    'Cg5QYXJzZUN2UmVxdWVzdBIfCgtzdG9yZWRfcGF0aBgBIAEoCVIKc3RvcmVkUGF0aBIbCgl3b3'
    'JrZXJfaWQYAyABKAlSCHdvcmtlcklkSgQIAhADUgtidWNrZXRfbmFtZQ==');

@$core.Deprecated('Use cvJobDescriptor instead')
const CvJob$json = {
  '1': 'CvJob',
  '2': [
    {'1': 'employer', '3': 1, '4': 1, '5': 9, '10': 'employer'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'start_date', '3': 3, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 4, '4': 1, '5': 9, '10': 'endDate'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    {'1': 'location', '3': 6, '4': 1, '5': 9, '10': 'location'},
    {'1': 'needs_check', '3': 7, '4': 1, '5': 8, '10': 'needsCheck'},
  ],
};

/// Descriptor for `CvJob`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvJobDescriptor = $convert.base64Decode(
    'CgVDdkpvYhIaCghlbXBsb3llchgBIAEoCVIIZW1wbG95ZXISFAoFdGl0bGUYAiABKAlSBXRpdG'
    'xlEh0KCnN0YXJ0X2RhdGUYAyABKAlSCXN0YXJ0RGF0ZRIZCghlbmRfZGF0ZRgEIAEoCVIHZW5k'
    'RGF0ZRIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcHRpb24SGgoIbG9jYXRpb24YBiABKA'
    'lSCGxvY2F0aW9uEh8KC25lZWRzX2NoZWNrGAcgASgIUgpuZWVkc0NoZWNr');

@$core.Deprecated('Use cvQualificationDescriptor instead')
const CvQualification$json = {
  '1': 'CvQualification',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'institution', '3': 2, '4': 1, '5': 9, '10': 'institution'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'location', '3': 4, '4': 1, '5': 9, '10': 'location'},
    {'1': 'needs_check', '3': 5, '4': 1, '5': 8, '10': 'needsCheck'},
  ],
};

/// Descriptor for `CvQualification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvQualificationDescriptor = $convert.base64Decode(
    'Cg9DdlF1YWxpZmljYXRpb24SEgoEdHlwZRgBIAEoCVIEdHlwZRIgCgtpbnN0aXR1dGlvbhgCIA'
    'EoCVILaW5zdGl0dXRpb24SFAoFdGl0bGUYAyABKAlSBXRpdGxlEhoKCGxvY2F0aW9uGAQgASgJ'
    'Ughsb2NhdGlvbhIfCgtuZWVkc19jaGVjaxgFIAEoCFIKbmVlZHNDaGVjaw==');

@$core.Deprecated('Use cvLinkDescriptor instead')
const CvLink$json = {
  '1': 'CvLink',
  '2': [
    {'1': 'uri', '3': 1, '4': 1, '5': 9, '10': 'uri'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'line', '3': 3, '4': 1, '5': 9, '10': 'line'},
    {'1': 'page', '3': 4, '4': 1, '5': 5, '10': 'page'},
  ],
};

/// Descriptor for `CvLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvLinkDescriptor = $convert.base64Decode(
    'CgZDdkxpbmsSEAoDdXJpGAEgASgJUgN1cmkSEgoEdGV4dBgCIAEoCVIEdGV4dBISCgRsaW5lGA'
    'MgASgJUgRsaW5lEhIKBHBhZ2UYBCABKAVSBHBhZ2U=');

@$core.Deprecated('Use cvContactDescriptor instead')
const CvContact$json = {
  '1': 'CvContact',
  '2': [
    {'1': 'full_name', '3': 1, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'location', '3': 2, '4': 1, '5': 9, '10': 'location'},
    {'1': 'current_title', '3': 3, '4': 1, '5': 9, '10': 'currentTitle'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'needs_check', '3': 6, '4': 1, '5': 8, '10': 'needsCheck'},
  ],
};

/// Descriptor for `CvContact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvContactDescriptor = $convert.base64Decode(
    'CglDdkNvbnRhY3QSGwoJZnVsbF9uYW1lGAEgASgJUghmdWxsTmFtZRIaCghsb2NhdGlvbhgCIA'
    'EoCVIIbG9jYXRpb24SIwoNY3VycmVudF90aXRsZRgDIAEoCVIMY3VycmVudFRpdGxlEhQKBWVt'
    'YWlsGAQgASgJUgVlbWFpbBIUCgVwaG9uZRgFIAEoCVIFcGhvbmUSHwoLbmVlZHNfY2hlY2sYBi'
    'ABKAhSCm5lZWRzQ2hlY2s=');

@$core.Deprecated('Use parseCvResponseDescriptor instead')
const ParseCvResponse$json = {
  '1': 'ParseCvResponse',
  '2': [
    {
      '1': 'jobs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.CvJob',
      '10': 'jobs'
    },
    {
      '1': 'qualifications',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.CvQualification',
      '10': 'qualifications'
    },
    {'1': 'raw_text', '3': 3, '4': 1, '5': 9, '10': 'rawText'},
    {
      '1': 'links',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.CvLink',
      '10': 'links'
    },
    {
      '1': 'contact',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.worker.v1.CvContact',
      '10': 'contact'
    },
  ],
};

/// Descriptor for `ParseCvResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseCvResponseDescriptor = $convert.base64Decode(
    'Cg9QYXJzZUN2UmVzcG9uc2USJAoEam9icxgBIAMoCzIQLndvcmtlci52MS5DdkpvYlIEam9icx'
    'JCCg5xdWFsaWZpY2F0aW9ucxgCIAMoCzIaLndvcmtlci52MS5DdlF1YWxpZmljYXRpb25SDnF1'
    'YWxpZmljYXRpb25zEhkKCHJhd190ZXh0GAMgASgJUgdyYXdUZXh0EicKBWxpbmtzGAQgAygLMh'
    'Eud29ya2VyLnYxLkN2TGlua1IFbGlua3MSLgoHY29udGFjdBgFIAEoCzIULndvcmtlci52MS5D'
    'dkNvbnRhY3RSB2NvbnRhY3Q=');

@$core.Deprecated('Use getInstitutionOutreachRequestDescriptor instead')
const GetInstitutionOutreachRequest$json = {
  '1': 'GetInstitutionOutreachRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `GetInstitutionOutreachRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstitutionOutreachRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXRJbnN0aXR1dGlvbk91dHJlYWNoUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcm'
        'tlcklk');

@$core.Deprecated('Use diplomaExtractionDescriptor instead')
const DiplomaExtraction$json = {
  '1': 'DiplomaExtraction',
  '2': [
    {'1': 'qualification_id', '3': 1, '4': 1, '5': 9, '10': 'qualificationId'},
    {'1': 'document_id', '3': 2, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'holder_name', '3': 3, '4': 1, '5': 9, '10': 'holderName'},
    {'1': 'degree', '3': 4, '4': 1, '5': 9, '10': 'degree'},
    {'1': 'institution', '3': 5, '4': 1, '5': 9, '10': 'institution'},
    {
      '1': 'institution_email',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'institutionEmail'
    },
    {'1': 'graduation_year', '3': 7, '4': 1, '5': 9, '10': 'graduationYear'},
    {'1': 'confidence', '3': 8, '4': 1, '5': 1, '10': 'confidence'},
    {
      '1': 'links',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.CvLink',
      '10': 'links'
    },
  ],
};

/// Descriptor for `DiplomaExtraction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List diplomaExtractionDescriptor = $convert.base64Decode(
    'ChFEaXBsb21hRXh0cmFjdGlvbhIpChBxdWFsaWZpY2F0aW9uX2lkGAEgASgJUg9xdWFsaWZpY2'
    'F0aW9uSWQSHwoLZG9jdW1lbnRfaWQYAiABKAlSCmRvY3VtZW50SWQSHwoLaG9sZGVyX25hbWUY'
    'AyABKAlSCmhvbGRlck5hbWUSFgoGZGVncmVlGAQgASgJUgZkZWdyZWUSIAoLaW5zdGl0dXRpb2'
    '4YBSABKAlSC2luc3RpdHV0aW9uEisKEWluc3RpdHV0aW9uX2VtYWlsGAYgASgJUhBpbnN0aXR1'
    'dGlvbkVtYWlsEicKD2dyYWR1YXRpb25feWVhchgHIAEoCVIOZ3JhZHVhdGlvblllYXISHgoKY2'
    '9uZmlkZW5jZRgIIAEoAVIKY29uZmlkZW5jZRInCgVsaW5rcxgJIAMoCzIRLndvcmtlci52MS5D'
    'dkxpbmtSBWxpbmtz');

@$core.Deprecated('Use outreachTemplateDescriptor instead')
const OutreachTemplate$json = {
  '1': 'OutreachTemplate',
  '2': [
    {'1': 'subject', '3': 1, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'body', '3': 2, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `OutreachTemplate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outreachTemplateDescriptor = $convert.base64Decode(
    'ChBPdXRyZWFjaFRlbXBsYXRlEhgKB3N1YmplY3QYASABKAlSB3N1YmplY3QSEgoEYm9keRgCIA'
    'EoCVIEYm9keQ==');

@$core.Deprecated('Use institutionOutreachDescriptor instead')
const InstitutionOutreach$json = {
  '1': 'InstitutionOutreach',
  '2': [
    {'1': 'outreach_id', '3': 1, '4': 1, '5': 9, '10': 'outreachId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'to_address', '3': 3, '4': 1, '5': 9, '10': 'toAddress'},
    {'1': 'subject', '3': 4, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'body', '3': 5, '4': 1, '5': 9, '10': 'body'},
    {'1': 'sent_at', '3': 6, '4': 1, '5': 9, '10': 'sentAt'},
    {
      '1': 'response_received_at',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'responseReceivedAt'
    },
    {'1': 'response_content', '3': 8, '4': 1, '5': 9, '10': 'responseContent'},
    {'1': 'response_verdict', '3': 9, '4': 1, '5': 9, '10': 'responseVerdict'},
  ],
};

/// Descriptor for `InstitutionOutreach`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List institutionOutreachDescriptor = $convert.base64Decode(
    'ChNJbnN0aXR1dGlvbk91dHJlYWNoEh8KC291dHJlYWNoX2lkGAEgASgJUgpvdXRyZWFjaElkEh'
    'YKBnN0YXR1cxgCIAEoCVIGc3RhdHVzEh0KCnRvX2FkZHJlc3MYAyABKAlSCXRvQWRkcmVzcxIY'
    'CgdzdWJqZWN0GAQgASgJUgdzdWJqZWN0EhIKBGJvZHkYBSABKAlSBGJvZHkSFwoHc2VudF9hdB'
    'gGIAEoCVIGc2VudEF0EjAKFHJlc3BvbnNlX3JlY2VpdmVkX2F0GAcgASgJUhJyZXNwb25zZVJl'
    'Y2VpdmVkQXQSKQoQcmVzcG9uc2VfY29udGVudBgIIAEoCVIPcmVzcG9uc2VDb250ZW50EikKEH'
    'Jlc3BvbnNlX3ZlcmRpY3QYCSABKAlSD3Jlc3BvbnNlVmVyZGljdA==');

@$core.Deprecated('Use getInstitutionOutreachResponseDescriptor instead')
const GetInstitutionOutreachResponse$json = {
  '1': 'GetInstitutionOutreachResponse',
  '2': [
    {
      '1': 'diploma',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.worker.v1.DiplomaExtraction',
      '10': 'diploma'
    },
    {
      '1': 'template',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.worker.v1.OutreachTemplate',
      '10': 'template'
    },
    {
      '1': 'latest',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.worker.v1.InstitutionOutreach',
      '10': 'latest'
    },
  ],
};

/// Descriptor for `GetInstitutionOutreachResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstitutionOutreachResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZXRJbnN0aXR1dGlvbk91dHJlYWNoUmVzcG9uc2USNgoHZGlwbG9tYRgBIAEoCzIcLndvcm'
        'tlci52MS5EaXBsb21hRXh0cmFjdGlvblIHZGlwbG9tYRI3Cgh0ZW1wbGF0ZRgCIAEoCzIbLndv'
        'cmtlci52MS5PdXRyZWFjaFRlbXBsYXRlUgh0ZW1wbGF0ZRI2CgZsYXRlc3QYAyABKAsyHi53b3'
        'JrZXIudjEuSW5zdGl0dXRpb25PdXRyZWFjaFIGbGF0ZXN0');

@$core.Deprecated('Use sendInstitutionOutreachRequestDescriptor instead')
const SendInstitutionOutreachRequest$json = {
  '1': 'SendInstitutionOutreachRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'qualification_id', '3': 2, '4': 1, '5': 9, '10': 'qualificationId'},
    {'1': 'to_address', '3': 3, '4': 1, '5': 9, '10': 'toAddress'},
    {'1': 'subject', '3': 4, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'body', '3': 5, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `SendInstitutionOutreachRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendInstitutionOutreachRequestDescriptor =
    $convert.base64Decode(
        'Ch5TZW5kSW5zdGl0dXRpb25PdXRyZWFjaFJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3'
        'JrZXJJZBIpChBxdWFsaWZpY2F0aW9uX2lkGAIgASgJUg9xdWFsaWZpY2F0aW9uSWQSHQoKdG9f'
        'YWRkcmVzcxgDIAEoCVIJdG9BZGRyZXNzEhgKB3N1YmplY3QYBCABKAlSB3N1YmplY3QSEgoEYm'
        '9keRgFIAEoCVIEYm9keQ==');

@$core.Deprecated('Use sendInstitutionOutreachResponseDescriptor instead')
const SendInstitutionOutreachResponse$json = {
  '1': 'SendInstitutionOutreachResponse',
  '2': [
    {
      '1': 'outreach',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.worker.v1.InstitutionOutreach',
      '10': 'outreach'
    },
  ],
};

/// Descriptor for `SendInstitutionOutreachResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendInstitutionOutreachResponseDescriptor =
    $convert.base64Decode(
        'Ch9TZW5kSW5zdGl0dXRpb25PdXRyZWFjaFJlc3BvbnNlEjoKCG91dHJlYWNoGAEgASgLMh4ud2'
        '9ya2VyLnYxLkluc3RpdHV0aW9uT3V0cmVhY2hSCG91dHJlYWNo');

@$core.Deprecated('Use listOutreachRepliesRequestDescriptor instead')
const ListOutreachRepliesRequest$json = {
  '1': 'ListOutreachRepliesRequest',
  '2': [
    {'1': 'since', '3': 1, '4': 1, '5': 9, '10': 'since'},
  ],
};

/// Descriptor for `ListOutreachRepliesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOutreachRepliesRequestDescriptor =
    $convert.base64Decode(
        'ChpMaXN0T3V0cmVhY2hSZXBsaWVzUmVxdWVzdBIUCgVzaW5jZRgBIAEoCVIFc2luY2U=');

@$core.Deprecated('Use outreachReplyDescriptor instead')
const OutreachReply$json = {
  '1': 'OutreachReply',
  '2': [
    {'1': 'outreach_id', '3': 1, '4': 1, '5': 9, '10': 'outreachId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'worker_name', '3': 3, '4': 1, '5': 9, '10': 'workerName'},
    {'1': 'institution', '3': 4, '4': 1, '5': 9, '10': 'institution'},
    {'1': 'received_at', '3': 5, '4': 1, '5': 9, '10': 'receivedAt'},
    {'1': 'response_verdict', '3': 6, '4': 1, '5': 9, '10': 'responseVerdict'},
  ],
};

/// Descriptor for `OutreachReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outreachReplyDescriptor = $convert.base64Decode(
    'Cg1PdXRyZWFjaFJlcGx5Eh8KC291dHJlYWNoX2lkGAEgASgJUgpvdXRyZWFjaElkEhsKCXdvcm'
    'tlcl9pZBgCIAEoCVIId29ya2VySWQSHwoLd29ya2VyX25hbWUYAyABKAlSCndvcmtlck5hbWUS'
    'IAoLaW5zdGl0dXRpb24YBCABKAlSC2luc3RpdHV0aW9uEh8KC3JlY2VpdmVkX2F0GAUgASgJUg'
    'pyZWNlaXZlZEF0EikKEHJlc3BvbnNlX3ZlcmRpY3QYBiABKAlSD3Jlc3BvbnNlVmVyZGljdA==');

@$core.Deprecated('Use listOutreachRepliesResponseDescriptor instead')
const ListOutreachRepliesResponse$json = {
  '1': 'ListOutreachRepliesResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.OutreachReply',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListOutreachRepliesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listOutreachRepliesResponseDescriptor =
    $convert.base64Decode(
        'ChtMaXN0T3V0cmVhY2hSZXBsaWVzUmVzcG9uc2USLgoFaXRlbXMYASADKAsyGC53b3JrZXIudj'
        'EuT3V0cmVhY2hSZXBseVIFaXRlbXM=');

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
    {'1': 'description', '3': 8, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `RequestEmployerReferenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestEmployerReferenceRequestDescriptor = $convert.base64Decode(
    'Ch9SZXF1ZXN0RW1wbG95ZXJSZWZlcmVuY2VSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdG'
    'VuYW50SWQSGwoJd29ya2VyX2lkGAIgASgJUgh3b3JrZXJJZBIjCg1lbXBsb3llcl9uYW1lGAMg'
    'ASgJUgxlbXBsb3llck5hbWUSIwoNY29udGFjdF9lbWFpbBgEIAEoCVIMY29udGFjdEVtYWlsEh'
    'oKCHBvc2l0aW9uGAUgASgJUghwb3NpdGlvbhIdCgpzdGFydF9kYXRlGAYgASgJUglzdGFydERh'
    'dGUSGQoIZW5kX2RhdGUYByABKAlSB2VuZERhdGUSIAoLZGVzY3JpcHRpb24YCCABKAlSC2Rlc2'
    'NyaXB0aW9u');

@$core.Deprecated('Use sendReferenceRequestRequestDescriptor instead')
const SendReferenceRequestRequest$json = {
  '1': 'SendReferenceRequestRequest',
  '2': [
    {'1': 'reference_id', '3': 1, '4': 1, '5': 9, '10': 'referenceId'},
    {'1': 'to_address', '3': 2, '4': 1, '5': 9, '10': 'toAddress'},
  ],
};

/// Descriptor for `SendReferenceRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendReferenceRequestRequestDescriptor =
    $convert.base64Decode(
        'ChtTZW5kUmVmZXJlbmNlUmVxdWVzdFJlcXVlc3QSIQoMcmVmZXJlbmNlX2lkGAEgASgJUgtyZW'
        'ZlcmVuY2VJZBIdCgp0b19hZGRyZXNzGAIgASgJUgl0b0FkZHJlc3M=');

@$core.Deprecated('Use sendReferenceRequestResponseDescriptor instead')
const SendReferenceRequestResponse$json = {
  '1': 'SendReferenceRequestResponse',
  '2': [
    {'1': 'reference_id', '3': 1, '4': 1, '5': 9, '10': 'referenceId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `SendReferenceRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendReferenceRequestResponseDescriptor =
    $convert.base64Decode(
        'ChxTZW5kUmVmZXJlbmNlUmVxdWVzdFJlc3BvbnNlEiEKDHJlZmVyZW5jZV9pZBgBIAEoCVILcm'
        'VmZXJlbmNlSWQSFgoGc3RhdHVzGAIgASgJUgZzdGF0dXM=');

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
    {'1': 'date_of_birth', '3': 7, '4': 1, '5': 9, '10': 'dateOfBirth'},
  ],
};

/// Descriptor for `EnrollWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollWorkerRequestDescriptor = $convert.base64Decode(
    'ChNFbnJvbGxXb3JrZXJSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQSGAoHc3'
    'VybmFtZRgCIAEoCVIHc3VybmFtZRIfCgtnaXZlbl9uYW1lcxgDIAEoCVIKZ2l2ZW5OYW1lcxIg'
    'CgtuYXRpb25hbGl0eRgEIAEoCVILbmF0aW9uYWxpdHkSOQoMcHJvZmlsZV90eXBlGAUgASgOMh'
    'Yud29ya2VyLnYxLlByb2ZpbGVUeXBlUgtwcm9maWxlVHlwZRI1Cghwb3NpdGlvbhgGIAEoDjIZ'
    'Lndvcmtlci52MS5Xb3JrZXJQb3NpdGlvblIIcG9zaXRpb24SIgoNZGF0ZV9vZl9iaXJ0aBgHIA'
    'EoCVILZGF0ZU9mQmlydGg=');

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

@$core.Deprecated('Use directoryInviteeDescriptor instead')
const DirectoryInvitee$json = {
  '1': 'DirectoryInvitee',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'external_id', '3': 3, '4': 1, '5': 9, '10': 'externalId'},
  ],
};

/// Descriptor for `DirectoryInvitee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List directoryInviteeDescriptor = $convert.base64Decode(
    'ChBEaXJlY3RvcnlJbnZpdGVlEhQKBWVtYWlsGAEgASgJUgVlbWFpbBIhCgxkaXNwbGF5X25hbW'
    'UYAiABKAlSC2Rpc3BsYXlOYW1lEh8KC2V4dGVybmFsX2lkGAMgASgJUgpleHRlcm5hbElk');

@$core.Deprecated('Use inviteDirectoryUsersRequestDescriptor instead')
const InviteDirectoryUsersRequest$json = {
  '1': 'InviteDirectoryUsersRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {
      '1': 'invitees',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.DirectoryInvitee',
      '10': 'invitees'
    },
    {'1': 'subcontractor_id', '3': 3, '4': 1, '5': 9, '10': 'subcontractorId'},
    {
      '1': 'position',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.WorkerPosition',
      '10': 'position'
    },
    {
      '1': 'sent_via',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.worker.v1.SentVia',
      '10': 'sentVia'
    },
  ],
};

/// Descriptor for `InviteDirectoryUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteDirectoryUsersRequestDescriptor = $convert.base64Decode(
    'ChtJbnZpdGVEaXJlY3RvcnlVc2Vyc1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbn'
    'RJZBI3CghpbnZpdGVlcxgCIAMoCzIbLndvcmtlci52MS5EaXJlY3RvcnlJbnZpdGVlUghpbnZp'
    'dGVlcxIpChBzdWJjb250cmFjdG9yX2lkGAMgASgJUg9zdWJjb250cmFjdG9ySWQSNQoIcG9zaX'
    'Rpb24YBCABKA4yGS53b3JrZXIudjEuV29ya2VyUG9zaXRpb25SCHBvc2l0aW9uEi0KCHNlbnRf'
    'dmlhGAUgASgOMhIud29ya2VyLnYxLlNlbnRWaWFSB3NlbnRWaWE=');

@$core.Deprecated('Use inviteDirectoryUsersResultDescriptor instead')
const InviteDirectoryUsersResult$json = {
  '1': 'InviteDirectoryUsersResult',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'invitation_id', '3': 3, '4': 1, '5': 9, '10': 'invitationId'},
    {'1': 'error', '3': 4, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `InviteDirectoryUsersResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteDirectoryUsersResultDescriptor =
    $convert.base64Decode(
        'ChpJbnZpdGVEaXJlY3RvcnlVc2Vyc1Jlc3VsdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSFgoGc3'
        'RhdHVzGAIgASgJUgZzdGF0dXMSIwoNaW52aXRhdGlvbl9pZBgDIAEoCVIMaW52aXRhdGlvbklk'
        'EhQKBWVycm9yGAQgASgJUgVlcnJvcg==');

@$core.Deprecated('Use inviteDirectoryUsersResponseDescriptor instead')
const InviteDirectoryUsersResponse$json = {
  '1': 'InviteDirectoryUsersResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.InviteDirectoryUsersResult',
      '10': 'results'
    },
    {'1': 'created', '3': 2, '4': 1, '5': 5, '10': 'created'},
    {'1': 'skipped', '3': 3, '4': 1, '5': 5, '10': 'skipped'},
    {'1': 'failed', '3': 4, '4': 1, '5': 5, '10': 'failed'},
  ],
};

/// Descriptor for `InviteDirectoryUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inviteDirectoryUsersResponseDescriptor = $convert.base64Decode(
    'ChxJbnZpdGVEaXJlY3RvcnlVc2Vyc1Jlc3BvbnNlEj8KB3Jlc3VsdHMYASADKAsyJS53b3JrZX'
    'IudjEuSW52aXRlRGlyZWN0b3J5VXNlcnNSZXN1bHRSB3Jlc3VsdHMSGAoHY3JlYXRlZBgCIAEo'
    'BVIHY3JlYXRlZBIYCgdza2lwcGVkGAMgASgFUgdza2lwcGVkEhYKBmZhaWxlZBgEIAEoBVIGZm'
    'FpbGVk');

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
    {'1': 'subcontractor_id', '3': 12, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'contact_email', '3': 13, '4': 1, '5': 9, '10': 'contactEmail'},
    {'1': 'date_of_birth', '3': 14, '4': 1, '5': 9, '10': 'dateOfBirth'},
    {'1': 'deleted_at', '3': 15, '4': 1, '5': 9, '10': 'deletedAt'},
    {'1': 'deleted_by', '3': 16, '4': 1, '5': 9, '10': 'deletedBy'},
    {'1': 'deletion_reason', '3': 17, '4': 1, '5': 9, '10': 'deletionReason'},
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
    '9ya2VyLnYxLldvcmtlclBvc2l0aW9uUghwb3NpdGlvbhIpChBzdWJjb250cmFjdG9yX2lkGAwg'
    'ASgJUg9zdWJjb250cmFjdG9ySWQSIwoNY29udGFjdF9lbWFpbBgNIAEoCVIMY29udGFjdEVtYW'
    'lsEiIKDWRhdGVfb2ZfYmlydGgYDiABKAlSC2RhdGVPZkJpcnRoEh0KCmRlbGV0ZWRfYXQYDyAB'
    'KAlSCWRlbGV0ZWRBdBIdCgpkZWxldGVkX2J5GBAgASgJUglkZWxldGVkQnkSJwoPZGVsZXRpb2'
    '5fcmVhc29uGBEgASgJUg5kZWxldGlvblJlYXNvbg==');

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
    {'1': 'gotify_token', '3': 8, '4': 1, '5': 9, '10': 'gotifyToken'},
  ],
};

/// Descriptor for `RegisterDeviceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerDeviceRequestDescriptor = $convert.base64Decode(
    'ChVSZWdpc3RlckRldmljZVJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIbCg'
    'lkZXZpY2VfaWQYAiABKAlSCGRldmljZUlkEh0KCnB1YmxpY19rZXkYAyABKAlSCXB1YmxpY0tl'
    'eRIhCgxkZXZpY2VfbW9kZWwYBCABKAlSC2RldmljZU1vZGVsEh0KCm9zX3ZlcnNpb24YBSABKA'
    'lSCW9zVmVyc2lvbhIaCghwbGF0Zm9ybRgGIAEoCVIIcGxhdGZvcm0SIwoNY2hhbmdlX3JlYXNv'
    'bhgHIAEoCVIMY2hhbmdlUmVhc29uEiEKDGdvdGlmeV90b2tlbhgIIAEoCVILZ290aWZ5VG9rZW'
    '4=');

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

@$core.Deprecated('Use registerPushTokenRequestDescriptor instead')
const RegisterPushTokenRequest$json = {
  '1': 'RegisterPushTokenRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'gotify_token', '3': 3, '4': 1, '5': 9, '10': 'gotifyToken'},
    {'1': 'endpoint_url', '3': 4, '4': 1, '5': 9, '10': 'endpointUrl'},
    {'1': 'source', '3': 5, '4': 1, '5': 9, '10': 'source'},
  ],
};

/// Descriptor for `RegisterPushTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerPushTokenRequestDescriptor = $convert.base64Decode(
    'ChhSZWdpc3RlclB1c2hUb2tlblJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZB'
    'IbCglkZXZpY2VfaWQYAiABKAlSCGRldmljZUlkEiEKDGdvdGlmeV90b2tlbhgDIAEoCVILZ290'
    'aWZ5VG9rZW4SIQoMZW5kcG9pbnRfdXJsGAQgASgJUgtlbmRwb2ludFVybBIWCgZzb3VyY2UYBS'
    'ABKAlSBnNvdXJjZQ==');

@$core.Deprecated('Use registerPushTokenResponseDescriptor instead')
const RegisterPushTokenResponse$json = {
  '1': 'RegisterPushTokenResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
  ],
};

/// Descriptor for `RegisterPushTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerPushTokenResponseDescriptor =
    $convert.base64Decode(
        'ChlSZWdpc3RlclB1c2hUb2tlblJlc3BvbnNlEhoKCGFjY2VwdGVkGAEgASgIUghhY2NlcHRlZA'
        '==');

@$core.Deprecated('Use provisionPushTargetRequestDescriptor instead')
const ProvisionPushTargetRequest$json = {
  '1': 'ProvisionPushTargetRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `ProvisionPushTargetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List provisionPushTargetRequestDescriptor =
    $convert.base64Decode(
        'ChpQcm92aXNpb25QdXNoVGFyZ2V0UmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlck'
        'lkEhsKCWRldmljZV9pZBgCIAEoCVIIZGV2aWNlSWQ=');

@$core.Deprecated('Use provisionPushTargetResponseDescriptor instead')
const ProvisionPushTargetResponse$json = {
  '1': 'ProvisionPushTargetResponse',
  '2': [
    {'1': 'client_token', '3': 1, '4': 1, '5': 9, '10': 'clientToken'},
    {'1': 'stream_url', '3': 2, '4': 1, '5': 9, '10': 'streamUrl'},
  ],
};

/// Descriptor for `ProvisionPushTargetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List provisionPushTargetResponseDescriptor =
    $convert.base64Decode(
        'ChtQcm92aXNpb25QdXNoVGFyZ2V0UmVzcG9uc2USIQoMY2xpZW50X3Rva2VuGAEgASgJUgtjbG'
        'llbnRUb2tlbhIdCgpzdHJlYW1fdXJsGAIgASgJUglzdHJlYW1Vcmw=');

@$core.Deprecated('Use createSubcontractorRequestDescriptor instead')
const CreateSubcontractorRequest$json = {
  '1': 'CreateSubcontractorRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'org_name', '3': 2, '4': 1, '5': 9, '10': 'orgName'},
    {'1': 'contact_name', '3': 3, '4': 1, '5': 9, '10': 'contactName'},
    {'1': 'contact_email', '3': 4, '4': 1, '5': 9, '10': 'contactEmail'},
  ],
};

/// Descriptor for `CreateSubcontractorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSubcontractorRequestDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVTdWJjb250cmFjdG9yUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudE'
        'lkEhkKCG9yZ19uYW1lGAIgASgJUgdvcmdOYW1lEiEKDGNvbnRhY3RfbmFtZRgDIAEoCVILY29u'
        'dGFjdE5hbWUSIwoNY29udGFjdF9lbWFpbBgEIAEoCVIMY29udGFjdEVtYWls');

@$core.Deprecated('Use subcontractorDescriptor instead')
const Subcontractor$json = {
  '1': 'Subcontractor',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'org_name', '3': 2, '4': 1, '5': 9, '10': 'orgName'},
    {'1': 'contact_name', '3': 3, '4': 1, '5': 9, '10': 'contactName'},
    {'1': 'contact_email', '3': 4, '4': 1, '5': 9, '10': 'contactEmail'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `Subcontractor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subcontractorDescriptor = $convert.base64Decode(
    'Cg1TdWJjb250cmFjdG9yEg4KAmlkGAEgASgJUgJpZBIZCghvcmdfbmFtZRgCIAEoCVIHb3JnTm'
    'FtZRIhCgxjb250YWN0X25hbWUYAyABKAlSC2NvbnRhY3ROYW1lEiMKDWNvbnRhY3RfZW1haWwY'
    'BCABKAlSDGNvbnRhY3RFbWFpbBIWCgZzdGF0dXMYBSABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use createSubcontractorResponseDescriptor instead')
const CreateSubcontractorResponse$json = {
  '1': 'CreateSubcontractorResponse',
  '2': [
    {
      '1': 'item',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.worker.v1.Subcontractor',
      '10': 'item'
    },
  ],
};

/// Descriptor for `CreateSubcontractorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSubcontractorResponseDescriptor =
    $convert.base64Decode(
        'ChtDcmVhdGVTdWJjb250cmFjdG9yUmVzcG9uc2USLAoEaXRlbRgBIAEoCzIYLndvcmtlci52MS'
        '5TdWJjb250cmFjdG9yUgRpdGVt');

@$core.Deprecated('Use listSubcontractorsRequestDescriptor instead')
const ListSubcontractorsRequest$json = {
  '1': 'ListSubcontractorsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListSubcontractorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSubcontractorsRequestDescriptor =
    $convert.base64Decode(
        'ChlMaXN0U3ViY29udHJhY3RvcnNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
        'Q=');

@$core.Deprecated('Use listSubcontractorsResponseDescriptor instead')
const ListSubcontractorsResponse$json = {
  '1': 'ListSubcontractorsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.Subcontractor',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListSubcontractorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSubcontractorsResponseDescriptor =
    $convert.base64Decode(
        'ChpMaXN0U3ViY29udHJhY3RvcnNSZXNwb25zZRIuCgVpdGVtcxgBIAMoCzIYLndvcmtlci52MS'
        '5TdWJjb250cmFjdG9yUgVpdGVtcw==');

@$core.Deprecated('Use listInvitationsRequestDescriptor instead')
const ListInvitationsRequest$json = {
  '1': 'ListInvitationsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListInvitationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInvitationsRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0SW52aXRhdGlvbnNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQ=');

@$core.Deprecated('Use workerInvitationDescriptor instead')
const WorkerInvitation$json = {
  '1': 'WorkerInvitation',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'subcontractor_id', '3': 3, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'worker_id', '3': 4, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'phone_number', '3': 5, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 6, '4': 1, '5': 9, '10': 'email'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
    {'1': 'sent_via', '3': 8, '4': 1, '5': 9, '10': 'sentVia'},
    {'1': 'expires_at', '3': 9, '4': 1, '5': 9, '10': 'expiresAt'},
    {'1': 'position', '3': 10, '4': 1, '5': 9, '10': 'position'},
    {'1': 'created_at', '3': 11, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'accepted_at', '3': 12, '4': 1, '5': 9, '10': 'acceptedAt'},
  ],
};

/// Descriptor for `WorkerInvitation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerInvitationDescriptor = $convert.base64Decode(
    'ChBXb3JrZXJJbnZpdGF0aW9uEg4KAmlkGAEgASgJUgJpZBIbCgl0ZW5hbnRfaWQYAiABKAlSCH'
    'RlbmFudElkEikKEHN1YmNvbnRyYWN0b3JfaWQYAyABKAlSD3N1YmNvbnRyYWN0b3JJZBIbCgl3'
    'b3JrZXJfaWQYBCABKAlSCHdvcmtlcklkEiEKDHBob25lX251bWJlchgFIAEoCVILcGhvbmVOdW'
    '1iZXISFAoFZW1haWwYBiABKAlSBWVtYWlsEhYKBnN0YXR1cxgHIAEoCVIGc3RhdHVzEhkKCHNl'
    'bnRfdmlhGAggASgJUgdzZW50VmlhEh0KCmV4cGlyZXNfYXQYCSABKAlSCWV4cGlyZXNBdBIaCg'
    'hwb3NpdGlvbhgKIAEoCVIIcG9zaXRpb24SHQoKY3JlYXRlZF9hdBgLIAEoCVIJY3JlYXRlZEF0'
    'Eh8KC2FjY2VwdGVkX2F0GAwgASgJUgphY2NlcHRlZEF0');

@$core.Deprecated('Use listInvitationsResponseDescriptor instead')
const ListInvitationsResponse$json = {
  '1': 'ListInvitationsResponse',
  '2': [
    {
      '1': 'invitations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.WorkerInvitation',
      '10': 'invitations'
    },
  ],
};

/// Descriptor for `ListInvitationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInvitationsResponseDescriptor =
    $convert.base64Decode(
        'ChdMaXN0SW52aXRhdGlvbnNSZXNwb25zZRI9CgtpbnZpdGF0aW9ucxgBIAMoCzIbLndvcmtlci'
        '52MS5Xb3JrZXJJbnZpdGF0aW9uUgtpbnZpdGF0aW9ucw==');

@$core
    .Deprecated('Use generateInvitationBatchUploadURLRequestDescriptor instead')
const GenerateInvitationBatchUploadURLRequest$json = {
  '1': 'GenerateInvitationBatchUploadURLRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'subcontractor_id', '3': 3, '4': 1, '5': 9, '10': 'subcontractorId'},
  ],
};

/// Descriptor for `GenerateInvitationBatchUploadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateInvitationBatchUploadURLRequestDescriptor =
    $convert.base64Decode(
        'CidHZW5lcmF0ZUludml0YXRpb25CYXRjaFVwbG9hZFVSTFJlcXVlc3QSGwoJdGVuYW50X2lkGA'
        'EgASgJUgh0ZW5hbnRJZBIbCglmaWxlX25hbWUYAiABKAlSCGZpbGVOYW1lEikKEHN1YmNvbnRy'
        'YWN0b3JfaWQYAyABKAlSD3N1YmNvbnRyYWN0b3JJZA==');

@$core.Deprecated(
    'Use generateInvitationBatchUploadURLResponseDescriptor instead')
const GenerateInvitationBatchUploadURLResponse$json = {
  '1': 'GenerateInvitationBatchUploadURLResponse',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
    {'1': 'upload_url', '3': 2, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'object_key', '3': 3, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `GenerateInvitationBatchUploadURLResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateInvitationBatchUploadURLResponseDescriptor =
    $convert.base64Decode(
        'CihHZW5lcmF0ZUludml0YXRpb25CYXRjaFVwbG9hZFVSTFJlc3BvbnNlEhkKCGJhdGNoX2lkGA'
        'EgASgJUgdiYXRjaElkEh0KCnVwbG9hZF91cmwYAiABKAlSCXVwbG9hZFVybBIdCgpvYmplY3Rf'
        'a2V5GAMgASgJUglvYmplY3RLZXk=');

@$core.Deprecated('Use startInvitationBatchRequestDescriptor instead')
const StartInvitationBatchRequest$json = {
  '1': 'StartInvitationBatchRequest',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'subcontractor_id', '3': 3, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'object_key', '3': 4, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `StartInvitationBatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startInvitationBatchRequestDescriptor =
    $convert.base64Decode(
        'ChtTdGFydEludml0YXRpb25CYXRjaFJlcXVlc3QSGQoIYmF0Y2hfaWQYASABKAlSB2JhdGNoSW'
        'QSGwoJdGVuYW50X2lkGAIgASgJUgh0ZW5hbnRJZBIpChBzdWJjb250cmFjdG9yX2lkGAMgASgJ'
        'Ug9zdWJjb250cmFjdG9ySWQSHQoKb2JqZWN0X2tleRgEIAEoCVIJb2JqZWN0S2V5');

@$core.Deprecated('Use startInvitationBatchResponseDescriptor instead')
const StartInvitationBatchResponse$json = {
  '1': 'StartInvitationBatchResponse',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `StartInvitationBatchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startInvitationBatchResponseDescriptor =
    $convert.base64Decode(
        'ChxTdGFydEludml0YXRpb25CYXRjaFJlc3BvbnNlEhkKCGJhdGNoX2lkGAEgASgJUgdiYXRjaE'
        'lkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use getInvitationBatchStatusRequestDescriptor instead')
const GetInvitationBatchStatusRequest$json = {
  '1': 'GetInvitationBatchStatusRequest',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
  ],
};

/// Descriptor for `GetInvitationBatchStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInvitationBatchStatusRequestDescriptor =
    $convert.base64Decode(
        'Ch9HZXRJbnZpdGF0aW9uQmF0Y2hTdGF0dXNSZXF1ZXN0EhkKCGJhdGNoX2lkGAEgASgJUgdiYX'
        'RjaElk');

@$core.Deprecated('Use invitationBatchRowResultDescriptor instead')
const InvitationBatchRowResult$json = {
  '1': 'InvitationBatchRowResult',
  '2': [
    {'1': 'row_number', '3': 1, '4': 1, '5': 5, '10': 'rowNumber'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'error_message', '3': 4, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'invitation_id', '3': 5, '4': 1, '5': 9, '10': 'invitationId'},
  ],
};

/// Descriptor for `InvitationBatchRowResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invitationBatchRowResultDescriptor = $convert.base64Decode(
    'ChhJbnZpdGF0aW9uQmF0Y2hSb3dSZXN1bHQSHQoKcm93X251bWJlchgBIAEoBVIJcm93TnVtYm'
    'VyEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIWCgZzdGF0dXMYAyABKAlSBnN0YXR1cxIjCg1lcnJv'
    'cl9tZXNzYWdlGAQgASgJUgxlcnJvck1lc3NhZ2USIwoNaW52aXRhdGlvbl9pZBgFIAEoCVIMaW'
    '52aXRhdGlvbklk');

@$core.Deprecated('Use getInvitationBatchStatusResponseDescriptor instead')
const GetInvitationBatchStatusResponse$json = {
  '1': 'GetInvitationBatchStatusResponse',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'total', '3': 3, '4': 1, '5': 5, '10': 'total'},
    {'1': 'created', '3': 4, '4': 1, '5': 5, '10': 'created'},
    {'1': 'skipped', '3': 5, '4': 1, '5': 5, '10': 'skipped'},
    {'1': 'invalid', '3': 6, '4': 1, '5': 5, '10': 'invalid'},
    {'1': 'sent', '3': 7, '4': 1, '5': 5, '10': 'sent'},
    {
      '1': 'rows',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.InvitationBatchRowResult',
      '10': 'rows'
    },
  ],
};

/// Descriptor for `GetInvitationBatchStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInvitationBatchStatusResponseDescriptor = $convert.base64Decode(
    'CiBHZXRJbnZpdGF0aW9uQmF0Y2hTdGF0dXNSZXNwb25zZRIZCghiYXRjaF9pZBgBIAEoCVIHYm'
    'F0Y2hJZBIWCgZzdGF0dXMYAiABKAlSBnN0YXR1cxIUCgV0b3RhbBgDIAEoBVIFdG90YWwSGAoH'
    'Y3JlYXRlZBgEIAEoBVIHY3JlYXRlZBIYCgdza2lwcGVkGAUgASgFUgdza2lwcGVkEhgKB2ludm'
    'FsaWQYBiABKAVSB2ludmFsaWQSEgoEc2VudBgHIAEoBVIEc2VudBI3CgRyb3dzGAggAygLMiMu'
    'd29ya2VyLnYxLkludml0YXRpb25CYXRjaFJvd1Jlc3VsdFIEcm93cw==');

@$core.Deprecated('Use listInvitationBatchesRequestDescriptor instead')
const ListInvitationBatchesRequest$json = {
  '1': 'ListInvitationBatchesRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'page_size', '3': 2, '4': 1, '5': 5, '10': 'pageSize'},
  ],
};

/// Descriptor for `ListInvitationBatchesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInvitationBatchesRequestDescriptor =
    $convert.base64Decode(
        'ChxMaXN0SW52aXRhdGlvbkJhdGNoZXNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW'
        '50SWQSGwoJcGFnZV9zaXplGAIgASgFUghwYWdlU2l6ZQ==');

@$core.Deprecated('Use invitationBatchSummaryDescriptor instead')
const InvitationBatchSummary$json = {
  '1': 'InvitationBatchSummary',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'subcontractor_id', '3': 3, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'total', '3': 5, '4': 1, '5': 5, '10': 'total'},
    {'1': 'created', '3': 6, '4': 1, '5': 5, '10': 'created'},
    {'1': 'skipped', '3': 7, '4': 1, '5': 5, '10': 'skipped'},
    {'1': 'invalid', '3': 8, '4': 1, '5': 5, '10': 'invalid'},
    {'1': 'sent', '3': 9, '4': 1, '5': 5, '10': 'sent'},
  ],
};

/// Descriptor for `InvitationBatchSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invitationBatchSummaryDescriptor = $convert.base64Decode(
    'ChZJbnZpdGF0aW9uQmF0Y2hTdW1tYXJ5EhkKCGJhdGNoX2lkGAEgASgJUgdiYXRjaElkEhYKBn'
    'N0YXR1cxgCIAEoCVIGc3RhdHVzEikKEHN1YmNvbnRyYWN0b3JfaWQYAyABKAlSD3N1YmNvbnRy'
    'YWN0b3JJZBIdCgpjcmVhdGVkX2F0GAQgASgJUgljcmVhdGVkQXQSFAoFdG90YWwYBSABKAVSBX'
    'RvdGFsEhgKB2NyZWF0ZWQYBiABKAVSB2NyZWF0ZWQSGAoHc2tpcHBlZBgHIAEoBVIHc2tpcHBl'
    'ZBIYCgdpbnZhbGlkGAggASgFUgdpbnZhbGlkEhIKBHNlbnQYCSABKAVSBHNlbnQ=');

@$core.Deprecated('Use listInvitationBatchesResponseDescriptor instead')
const ListInvitationBatchesResponse$json = {
  '1': 'ListInvitationBatchesResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.InvitationBatchSummary',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListInvitationBatchesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInvitationBatchesResponseDescriptor =
    $convert.base64Decode(
        'Ch1MaXN0SW52aXRhdGlvbkJhdGNoZXNSZXNwb25zZRI3CgVpdGVtcxgBIAMoCzIhLndvcmtlci'
        '52MS5JbnZpdGF0aW9uQmF0Y2hTdW1tYXJ5UgVpdGVtcw==');

@$core.Deprecated('Use listEmployerReferencesRequestDescriptor instead')
const ListEmployerReferencesRequest$json = {
  '1': 'ListEmployerReferencesRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListEmployerReferencesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEmployerReferencesRequestDescriptor =
    $convert.base64Decode(
        'Ch1MaXN0RW1wbG95ZXJSZWZlcmVuY2VzUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbm'
        'FudElk');

@$core.Deprecated('Use employerReferenceDescriptor instead')
const EmployerReference$json = {
  '1': 'EmployerReference',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'employer_name', '3': 4, '4': 1, '5': 9, '10': 'employerName'},
    {'1': 'contact_email', '3': 5, '4': 1, '5': 9, '10': 'contactEmail'},
    {'1': 'position', '3': 6, '4': 1, '5': 9, '10': 'position'},
    {'1': 'start_date', '3': 7, '4': 1, '5': 9, '10': 'startDate'},
    {'1': 'end_date', '3': 8, '4': 1, '5': 9, '10': 'endDate'},
    {'1': 'status', '3': 9, '4': 1, '5': 9, '10': 'status'},
    {'1': 'description', '3': 10, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `EmployerReference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List employerReferenceDescriptor = $convert.base64Decode(
    'ChFFbXBsb3llclJlZmVyZW5jZRIOCgJpZBgBIAEoCVICaWQSGwoJd29ya2VyX2lkGAIgASgJUg'
    'h3b3JrZXJJZBIbCgl0ZW5hbnRfaWQYAyABKAlSCHRlbmFudElkEiMKDWVtcGxveWVyX25hbWUY'
    'BCABKAlSDGVtcGxveWVyTmFtZRIjCg1jb250YWN0X2VtYWlsGAUgASgJUgxjb250YWN0RW1haW'
    'wSGgoIcG9zaXRpb24YBiABKAlSCHBvc2l0aW9uEh0KCnN0YXJ0X2RhdGUYByABKAlSCXN0YXJ0'
    'RGF0ZRIZCghlbmRfZGF0ZRgIIAEoCVIHZW5kRGF0ZRIWCgZzdGF0dXMYCSABKAlSBnN0YXR1cx'
    'IgCgtkZXNjcmlwdGlvbhgKIAEoCVILZGVzY3JpcHRpb24=');

@$core.Deprecated('Use listEmployerReferencesResponseDescriptor instead')
const ListEmployerReferencesResponse$json = {
  '1': 'ListEmployerReferencesResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.EmployerReference',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListEmployerReferencesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEmployerReferencesResponseDescriptor =
    $convert.base64Decode(
        'Ch5MaXN0RW1wbG95ZXJSZWZlcmVuY2VzUmVzcG9uc2USMgoFaXRlbXMYASADKAsyHC53b3JrZX'
        'IudjEuRW1wbG95ZXJSZWZlcmVuY2VSBWl0ZW1z');

@$core.Deprecated('Use listQualificationsRequestDescriptor instead')
const ListQualificationsRequest$json = {
  '1': 'ListQualificationsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListQualificationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listQualificationsRequestDescriptor =
    $convert.base64Decode(
        'ChlMaXN0UXVhbGlmaWNhdGlvbnNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
        'Q=');

@$core.Deprecated('Use qualificationDescriptor instead')
const Qualification$json = {
  '1': 'Qualification',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'document_id', '3': 4, '4': 1, '5': 9, '10': 'documentId'},
    {
      '1': 'qualification_type',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'qualificationType'
    },
    {'1': 'institution', '3': 6, '4': 1, '5': 9, '10': 'institution'},
    {'1': 'status', '3': 7, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `Qualification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List qualificationDescriptor = $convert.base64Decode(
    'Cg1RdWFsaWZpY2F0aW9uEg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKAlSCHdvcm'
    'tlcklkEhsKCXRlbmFudF9pZBgDIAEoCVIIdGVuYW50SWQSHwoLZG9jdW1lbnRfaWQYBCABKAlS'
    'CmRvY3VtZW50SWQSLQoScXVhbGlmaWNhdGlvbl90eXBlGAUgASgJUhFxdWFsaWZpY2F0aW9uVH'
    'lwZRIgCgtpbnN0aXR1dGlvbhgGIAEoCVILaW5zdGl0dXRpb24SFgoGc3RhdHVzGAcgASgJUgZz'
    'dGF0dXM=');

@$core.Deprecated('Use listQualificationsResponseDescriptor instead')
const ListQualificationsResponse$json = {
  '1': 'ListQualificationsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.Qualification',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListQualificationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listQualificationsResponseDescriptor =
    $convert.base64Decode(
        'ChpMaXN0UXVhbGlmaWNhdGlvbnNSZXNwb25zZRIuCgVpdGVtcxgBIAMoCzIYLndvcmtlci52MS'
        '5RdWFsaWZpY2F0aW9uUgVpdGVtcw==');

@$core.Deprecated('Use listDeviceChangeRequestsRequestDescriptor instead')
const ListDeviceChangeRequestsRequest$json = {
  '1': 'ListDeviceChangeRequestsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListDeviceChangeRequestsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeviceChangeRequestsRequestDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0RGV2aWNlQ2hhbmdlUmVxdWVzdHNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdG'
        'VuYW50SWQ=');

@$core.Deprecated('Use deviceChangeRequestDescriptor instead')
const DeviceChangeRequest$json = {
  '1': 'DeviceChangeRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 3, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'device_model', '3': 4, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'os_version', '3': 5, '4': 1, '5': 9, '10': 'osVersion'},
    {'1': 'change_reason', '3': 6, '4': 1, '5': 9, '10': 'changeReason'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
    {'1': 'worker_name', '3': 9, '4': 1, '5': 9, '10': 'workerName'},
    {'1': 'swap_origin', '3': 10, '4': 1, '5': 9, '10': 'swapOrigin'},
    {
      '1': 'seen_on_other_workers',
      '3': 11,
      '4': 1,
      '5': 5,
      '10': 'seenOnOtherWorkers'
    },
  ],
};

/// Descriptor for `DeviceChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceChangeRequestDescriptor = $convert.base64Decode(
    'ChNEZXZpY2VDaGFuZ2VSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKA'
    'lSCHdvcmtlcklkEhsKCWRldmljZV9pZBgDIAEoCVIIZGV2aWNlSWQSIQoMZGV2aWNlX21vZGVs'
    'GAQgASgJUgtkZXZpY2VNb2RlbBIdCgpvc192ZXJzaW9uGAUgASgJUglvc1ZlcnNpb24SIwoNY2'
    'hhbmdlX3JlYXNvbhgGIAEoCVIMY2hhbmdlUmVhc29uEh0KCmNyZWF0ZWRfYXQYByABKAlSCWNy'
    'ZWF0ZWRBdBIWCgZzdGF0dXMYCCABKAlSBnN0YXR1cxIfCgt3b3JrZXJfbmFtZRgJIAEoCVIKd2'
    '9ya2VyTmFtZRIfCgtzd2FwX29yaWdpbhgKIAEoCVIKc3dhcE9yaWdpbhIxChVzZWVuX29uX290'
    'aGVyX3dvcmtlcnMYCyABKAVSEnNlZW5Pbk90aGVyV29ya2Vycw==');

@$core.Deprecated('Use listDeviceChangeRequestsResponseDescriptor instead')
const ListDeviceChangeRequestsResponse$json = {
  '1': 'ListDeviceChangeRequestsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.DeviceChangeRequest',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListDeviceChangeRequestsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeviceChangeRequestsResponseDescriptor =
    $convert.base64Decode(
        'CiBMaXN0RGV2aWNlQ2hhbmdlUmVxdWVzdHNSZXNwb25zZRI0CgVpdGVtcxgBIAMoCzIeLndvcm'
        'tlci52MS5EZXZpY2VDaGFuZ2VSZXF1ZXN0UgVpdGVtcw==');

@$core.Deprecated('Use decideDeviceChangeRequestDescriptor instead')
const DecideDeviceChangeRequest$json = {
  '1': 'DecideDeviceChangeRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'decision', '3': 2, '4': 1, '5': 9, '10': 'decision'},
  ],
};

/// Descriptor for `DecideDeviceChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decideDeviceChangeRequestDescriptor =
    $convert.base64Decode(
        'ChlEZWNpZGVEZXZpY2VDaGFuZ2VSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIaCghkZWNpc2lvbh'
        'gCIAEoCVIIZGVjaXNpb24=');

@$core.Deprecated('Use decideDeviceChangeResponseDescriptor instead')
const DecideDeviceChangeResponse$json = {
  '1': 'DecideDeviceChangeResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DecideDeviceChangeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decideDeviceChangeResponseDescriptor =
    $convert.base64Decode(
        'ChpEZWNpZGVEZXZpY2VDaGFuZ2VSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use requestDeviceSwapRequestDescriptor instead')
const RequestDeviceSwapRequest$json = {
  '1': 'RequestDeviceSwapRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `RequestDeviceSwapRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeviceSwapRequestDescriptor =
    $convert.base64Decode(
        'ChhSZXF1ZXN0RGV2aWNlU3dhcFJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZB'
        'IbCglkZXZpY2VfaWQYAiABKAlSCGRldmljZUlkEhYKBnJlYXNvbhgDIAEoCVIGcmVhc29u');

@$core.Deprecated('Use requestDeviceSwapResponseDescriptor instead')
const RequestDeviceSwapResponse$json = {
  '1': 'RequestDeviceSwapResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'request_id', '3': 2, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'expires_at', '3': 3, '4': 1, '5': 9, '10': 'expiresAt'},
  ],
};

/// Descriptor for `RequestDeviceSwapResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeviceSwapResponseDescriptor = $convert.base64Decode(
    'ChlSZXF1ZXN0RGV2aWNlU3dhcFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSHQ'
    'oKcmVxdWVzdF9pZBgCIAEoCVIJcmVxdWVzdElkEh0KCmV4cGlyZXNfYXQYAyABKAlSCWV4cGly'
    'ZXNBdA==');

@$core.Deprecated('Use getMyDeviceStatusRequestDescriptor instead')
const GetMyDeviceStatusRequest$json = {
  '1': 'GetMyDeviceStatusRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
  ],
};

/// Descriptor for `GetMyDeviceStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyDeviceStatusRequestDescriptor =
    $convert.base64Decode(
        'ChhHZXRNeURldmljZVN0YXR1c1JlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZB'
        'IbCglkZXZpY2VfaWQYAiABKAlSCGRldmljZUlk');

@$core.Deprecated('Use getMyDeviceStatusResponseDescriptor instead')
const GetMyDeviceStatusResponse$json = {
  '1': 'GetMyDeviceStatusResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'swap_requested', '3': 2, '4': 1, '5': 8, '10': 'swapRequested'},
    {'1': 'swap_request_open', '3': 3, '4': 1, '5': 8, '10': 'swapRequestOpen'},
    {'1': 'decided_at', '3': 4, '4': 1, '5': 9, '10': 'decidedAt'},
  ],
};

/// Descriptor for `GetMyDeviceStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyDeviceStatusResponseDescriptor = $convert.base64Decode(
    'ChlHZXRNeURldmljZVN0YXR1c1Jlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEiUKDn'
    'N3YXBfcmVxdWVzdGVkGAIgASgIUg1zd2FwUmVxdWVzdGVkEioKEXN3YXBfcmVxdWVzdF9vcGVu'
    'GAMgASgIUg9zd2FwUmVxdWVzdE9wZW4SHQoKZGVjaWRlZF9hdBgEIAEoCVIJZGVjaWRlZEF0');

@$core.Deprecated('Use startShiftRequestDescriptor instead')
const StartShiftRequest$json = {
  '1': 'StartShiftRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'device_id', '3': 2, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `StartShiftRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startShiftRequestDescriptor = $convert.base64Decode(
    'ChFTdGFydFNoaWZ0UmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlcklkEhsKCWRldm'
    'ljZV9pZBgCIAEoCVIIZGV2aWNlSWQSGgoIbGF0aXR1ZGUYAyABKAFSCGxhdGl0dWRlEhwKCWxv'
    'bmdpdHVkZRgEIAEoAVIJbG9uZ2l0dWRl');

@$core.Deprecated('Use startShiftResponseDescriptor instead')
const StartShiftResponse$json = {
  '1': 'StartShiftResponse',
  '2': [
    {'1': 'shift_id', '3': 1, '4': 1, '5': 9, '10': 'shiftId'},
    {'1': 'started_at', '3': 2, '4': 1, '5': 9, '10': 'startedAt'},
  ],
};

/// Descriptor for `StartShiftResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startShiftResponseDescriptor = $convert.base64Decode(
    'ChJTdGFydFNoaWZ0UmVzcG9uc2USGQoIc2hpZnRfaWQYASABKAlSB3NoaWZ0SWQSHQoKc3Rhcn'
    'RlZF9hdBgCIAEoCVIJc3RhcnRlZEF0');

@$core.Deprecated('Use endShiftRequestDescriptor instead')
const EndShiftRequest$json = {
  '1': 'EndShiftRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'shift_id', '3': 2, '4': 1, '5': 9, '10': 'shiftId'},
    {'1': 'latitude', '3': 3, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 4, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `EndShiftRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endShiftRequestDescriptor = $convert.base64Decode(
    'Cg9FbmRTaGlmdFJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIZCghzaGlmdF'
    '9pZBgCIAEoCVIHc2hpZnRJZBIaCghsYXRpdHVkZRgDIAEoAVIIbGF0aXR1ZGUSHAoJbG9uZ2l0'
    'dWRlGAQgASgBUglsb25naXR1ZGU=');

@$core.Deprecated('Use endShiftResponseDescriptor instead')
const EndShiftResponse$json = {
  '1': 'EndShiftResponse',
  '2': [
    {'1': 'ended_at', '3': 1, '4': 1, '5': 9, '10': 'endedAt'},
  ],
};

/// Descriptor for `EndShiftResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endShiftResponseDescriptor = $convert.base64Decode(
    'ChBFbmRTaGlmdFJlc3BvbnNlEhkKCGVuZGVkX2F0GAEgASgJUgdlbmRlZEF0');

@$core.Deprecated('Use submitDeploymentListRequestDescriptor instead')
const SubmitDeploymentListRequest$json = {
  '1': 'SubmitDeploymentListRequest',
  '2': [
    {'1': 'subcontractor_id', '3': 1, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'deployment_at', '3': 2, '4': 1, '5': 9, '10': 'deploymentAt'},
    {
      '1': 'workers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.DeploymentWorker',
      '10': 'workers'
    },
  ],
};

/// Descriptor for `SubmitDeploymentListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitDeploymentListRequestDescriptor = $convert.base64Decode(
    'ChtTdWJtaXREZXBsb3ltZW50TGlzdFJlcXVlc3QSKQoQc3ViY29udHJhY3Rvcl9pZBgBIAEoCV'
    'IPc3ViY29udHJhY3RvcklkEiMKDWRlcGxveW1lbnRfYXQYAiABKAlSDGRlcGxveW1lbnRBdBI1'
    'Cgd3b3JrZXJzGAMgAygLMhsud29ya2VyLnYxLkRlcGxveW1lbnRXb3JrZXJSB3dvcmtlcnM=');

@$core.Deprecated('Use deploymentWorkerDescriptor instead')
const DeploymentWorker$json = {
  '1': 'DeploymentWorker',
  '2': [
    {'1': 'surname', '3': 1, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'given_names', '3': 2, '4': 1, '5': 9, '10': 'givenNames'},
    {'1': 'nationality', '3': 3, '4': 1, '5': 9, '10': 'nationality'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `DeploymentWorker`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deploymentWorkerDescriptor = $convert.base64Decode(
    'ChBEZXBsb3ltZW50V29ya2VyEhgKB3N1cm5hbWUYASABKAlSB3N1cm5hbWUSHwoLZ2l2ZW5fbm'
    'FtZXMYAiABKAlSCmdpdmVuTmFtZXMSIAoLbmF0aW9uYWxpdHkYAyABKAlSC25hdGlvbmFsaXR5'
    'EhQKBWVtYWlsGAQgASgJUgVlbWFpbA==');

@$core.Deprecated('Use submitDeploymentListResponseDescriptor instead')
const SubmitDeploymentListResponse$json = {
  '1': 'SubmitDeploymentListResponse',
  '2': [
    {'1': 'deployment_id', '3': 1, '4': 1, '5': 9, '10': 'deploymentId'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'flagged_count', '3': 3, '4': 1, '5': 5, '10': 'flaggedCount'},
    {'1': 'rejected_count', '3': 4, '4': 1, '5': 5, '10': 'rejectedCount'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `SubmitDeploymentListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitDeploymentListResponseDescriptor = $convert.base64Decode(
    'ChxTdWJtaXREZXBsb3ltZW50TGlzdFJlc3BvbnNlEiMKDWRlcGxveW1lbnRfaWQYASABKAlSDG'
    'RlcGxveW1lbnRJZBIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxDb3VudBIjCg1mbGFnZ2Vk'
    'X2NvdW50GAMgASgFUgxmbGFnZ2VkQ291bnQSJQoOcmVqZWN0ZWRfY291bnQYBCABKAVSDXJlam'
    'VjdGVkQ291bnQSFgoGc3RhdHVzGAUgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use listSubcontractorWorkforceRequestDescriptor instead')
const ListSubcontractorWorkforceRequest$json = {
  '1': 'ListSubcontractorWorkforceRequest',
  '2': [
    {'1': 'subcontractor_id', '3': 1, '4': 1, '5': 9, '10': 'subcontractorId'},
  ],
};

/// Descriptor for `ListSubcontractorWorkforceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSubcontractorWorkforceRequestDescriptor =
    $convert.base64Decode(
        'CiFMaXN0U3ViY29udHJhY3Rvcldvcmtmb3JjZVJlcXVlc3QSKQoQc3ViY29udHJhY3Rvcl9pZB'
        'gBIAEoCVIPc3ViY29udHJhY3Rvcklk');

@$core.Deprecated('Use subcontractorWorkerProfileDescriptor instead')
const SubcontractorWorkerProfile$json = {
  '1': 'SubcontractorWorkerProfile',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'surname', '3': 2, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'given_names', '3': 3, '4': 1, '5': 9, '10': 'givenNames'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    {'1': 'traffic_light', '3': 6, '4': 1, '5': 9, '10': 'trafficLight'},
  ],
};

/// Descriptor for `SubcontractorWorkerProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subcontractorWorkerProfileDescriptor = $convert.base64Decode(
    'ChpTdWJjb250cmFjdG9yV29ya2VyUHJvZmlsZRIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlck'
    'lkEhgKB3N1cm5hbWUYAiABKAlSB3N1cm5hbWUSHwoLZ2l2ZW5fbmFtZXMYAyABKAlSCmdpdmVu'
    'TmFtZXMSFAoFZW1haWwYBCABKAlSBWVtYWlsEhYKBnN0YXR1cxgFIAEoCVIGc3RhdHVzEiMKDX'
    'RyYWZmaWNfbGlnaHQYBiABKAlSDHRyYWZmaWNMaWdodA==');

@$core.Deprecated('Use listSubcontractorWorkforceResponseDescriptor instead')
const ListSubcontractorWorkforceResponse$json = {
  '1': 'ListSubcontractorWorkforceResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.SubcontractorWorkerProfile',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListSubcontractorWorkforceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSubcontractorWorkforceResponseDescriptor =
    $convert.base64Decode(
        'CiJMaXN0U3ViY29udHJhY3Rvcldvcmtmb3JjZVJlc3BvbnNlEjsKBWl0ZW1zGAEgAygLMiUud2'
        '9ya2VyLnYxLlN1YmNvbnRyYWN0b3JXb3JrZXJQcm9maWxlUgVpdGVtcw==');

@$core.Deprecated('Use getDeploymentValidationRequestDescriptor instead')
const GetDeploymentValidationRequest$json = {
  '1': 'GetDeploymentValidationRequest',
  '2': [
    {'1': 'deployment_id', '3': 1, '4': 1, '5': 9, '10': 'deploymentId'},
  ],
};

/// Descriptor for `GetDeploymentValidationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeploymentValidationRequestDescriptor =
    $convert.base64Decode(
        'Ch5HZXREZXBsb3ltZW50VmFsaWRhdGlvblJlcXVlc3QSIwoNZGVwbG95bWVudF9pZBgBIAEoCV'
        'IMZGVwbG95bWVudElk');

@$core.Deprecated('Use getDeploymentValidationResponseDescriptor instead')
const GetDeploymentValidationResponse$json = {
  '1': 'GetDeploymentValidationResponse',
  '2': [
    {'1': 'deployment_id', '3': 1, '4': 1, '5': 9, '10': 'deploymentId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'total_count', '3': 3, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'flagged_count', '3': 4, '4': 1, '5': 5, '10': 'flaggedCount'},
  ],
};

/// Descriptor for `GetDeploymentValidationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeploymentValidationResponseDescriptor =
    $convert.base64Decode(
        'Ch9HZXREZXBsb3ltZW50VmFsaWRhdGlvblJlc3BvbnNlEiMKDWRlcGxveW1lbnRfaWQYASABKA'
        'lSDGRlcGxveW1lbnRJZBIWCgZzdGF0dXMYAiABKAlSBnN0YXR1cxIfCgt0b3RhbF9jb3VudBgD'
        'IAEoBVIKdG90YWxDb3VudBIjCg1mbGFnZ2VkX2NvdW50GAQgASgFUgxmbGFnZ2VkQ291bnQ=');

@$core.Deprecated('Use listDeploymentsRequestDescriptor instead')
const ListDeploymentsRequest$json = {
  '1': 'ListDeploymentsRequest',
  '2': [
    {'1': 'subcontractor_id', '3': 1, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `ListDeploymentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeploymentsRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0RGVwbG95bWVudHNSZXF1ZXN0EikKEHN1YmNvbnRyYWN0b3JfaWQYASABKAlSD3N1Ym'
        'NvbnRyYWN0b3JJZBIWCgZzdGF0dXMYAiABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use deploymentItemDescriptor instead')
const DeploymentItem$json = {
  '1': 'DeploymentItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'deployment_at', '3': 2, '4': 1, '5': 9, '10': 'deploymentAt'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'total_count', '3': 4, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'flagged_count', '3': 5, '4': 1, '5': 5, '10': 'flaggedCount'},
  ],
};

/// Descriptor for `DeploymentItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deploymentItemDescriptor = $convert.base64Decode(
    'Cg5EZXBsb3ltZW50SXRlbRIOCgJpZBgBIAEoCVICaWQSIwoNZGVwbG95bWVudF9hdBgCIAEoCV'
    'IMZGVwbG95bWVudEF0EhYKBnN0YXR1cxgDIAEoCVIGc3RhdHVzEh8KC3RvdGFsX2NvdW50GAQg'
    'ASgFUgp0b3RhbENvdW50EiMKDWZsYWdnZWRfY291bnQYBSABKAVSDGZsYWdnZWRDb3VudA==');

@$core.Deprecated('Use listDeploymentsResponseDescriptor instead')
const ListDeploymentsResponse$json = {
  '1': 'ListDeploymentsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.DeploymentItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListDeploymentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeploymentsResponseDescriptor =
    $convert.base64Decode(
        'ChdMaXN0RGVwbG95bWVudHNSZXNwb25zZRIvCgVpdGVtcxgBIAMoCzIZLndvcmtlci52MS5EZX'
        'Bsb3ltZW50SXRlbVIFaXRlbXM=');

@$core.Deprecated('Use sendSubcontractorMessageRequestDescriptor instead')
const SendSubcontractorMessageRequest$json = {
  '1': 'SendSubcontractorMessageRequest',
  '2': [
    {'1': 'subcontractor_id', '3': 1, '4': 1, '5': 9, '10': 'subcontractorId'},
    {'1': 'subject', '3': 2, '4': 1, '5': 9, '10': 'subject'},
    {'1': 'worker_id', '3': 3, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
  ],
};

/// Descriptor for `SendSubcontractorMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendSubcontractorMessageRequestDescriptor =
    $convert.base64Decode(
        'Ch9TZW5kU3ViY29udHJhY3Rvck1lc3NhZ2VSZXF1ZXN0EikKEHN1YmNvbnRyYWN0b3JfaWQYAS'
        'ABKAlSD3N1YmNvbnRyYWN0b3JJZBIYCgdzdWJqZWN0GAIgASgJUgdzdWJqZWN0EhsKCXdvcmtl'
        'cl9pZBgDIAEoCVIId29ya2VySWQSEgoEYm9keRgEIAEoCVIEYm9keQ==');

@$core.Deprecated('Use sendSubcontractorMessageResponseDescriptor instead')
const SendSubcontractorMessageResponse$json = {
  '1': 'SendSubcontractorMessageResponse',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
  ],
};

/// Descriptor for `SendSubcontractorMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendSubcontractorMessageResponseDescriptor =
    $convert.base64Decode(
        'CiBTZW5kU3ViY29udHJhY3Rvck1lc3NhZ2VSZXNwb25zZRIdCgptZXNzYWdlX2lkGAEgASgJUg'
        'ltZXNzYWdlSWQ=');

@$core.Deprecated('Use sendDocumentReminderRequestDescriptor instead')
const SendDocumentReminderRequest$json = {
  '1': 'SendDocumentReminderRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `SendDocumentReminderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendDocumentReminderRequestDescriptor =
    $convert.base64Decode(
        'ChtTZW5kRG9jdW1lbnRSZW1pbmRlclJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZX'
        'JJZA==');

@$core.Deprecated('Use sendDocumentReminderResponseDescriptor instead')
const SendDocumentReminderResponse$json = {
  '1': 'SendDocumentReminderResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SendDocumentReminderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendDocumentReminderResponseDescriptor =
    $convert.base64Decode(
        'ChxTZW5kRG9jdW1lbnRSZW1pbmRlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3'
        'M=');

@$core.Deprecated('Use adjudicateWorkerRequestDescriptor instead')
const AdjudicateWorkerRequest$json = {
  '1': 'AdjudicateWorkerRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'decision', '3': 2, '4': 1, '5': 9, '10': 'decision'},
    {'1': 'justification', '3': 3, '4': 1, '5': 9, '10': 'justification'},
  ],
};

/// Descriptor for `AdjudicateWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adjudicateWorkerRequestDescriptor = $convert.base64Decode(
    'ChdBZGp1ZGljYXRlV29ya2VyUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlcklkEh'
    'oKCGRlY2lzaW9uGAIgASgJUghkZWNpc2lvbhIkCg1qdXN0aWZpY2F0aW9uGAMgASgJUg1qdXN0'
    'aWZpY2F0aW9u');

@$core.Deprecated('Use adjudicateWorkerResponseDescriptor instead')
const AdjudicateWorkerResponse$json = {
  '1': 'AdjudicateWorkerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AdjudicateWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adjudicateWorkerResponseDescriptor =
    $convert.base64Decode(
        'ChhBZGp1ZGljYXRlV29ya2VyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use escalateWorkerRequestDescriptor instead')
const EscalateWorkerRequest$json = {
  '1': 'EscalateWorkerRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'priority', '3': 3, '4': 1, '5': 9, '10': 'priority'},
  ],
};

/// Descriptor for `EscalateWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List escalateWorkerRequestDescriptor = $convert.base64Decode(
    'ChVFc2NhbGF0ZVdvcmtlclJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIWCg'
    'ZyZWFzb24YAiABKAlSBnJlYXNvbhIaCghwcmlvcml0eRgDIAEoCVIIcHJpb3JpdHk=');

@$core.Deprecated('Use escalateWorkerResponseDescriptor instead')
const EscalateWorkerResponse$json = {
  '1': 'EscalateWorkerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `EscalateWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List escalateWorkerResponseDescriptor =
    $convert.base64Decode(
        'ChZFc2NhbGF0ZVdvcmtlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use removeWorkerFromTenantRequestDescriptor instead')
const RemoveWorkerFromTenantRequest$json = {
  '1': 'RemoveWorkerFromTenantRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `RemoveWorkerFromTenantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeWorkerFromTenantRequestDescriptor =
    $convert.base64Decode(
        'Ch1SZW1vdmVXb3JrZXJGcm9tVGVuYW50UmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcm'
        'tlcklk');

@$core.Deprecated('Use removeWorkerFromTenantResponseDescriptor instead')
const RemoveWorkerFromTenantResponse$json = {
  '1': 'RemoveWorkerFromTenantResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveWorkerFromTenantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeWorkerFromTenantResponseDescriptor =
    $convert.base64Decode(
        'Ch5SZW1vdmVXb3JrZXJGcm9tVGVuYW50UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2'
        'Vzcw==');

@$core.Deprecated('Use listDevicesRequestDescriptor instead')
const ListDevicesRequest$json = {
  '1': 'ListDevicesRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `ListDevicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDevicesRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0RGV2aWNlc1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZBIbCgl3b3'
    'JrZXJfaWQYAiABKAlSCHdvcmtlcklk');

@$core.Deprecated('Use deviceInfoDescriptor instead')
const DeviceInfo$json = {
  '1': 'DeviceInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'worker_name', '3': 3, '4': 1, '5': 9, '10': 'workerName'},
    {'1': 'model', '3': 4, '4': 1, '5': 9, '10': 'model'},
    {'1': 'platform', '3': 5, '4': 1, '5': 9, '10': 'platform'},
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'bound_at', '3': 7, '4': 1, '5': 9, '10': 'boundAt'},
    {'1': 'last_seen_at', '3': 8, '4': 1, '5': 9, '10': 'lastSeenAt'},
    {'1': 'anomaly_score', '3': 9, '4': 1, '5': 1, '10': 'anomalyScore'},
    {'1': 'carrier', '3': 10, '4': 1, '5': 9, '10': 'carrier'},
    {'1': 'network', '3': 11, '4': 1, '5': 9, '10': 'network'},
    {'1': 'last_gps', '3': 12, '4': 1, '5': 9, '10': 'lastGps'},
    {'1': 'wifi_ssid', '3': 13, '4': 1, '5': 9, '10': 'wifiSsid'},
    {'1': 'wifi_ip', '3': 14, '4': 1, '5': 9, '10': 'wifiIp'},
    {
      '1': 'mobile_generation',
      '3': 15,
      '4': 1,
      '5': 9,
      '10': 'mobileGeneration'
    },
    {'1': 'is_airplane_mode', '3': 16, '4': 1, '5': 8, '10': 'isAirplaneMode'},
  ],
};

/// Descriptor for `DeviceInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceInfoDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VJbmZvEg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlck'
    'lkEh8KC3dvcmtlcl9uYW1lGAMgASgJUgp3b3JrZXJOYW1lEhQKBW1vZGVsGAQgASgJUgVtb2Rl'
    'bBIaCghwbGF0Zm9ybRgFIAEoCVIIcGxhdGZvcm0SFgoGc3RhdHVzGAYgASgJUgZzdGF0dXMSGQ'
    'oIYm91bmRfYXQYByABKAlSB2JvdW5kQXQSIAoMbGFzdF9zZWVuX2F0GAggASgJUgpsYXN0U2Vl'
    'bkF0EiMKDWFub21hbHlfc2NvcmUYCSABKAFSDGFub21hbHlTY29yZRIYCgdjYXJyaWVyGAogAS'
    'gJUgdjYXJyaWVyEhgKB25ldHdvcmsYCyABKAlSB25ldHdvcmsSGQoIbGFzdF9ncHMYDCABKAlS'
    'B2xhc3RHcHMSGwoJd2lmaV9zc2lkGA0gASgJUgh3aWZpU3NpZBIXCgd3aWZpX2lwGA4gASgJUg'
    'Z3aWZpSXASKwoRbW9iaWxlX2dlbmVyYXRpb24YDyABKAlSEG1vYmlsZUdlbmVyYXRpb24SKAoQ'
    'aXNfYWlycGxhbmVfbW9kZRgQIAEoCFIOaXNBaXJwbGFuZU1vZGU=');

@$core.Deprecated('Use listDevicesResponseDescriptor instead')
const ListDevicesResponse$json = {
  '1': 'ListDevicesResponse',
  '2': [
    {
      '1': 'devices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.DeviceInfo',
      '10': 'devices'
    },
  ],
};

/// Descriptor for `ListDevicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDevicesResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0RGV2aWNlc1Jlc3BvbnNlEi8KB2RldmljZXMYASADKAsyFS53b3JrZXIudjEuRGV2aW'
    'NlSW5mb1IHZGV2aWNlcw==');

@$core.Deprecated('Use listDeviceSignalBatchesRequestDescriptor instead')
const ListDeviceSignalBatchesRequest$json = {
  '1': 'ListDeviceSignalBatchesRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ListDeviceSignalBatchesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeviceSignalBatchesRequestDescriptor =
    $convert.base64Decode(
        'Ch5MaXN0RGV2aWNlU2lnbmFsQmF0Y2hlc1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZBISCgRwYWdlGAIgASgFUgRwYWdlEhQKBWxpbWl0GAMgASgFUgVsaW1pdA==');

@$core.Deprecated('Use deviceSignalBatchInfoDescriptor instead')
const DeviceSignalBatchInfo$json = {
  '1': 'DeviceSignalBatchInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'worker_name', '3': 3, '4': 1, '5': 9, '10': 'workerName'},
    {'1': 'device_model', '3': 4, '4': 1, '5': 9, '10': 'deviceModel'},
    {'1': 'device_platform', '3': 5, '4': 1, '5': 9, '10': 'devicePlatform'},
    {'1': 'anomaly_score', '3': 6, '4': 1, '5': 1, '10': 'anomalyScore'},
    {'1': 'received_at', '3': 7, '4': 1, '5': 9, '10': 'receivedAt'},
    {'1': 'carrier', '3': 8, '4': 1, '5': 9, '10': 'carrier'},
    {'1': 'network', '3': 9, '4': 1, '5': 9, '10': 'network'},
    {'1': 'wifi_ssid', '3': 10, '4': 1, '5': 9, '10': 'wifiSsid'},
    {'1': 'wifi_ip', '3': 11, '4': 1, '5': 9, '10': 'wifiIp'},
    {
      '1': 'mobile_generation',
      '3': 12,
      '4': 1,
      '5': 9,
      '10': 'mobileGeneration'
    },
    {'1': 'is_airplane_mode', '3': 13, '4': 1, '5': 8, '10': 'isAirplaneMode'},
    {'1': 'last_gps', '3': 14, '4': 1, '5': 9, '10': 'lastGps'},
  ],
};

/// Descriptor for `DeviceSignalBatchInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceSignalBatchInfoDescriptor = $convert.base64Decode(
    'ChVEZXZpY2VTaWduYWxCYXRjaEluZm8SDgoCaWQYASABKAlSAmlkEhsKCXdvcmtlcl9pZBgCIA'
    'EoCVIId29ya2VySWQSHwoLd29ya2VyX25hbWUYAyABKAlSCndvcmtlck5hbWUSIQoMZGV2aWNl'
    'X21vZGVsGAQgASgJUgtkZXZpY2VNb2RlbBInCg9kZXZpY2VfcGxhdGZvcm0YBSABKAlSDmRldm'
    'ljZVBsYXRmb3JtEiMKDWFub21hbHlfc2NvcmUYBiABKAFSDGFub21hbHlTY29yZRIfCgtyZWNl'
    'aXZlZF9hdBgHIAEoCVIKcmVjZWl2ZWRBdBIYCgdjYXJyaWVyGAggASgJUgdjYXJyaWVyEhgKB2'
    '5ldHdvcmsYCSABKAlSB25ldHdvcmsSGwoJd2lmaV9zc2lkGAogASgJUgh3aWZpU3NpZBIXCgd3'
    'aWZpX2lwGAsgASgJUgZ3aWZpSXASKwoRbW9iaWxlX2dlbmVyYXRpb24YDCABKAlSEG1vYmlsZU'
    'dlbmVyYXRpb24SKAoQaXNfYWlycGxhbmVfbW9kZRgNIAEoCFIOaXNBaXJwbGFuZU1vZGUSGQoI'
    'bGFzdF9ncHMYDiABKAlSB2xhc3RHcHM=');

@$core.Deprecated('Use listDeviceSignalBatchesResponseDescriptor instead')
const ListDeviceSignalBatchesResponse$json = {
  '1': 'ListDeviceSignalBatchesResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.DeviceSignalBatchInfo',
      '10': 'items'
    },
    {'1': 'total_items', '3': 2, '4': 1, '5': 5, '10': 'totalItems'},
  ],
};

/// Descriptor for `ListDeviceSignalBatchesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeviceSignalBatchesResponseDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0RGV2aWNlU2lnbmFsQmF0Y2hlc1Jlc3BvbnNlEjYKBWl0ZW1zGAEgAygLMiAud29ya2'
        'VyLnYxLkRldmljZVNpZ25hbEJhdGNoSW5mb1IFaXRlbXMSHwoLdG90YWxfaXRlbXMYAiABKAVS'
        'CnRvdGFsSXRlbXM=');

@$core.Deprecated('Use validateWorkersRequestDescriptor instead')
const ValidateWorkersRequest$json = {
  '1': 'ValidateWorkersRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'identifiers', '3': 2, '4': 3, '5': 9, '10': 'identifiers'},
  ],
};

/// Descriptor for `ValidateWorkersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateWorkersRequestDescriptor =
    $convert.base64Decode(
        'ChZWYWxpZGF0ZVdvcmtlcnNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQSIA'
        'oLaWRlbnRpZmllcnMYAiADKAlSC2lkZW50aWZpZXJz');

@$core.Deprecated('Use workerValidationDescriptor instead')
const WorkerValidation$json = {
  '1': 'WorkerValidation',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'found', '3': 2, '4': 1, '5': 8, '10': 'found'},
    {'1': 'worker_id', '3': 3, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'name', '3': 4, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    {'1': 'risk_level', '3': 6, '4': 1, '5': 9, '10': 'riskLevel'},
    {'1': 'traffic_light', '3': 7, '4': 1, '5': 9, '10': 'trafficLight'},
  ],
};

/// Descriptor for `WorkerValidation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerValidationDescriptor = $convert.base64Decode(
    'ChBXb3JrZXJWYWxpZGF0aW9uEh4KCmlkZW50aWZpZXIYASABKAlSCmlkZW50aWZpZXISFAoFZm'
    '91bmQYAiABKAhSBWZvdW5kEhsKCXdvcmtlcl9pZBgDIAEoCVIId29ya2VySWQSEgoEbmFtZRgE'
    'IAEoCVIEbmFtZRIWCgZzdGF0dXMYBSABKAlSBnN0YXR1cxIdCgpyaXNrX2xldmVsGAYgASgJUg'
    'lyaXNrTGV2ZWwSIwoNdHJhZmZpY19saWdodBgHIAEoCVIMdHJhZmZpY0xpZ2h0');

@$core.Deprecated('Use validateWorkersResponseDescriptor instead')
const ValidateWorkersResponse$json = {
  '1': 'ValidateWorkersResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.worker.v1.WorkerValidation',
      '10': 'results'
    },
  ],
};

/// Descriptor for `ValidateWorkersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateWorkersResponseDescriptor =
    $convert.base64Decode(
        'ChdWYWxpZGF0ZVdvcmtlcnNSZXNwb25zZRI1CgdyZXN1bHRzGAEgAygLMhsud29ya2VyLnYxLl'
        'dvcmtlclZhbGlkYXRpb25SB3Jlc3VsdHM=');

@$core.Deprecated('Use rerunBackgroundChecksRequestDescriptor instead')
const RerunBackgroundChecksRequest$json = {
  '1': 'RerunBackgroundChecksRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'check_types', '3': 3, '4': 3, '5': 9, '10': 'checkTypes'},
    {'1': 'include_settled', '3': 4, '4': 1, '5': 8, '10': 'includeSettled'},
  ],
};

/// Descriptor for `RerunBackgroundChecksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rerunBackgroundChecksRequestDescriptor =
    $convert.base64Decode(
        'ChxSZXJ1bkJhY2tncm91bmRDaGVja3NSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW'
        '50SWQSGwoJd29ya2VyX2lkGAIgASgJUgh3b3JrZXJJZBIfCgtjaGVja190eXBlcxgDIAMoCVIK'
        'Y2hlY2tUeXBlcxInCg9pbmNsdWRlX3NldHRsZWQYBCABKAhSDmluY2x1ZGVTZXR0bGVk');

@$core.Deprecated('Use rerunBackgroundChecksResponseDescriptor instead')
const RerunBackgroundChecksResponse$json = {
  '1': 'RerunBackgroundChecksResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'checks_triggered', '3': 2, '4': 1, '5': 5, '10': 'checksTriggered'},
  ],
};

/// Descriptor for `RerunBackgroundChecksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rerunBackgroundChecksResponseDescriptor =
    $convert.base64Decode(
        'Ch1SZXJ1bkJhY2tncm91bmRDaGVja3NSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
        'NzEikKEGNoZWNrc190cmlnZ2VyZWQYAiABKAVSD2NoZWNrc1RyaWdnZXJlZA==');

@$core.Deprecated('Use deleteWorkerRequestDescriptor instead')
const DeleteWorkerRequest$json = {
  '1': 'DeleteWorkerRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `DeleteWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteWorkerRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVXb3JrZXJSZXF1ZXN0EhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySWQSFgoGcm'
    'Vhc29uGAIgASgJUgZyZWFzb24=');

@$core.Deprecated('Use deleteWorkerResponseDescriptor instead')
const DeleteWorkerResponse$json = {
  '1': 'DeleteWorkerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteWorkerResponseDescriptor =
    $convert.base64Decode(
        'ChREZWxldGVXb3JrZXJSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use restoreWorkerRequestDescriptor instead')
const RestoreWorkerRequest$json = {
  '1': 'RestoreWorkerRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `RestoreWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreWorkerRequestDescriptor =
    $convert.base64Decode(
        'ChRSZXN0b3JlV29ya2VyUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlcklk');

@$core.Deprecated('Use restoreWorkerResponseDescriptor instead')
const RestoreWorkerResponse$json = {
  '1': 'RestoreWorkerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RestoreWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreWorkerResponseDescriptor =
    $convert.base64Decode(
        'ChVSZXN0b3JlV29ya2VyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use listDeletedWorkersRequestDescriptor instead')
const ListDeletedWorkersRequest$json = {
  '1': 'ListDeletedWorkersRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
    {'1': 'limit', '3': 3, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ListDeletedWorkersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeletedWorkersRequestDescriptor =
    $convert.base64Decode(
        'ChlMaXN0RGVsZXRlZFdvcmtlcnNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SW'
        'QSEgoEcGFnZRgCIAEoBVIEcGFnZRIUCgVsaW1pdBgDIAEoBVIFbGltaXQ=');

@$core.Deprecated('Use listDeletedWorkersResponseDescriptor instead')
const ListDeletedWorkersResponse$json = {
  '1': 'ListDeletedWorkersResponse',
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

/// Descriptor for `ListDeletedWorkersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDeletedWorkersResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0RGVsZXRlZFdvcmtlcnNSZXNwb25zZRIyCgd3b3JrZXJzGAEgAygLMhgud29ya2VyLn'
    'YxLldvcmtlclByb2ZpbGVSB3dvcmtlcnMSHwoLdG90YWxfaXRlbXMYAiABKAVSCnRvdGFsSXRl'
    'bXMSHwoLdG90YWxfcGFnZXMYAyABKAVSCnRvdGFsUGFnZXMSIQoMY3VycmVudF9wYWdlGAQgAS'
    'gFUgtjdXJyZW50UGFnZQ==');
