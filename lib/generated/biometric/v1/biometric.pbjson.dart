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

@$core.Deprecated('Use getWorkerEmbeddingRequestDescriptor instead')
const GetWorkerEmbeddingRequest$json = {
  '1': 'GetWorkerEmbeddingRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `GetWorkerEmbeddingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWorkerEmbeddingRequestDescriptor =
    $convert.base64Decode(
        'ChlHZXRXb3JrZXJFbWJlZGRpbmdSZXF1ZXN0EhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySW'
        'Q=');

@$core.Deprecated('Use getWorkerEmbeddingResponseDescriptor instead')
const GetWorkerEmbeddingResponse$json = {
  '1': 'GetWorkerEmbeddingResponse',
  '2': [
    {'1': 'embedding_hash', '3': 1, '4': 1, '5': 9, '10': 'embeddingHash'},
  ],
};

/// Descriptor for `GetWorkerEmbeddingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getWorkerEmbeddingResponseDescriptor =
    $convert.base64Decode(
        'ChpHZXRXb3JrZXJFbWJlZGRpbmdSZXNwb25zZRIlCg5lbWJlZGRpbmdfaGFzaBgBIAEoCVINZW'
        '1iZWRkaW5nSGFzaA==');

@$core.Deprecated('Use getChallengeRequestDescriptor instead')
const GetChallengeRequest$json = {
  '1': 'GetChallengeRequest',
};

/// Descriptor for `GetChallengeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChallengeRequestDescriptor =
    $convert.base64Decode('ChNHZXRDaGFsbGVuZ2VSZXF1ZXN0');

@$core.Deprecated('Use getChallengeResponseDescriptor instead')
const GetChallengeResponse$json = {
  '1': 'GetChallengeResponse',
  '2': [
    {'1': 'challenge_id', '3': 1, '4': 1, '5': 9, '10': 'challengeId'},
    {'1': 'steps', '3': 2, '4': 3, '5': 9, '10': 'steps'},
  ],
};

/// Descriptor for `GetChallengeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChallengeResponseDescriptor = $convert.base64Decode(
    'ChRHZXRDaGFsbGVuZ2VSZXNwb25zZRIhCgxjaGFsbGVuZ2VfaWQYASABKAlSC2NoYWxsZW5nZU'
    'lkEhQKBXN0ZXBzGAIgAygJUgVzdGVwcw==');

@$core.Deprecated('Use livenessClientMsgDescriptor instead')
const LivenessClientMsg$json = {
  '1': 'LivenessClientMsg',
  '2': [
    {
      '1': 'start',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.biometric.v1.LivenessStart',
      '9': 0,
      '10': 'start'
    },
    {'1': 'frame', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'frame'},
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `LivenessClientMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessClientMsgDescriptor = $convert.base64Decode(
    'ChFMaXZlbmVzc0NsaWVudE1zZxIzCgVzdGFydBgBIAEoCzIbLmJpb21ldHJpYy52MS5MaXZlbm'
    'Vzc1N0YXJ0SABSBXN0YXJ0EhYKBWZyYW1lGAIgASgMSABSBWZyYW1lQgUKA21zZw==');

@$core.Deprecated('Use livenessStartDescriptor instead')
const LivenessStart$json = {
  '1': 'LivenessStart',
  '2': [
    {'1': 'challenge_id', '3': 1, '4': 1, '5': 9, '10': 'challengeId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'doc_face', '3': 4, '4': 1, '5': 12, '10': 'docFace'},
  ],
};

/// Descriptor for `LivenessStart`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessStartDescriptor = $convert.base64Decode(
    'Cg1MaXZlbmVzc1N0YXJ0EiEKDGNoYWxsZW5nZV9pZBgBIAEoCVILY2hhbGxlbmdlSWQSGwoJd2'
    '9ya2VyX2lkGAIgASgJUgh3b3JrZXJJZBIbCgl0ZW5hbnRfaWQYAyABKAlSCHRlbmFudElkEhkK'
    'CGRvY19mYWNlGAQgASgMUgdkb2NGYWNl');

@$core.Deprecated('Use livenessServerMsgDescriptor instead')
const LivenessServerMsg$json = {
  '1': 'LivenessServerMsg',
  '2': [
    {
      '1': 'step',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.biometric.v1.LivenessStep',
      '9': 0,
      '10': 'step'
    },
    {
      '1': 'step_passed',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.biometric.v1.LivenessStepPassed',
      '9': 0,
      '10': 'stepPassed'
    },
    {
      '1': 'step_timeout',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.biometric.v1.LivenessStepTimeout',
      '9': 0,
      '10': 'stepTimeout'
    },
    {
      '1': 'result',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.biometric.v1.LivenessResult',
      '9': 0,
      '10': 'result'
    },
    {
      '1': 'error',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.biometric.v1.LivenessError',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'msg'},
  ],
};

/// Descriptor for `LivenessServerMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessServerMsgDescriptor = $convert.base64Decode(
    'ChFMaXZlbmVzc1NlcnZlck1zZxIwCgRzdGVwGAEgASgLMhouYmlvbWV0cmljLnYxLkxpdmVuZX'
    'NzU3RlcEgAUgRzdGVwEkMKC3N0ZXBfcGFzc2VkGAIgASgLMiAuYmlvbWV0cmljLnYxLkxpdmVu'
    'ZXNzU3RlcFBhc3NlZEgAUgpzdGVwUGFzc2VkEkYKDHN0ZXBfdGltZW91dBgDIAEoCzIhLmJpb2'
    '1ldHJpYy52MS5MaXZlbmVzc1N0ZXBUaW1lb3V0SABSC3N0ZXBUaW1lb3V0EjYKBnJlc3VsdBgE'
    'IAEoCzIcLmJpb21ldHJpYy52MS5MaXZlbmVzc1Jlc3VsdEgAUgZyZXN1bHQSMwoFZXJyb3IYBS'
    'ABKAsyGy5iaW9tZXRyaWMudjEuTGl2ZW5lc3NFcnJvckgAUgVlcnJvckIFCgNtc2c=');

@$core.Deprecated('Use livenessStepDescriptor instead')
const LivenessStep$json = {
  '1': 'LivenessStep',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 5, '10': 'index'},
    {'1': 'total', '3': 2, '4': 1, '5': 5, '10': 'total'},
    {'1': 'instruction', '3': 3, '4': 1, '5': 9, '10': 'instruction'},
    {'1': 'attempt', '3': 4, '4': 1, '5': 5, '10': 'attempt'},
    {'1': 'attempts_left', '3': 5, '4': 1, '5': 5, '10': 'attemptsLeft'},
  ],
};

/// Descriptor for `LivenessStep`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessStepDescriptor = $convert.base64Decode(
    'CgxMaXZlbmVzc1N0ZXASFAoFaW5kZXgYASABKAVSBWluZGV4EhQKBXRvdGFsGAIgASgFUgV0b3'
    'RhbBIgCgtpbnN0cnVjdGlvbhgDIAEoCVILaW5zdHJ1Y3Rpb24SGAoHYXR0ZW1wdBgEIAEoBVIH'
    'YXR0ZW1wdBIjCg1hdHRlbXB0c19sZWZ0GAUgASgFUgxhdHRlbXB0c0xlZnQ=');

@$core.Deprecated('Use livenessStepPassedDescriptor instead')
const LivenessStepPassed$json = {
  '1': 'LivenessStepPassed',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 5, '10': 'index'},
  ],
};

/// Descriptor for `LivenessStepPassed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessStepPassedDescriptor = $convert
    .base64Decode('ChJMaXZlbmVzc1N0ZXBQYXNzZWQSFAoFaW5kZXgYASABKAVSBWluZGV4');

@$core.Deprecated('Use livenessStepTimeoutDescriptor instead')
const LivenessStepTimeout$json = {
  '1': 'LivenessStepTimeout',
  '2': [
    {'1': 'index', '3': 1, '4': 1, '5': 5, '10': 'index'},
    {'1': 'attempt', '3': 2, '4': 1, '5': 5, '10': 'attempt'},
    {'1': 'attempts_left', '3': 3, '4': 1, '5': 5, '10': 'attemptsLeft'},
    {'1': 'failed', '3': 4, '4': 1, '5': 8, '10': 'failed'},
  ],
};

/// Descriptor for `LivenessStepTimeout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessStepTimeoutDescriptor = $convert.base64Decode(
    'ChNMaXZlbmVzc1N0ZXBUaW1lb3V0EhQKBWluZGV4GAEgASgFUgVpbmRleBIYCgdhdHRlbXB0GA'
    'IgASgFUgdhdHRlbXB0EiMKDWF0dGVtcHRzX2xlZnQYAyABKAVSDGF0dGVtcHRzTGVmdBIWCgZm'
    'YWlsZWQYBCABKAhSBmZhaWxlZA==');

@$core.Deprecated('Use livenessErrorDescriptor instead')
const LivenessError$json = {
  '1': 'LivenessError',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `LivenessError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessErrorDescriptor = $convert
    .base64Decode('Cg1MaXZlbmVzc0Vycm9yEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use livenessResultDescriptor instead')
const LivenessResult$json = {
  '1': 'LivenessResult',
  '2': [
    {'1': 'verdict', '3': 1, '4': 1, '5': 9, '10': 'verdict'},
    {'1': 'liveness_passed', '3': 2, '4': 1, '5': 8, '10': 'livenessPassed'},
    {'1': 'matched', '3': 3, '4': 1, '5': 8, '10': 'matched'},
    {'1': 'match_score', '3': 4, '4': 1, '5': 2, '10': 'matchScore'},
    {'1': 'match_reason', '3': 5, '4': 1, '5': 9, '10': 'matchReason'},
    {
      '1': 'spoof_classification',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'spoofClassification'
    },
    {'1': 'deepfake_verdict', '3': 7, '4': 1, '5': 9, '10': 'deepfakeVerdict'},
    {'1': 'embedding_hash', '3': 8, '4': 1, '5': 9, '10': 'embeddingHash'},
  ],
};

/// Descriptor for `LivenessResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List livenessResultDescriptor = $convert.base64Decode(
    'Cg5MaXZlbmVzc1Jlc3VsdBIYCgd2ZXJkaWN0GAEgASgJUgd2ZXJkaWN0EicKD2xpdmVuZXNzX3'
    'Bhc3NlZBgCIAEoCFIObGl2ZW5lc3NQYXNzZWQSGAoHbWF0Y2hlZBgDIAEoCFIHbWF0Y2hlZBIf'
    'CgttYXRjaF9zY29yZRgEIAEoAlIKbWF0Y2hTY29yZRIhCgxtYXRjaF9yZWFzb24YBSABKAlSC2'
    '1hdGNoUmVhc29uEjEKFHNwb29mX2NsYXNzaWZpY2F0aW9uGAYgASgJUhNzcG9vZkNsYXNzaWZp'
    'Y2F0aW9uEikKEGRlZXBmYWtlX3ZlcmRpY3QYByABKAlSD2RlZXBmYWtlVmVyZGljdBIlCg5lbW'
    'JlZGRpbmdfaGFzaBgIIAEoCVINZW1iZWRkaW5nSGFzaA==');

@$core.Deprecated('Use listBiometricReviewQueueRequestDescriptor instead')
const ListBiometricReviewQueueRequest$json = {
  '1': 'ListBiometricReviewQueueRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListBiometricReviewQueueRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBiometricReviewQueueRequestDescriptor =
    $convert.base64Decode(
        'Ch9MaXN0QmlvbWV0cmljUmV2aWV3UXVldWVSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdG'
        'VuYW50SWQ=');

@$core.Deprecated('Use biometricReviewItemDescriptor instead')
const BiometricReviewItem$json = {
  '1': 'BiometricReviewItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'session_token', '3': 4, '4': 1, '5': 9, '10': 'sessionToken'},
    {'1': 'match_score', '3': 5, '4': 1, '5': 2, '10': 'matchScore'},
    {'1': 'liveness_passed', '3': 6, '4': 1, '5': 8, '10': 'livenessPassed'},
    {
      '1': 'spoof_classification',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'spoofClassification'
    },
    {'1': 'deepfake_verdict', '3': 8, '4': 1, '5': 9, '10': 'deepfakeVerdict'},
    {'1': 'verified_at', '3': 9, '4': 1, '5': 9, '10': 'verifiedAt'},
  ],
};

/// Descriptor for `BiometricReviewItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List biometricReviewItemDescriptor = $convert.base64Decode(
    'ChNCaW9tZXRyaWNSZXZpZXdJdGVtEg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKA'
    'lSCHdvcmtlcklkEhsKCXRlbmFudF9pZBgDIAEoCVIIdGVuYW50SWQSIwoNc2Vzc2lvbl90b2tl'
    'bhgEIAEoCVIMc2Vzc2lvblRva2VuEh8KC21hdGNoX3Njb3JlGAUgASgCUgptYXRjaFNjb3JlEi'
    'cKD2xpdmVuZXNzX3Bhc3NlZBgGIAEoCFIObGl2ZW5lc3NQYXNzZWQSMQoUc3Bvb2ZfY2xhc3Np'
    'ZmljYXRpb24YByABKAlSE3Nwb29mQ2xhc3NpZmljYXRpb24SKQoQZGVlcGZha2VfdmVyZGljdB'
    'gIIAEoCVIPZGVlcGZha2VWZXJkaWN0Eh8KC3ZlcmlmaWVkX2F0GAkgASgJUgp2ZXJpZmllZEF0');

@$core.Deprecated('Use listBiometricReviewQueueResponseDescriptor instead')
const ListBiometricReviewQueueResponse$json = {
  '1': 'ListBiometricReviewQueueResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.biometric.v1.BiometricReviewItem',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListBiometricReviewQueueResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBiometricReviewQueueResponseDescriptor =
    $convert.base64Decode(
        'CiBMaXN0QmlvbWV0cmljUmV2aWV3UXVldWVSZXNwb25zZRI3CgVpdGVtcxgBIAMoCzIhLmJpb2'
        '1ldHJpYy52MS5CaW9tZXRyaWNSZXZpZXdJdGVtUgVpdGVtcw==');

@$core.Deprecated('Use listBiometricResultsRequestDescriptor instead')
const ListBiometricResultsRequest$json = {
  '1': 'ListBiometricResultsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListBiometricResultsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBiometricResultsRequestDescriptor =
    $convert.base64Decode(
        'ChtMaXN0QmlvbWV0cmljUmVzdWx0c1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbn'
        'RJZA==');

@$core.Deprecated('Use biometricResultDescriptor instead')
const BiometricResult$json = {
  '1': 'BiometricResult',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'match_score', '3': 2, '4': 1, '5': 2, '10': 'matchScore'},
    {'1': 'liveness_score', '3': 3, '4': 1, '5': 2, '10': 'livenessScore'},
    {'1': 'liveness_passed', '3': 4, '4': 1, '5': 8, '10': 'livenessPassed'},
    {'1': 'verified_at', '3': 5, '4': 1, '5': 9, '10': 'verifiedAt'},
    {'1': 'verdict', '3': 6, '4': 1, '5': 9, '10': 'verdict'},
    {'1': 'match_band', '3': 7, '4': 1, '5': 9, '10': 'matchBand'},
    {'1': 'match_reason', '3': 8, '4': 1, '5': 9, '10': 'matchReason'},
    {'1': 'matched', '3': 9, '4': 1, '5': 8, '10': 'matched'},
  ],
};

/// Descriptor for `BiometricResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List biometricResultDescriptor = $convert.base64Decode(
    'Cg9CaW9tZXRyaWNSZXN1bHQSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIfCgttYXRjaF'
    '9zY29yZRgCIAEoAlIKbWF0Y2hTY29yZRIlCg5saXZlbmVzc19zY29yZRgDIAEoAlINbGl2ZW5l'
    'c3NTY29yZRInCg9saXZlbmVzc19wYXNzZWQYBCABKAhSDmxpdmVuZXNzUGFzc2VkEh8KC3Zlcm'
    'lmaWVkX2F0GAUgASgJUgp2ZXJpZmllZEF0EhgKB3ZlcmRpY3QYBiABKAlSB3ZlcmRpY3QSHQoK'
    'bWF0Y2hfYmFuZBgHIAEoCVIJbWF0Y2hCYW5kEiEKDG1hdGNoX3JlYXNvbhgIIAEoCVILbWF0Y2'
    'hSZWFzb24SGAoHbWF0Y2hlZBgJIAEoCFIHbWF0Y2hlZA==');

@$core.Deprecated('Use listBiometricResultsResponseDescriptor instead')
const ListBiometricResultsResponse$json = {
  '1': 'ListBiometricResultsResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.biometric.v1.BiometricResult',
      '10': 'results'
    },
  ],
};

/// Descriptor for `ListBiometricResultsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBiometricResultsResponseDescriptor =
    $convert.base64Decode(
        'ChxMaXN0QmlvbWV0cmljUmVzdWx0c1Jlc3BvbnNlEjcKB3Jlc3VsdHMYASADKAsyHS5iaW9tZX'
        'RyaWMudjEuQmlvbWV0cmljUmVzdWx0UgdyZXN1bHRz');

@$core.Deprecated('Use getBiometricEvidenceURLRequestDescriptor instead')
const GetBiometricEvidenceURLRequest$json = {
  '1': 'GetBiometricEvidenceURLRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `GetBiometricEvidenceURLRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBiometricEvidenceURLRequestDescriptor =
    $convert.base64Decode(
        'Ch5HZXRCaW9tZXRyaWNFdmlkZW5jZVVSTFJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZBIbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlcklk');

@$core.Deprecated('Use getBiometricEvidenceURLResponseDescriptor instead')
const GetBiometricEvidenceURLResponse$json = {
  '1': 'GetBiometricEvidenceURLResponse',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'expires_at', '3': 2, '4': 1, '5': 9, '10': 'expiresAt'},
  ],
};

/// Descriptor for `GetBiometricEvidenceURLResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBiometricEvidenceURLResponseDescriptor =
    $convert.base64Decode(
        'Ch9HZXRCaW9tZXRyaWNFdmlkZW5jZVVSTFJlc3BvbnNlEhAKA3VybBgBIAEoCVIDdXJsEh0KCm'
        'V4cGlyZXNfYXQYAiABKAlSCWV4cGlyZXNBdA==');

@$core.Deprecated('Use deleteBiometricEvidenceRequestDescriptor instead')
const DeleteBiometricEvidenceRequest$json = {
  '1': 'DeleteBiometricEvidenceRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `DeleteBiometricEvidenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBiometricEvidenceRequestDescriptor =
    $convert.base64Decode(
        'Ch5EZWxldGVCaW9tZXRyaWNFdmlkZW5jZVJlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW'
        '5hbnRJZBIbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlcklk');

@$core.Deprecated('Use deleteBiometricEvidenceResponseDescriptor instead')
const DeleteBiometricEvidenceResponse$json = {
  '1': 'DeleteBiometricEvidenceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteBiometricEvidenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBiometricEvidenceResponseDescriptor =
    $convert.base64Decode(
        'Ch9EZWxldGVCaW9tZXRyaWNFdmlkZW5jZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2'
        'Nlc3M=');
