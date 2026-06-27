// This is a generated file - do not edit.
//
// Generated from biometric/v1/biometric.proto.

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

@$core.Deprecated('Use enrollFaceRequestDescriptor instead')
const EnrollFaceRequest$json = {
  '1': 'EnrollFaceRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'embedding_hash', '3': 3, '4': 1, '5': 9, '10': 'embeddingHash'},
  ],
};

/// Descriptor for `EnrollFaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollFaceRequestDescriptor = $convert.base64Decode(
    'ChFFbnJvbGxGYWNlUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlcklkEhsKCXRlbm'
    'FudF9pZBgCIAEoCVIIdGVuYW50SWQSJQoOZW1iZWRkaW5nX2hhc2gYAyABKAlSDWVtYmVkZGlu'
    'Z0hhc2g=');

@$core.Deprecated('Use enrollFaceResponseDescriptor instead')
const EnrollFaceResponse$json = {
  '1': 'EnrollFaceResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'is_new', '3': 2, '4': 1, '5': 8, '10': 'isNew'},
    {'1': 'is_collision', '3': 3, '4': 1, '5': 8, '10': 'isCollision'},
  ],
};

/// Descriptor for `EnrollFaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enrollFaceResponseDescriptor = $convert.base64Decode(
    'ChJFbnJvbGxGYWNlUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhUKBmlzX25ldxgCIAEoCFIFaX'
    'NOZXcSIQoMaXNfY29sbGlzaW9uGAMgASgIUgtpc0NvbGxpc2lvbg==');

@$core.Deprecated('Use searchCollisionsRequestDescriptor instead')
const SearchCollisionsRequest$json = {
  '1': 'SearchCollisionsRequest',
  '2': [
    {'1': 'embedding_hash', '3': 1, '4': 1, '5': 9, '10': 'embeddingHash'},
  ],
};

/// Descriptor for `SearchCollisionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchCollisionsRequestDescriptor =
    $convert.base64Decode(
        'ChdTZWFyY2hDb2xsaXNpb25zUmVxdWVzdBIlCg5lbWJlZGRpbmdfaGFzaBgBIAEoCVINZW1iZW'
        'RkaW5nSGFzaA==');

@$core.Deprecated('Use searchCollisionsResponseDescriptor instead')
const SearchCollisionsResponse$json = {
  '1': 'SearchCollisionsResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.biometric.v1.CollisionResult',
      '10': 'results'
    },
  ],
};

/// Descriptor for `SearchCollisionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchCollisionsResponseDescriptor =
    $convert.base64Decode(
        'ChhTZWFyY2hDb2xsaXNpb25zUmVzcG9uc2USNwoHcmVzdWx0cxgBIAMoCzIdLmJpb21ldHJpYy'
        '52MS5Db2xsaXNpb25SZXN1bHRSB3Jlc3VsdHM=');

@$core.Deprecated('Use collisionResultDescriptor instead')
const CollisionResult$json = {
  '1': 'CollisionResult',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    {'1': 'detected_at', '3': 3, '4': 1, '5': 9, '10': 'detectedAt'},
  ],
};

/// Descriptor for `CollisionResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List collisionResultDescriptor = $convert.base64Decode(
    'Cg9Db2xsaXNpb25SZXN1bHQSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIUCgVsYWJlbB'
    'gCIAEoCVIFbGFiZWwSHwoLZGV0ZWN0ZWRfYXQYAyABKAlSCmRldGVjdGVkQXQ=');

@$core.Deprecated('Use blockFaceRequestDescriptor instead')
const BlockFaceRequest$json = {
  '1': 'BlockFaceRequest',
  '2': [
    {'1': 'embedding_hash', '3': 1, '4': 1, '5': 9, '10': 'embeddingHash'},
  ],
};

/// Descriptor for `BlockFaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockFaceRequestDescriptor = $convert.base64Decode(
    'ChBCbG9ja0ZhY2VSZXF1ZXN0EiUKDmVtYmVkZGluZ19oYXNoGAEgASgJUg1lbWJlZGRpbmdIYX'
    'No');

@$core.Deprecated('Use blockFaceResponseDescriptor instead')
const BlockFaceResponse$json = {
  '1': 'BlockFaceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `BlockFaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockFaceResponseDescriptor = $convert.base64Decode(
    'ChFCbG9ja0ZhY2VSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use unblockFaceRequestDescriptor instead')
const UnblockFaceRequest$json = {
  '1': 'UnblockFaceRequest',
  '2': [
    {'1': 'embedding_hash', '3': 1, '4': 1, '5': 9, '10': 'embeddingHash'},
  ],
};

/// Descriptor for `UnblockFaceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unblockFaceRequestDescriptor = $convert.base64Decode(
    'ChJVbmJsb2NrRmFjZVJlcXVlc3QSJQoOZW1iZWRkaW5nX2hhc2gYASABKAlSDWVtYmVkZGluZ0'
    'hhc2g=');

@$core.Deprecated('Use unblockFaceResponseDescriptor instead')
const UnblockFaceResponse$json = {
  '1': 'UnblockFaceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UnblockFaceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unblockFaceResponseDescriptor =
    $convert.base64Decode(
        'ChNVbmJsb2NrRmFjZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');
