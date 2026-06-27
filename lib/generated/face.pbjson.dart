// This is a generated file - do not edit.
//
// Generated from face.proto.

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

@$core.Deprecated('Use gestureLogDescriptor instead')
const GestureLog$json = {
  '1': 'GestureLog',
  '2': [
    {'1': 'step', '3': 1, '4': 1, '5': 9, '10': 'step'},
    {'1': 'timestamp_ms', '3': 2, '4': 1, '5': 3, '10': 'timestampMs'},
    {'1': 'confidence', '3': 3, '4': 1, '5': 2, '10': 'confidence'},
  ],
};

/// Descriptor for `GestureLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gestureLogDescriptor = $convert.base64Decode(
    'CgpHZXN0dXJlTG9nEhIKBHN0ZXAYASABKAlSBHN0ZXASIQoMdGltZXN0YW1wX21zGAIgASgDUg'
    't0aW1lc3RhbXBNcxIeCgpjb25maWRlbmNlGAMgASgCUgpjb25maWRlbmNl');

@$core.Deprecated('Use enrollRequestDescriptor instead')
const EnrollRequest$json = {
  '1': 'EnrollRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'embedding', '3': 2, '4': 3, '5': 2, '10': 'embedding'},
    {'1': 'selfie_frames', '3': 3, '4': 3, '5': 12, '10': 'selfieFrames'},
    {
      '1': 'metadata',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.faceauth.GestureLog',
      '10': 'metadata'
    },
  ],
};

/// Descriptor for `EnrollRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollRequestDescriptor = $convert.base64Decode(
    'Cg1FbnJvbGxSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIcCgllbWJlZGRpbmcYAi'
    'ADKAJSCWVtYmVkZGluZxIjCg1zZWxmaWVfZnJhbWVzGAMgAygMUgxzZWxmaWVGcmFtZXMSMAoI'
    'bWV0YWRhdGEYBCADKAsyFC5mYWNlYXV0aC5HZXN0dXJlTG9nUghtZXRhZGF0YQ==');

@$core.Deprecated('Use enrollResponseDescriptor instead')
const EnrollResponse$json = {
  '1': 'EnrollResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EnrollResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollResponseDescriptor = $convert.base64Decode(
    'Cg5FbnJvbGxSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhgKB21lc3NhZ2UYAi'
    'ABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use verifyRequestDescriptor instead')
const VerifyRequest$json = {
  '1': 'VerifyRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'embedding', '3': 2, '4': 3, '5': 2, '10': 'embedding'},
  ],
};

/// Descriptor for `VerifyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyRequestDescriptor = $convert.base64Decode(
    'Cg1WZXJpZnlSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIcCgllbWJlZGRpbmcYAi'
    'ADKAJSCWVtYmVkZGluZw==');

@$core.Deprecated('Use verifyResponseDescriptor instead')
const VerifyResponse$json = {
  '1': 'VerifyResponse',
  '2': [
    {'1': 'match', '3': 1, '4': 1, '5': 8, '10': 'match'},
    {'1': 'similarity', '3': 2, '4': 1, '5': 2, '10': 'similarity'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `VerifyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyResponseDescriptor = $convert.base64Decode(
    'Cg5WZXJpZnlSZXNwb25zZRIUCgVtYXRjaBgBIAEoCFIFbWF0Y2gSHgoKc2ltaWxhcml0eRgCIA'
    'EoAlIKc2ltaWxhcml0eRIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use pingRequestDescriptor instead')
const PingRequest$json = {
  '1': 'PingRequest',
};

/// Descriptor for `PingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingRequestDescriptor =
    $convert.base64Decode('CgtQaW5nUmVxdWVzdA==');

@$core.Deprecated('Use pingResponseDescriptor instead')
const PingResponse$json = {
  '1': 'PingResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `PingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingResponseDescriptor = $convert
    .base64Decode('CgxQaW5nUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');
