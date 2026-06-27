// This is a generated file - do not edit.
//
// Generated from risk/v1/risk.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RiskLevel extends $pb.ProtobufEnum {
  static const RiskLevel RISK_LEVEL_UNSPECIFIED =
      RiskLevel._(0, _omitEnumNames ? '' : 'RISK_LEVEL_UNSPECIFIED');
  static const RiskLevel RISK_LEVEL_L1 =
      RiskLevel._(1, _omitEnumNames ? '' : 'RISK_LEVEL_L1');
  static const RiskLevel RISK_LEVEL_L2 =
      RiskLevel._(2, _omitEnumNames ? '' : 'RISK_LEVEL_L2');
  static const RiskLevel RISK_LEVEL_L3 =
      RiskLevel._(3, _omitEnumNames ? '' : 'RISK_LEVEL_L3');

  static const $core.List<RiskLevel> values = <RiskLevel>[
    RISK_LEVEL_UNSPECIFIED,
    RISK_LEVEL_L1,
    RISK_LEVEL_L2,
    RISK_LEVEL_L3,
  ];

  static final $core.List<RiskLevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static RiskLevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RiskLevel._(super.value, super.name);
}

class TrafficLight extends $pb.ProtobufEnum {
  static const TrafficLight TRAFFIC_LIGHT_UNSPECIFIED =
      TrafficLight._(0, _omitEnumNames ? '' : 'TRAFFIC_LIGHT_UNSPECIFIED');
  static const TrafficLight TRAFFIC_LIGHT_GREEN =
      TrafficLight._(1, _omitEnumNames ? '' : 'TRAFFIC_LIGHT_GREEN');
  static const TrafficLight TRAFFIC_LIGHT_YELLOW =
      TrafficLight._(2, _omitEnumNames ? '' : 'TRAFFIC_LIGHT_YELLOW');
  static const TrafficLight TRAFFIC_LIGHT_RED =
      TrafficLight._(3, _omitEnumNames ? '' : 'TRAFFIC_LIGHT_RED');

  static const $core.List<TrafficLight> values = <TrafficLight>[
    TRAFFIC_LIGHT_UNSPECIFIED,
    TRAFFIC_LIGHT_GREEN,
    TRAFFIC_LIGHT_YELLOW,
    TRAFFIC_LIGHT_RED,
  ];

  static final $core.List<TrafficLight?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static TrafficLight? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TrafficLight._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
