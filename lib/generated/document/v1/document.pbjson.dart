// This is a generated file - do not edit.
//
// Generated from document/v1/document.proto.

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

@$core.Deprecated('Use generateUploadURLRequestDescriptor instead')
const GenerateUploadURLRequest$json = {
  '1': 'GenerateUploadURLRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'file_ext', '3': 3, '4': 1, '5': 9, '10': 'fileExt'},
    {'1': 'doc_type', '3': 4, '4': 1, '5': 9, '10': 'docType'},
  ],
};

/// Descriptor for `GenerateUploadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateUploadURLRequestDescriptor = $convert.base64Decode(
    'ChhHZW5lcmF0ZVVwbG9hZFVSTFJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZB'
    'IbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlcklkEhkKCGZpbGVfZXh0GAMgASgJUgdmaWxlRXh0'
    'EhkKCGRvY190eXBlGAQgASgJUgdkb2NUeXBl');

@$core.Deprecated('Use generateUploadURLResponseDescriptor instead')
const GenerateUploadURLResponse$json = {
  '1': 'GenerateUploadURLResponse',
  '2': [
    {'1': 'upload_url', '3': 1, '4': 1, '5': 9, '10': 'uploadUrl'},
    {'1': 'object_key', '3': 2, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 5, '10': 'expiresIn'},
    {
      '1': 'required_headers',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.document.v1.GenerateUploadURLResponse.RequiredHeadersEntry',
      '10': 'requiredHeaders'
    },
    {'1': 'document_id', '3': 5, '4': 1, '5': 9, '10': 'documentId'},
  ],
  '3': [GenerateUploadURLResponse_RequiredHeadersEntry$json],
};

@$core.Deprecated('Use generateUploadURLResponseDescriptor instead')
const GenerateUploadURLResponse_RequiredHeadersEntry$json = {
  '1': 'RequiredHeadersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GenerateUploadURLResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateUploadURLResponseDescriptor = $convert.base64Decode(
    'ChlHZW5lcmF0ZVVwbG9hZFVSTFJlc3BvbnNlEh0KCnVwbG9hZF91cmwYASABKAlSCXVwbG9hZF'
    'VybBIdCgpvYmplY3Rfa2V5GAIgASgJUglvYmplY3RLZXkSHQoKZXhwaXJlc19pbhgDIAEoBVIJ'
    'ZXhwaXJlc0luEmYKEHJlcXVpcmVkX2hlYWRlcnMYBCADKAsyOy5kb2N1bWVudC52MS5HZW5lcm'
    'F0ZVVwbG9hZFVSTFJlc3BvbnNlLlJlcXVpcmVkSGVhZGVyc0VudHJ5Ug9yZXF1aXJlZEhlYWRl'
    'cnMSHwoLZG9jdW1lbnRfaWQYBSABKAlSCmRvY3VtZW50SWQaQgoUUmVxdWlyZWRIZWFkZXJzRW'
    '50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use generateDownloadURLRequestDescriptor instead')
const GenerateDownloadURLRequest$json = {
  '1': 'GenerateDownloadURLRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'bucket', '3': 2, '4': 1, '5': 9, '10': 'bucket'},
  ],
};

/// Descriptor for `GenerateDownloadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDownloadURLRequestDescriptor =
    $convert.base64Decode(
        'ChpHZW5lcmF0ZURvd25sb2FkVVJMUmVxdWVzdBIdCgpvYmplY3Rfa2V5GAEgASgJUglvYmplY3'
        'RLZXkSFgoGYnVja2V0GAIgASgJUgZidWNrZXQ=');

@$core.Deprecated('Use generateDownloadURLResponseDescriptor instead')
const GenerateDownloadURLResponse$json = {
  '1': 'GenerateDownloadURLResponse',
  '2': [
    {'1': 'download_url', '3': 1, '4': 1, '5': 9, '10': 'downloadUrl'},
    {'1': 'expires_in', '3': 2, '4': 1, '5': 5, '10': 'expiresIn'},
  ],
};

/// Descriptor for `GenerateDownloadURLResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDownloadURLResponseDescriptor =
    $convert.base64Decode(
        'ChtHZW5lcmF0ZURvd25sb2FkVVJMUmVzcG9uc2USIQoMZG93bmxvYWRfdXJsGAEgASgJUgtkb3'
        'dubG9hZFVybBIdCgpleHBpcmVzX2luGAIgASgFUglleHBpcmVzSW4=');

@$core.Deprecated('Use confirmUploadRequestDescriptor instead')
const ConfirmUploadRequest$json = {
  '1': 'ConfirmUploadRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'doc_type', '3': 2, '4': 1, '5': 9, '10': 'docType'},
  ],
};

/// Descriptor for `ConfirmUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmUploadRequestDescriptor = $convert.base64Decode(
    'ChRDb25maXJtVXBsb2FkUmVxdWVzdBIdCgpvYmplY3Rfa2V5GAEgASgJUglvYmplY3RLZXkSGQ'
    'oIZG9jX3R5cGUYAiABKAlSB2RvY1R5cGU=');

@$core.Deprecated('Use confirmUploadResponseDescriptor instead')
const ConfirmUploadResponse$json = {
  '1': 'ConfirmUploadResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'document_id', '3': 2, '4': 1, '5': 9, '10': 'documentId'},
  ],
};

/// Descriptor for `ConfirmUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmUploadResponseDescriptor = $convert.base64Decode(
    'ChVDb25maXJtVXBsb2FkUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSHwoLZG9jdW'
    '1lbnRfaWQYAiABKAlSCmRvY3VtZW50SWQ=');

@$core.Deprecated('Use displayDocumentRequestDescriptor instead')
const DisplayDocumentRequest$json = {
  '1': 'DisplayDocumentRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `DisplayDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List displayDocumentRequestDescriptor =
    $convert.base64Decode(
        'ChZEaXNwbGF5RG9jdW1lbnRSZXF1ZXN0Eh0KCm9iamVjdF9rZXkYASABKAlSCW9iamVjdEtleQ'
        '==');

@$core.Deprecated('Use displayDocumentResponseDescriptor instead')
const DisplayDocumentResponse$json = {
  '1': 'DisplayDocumentResponse',
  '2': [
    {'1': 'display_url', '3': 1, '4': 1, '5': 9, '10': 'displayUrl'},
    {'1': 'expires_in', '3': 2, '4': 1, '5': 5, '10': 'expiresIn'},
    {'1': 'content_type', '3': 3, '4': 1, '5': 9, '10': 'contentType'},
  ],
};

/// Descriptor for `DisplayDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List displayDocumentResponseDescriptor = $convert.base64Decode(
    'ChdEaXNwbGF5RG9jdW1lbnRSZXNwb25zZRIfCgtkaXNwbGF5X3VybBgBIAEoCVIKZGlzcGxheV'
    'VybBIdCgpleHBpcmVzX2luGAIgASgFUglleHBpcmVzSW4SIQoMY29udGVudF90eXBlGAMgASgJ'
    'Ugtjb250ZW50VHlwZQ==');

@$core.Deprecated('Use deleteDocumentRequestDescriptor instead')
const DeleteDocumentRequest$json = {
  '1': 'DeleteDocumentRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `DeleteDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDocumentRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVEb2N1bWVudFJlcXVlc3QSHQoKb2JqZWN0X2tleRgBIAEoCVIJb2JqZWN0S2V5');

@$core.Deprecated('Use deleteDocumentResponseDescriptor instead')
const DeleteDocumentResponse$json = {
  '1': 'DeleteDocumentResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `DeleteDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteDocumentResponseDescriptor =
    $convert.base64Decode(
        'ChZEZWxldGVEb2N1bWVudFJlc3BvbnNlEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVz');

@$core.Deprecated('Use listExpiringDocumentsRequestDescriptor instead')
const ListExpiringDocumentsRequest$json = {
  '1': 'ListExpiringDocumentsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListExpiringDocumentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listExpiringDocumentsRequestDescriptor =
    $convert.base64Decode(
        'ChxMaXN0RXhwaXJpbmdEb2N1bWVudHNSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW'
        '50SWQ=');

@$core.Deprecated('Use expiringDocumentDescriptor instead')
const ExpiringDocument$json = {
  '1': 'ExpiringDocument',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'doc_type', '3': 4, '4': 1, '5': 9, '10': 'docType'},
    {'1': 'stored_path', '3': 5, '4': 1, '5': 9, '10': 'storedPath'},
    {'1': 'expiry_date', '3': 6, '4': 1, '5': 9, '10': 'expiryDate'},
    {'1': 'is_expired', '3': 7, '4': 1, '5': 8, '10': 'isExpired'},
  ],
};

/// Descriptor for `ExpiringDocument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List expiringDocumentDescriptor = $convert.base64Decode(
    'ChBFeHBpcmluZ0RvY3VtZW50Eg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKAlSCH'
    'dvcmtlcklkEhsKCXRlbmFudF9pZBgDIAEoCVIIdGVuYW50SWQSGQoIZG9jX3R5cGUYBCABKAlS'
    'B2RvY1R5cGUSHwoLc3RvcmVkX3BhdGgYBSABKAlSCnN0b3JlZFBhdGgSHwoLZXhwaXJ5X2RhdG'
    'UYBiABKAlSCmV4cGlyeURhdGUSHQoKaXNfZXhwaXJlZBgHIAEoCFIJaXNFeHBpcmVk');

@$core.Deprecated('Use listExpiringDocumentsResponseDescriptor instead')
const ListExpiringDocumentsResponse$json = {
  '1': 'ListExpiringDocumentsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.document.v1.ExpiringDocument',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListExpiringDocumentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listExpiringDocumentsResponseDescriptor =
    $convert.base64Decode(
        'Ch1MaXN0RXhwaXJpbmdEb2N1bWVudHNSZXNwb25zZRIzCgVpdGVtcxgBIAMoCzIdLmRvY3VtZW'
        '50LnYxLkV4cGlyaW5nRG9jdW1lbnRSBWl0ZW1z');

@$core.Deprecated('Use listDocumentReviewQueueRequestDescriptor instead')
const ListDocumentReviewQueueRequest$json = {
  '1': 'ListDocumentReviewQueueRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListDocumentReviewQueueRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDocumentReviewQueueRequestDescriptor =
    $convert.base64Decode(
        'Ch5MaXN0RG9jdW1lbnRSZXZpZXdRdWV1ZVJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZA==');

@$core.Deprecated('Use documentReviewItemDescriptor instead')
const DocumentReviewItem$json = {
  '1': 'DocumentReviewItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'doc_type', '3': 4, '4': 1, '5': 9, '10': 'docType'},
    {'1': 'stored_path', '3': 5, '4': 1, '5': 9, '10': 'storedPath'},
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'uploaded_at', '3': 7, '4': 1, '5': 9, '10': 'uploadedAt'},
    {'1': 'expected_type', '3': 8, '4': 1, '5': 9, '10': 'expectedType'},
    {'1': 'review_reasons', '3': 9, '4': 3, '5': 9, '10': 'reviewReasons'},
    {'1': 'm4_verdict', '3': 10, '4': 1, '5': 9, '10': 'm4Verdict'},
    {'1': 'face_band', '3': 11, '4': 1, '5': 9, '10': 'faceBand'},
    {'1': 'name_band', '3': 12, '4': 1, '5': 9, '10': 'nameBand'},
    {'1': 'back_document_id', '3': 13, '4': 1, '5': 9, '10': 'backDocumentId'},
  ],
};

/// Descriptor for `DocumentReviewItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List documentReviewItemDescriptor = $convert.base64Decode(
    'ChJEb2N1bWVudFJldmlld0l0ZW0SDgoCaWQYASABKAlSAmlkEhsKCXdvcmtlcl9pZBgCIAEoCV'
    'IId29ya2VySWQSGwoJdGVuYW50X2lkGAMgASgJUgh0ZW5hbnRJZBIZCghkb2NfdHlwZRgEIAEo'
    'CVIHZG9jVHlwZRIfCgtzdG9yZWRfcGF0aBgFIAEoCVIKc3RvcmVkUGF0aBIWCgZzdGF0dXMYBi'
    'ABKAlSBnN0YXR1cxIfCgt1cGxvYWRlZF9hdBgHIAEoCVIKdXBsb2FkZWRBdBIjCg1leHBlY3Rl'
    'ZF90eXBlGAggASgJUgxleHBlY3RlZFR5cGUSJQoOcmV2aWV3X3JlYXNvbnMYCSADKAlSDXJldm'
    'lld1JlYXNvbnMSHQoKbTRfdmVyZGljdBgKIAEoCVIJbTRWZXJkaWN0EhsKCWZhY2VfYmFuZBgL'
    'IAEoCVIIZmFjZUJhbmQSGwoJbmFtZV9iYW5kGAwgASgJUghuYW1lQmFuZBIoChBiYWNrX2RvY3'
    'VtZW50X2lkGA0gASgJUg5iYWNrRG9jdW1lbnRJZA==');

@$core.Deprecated('Use listDocumentReviewQueueResponseDescriptor instead')
const ListDocumentReviewQueueResponse$json = {
  '1': 'ListDocumentReviewQueueResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.document.v1.DocumentReviewItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListDocumentReviewQueueResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDocumentReviewQueueResponseDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0RG9jdW1lbnRSZXZpZXdRdWV1ZVJlc3BvbnNlEjUKBWl0ZW1zGAEgAygLMh8uZG9jdW'
        '1lbnQudjEuRG9jdW1lbnRSZXZpZXdJdGVtUgVpdGVtcw==');

@$core.Deprecated('Use listDocumentsByTenantRequestDescriptor instead')
const ListDocumentsByTenantRequest$json = {
  '1': 'ListDocumentsByTenantRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListDocumentsByTenantRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDocumentsByTenantRequestDescriptor =
    $convert.base64Decode(
        'ChxMaXN0RG9jdW1lbnRzQnlUZW5hbnRSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW'
        '50SWQ=');

@$core.Deprecated('Use tenantDocumentDescriptor instead')
const TenantDocument$json = {
  '1': 'TenantDocument',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'doc_type', '3': 3, '4': 1, '5': 9, '10': 'docType'},
    {'1': 'document_number', '3': 4, '4': 1, '5': 9, '10': 'documentNumber'},
    {'1': 'expiry_date', '3': 5, '4': 1, '5': 9, '10': 'expiryDate'},
    {'1': 'confidence_score', '3': 6, '4': 1, '5': 1, '10': 'confidenceScore'},
    {'1': 'stored_path', '3': 7, '4': 1, '5': 9, '10': 'storedPath'},
    {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
    {'1': 'date_of_birth', '3': 9, '4': 1, '5': 9, '10': 'dateOfBirth'},
    {'1': 'review_message', '3': 10, '4': 1, '5': 9, '10': 'reviewMessage'},
    {'1': 'reject_category', '3': 11, '4': 1, '5': 9, '10': 'rejectCategory'},
    {'1': 'uploaded_at', '3': 12, '4': 1, '5': 9, '10': 'uploadedAt'},
  ],
};

/// Descriptor for `TenantDocument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tenantDocumentDescriptor = $convert.base64Decode(
    'Cg5UZW5hbnREb2N1bWVudBIOCgJpZBgBIAEoCVICaWQSGwoJd29ya2VyX2lkGAIgASgJUgh3b3'
    'JrZXJJZBIZCghkb2NfdHlwZRgDIAEoCVIHZG9jVHlwZRInCg9kb2N1bWVudF9udW1iZXIYBCAB'
    'KAlSDmRvY3VtZW50TnVtYmVyEh8KC2V4cGlyeV9kYXRlGAUgASgJUgpleHBpcnlEYXRlEikKEG'
    'NvbmZpZGVuY2Vfc2NvcmUYBiABKAFSD2NvbmZpZGVuY2VTY29yZRIfCgtzdG9yZWRfcGF0aBgH'
    'IAEoCVIKc3RvcmVkUGF0aBIWCgZzdGF0dXMYCCABKAlSBnN0YXR1cxIiCg1kYXRlX29mX2Jpcn'
    'RoGAkgASgJUgtkYXRlT2ZCaXJ0aBIlCg5yZXZpZXdfbWVzc2FnZRgKIAEoCVINcmV2aWV3TWVz'
    'c2FnZRInCg9yZWplY3RfY2F0ZWdvcnkYCyABKAlSDnJlamVjdENhdGVnb3J5Eh8KC3VwbG9hZG'
    'VkX2F0GAwgASgJUgp1cGxvYWRlZEF0');

@$core.Deprecated('Use listDocumentsByTenantResponseDescriptor instead')
const ListDocumentsByTenantResponse$json = {
  '1': 'ListDocumentsByTenantResponse',
  '2': [
    {
      '1': 'documents',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.document.v1.TenantDocument',
      '10': 'documents'
    },
  ],
};

/// Descriptor for `ListDocumentsByTenantResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listDocumentsByTenantResponseDescriptor =
    $convert.base64Decode(
        'Ch1MaXN0RG9jdW1lbnRzQnlUZW5hbnRSZXNwb25zZRI5Cglkb2N1bWVudHMYASADKAsyGy5kb2'
        'N1bWVudC52MS5UZW5hbnREb2N1bWVudFIJZG9jdW1lbnRz');

@$core.Deprecated('Use listWorkerDocumentsRequestDescriptor instead')
const ListWorkerDocumentsRequest$json = {
  '1': 'ListWorkerDocumentsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `ListWorkerDocumentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWorkerDocumentsRequestDescriptor =
    $convert.base64Decode(
        'ChpMaXN0V29ya2VyRG9jdW1lbnRzUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudE'
        'lkEhsKCXdvcmtlcl9pZBgCIAEoCVIId29ya2VySWQ=');

@$core.Deprecated('Use listWorkerDocumentsResponseDescriptor instead')
const ListWorkerDocumentsResponse$json = {
  '1': 'ListWorkerDocumentsResponse',
  '2': [
    {
      '1': 'documents',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.document.v1.TenantDocument',
      '10': 'documents'
    },
  ],
};

/// Descriptor for `ListWorkerDocumentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listWorkerDocumentsResponseDescriptor =
    $convert.base64Decode(
        'ChtMaXN0V29ya2VyRG9jdW1lbnRzUmVzcG9uc2USOQoJZG9jdW1lbnRzGAEgAygLMhsuZG9jdW'
        '1lbnQudjEuVGVuYW50RG9jdW1lbnRSCWRvY3VtZW50cw==');

@$core.Deprecated('Use verifyDocumentUploadRequestDescriptor instead')
const VerifyDocumentUploadRequest$json = {
  '1': 'VerifyDocumentUploadRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
    {'1': 'back_object_key', '3': 2, '4': 1, '5': 9, '10': 'backObjectKey'},
    {'1': 'expected_type', '3': 3, '4': 1, '5': 9, '10': 'expectedType'},
    {'1': 'selfie', '3': 4, '4': 1, '5': 12, '10': 'selfie'},
  ],
};

/// Descriptor for `VerifyDocumentUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyDocumentUploadRequestDescriptor =
    $convert.base64Decode(
        'ChtWZXJpZnlEb2N1bWVudFVwbG9hZFJlcXVlc3QSHQoKb2JqZWN0X2tleRgBIAEoCVIJb2JqZW'
        'N0S2V5EiYKD2JhY2tfb2JqZWN0X2tleRgCIAEoCVINYmFja09iamVjdEtleRIjCg1leHBlY3Rl'
        'ZF90eXBlGAMgASgJUgxleHBlY3RlZFR5cGUSFgoGc2VsZmllGAQgASgMUgZzZWxmaWU=');

@$core.Deprecated('Use verifyDocumentUploadResponseDescriptor instead')
const VerifyDocumentUploadResponse$json = {
  '1': 'VerifyDocumentUploadResponse',
  '2': [
    {'1': 'accepted', '3': 1, '4': 1, '5': 8, '10': 'accepted'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'expected_type', '3': 4, '4': 1, '5': 9, '10': 'expectedType'},
    {'1': 'detected_type', '3': 5, '4': 1, '5': 9, '10': 'detectedType'},
    {'1': 'message', '3': 6, '4': 1, '5': 9, '10': 'message'},
    {'1': 'document_id', '3': 7, '4': 1, '5': 9, '10': 'documentId'},
  ],
};

/// Descriptor for `VerifyDocumentUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyDocumentUploadResponseDescriptor = $convert.base64Decode(
    'ChxWZXJpZnlEb2N1bWVudFVwbG9hZFJlc3BvbnNlEhoKCGFjY2VwdGVkGAEgASgIUghhY2NlcH'
    'RlZBIWCgZzdGF0dXMYAiABKAlSBnN0YXR1cxIWCgZyZWFzb24YAyABKAlSBnJlYXNvbhIjCg1l'
    'eHBlY3RlZF90eXBlGAQgASgJUgxleHBlY3RlZFR5cGUSIwoNZGV0ZWN0ZWRfdHlwZRgFIAEoCV'
    'IMZGV0ZWN0ZWRUeXBlEhgKB21lc3NhZ2UYBiABKAlSB21lc3NhZ2USHwoLZG9jdW1lbnRfaWQY'
    'ByABKAlSCmRvY3VtZW50SWQ=');

@$core.Deprecated('Use getDocumentExtractionRequestDescriptor instead')
const GetDocumentExtractionRequest$json = {
  '1': 'GetDocumentExtractionRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'stored_path', '3': 3, '4': 1, '5': 9, '10': 'storedPath'},
  ],
};

/// Descriptor for `GetDocumentExtractionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDocumentExtractionRequestDescriptor =
    $convert.base64Decode(
        'ChxHZXREb2N1bWVudEV4dHJhY3Rpb25SZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW'
        '50SWQSGwoJd29ya2VyX2lkGAIgASgJUgh3b3JrZXJJZBIfCgtzdG9yZWRfcGF0aBgDIAEoCVIK'
        'c3RvcmVkUGF0aA==');

@$core.Deprecated('Use getDocumentExtractionResponseDescriptor instead')
const GetDocumentExtractionResponse$json = {
  '1': 'GetDocumentExtractionResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'extraction_json', '3': 2, '4': 1, '5': 9, '10': 'extractionJson'},
  ],
};

/// Descriptor for `GetDocumentExtractionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDocumentExtractionResponseDescriptor =
    $convert.base64Decode(
        'Ch1HZXREb2N1bWVudEV4dHJhY3Rpb25SZXNwb25zZRIfCgtkb2N1bWVudF9pZBgBIAEoCVIKZG'
        '9jdW1lbnRJZBInCg9leHRyYWN0aW9uX2pzb24YAiABKAlSDmV4dHJhY3Rpb25Kc29u');

@$core.Deprecated('Use reviewDocumentRequestDescriptor instead')
const ReviewDocumentRequest$json = {
  '1': 'ReviewDocumentRequest',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'decision', '3': 2, '4': 1, '5': 9, '10': 'decision'},
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'worker_message', '3': 4, '4': 1, '5': 9, '10': 'workerMessage'},
    {'1': 'reject_category', '3': 5, '4': 1, '5': 9, '10': 'rejectCategory'},
  ],
};

/// Descriptor for `ReviewDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reviewDocumentRequestDescriptor = $convert.base64Decode(
    'ChVSZXZpZXdEb2N1bWVudFJlcXVlc3QSHwoLZG9jdW1lbnRfaWQYASABKAlSCmRvY3VtZW50SW'
    'QSGgoIZGVjaXNpb24YAiABKAlSCGRlY2lzaW9uEhYKBnJlYXNvbhgDIAEoCVIGcmVhc29uEiUK'
    'Dndvcmtlcl9tZXNzYWdlGAQgASgJUg13b3JrZXJNZXNzYWdlEicKD3JlamVjdF9jYXRlZ29yeR'
    'gFIAEoCVIOcmVqZWN0Q2F0ZWdvcnk=');

@$core.Deprecated('Use reviewDocumentResponseDescriptor instead')
const ReviewDocumentResponse$json = {
  '1': 'ReviewDocumentResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
    {'1': 'reviewed_at', '3': 3, '4': 1, '5': 9, '10': 'reviewedAt'},
  ],
};

/// Descriptor for `ReviewDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reviewDocumentResponseDescriptor = $convert.base64Decode(
    'ChZSZXZpZXdEb2N1bWVudFJlc3BvbnNlEh8KC2RvY3VtZW50X2lkGAEgASgJUgpkb2N1bWVudE'
    'lkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdHVzEh8KC3Jldmlld2VkX2F0GAMgASgJUgpyZXZpZXdl'
    'ZEF0');

@$core.Deprecated('Use getDocumentIdentityFieldsRequestDescriptor instead')
const GetDocumentIdentityFieldsRequest$json = {
  '1': 'GetDocumentIdentityFieldsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'document_id', '3': 3, '4': 1, '5': 9, '10': 'documentId'},
  ],
};

/// Descriptor for `GetDocumentIdentityFieldsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDocumentIdentityFieldsRequestDescriptor =
    $convert.base64Decode(
        'CiBHZXREb2N1bWVudElkZW50aXR5RmllbGRzUmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCH'
        'RlbmFudElkEhsKCXdvcmtlcl9pZBgCIAEoCVIId29ya2VySWQSHwoLZG9jdW1lbnRfaWQYAyAB'
        'KAlSCmRvY3VtZW50SWQ=');

@$core.Deprecated('Use getDocumentIdentityFieldsResponseDescriptor instead')
const GetDocumentIdentityFieldsResponse$json = {
  '1': 'GetDocumentIdentityFieldsResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'check_id', '3': 2, '4': 1, '5': 9, '10': 'checkId'},
    {'1': 'identity_json', '3': 3, '4': 1, '5': 9, '10': 'identityJson'},
  ],
};

/// Descriptor for `GetDocumentIdentityFieldsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDocumentIdentityFieldsResponseDescriptor =
    $convert.base64Decode(
        'CiFHZXREb2N1bWVudElkZW50aXR5RmllbGRzUmVzcG9uc2USHwoLZG9jdW1lbnRfaWQYASABKA'
        'lSCmRvY3VtZW50SWQSGQoIY2hlY2tfaWQYAiABKAlSB2NoZWNrSWQSIwoNaWRlbnRpdHlfanNv'
        'bhgDIAEoCVIMaWRlbnRpdHlKc29u');

@$core.Deprecated('Use getIdentityPortraitRequestDescriptor instead')
const GetIdentityPortraitRequest$json = {
  '1': 'GetIdentityPortraitRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `GetIdentityPortraitRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIdentityPortraitRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRJZGVudGl0eVBvcnRyYWl0UmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudE'
        'lkEhsKCXdvcmtlcl9pZBgCIAEoCVIId29ya2VySWQ=');

@$core.Deprecated('Use getIdentityPortraitResponseDescriptor instead')
const GetIdentityPortraitResponse$json = {
  '1': 'GetIdentityPortraitResponse',
  '2': [
    {'1': 'portrait', '3': 1, '4': 1, '5': 12, '10': 'portrait'},
    {'1': 'document_id', '3': 2, '4': 1, '5': 9, '10': 'documentId'},
  ],
};

/// Descriptor for `GetIdentityPortraitResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIdentityPortraitResponseDescriptor =
    $convert.base64Decode(
        'ChtHZXRJZGVudGl0eVBvcnRyYWl0UmVzcG9uc2USGgoIcG9ydHJhaXQYASABKAxSCHBvcnRyYW'
        'l0Eh8KC2RvY3VtZW50X2lkGAIgASgJUgpkb2N1bWVudElk');
