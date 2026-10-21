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
    {'1': 'TRAFFIC_LIGHT_GREY', '2': 4},
  ],
};

/// Descriptor for `TrafficLight`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List trafficLightDescriptor = $convert.base64Decode(
    'CgxUcmFmZmljTGlnaHQSHQoZVFJBRkZJQ19MSUdIVF9VTlNQRUNJRklFRBAAEhcKE1RSQUZGSU'
    'NfTElHSFRfR1JFRU4QARIYChRUUkFGRklDX0xJR0hUX1lFTExPVxACEhUKEVRSQUZGSUNfTElH'
    'SFRfUkVEEAMSFgoSVFJBRkZJQ19MSUdIVF9HUkVZEAQ=');

@$core.Deprecated('Use decisionDescriptor instead')
const Decision$json = {
  '1': 'Decision',
  '2': [
    {'1': 'DECISION_UNSPECIFIED', '2': 0},
    {'1': 'DECISION_APPROVED', '2': 1},
    {'1': 'DECISION_REJECTED', '2': 2},
    {'1': 'DECISION_ESCALATED', '2': 3},
  ],
};

/// Descriptor for `Decision`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List decisionDescriptor = $convert.base64Decode(
    'CghEZWNpc2lvbhIYChRERUNJU0lPTl9VTlNQRUNJRklFRBAAEhUKEURFQ0lTSU9OX0FQUFJPVk'
    'VEEAESFQoRREVDSVNJT05fUkVKRUNURUQQAhIWChJERUNJU0lPTl9FU0NBTEFURUQQAw==');

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
    {'1': 'previous_colour', '3': 6, '4': 1, '5': 9, '10': 'previousColour'},
    {'1': 'set_at', '3': 7, '4': 1, '5': 9, '10': 'setAt'},
    {'1': 'set_by_module', '3': 8, '4': 1, '5': 9, '10': 'setByModule'},
  ],
};

/// Descriptor for `GetRiskAssessmentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRiskAssessmentResponseDescriptor = $convert.base64Decode(
    'ChlHZXRSaXNrQXNzZXNzbWVudFJlc3BvbnNlEhsKCXdvcmtlcl9pZBgBIAEoCVIId29ya2VySW'
    'QSMQoKcmlza19sZXZlbBgCIAEoDjISLnJpc2sudjEuUmlza0xldmVsUglyaXNrTGV2ZWwSOgoN'
    'dHJhZmZpY19saWdodBgDIAEoDjIVLnJpc2sudjEuVHJhZmZpY0xpZ2h0Ugx0cmFmZmljTGlnaH'
    'QSNwoHZmFjdG9ycxgEIAMoCzIdLnJpc2sudjEuRXhwbGFpbmFiaWxpdHlGYWN0b3JSB2ZhY3Rv'
    'cnMSFgoGc3RhdHVzGAUgASgJUgZzdGF0dXMSJwoPcHJldmlvdXNfY29sb3VyGAYgASgJUg5wcm'
    'V2aW91c0NvbG91chIVCgZzZXRfYXQYByABKAlSBXNldEF0EiIKDXNldF9ieV9tb2R1bGUYCCAB'
    'KAlSC3NldEJ5TW9kdWxl');

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
    {
      '1': 'decision',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.risk.v1.Decision',
      '10': 'decision'
    },
    {'1': 'justification', '3': 3, '4': 1, '5': 9, '10': 'justification'},
  ],
};

/// Descriptor for `SubmitFinalDecisionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitFinalDecisionRequestDescriptor =
    $convert.base64Decode(
        'ChpTdWJtaXRGaW5hbERlY2lzaW9uUmVxdWVzdBIbCgl3b3JrZXJfaWQYASABKAlSCHdvcmtlck'
        'lkEi0KCGRlY2lzaW9uGAIgASgOMhEucmlzay52MS5EZWNpc2lvblIIZGVjaXNpb24SJAoNanVz'
        'dGlmaWNhdGlvbhgDIAEoCVINanVzdGlmaWNhdGlvbg==');

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

@$core.Deprecated('Use listSanctionsHitsRequestDescriptor instead')
const ListSanctionsHitsRequest$json = {
  '1': 'ListSanctionsHitsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListSanctionsHitsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSanctionsHitsRequestDescriptor =
    $convert.base64Decode(
        'ChhMaXN0U2FuY3Rpb25zSGl0c1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZA'
        '==');

@$core.Deprecated('Use sanctionsHitDescriptor instead')
const SanctionsHit$json = {
  '1': 'SanctionsHit',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'list_name', '3': 4, '4': 1, '5': 9, '10': 'listName'},
    {'1': 'match_score', '3': 5, '4': 1, '5': 2, '10': 'matchScore'},
    {'1': 'matched_entry', '3': 6, '4': 1, '5': 9, '10': 'matchedEntry'},
    {'1': 'checked_at', '3': 7, '4': 1, '5': 9, '10': 'checkedAt'},
  ],
};

/// Descriptor for `SanctionsHit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sanctionsHitDescriptor = $convert.base64Decode(
    'CgxTYW5jdGlvbnNIaXQSDgoCaWQYASABKAlSAmlkEhsKCXdvcmtlcl9pZBgCIAEoCVIId29ya2'
    'VySWQSGwoJdGVuYW50X2lkGAMgASgJUgh0ZW5hbnRJZBIbCglsaXN0X25hbWUYBCABKAlSCGxp'
    'c3ROYW1lEh8KC21hdGNoX3Njb3JlGAUgASgCUgptYXRjaFNjb3JlEiMKDW1hdGNoZWRfZW50cn'
    'kYBiABKAlSDG1hdGNoZWRFbnRyeRIdCgpjaGVja2VkX2F0GAcgASgJUgljaGVja2VkQXQ=');

@$core.Deprecated('Use listSanctionsHitsResponseDescriptor instead')
const ListSanctionsHitsResponse$json = {
  '1': 'ListSanctionsHitsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.risk.v1.SanctionsHit',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListSanctionsHitsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSanctionsHitsResponseDescriptor =
    $convert.base64Decode(
        'ChlMaXN0U2FuY3Rpb25zSGl0c1Jlc3BvbnNlEisKBWl0ZW1zGAEgAygLMhUucmlzay52MS5TYW'
        '5jdGlvbnNIaXRSBWl0ZW1z');

@$core.Deprecated(
    'Use triggerSanctionsReScreenForWorkerRequestDescriptor instead')
const TriggerSanctionsReScreenForWorkerRequest$json = {
  '1': 'TriggerSanctionsReScreenForWorkerRequest',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
  ],
};

/// Descriptor for `TriggerSanctionsReScreenForWorkerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List triggerSanctionsReScreenForWorkerRequestDescriptor =
    $convert.base64Decode(
        'CihUcmlnZ2VyU2FuY3Rpb25zUmVTY3JlZW5Gb3JXb3JrZXJSZXF1ZXN0EhsKCXdvcmtlcl9pZB'
        'gBIAEoCVIId29ya2VySWQ=');

@$core.Deprecated(
    'Use triggerSanctionsReScreenForWorkerResponseDescriptor instead')
const TriggerSanctionsReScreenForWorkerResponse$json = {
  '1': 'TriggerSanctionsReScreenForWorkerResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `TriggerSanctionsReScreenForWorkerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    triggerSanctionsReScreenForWorkerResponseDescriptor = $convert.base64Decode(
        'CilUcmlnZ2VyU2FuY3Rpb25zUmVTY3JlZW5Gb3JXb3JrZXJSZXNwb25zZRIYCgdzdWNjZXNzGA'
        'EgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use listTravelFlagsRequestDescriptor instead')
const ListTravelFlagsRequest$json = {
  '1': 'ListTravelFlagsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListTravelFlagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTravelFlagsRequestDescriptor =
    $convert.base64Decode(
        'ChZMaXN0VHJhdmVsRmxhZ3NSZXF1ZXN0EhsKCXRlbmFudF9pZBgBIAEoCVIIdGVuYW50SWQ=');

@$core.Deprecated('Use travelFlagDescriptor instead')
const TravelFlag$json = {
  '1': 'TravelFlag',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'tenant_id', '3': 3, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'device_id', '3': 4, '4': 1, '5': 9, '10': 'deviceId'},
    {'1': 'origin_country', '3': 5, '4': 1, '5': 9, '10': 'originCountry'},
    {
      '1': 'destination_country',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'destinationCountry'
    },
    {'1': 'distance_km', '3': 7, '4': 1, '5': 9, '10': 'distanceKm'},
    {'1': 'detected_at', '3': 8, '4': 1, '5': 9, '10': 'detectedAt'},
  ],
};

/// Descriptor for `TravelFlag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List travelFlagDescriptor = $convert.base64Decode(
    'CgpUcmF2ZWxGbGFnEg4KAmlkGAEgASgJUgJpZBIbCgl3b3JrZXJfaWQYAiABKAlSCHdvcmtlck'
    'lkEhsKCXRlbmFudF9pZBgDIAEoCVIIdGVuYW50SWQSGwoJZGV2aWNlX2lkGAQgASgJUghkZXZp'
    'Y2VJZBIlCg5vcmlnaW5fY291bnRyeRgFIAEoCVINb3JpZ2luQ291bnRyeRIvChNkZXN0aW5hdG'
    'lvbl9jb3VudHJ5GAYgASgJUhJkZXN0aW5hdGlvbkNvdW50cnkSHwoLZGlzdGFuY2Vfa20YByAB'
    'KAlSCmRpc3RhbmNlS20SHwoLZGV0ZWN0ZWRfYXQYCCABKAlSCmRldGVjdGVkQXQ=');

@$core.Deprecated('Use listTravelFlagsResponseDescriptor instead')
const ListTravelFlagsResponse$json = {
  '1': 'ListTravelFlagsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.risk.v1.TravelFlag',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListTravelFlagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTravelFlagsResponseDescriptor =
    $convert.base64Decode(
        'ChdMaXN0VHJhdmVsRmxhZ3NSZXNwb25zZRIpCgVpdGVtcxgBIAMoCzITLnJpc2sudjEuVHJhdm'
        'VsRmxhZ1IFaXRlbXM=');

@$core.Deprecated('Use listBlocklistRequestDescriptor instead')
const ListBlocklistRequest$json = {
  '1': 'ListBlocklistRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
    {'1': 'active_only', '3': 2, '4': 1, '5': 8, '10': 'activeOnly'},
  ],
};

/// Descriptor for `ListBlocklistRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBlocklistRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0QmxvY2tsaXN0UmVxdWVzdBIbCgl0ZW5hbnRfaWQYASABKAlSCHRlbmFudElkEh8KC2'
    'FjdGl2ZV9vbmx5GAIgASgIUgphY3RpdmVPbmx5');

@$core.Deprecated('Use blocklistEntryDescriptor instead')
const BlocklistEntry$json = {
  '1': 'BlocklistEntry',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'worker_id', '3': 2, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'worker_name', '3': 3, '4': 1, '5': 9, '10': 'workerName'},
    {'1': 'embedding_hash', '3': 4, '4': 1, '5': 9, '10': 'embeddingHash'},
    {'1': 'blocked_by', '3': 5, '4': 1, '5': 9, '10': 'blockedBy'},
    {'1': 'reason', '3': 6, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'blocked_at', '3': 7, '4': 1, '5': 9, '10': 'blockedAt'},
    {'1': 'active', '3': 8, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `BlocklistEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blocklistEntryDescriptor = $convert.base64Decode(
    'Cg5CbG9ja2xpc3RFbnRyeRIOCgJpZBgBIAEoCVICaWQSGwoJd29ya2VyX2lkGAIgASgJUgh3b3'
    'JrZXJJZBIfCgt3b3JrZXJfbmFtZRgDIAEoCVIKd29ya2VyTmFtZRIlCg5lbWJlZGRpbmdfaGFz'
    'aBgEIAEoCVINZW1iZWRkaW5nSGFzaBIdCgpibG9ja2VkX2J5GAUgASgJUglibG9ja2VkQnkSFg'
    'oGcmVhc29uGAYgASgJUgZyZWFzb24SHQoKYmxvY2tlZF9hdBgHIAEoCVIJYmxvY2tlZEF0EhYK'
    'BmFjdGl2ZRgIIAEoCFIGYWN0aXZl');

@$core.Deprecated('Use listBlocklistResponseDescriptor instead')
const ListBlocklistResponse$json = {
  '1': 'ListBlocklistResponse',
  '2': [
    {
      '1': 'entries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.risk.v1.BlocklistEntry',
      '10': 'entries'
    },
    {'1': 'total_active', '3': 2, '4': 1, '5': 5, '10': 'totalActive'},
  ],
};

/// Descriptor for `ListBlocklistResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listBlocklistResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0QmxvY2tsaXN0UmVzcG9uc2USMQoHZW50cmllcxgBIAMoCzIXLnJpc2sudjEuQmxvY2'
    'tsaXN0RW50cnlSB2VudHJpZXMSIQoMdG90YWxfYWN0aXZlGAIgASgFUgt0b3RhbEFjdGl2ZQ==');

@$core.Deprecated('Use listTrafficLightsRequestDescriptor instead')
const ListTrafficLightsRequest$json = {
  '1': 'ListTrafficLightsRequest',
  '2': [
    {'1': 'tenant_id', '3': 1, '4': 1, '5': 9, '10': 'tenantId'},
  ],
};

/// Descriptor for `ListTrafficLightsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTrafficLightsRequestDescriptor =
    $convert.base64Decode(
        'ChhMaXN0VHJhZmZpY0xpZ2h0c1JlcXVlc3QSGwoJdGVuYW50X2lkGAEgASgJUgh0ZW5hbnRJZA'
        '==');

@$core.Deprecated('Use workerTrafficLightDescriptor instead')
const WorkerTrafficLight$json = {
  '1': 'WorkerTrafficLight',
  '2': [
    {'1': 'worker_id', '3': 1, '4': 1, '5': 9, '10': 'workerId'},
    {'1': 'colour', '3': 2, '4': 1, '5': 9, '10': 'colour'},
    {'1': 'previous_colour', '3': 3, '4': 1, '5': 9, '10': 'previousColour'},
    {'1': 'risk_level', '3': 4, '4': 1, '5': 9, '10': 'riskLevel'},
    {'1': 'set_by_module', '3': 5, '4': 1, '5': 9, '10': 'setByModule'},
    {'1': 'set_at', '3': 6, '4': 1, '5': 9, '10': 'setAt'},
  ],
};

/// Descriptor for `WorkerTrafficLight`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List workerTrafficLightDescriptor = $convert.base64Decode(
    'ChJXb3JrZXJUcmFmZmljTGlnaHQSGwoJd29ya2VyX2lkGAEgASgJUgh3b3JrZXJJZBIWCgZjb2'
    'xvdXIYAiABKAlSBmNvbG91chInCg9wcmV2aW91c19jb2xvdXIYAyABKAlSDnByZXZpb3VzQ29s'
    'b3VyEh0KCnJpc2tfbGV2ZWwYBCABKAlSCXJpc2tMZXZlbBIiCg1zZXRfYnlfbW9kdWxlGAUgAS'
    'gJUgtzZXRCeU1vZHVsZRIVCgZzZXRfYXQYBiABKAlSBXNldEF0');

@$core.Deprecated('Use listTrafficLightsResponseDescriptor instead')
const ListTrafficLightsResponse$json = {
  '1': 'ListTrafficLightsResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.risk.v1.WorkerTrafficLight',
      '10': 'items'
    },
  ],
};

/// Descriptor for `ListTrafficLightsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTrafficLightsResponseDescriptor =
    $convert.base64Decode(
        'ChlMaXN0VHJhZmZpY0xpZ2h0c1Jlc3BvbnNlEjEKBWl0ZW1zGAEgAygLMhsucmlzay52MS5Xb3'
        'JrZXJUcmFmZmljTGlnaHRSBWl0ZW1z');
