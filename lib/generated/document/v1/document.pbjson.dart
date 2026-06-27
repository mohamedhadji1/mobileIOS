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
  ],
};

/// Descriptor for `GenerateUploadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateUploadURLRequestDescriptor = $convert.base64Decode(
    'ChhHZW5lcmF0ZVVwbG9hZFVSTFJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZB'
    'IbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlcklkEhkKCGZpbGVfZXh0GAMgASgJUgdmaWxlRXh0');

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
    'cnMaQgoUUmVxdWlyZWRIZWFkZXJzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAi'
    'ABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use generateDownloadURLRequestDescriptor instead')
const GenerateDownloadURLRequest$json = {
  '1': 'GenerateDownloadURLRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `GenerateDownloadURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateDownloadURLRequestDescriptor =
    $convert.base64Decode(
        'ChpHZW5lcmF0ZURvd25sb2FkVVJMUmVxdWVzdBIdCgpvYmplY3Rfa2V5GAEgASgJUglvYmplY3'
        'RLZXk=');

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
  ],
};

/// Descriptor for `ConfirmUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List confirmUploadResponseDescriptor =
    $convert.base64Decode(
        'ChVDb25maXJtVXBsb2FkUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use downloadEncryptedRequestDescriptor instead')
const DownloadEncryptedRequest$json = {
  '1': 'DownloadEncryptedRequest',
  '2': [
    {'1': 'object_key', '3': 1, '4': 1, '5': 9, '10': 'objectKey'},
  ],
};

/// Descriptor for `DownloadEncryptedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadEncryptedRequestDescriptor =
    $convert.base64Decode(
        'ChhEb3dubG9hZEVuY3J5cHRlZFJlcXVlc3QSHQoKb2JqZWN0X2tleRgBIAEoCVIJb2JqZWN0S2'
        'V5');

@$core.Deprecated('Use downloadEncryptedResponseDescriptor instead')
const DownloadEncryptedResponse$json = {
  '1': 'DownloadEncryptedResponse',
  '2': [
    {'1': 'encrypted_data', '3': 1, '4': 1, '5': 12, '10': 'encryptedData'},
  ],
};

/// Descriptor for `DownloadEncryptedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadEncryptedResponseDescriptor =
    $convert.base64Decode(
        'ChlEb3dubG9hZEVuY3J5cHRlZFJlc3BvbnNlEiUKDmVuY3J5cHRlZF9kYXRhGAEgASgMUg1lbm'
        'NyeXB0ZWREYXRh');
