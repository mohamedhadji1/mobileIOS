// This is a generated file - do not edit.
//
// Generated from worker/v1/worker.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class QualificationType extends $pb.ProtobufEnum {
  static const QualificationType QUALIFICATION_TYPE_UNSPECIFIED =
      QualificationType._(
          0, _omitEnumNames ? '' : 'QUALIFICATION_TYPE_UNSPECIFIED');
  static const QualificationType QUALIFICATION_TYPE_DEGREE =
      QualificationType._(1, _omitEnumNames ? '' : 'QUALIFICATION_TYPE_DEGREE');
  static const QualificationType QUALIFICATION_TYPE_CERTIFICATION =
      QualificationType._(
          2, _omitEnumNames ? '' : 'QUALIFICATION_TYPE_CERTIFICATION');
  static const QualificationType QUALIFICATION_TYPE_DIPLOMA =
      QualificationType._(
          3, _omitEnumNames ? '' : 'QUALIFICATION_TYPE_DIPLOMA');
  static const QualificationType QUALIFICATION_TYPE_LICENSE =
      QualificationType._(
          4, _omitEnumNames ? '' : 'QUALIFICATION_TYPE_LICENSE');
  static const QualificationType QUALIFICATION_TYPE_APPRENTICESHIP =
      QualificationType._(
          5, _omitEnumNames ? '' : 'QUALIFICATION_TYPE_APPRENTICESHIP');

  static const $core.List<QualificationType> values = <QualificationType>[
    QUALIFICATION_TYPE_UNSPECIFIED,
    QUALIFICATION_TYPE_DEGREE,
    QUALIFICATION_TYPE_CERTIFICATION,
    QUALIFICATION_TYPE_DIPLOMA,
    QUALIFICATION_TYPE_LICENSE,
    QUALIFICATION_TYPE_APPRENTICESHIP,
  ];

  static final $core.List<QualificationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static QualificationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const QualificationType._(super.value, super.name);
}

class ProfileType extends $pb.ProtobufEnum {
  static const ProfileType PROFILE_TYPE_UNSPECIFIED =
      ProfileType._(0, _omitEnumNames ? '' : 'PROFILE_TYPE_UNSPECIFIED');
  static const ProfileType PROFILE_TYPE_PERMANENT =
      ProfileType._(1, _omitEnumNames ? '' : 'PROFILE_TYPE_PERMANENT');
  static const ProfileType PROFILE_TYPE_CONTRACTOR =
      ProfileType._(2, _omitEnumNames ? '' : 'PROFILE_TYPE_CONTRACTOR');
  static const ProfileType PROFILE_TYPE_SEASONAL =
      ProfileType._(3, _omitEnumNames ? '' : 'PROFILE_TYPE_SEASONAL');
  static const ProfileType PROFILE_TYPE_TEMP =
      ProfileType._(4, _omitEnumNames ? '' : 'PROFILE_TYPE_TEMP');

  static const $core.List<ProfileType> values = <ProfileType>[
    PROFILE_TYPE_UNSPECIFIED,
    PROFILE_TYPE_PERMANENT,
    PROFILE_TYPE_CONTRACTOR,
    PROFILE_TYPE_SEASONAL,
    PROFILE_TYPE_TEMP,
  ];

  static final $core.List<ProfileType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ProfileType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProfileType._(super.value, super.name);
}

class WorkerPosition extends $pb.ProtobufEnum {
  static const WorkerPosition WORKER_POSITION_UNSPECIFIED =
      WorkerPosition._(0, _omitEnumNames ? '' : 'WORKER_POSITION_UNSPECIFIED');

  /// Risk Level 3 - High Risk (Critical)
  static const WorkerPosition
      WORKER_POSITION_SECURITY_CRITICAL_FACILITY_ACCESS = WorkerPosition._(
          1,
          _omitEnumNames
              ? ''
              : 'WORKER_POSITION_SECURITY_CRITICAL_FACILITY_ACCESS');
  static const WorkerPosition WORKER_POSITION_IT_ADMINISTRATOR =
      WorkerPosition._(
          2, _omitEnumNames ? '' : 'WORKER_POSITION_IT_ADMINISTRATOR');
  static const WorkerPosition WORKER_POSITION_CLOUD_ACCESS =
      WorkerPosition._(3, _omitEnumNames ? '' : 'WORKER_POSITION_CLOUD_ACCESS');
  static const WorkerPosition WORKER_POSITION_NETWORK_ACCESS = WorkerPosition._(
      4, _omitEnumNames ? '' : 'WORKER_POSITION_NETWORK_ACCESS');
  static const WorkerPosition WORKER_POSITION_FINANCIAL_ACCESS_CFO =
      WorkerPosition._(
          5, _omitEnumNames ? '' : 'WORKER_POSITION_FINANCIAL_ACCESS_CFO');
  static const WorkerPosition WORKER_POSITION_SENSITIVE_DATA_ACCESS =
      WorkerPosition._(
          6, _omitEnumNames ? '' : 'WORKER_POSITION_SENSITIVE_DATA_ACCESS');
  static const WorkerPosition
      WORKER_POSITION_CRITICAL_SUBCONTRACTOR_ELECTRICAL = WorkerPosition._(
          7,
          _omitEnumNames
              ? ''
              : 'WORKER_POSITION_CRITICAL_SUBCONTRACTOR_ELECTRICAL');
  static const WorkerPosition WORKER_POSITION_CRITICAL_SUBCONTRACTOR_IT =
      WorkerPosition._(
          8, _omitEnumNames ? '' : 'WORKER_POSITION_CRITICAL_SUBCONTRACTOR_IT');
  static const WorkerPosition WORKER_POSITION_CRITICAL_SUBCONTRACTOR_SECURITY =
      WorkerPosition._(
          9,
          _omitEnumNames
              ? ''
              : 'WORKER_POSITION_CRITICAL_SUBCONTRACTOR_SECURITY');

  /// Risk Level 2 - Medium Risk
  static const WorkerPosition WORKER_POSITION_OFFICE_WORKER_SYSTEM_ACCESS =
      WorkerPosition._(10,
          _omitEnumNames ? '' : 'WORKER_POSITION_OFFICE_WORKER_SYSTEM_ACCESS');
  static const WorkerPosition WORKER_POSITION_TECHNICAL_SPECIALIST =
      WorkerPosition._(
          11, _omitEnumNames ? '' : 'WORKER_POSITION_TECHNICAL_SPECIALIST');
  static const WorkerPosition WORKER_POSITION_IT_SUPPORT =
      WorkerPosition._(12, _omitEnumNames ? '' : 'WORKER_POSITION_IT_SUPPORT');
  static const WorkerPosition WORKER_POSITION_RESTRICTED_SUBCONTRACTOR =
      WorkerPosition._(
          13, _omitEnumNames ? '' : 'WORKER_POSITION_RESTRICTED_SUBCONTRACTOR');

  /// Risk Level 1 - Low Risk
  static const WorkerPosition WORKER_POSITION_SUPPORT_STAFF = WorkerPosition._(
      14, _omitEnumNames ? '' : 'WORKER_POSITION_SUPPORT_STAFF');
  static const WorkerPosition WORKER_POSITION_CLEANING_STAFF = WorkerPosition._(
      15, _omitEnumNames ? '' : 'WORKER_POSITION_CLEANING_STAFF');
  static const WorkerPosition WORKER_POSITION_LOGISTICS_STAFF =
      WorkerPosition._(
          16, _omitEnumNames ? '' : 'WORKER_POSITION_LOGISTICS_STAFF');
  static const WorkerPosition WORKER_POSITION_INTERN =
      WorkerPosition._(17, _omitEnumNames ? '' : 'WORKER_POSITION_INTERN');
  static const WorkerPosition WORKER_POSITION_VISITOR =
      WorkerPosition._(18, _omitEnumNames ? '' : 'WORKER_POSITION_VISITOR');

  static const $core.List<WorkerPosition> values = <WorkerPosition>[
    WORKER_POSITION_UNSPECIFIED,
    WORKER_POSITION_SECURITY_CRITICAL_FACILITY_ACCESS,
    WORKER_POSITION_IT_ADMINISTRATOR,
    WORKER_POSITION_CLOUD_ACCESS,
    WORKER_POSITION_NETWORK_ACCESS,
    WORKER_POSITION_FINANCIAL_ACCESS_CFO,
    WORKER_POSITION_SENSITIVE_DATA_ACCESS,
    WORKER_POSITION_CRITICAL_SUBCONTRACTOR_ELECTRICAL,
    WORKER_POSITION_CRITICAL_SUBCONTRACTOR_IT,
    WORKER_POSITION_CRITICAL_SUBCONTRACTOR_SECURITY,
    WORKER_POSITION_OFFICE_WORKER_SYSTEM_ACCESS,
    WORKER_POSITION_TECHNICAL_SPECIALIST,
    WORKER_POSITION_IT_SUPPORT,
    WORKER_POSITION_RESTRICTED_SUBCONTRACTOR,
    WORKER_POSITION_SUPPORT_STAFF,
    WORKER_POSITION_CLEANING_STAFF,
    WORKER_POSITION_LOGISTICS_STAFF,
    WORKER_POSITION_INTERN,
    WORKER_POSITION_VISITOR,
  ];

  static final $core.List<WorkerPosition?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 18);
  static WorkerPosition? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const WorkerPosition._(super.value, super.name);
}

class SentVia extends $pb.ProtobufEnum {
  static const SentVia SENT_VIA_UNSPECIFIED =
      SentVia._(0, _omitEnumNames ? '' : 'SENT_VIA_UNSPECIFIED');
  static const SentVia SENT_VIA_EMAIL =
      SentVia._(1, _omitEnumNames ? '' : 'SENT_VIA_EMAIL');
  static const SentVia SENT_VIA_SMS =
      SentVia._(2, _omitEnumNames ? '' : 'SENT_VIA_SMS');
  static const SentVia SENT_VIA_WHATSAPP =
      SentVia._(3, _omitEnumNames ? '' : 'SENT_VIA_WHATSAPP');

  static const $core.List<SentVia> values = <SentVia>[
    SENT_VIA_UNSPECIFIED,
    SENT_VIA_EMAIL,
    SENT_VIA_SMS,
    SENT_VIA_WHATSAPP,
  ];

  static final $core.List<SentVia?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SentVia? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SentVia._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
