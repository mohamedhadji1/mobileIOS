// This is a generated file - do not edit.
//
// Generated from risk/v1/risk.proto.

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

@$core.Deprecated('Use riskLevelDescriptor instead')
const RiskLevel$json = {
  '1': 'RiskLevel',
  '2': [
    {'1': 'RISK_LEVEL_UNSPECIFIED', '2': 0},
    {'1': 'RISK_LEVEL_L1', '2': 1},
    {'1': 'RISK_LEVEL_L2', '2': 2},
    {'1': 'RISK_LEVEL_L3', '2': 3},
  ],
};

/// Descriptor for `RiskLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List riskLevelDescriptor = $convert.base64Decode(
    'CglSaXNrTGV2ZWwSGgoWUklTS19MRVZFTF9VTlNQRUNJRklFRBAAEhEKDVJJU0tfTEVWRUxfTD'
    'EQARIRCg1SSVNLX0xFVkVMX0wyEAISEQoNUklTS19MRVZFTF9MMxAD');

@$core.Deprecated('Use trafficLightDescriptor instead')
const TrafficLight$json = {
  '1': 'TrafficLight',
  '2': [
    {'1': 'TRAFFIC_LIGHT_UNSPECIFIED', '2': 0},
    {'1': 'TRAFFIC_LIGHT_GREEN', '2': 1},
    {'1': 'TRAFFIC_LIGHT_YELLOW', '2': 2},
    {'1': 'TRAFFIC_LIGHT_RED', '2': 3},
  ],
};

/// Descriptor for `TrafficLight`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List trafficLightDescriptor = $convert.base64Decode(
    'CgxUcmFmZmljTGlnaHQSHQoZVFJBRkZJQ19MSUdIVF9VTlNQRUNJRklFRBAAEhcKE1RSQUZGSU'
    'NfTElHSFRfR1JFRU4QARIYChRUUkFGRklDX0xJR0hUX1lFTExPVxACEhUKEVRSQUZGSUNfTElH'
    'SFRfUkVEEAM=');

@$core.Deprecated('Use getRiskAssessmentRequestDescriptor instead')
const GetRiskAssessmentRequest$json = {
  '1': 'GetRiskAssessmentRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 2, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `GetRiskAssessmentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRiskAssessmentRequestDescriptor =
    $convert.base64Decode(
        'ChhHZXRSaXNrQXNzZXNzbWVudFJlcXVlc3QSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZB'
        'IbCgl0ZW5hbnRfaWQYAiABKAlSCHRlbmFudElk');

@$core.Deprecated('Use getRiskAssessmentResponseDescriptor instead')
const GetRiskAssessmentResponse$json = {
  '1': 'GetRiskAssessmentResponse',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {
      '1': 'risk_level',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.risk.v1.RiskLevel',
      '10': 'riskLevel'
    },
    {
      '1': 'traffic_light',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.risk.v1.TrafficLight',
      '10': 'trafficLight'
    },
    {
      '1': 'factors',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.risk.v1.ExplainabilityFactor',
      '10': 'factors'
    },
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `GetRiskAssessmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRiskAssessmentResponseDescriptor = $convert.base64Decode(
    'ChlHZXRSaXNrQXNzZXNzbWVudFJlc3BvbnNlEhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySW'
    'QSMQoKcmlza19sZXZlbBgCIAEoDjISLnJpc2sudjEuUmlza0xldmVsUglyaXNrTGV2ZWwSOgoN'
    'dHJhZmZpY19saWdodBgDIAEoDjIVLnJpc2sudjEuVHJhZmZpY0xpZ2h0Ugx0cmFmZmljTGlnaH'
    'QSNwoHZmFjdG9ycxgEIAMoCzIdLnJpc2sudjEuRXhwbGFpbmFiaWxpdHlGYWN0b3JSB2ZhY3Rv'
    'cnMSFgoGc3RhdHVzGAUgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use explainabilityFactorDescriptor instead')
const ExplainabilityFactor$json = {
  '1': 'ExplainabilityFactor',
  '2': [
    {'1': 'source', '3': 1, '4': 1, '5': 9, '10': 'source'},
    {'1': 'signal', '3': 2, '4': 1, '5': 9, '10': 'signal'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'weight', '3': 4, '4': 1, '5': 5, '10': 'weight'},
  ],
};

/// Descriptor for `ExplainabilityFactor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List explainabilityFactorDescriptor = $convert.base64Decode(
    'ChRFeHBsYWluYWJpbGl0eUZhY3RvchIWCgZzb3VyY2UYASABKAlSBnNvdXJjZRIWCgZzaWduYW'
    'wYAiABKAlSBnNpZ25hbBIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SFgoGd2Vp'
    'Z2h0GAQgASgFUgZ3ZWlnaHQ=');

@$core.Deprecated('Use submitFinalDecisionRequestDescriptor instead')
const SubmitFinalDecisionRequest$json = {
  '1': 'SubmitFinalDecisionRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'decision', '3': 2, '4': 1, '5': 9, '10': 'decision'},
    {'1': 'justification', '3': 3, '4': 1, '5': 9, '10': 'justification'},
  ],
};

/// Descriptor for `SubmitFinalDecisionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFinalDecisionRequestDescriptor =
    $convert.base64Decode(
        'ChpTdWJtaXRGaW5hbERlY2lzaW9uUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlck'
        'lkEhoKCGRlY2lzaW9uGAIgASgJUghkZWNpc2lvbhIkCg1qdXN0aWZpY2F0aW9uGAMgASgJUg1q'
        'dXN0aWZpY2F0aW9u');

@$core.Deprecated('Use submitFinalDecisionResponseDescriptor instead')
const SubmitFinalDecisionResponse$json = {
  '1': 'SubmitFinalDecisionResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `SubmitFinalDecisionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFinalDecisionResponseDescriptor =
    $convert.base64Decode(
        'ChtTdWJtaXRGaW5hbERlY2lzaW9uUmVzcG9uc2USFgoGc3RhdHVzGAEgASgJUgZzdGF0dXM=');

@$core.Deprecated('Use submitBlockDecisionRequestDescriptor instead')
const SubmitBlockDecisionRequest$json = {
  '1': 'SubmitBlockDecisionRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `SubmitBlockDecisionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitBlockDecisionRequestDescriptor =
    $convert.base64Decode(
        'ChpTdWJtaXRCbG9ja0RlY2lzaW9uUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlck'
        'lkEhYKBnJlYXNvbhgCIAEoCVIGcmVhc29u');

@$core.Deprecated('Use submitBlockDecisionResponseDescriptor instead')
const SubmitBlockDecisionResponse$json = {
  '1': 'SubmitBlockDecisionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SubmitBlockDecisionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitBlockDecisionResponseDescriptor =
    $convert.base64Decode(
        'ChtTdWJtaXRCbG9ja0RlY2lzaW9uUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

@$core.Deprecated('Use removeFromBlocklistRequestDescriptor instead')
const RemoveFromBlocklistRequest$json = {
  '1': 'RemoveFromBlocklistRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `RemoveFromBlocklistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFromBlocklistRequestDescriptor =
    $convert.base64Decode(
        'ChpSZW1vdmVGcm9tQmxvY2tsaXN0UmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlck'
        'lkEhYKBnJlYXNvbhgCIAEoCVIGcmVhc29u');

@$core.Deprecated('Use removeFromBlocklistResponseDescriptor instead')
const RemoveFromBlocklistResponse$json = {
  '1': 'RemoveFromBlocklistResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveFromBlocklistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFromBlocklistResponseDescriptor =
    $convert.base64Decode(
        'ChtSZW1vdmVGcm9tQmxvY2tsaXN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

@$core.Deprecated('Use triggerSanctionsReScreenRequestDescriptor instead')
const TriggerSanctionsReScreenRequest$json = {
  '1': 'TriggerSanctionsReScreenRequest',
};

/// Descriptor for `TriggerSanctionsReScreenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List triggerSanctionsReScreenRequestDescriptor =
    $convert.base64Decode('Ch9UcmlnZ2VyU2FuY3Rpb25zUmVTY3JlZW5SZXF1ZXN0');

@$core.Deprecated('Use triggerSanctionsReScreenResponseDescriptor instead')
const TriggerSanctionsReScreenResponse$json = {
  '1': 'TriggerSanctionsReScreenResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'checks_run', '3': 2, '4': 1, '5': 5, '10': 'checksRun'},
    {'1': 'hits_found', '3': 3, '4': 1, '5': 5, '10': 'hitsFound'},
  ],
};

/// Descriptor for `TriggerSanctionsReScreenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List triggerSanctionsReScreenResponseDescriptor =
    $convert.base64Decode(
        'CiBUcmlnZ2VyU2FuY3Rpb25zUmVTY3JlZW5SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdW'
        'NjZXNzEh0KCmNoZWNrc19ydW4YAiABKAVSCWNoZWNrc1J1bhIdCgpoaXRzX2ZvdW5kGAMgASgF'
        'UgloaXRzRm91bmQ=');
