// This is a generated file - do not edit.
//
// Generated from case/v1/case.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart'
    as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Case extends $pb.GeneratedMessage {
  factory Case({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? ringCandidateId,
    $core.String? reVerificationRequestId,
    $core.String? caseType,
    $core.String? state,
    $core.String? priority,
    $core.String? temporalWorkflowId,
    $1.Timestamp? slaDeadline,
    $1.Timestamp? openedAt,
    $1.Timestamp? closedAt,
    $core.String? resolution,
    $core.Iterable<CaseEvent>? events,
    $core.Iterable<CaseEvidence>? evidence,
    AnalystAssignment? currentAssignment,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (ringCandidateId != null) result.ringCandidateId = ringCandidateId;
    if (reVerificationRequestId != null)
      result.reVerificationRequestId = reVerificationRequestId;
    if (caseType != null) result.caseType = caseType;
    if (state != null) result.state = state;
    if (priority != null) result.priority = priority;
    if (temporalWorkflowId != null)
      result.temporalWorkflowId = temporalWorkflowId;
    if (slaDeadline != null) result.slaDeadline = slaDeadline;
    if (openedAt != null) result.openedAt = openedAt;
    if (closedAt != null) result.closedAt = closedAt;
    if (resolution != null) result.resolution = resolution;
    if (events != null) result.events.addAll(events);
    if (evidence != null) result.evidence.addAll(evidence);
    if (currentAssignment != null) result.currentAssignment = currentAssignment;
    return result;
  }

  Case._();

  factory Case.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Case.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Case',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'ringCandidateId')
    ..aOS(5, _omitFieldNames ? '' : 'reVerificationRequestId')
    ..aOS(6, _omitFieldNames ? '' : 'caseType')
    ..aOS(7, _omitFieldNames ? '' : 'state')
    ..aOS(8, _omitFieldNames ? '' : 'priority')
    ..aOS(9, _omitFieldNames ? '' : 'temporalWorkflowId')
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'slaDeadline',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'openedAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'closedAt',
        subBuilder: $1.Timestamp.create)
    ..aOS(13, _omitFieldNames ? '' : 'resolution')
    ..pPM<CaseEvent>(14, _omitFieldNames ? '' : 'events',
        subBuilder: CaseEvent.create)
    ..pPM<CaseEvidence>(15, _omitFieldNames ? '' : 'evidence',
        subBuilder: CaseEvidence.create)
    ..aOM<AnalystAssignment>(16, _omitFieldNames ? '' : 'currentAssignment',
        subBuilder: AnalystAssignment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Case clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Case copyWith(void Function(Case) updates) =>
      super.copyWith((message) => updates(message as Case)) as Case;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Case create() => Case._();
  @$core.override
  Case createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Case getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Case>(create);
  static Case? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get workerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set workerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWorkerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tenantId => $_getSZ(2);
  @$pb.TagNumber(3)
  set tenantId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTenantId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTenantId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get ringCandidateId => $_getSZ(3);
  @$pb.TagNumber(4)
  set ringCandidateId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRingCandidateId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRingCandidateId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get reVerificationRequestId => $_getSZ(4);
  @$pb.TagNumber(5)
  set reVerificationRequestId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReVerificationRequestId() => $_has(4);
  @$pb.TagNumber(5)
  void clearReVerificationRequestId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get caseType => $_getSZ(5);
  @$pb.TagNumber(6)
  set caseType($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCaseType() => $_has(5);
  @$pb.TagNumber(6)
  void clearCaseType() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get state => $_getSZ(6);
  @$pb.TagNumber(7)
  set state($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasState() => $_has(6);
  @$pb.TagNumber(7)
  void clearState() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get priority => $_getSZ(7);
  @$pb.TagNumber(8)
  set priority($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPriority() => $_has(7);
  @$pb.TagNumber(8)
  void clearPriority() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get temporalWorkflowId => $_getSZ(8);
  @$pb.TagNumber(9)
  set temporalWorkflowId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTemporalWorkflowId() => $_has(8);
  @$pb.TagNumber(9)
  void clearTemporalWorkflowId() => $_clearField(9);

  @$pb.TagNumber(10)
  $1.Timestamp get slaDeadline => $_getN(9);
  @$pb.TagNumber(10)
  set slaDeadline($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSlaDeadline() => $_has(9);
  @$pb.TagNumber(10)
  void clearSlaDeadline() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureSlaDeadline() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.Timestamp get openedAt => $_getN(10);
  @$pb.TagNumber(11)
  set openedAt($1.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasOpenedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearOpenedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureOpenedAt() => $_ensure(10);

  @$pb.TagNumber(12)
  $1.Timestamp get closedAt => $_getN(11);
  @$pb.TagNumber(12)
  set closedAt($1.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasClosedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearClosedAt() => $_clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureClosedAt() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get resolution => $_getSZ(12);
  @$pb.TagNumber(13)
  set resolution($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasResolution() => $_has(12);
  @$pb.TagNumber(13)
  void clearResolution() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbList<CaseEvent> get events => $_getList(13);

  @$pb.TagNumber(15)
  $pb.PbList<CaseEvidence> get evidence => $_getList(14);

  @$pb.TagNumber(16)
  AnalystAssignment get currentAssignment => $_getN(15);
  @$pb.TagNumber(16)
  set currentAssignment(AnalystAssignment value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasCurrentAssignment() => $_has(15);
  @$pb.TagNumber(16)
  void clearCurrentAssignment() => $_clearField(16);
  @$pb.TagNumber(16)
  AnalystAssignment ensureCurrentAssignment() => $_ensure(15);
}

class CaseEvent extends $pb.GeneratedMessage {
  factory CaseEvent({
    $core.String? id,
    $core.String? caseId,
    $core.String? actorId,
    $core.String? eventType,
    $core.String? status,
    $core.String? details,
    $1.Timestamp? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (caseId != null) result.caseId = caseId;
    if (actorId != null) result.actorId = actorId;
    if (eventType != null) result.eventType = eventType;
    if (status != null) result.status = status;
    if (details != null) result.details = details;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  CaseEvent._();

  factory CaseEvent.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CaseEvent.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CaseEvent',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'caseId')
    ..aOS(3, _omitFieldNames ? '' : 'actorId')
    ..aOS(4, _omitFieldNames ? '' : 'eventType')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'details')
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaseEvent clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaseEvent copyWith(void Function(CaseEvent) updates) =>
      super.copyWith((message) => updates(message as CaseEvent)) as CaseEvent;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CaseEvent create() => CaseEvent._();
  @$core.override
  CaseEvent createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CaseEvent getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CaseEvent>(create);
  static CaseEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get caseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set caseId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCaseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaseId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get actorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set actorId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasActorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearActorId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get eventType => $_getSZ(3);
  @$pb.TagNumber(4)
  set eventType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEventType() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get details => $_getSZ(5);
  @$pb.TagNumber(6)
  set details($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDetails() => $_has(5);
  @$pb.TagNumber(6)
  void clearDetails() => $_clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureCreatedAt() => $_ensure(6);
}

class CaseEvidence extends $pb.GeneratedMessage {
  factory CaseEvidence({
    $core.String? id,
    $core.String? caseId,
    $core.String? uploadedBy,
    $core.String? fileKey,
    $core.String? description,
    $1.Timestamp? uploadedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (caseId != null) result.caseId = caseId;
    if (uploadedBy != null) result.uploadedBy = uploadedBy;
    if (fileKey != null) result.fileKey = fileKey;
    if (description != null) result.description = description;
    if (uploadedAt != null) result.uploadedAt = uploadedAt;
    return result;
  }

  CaseEvidence._();

  factory CaseEvidence.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CaseEvidence.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CaseEvidence',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'caseId')
    ..aOS(3, _omitFieldNames ? '' : 'uploadedBy')
    ..aOS(4, _omitFieldNames ? '' : 'fileKey')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'uploadedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaseEvidence clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CaseEvidence copyWith(void Function(CaseEvidence) updates) =>
      super.copyWith((message) => updates(message as CaseEvidence))
          as CaseEvidence;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CaseEvidence create() => CaseEvidence._();
  @$core.override
  CaseEvidence createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CaseEvidence getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CaseEvidence>(create);
  static CaseEvidence? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get caseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set caseId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCaseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaseId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get uploadedBy => $_getSZ(2);
  @$pb.TagNumber(3)
  set uploadedBy($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUploadedBy() => $_has(2);
  @$pb.TagNumber(3)
  void clearUploadedBy() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fileKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set fileKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFileKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearFileKey() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get uploadedAt => $_getN(5);
  @$pb.TagNumber(6)
  set uploadedAt($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasUploadedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUploadedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureUploadedAt() => $_ensure(5);
}

class AnalystAssignment extends $pb.GeneratedMessage {
  factory AnalystAssignment({
    $core.String? id,
    $core.String? caseId,
    $core.String? analystId,
    $1.Timestamp? assignedAt,
    $1.Timestamp? unassignedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (caseId != null) result.caseId = caseId;
    if (analystId != null) result.analystId = analystId;
    if (assignedAt != null) result.assignedAt = assignedAt;
    if (unassignedAt != null) result.unassignedAt = unassignedAt;
    return result;
  }

  AnalystAssignment._();

  factory AnalystAssignment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalystAssignment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalystAssignment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'caseId')
    ..aOS(3, _omitFieldNames ? '' : 'analystId')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'assignedAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'unassignedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalystAssignment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalystAssignment copyWith(void Function(AnalystAssignment) updates) =>
      super.copyWith((message) => updates(message as AnalystAssignment))
          as AnalystAssignment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalystAssignment create() => AnalystAssignment._();
  @$core.override
  AnalystAssignment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalystAssignment getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalystAssignment>(create);
  static AnalystAssignment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get caseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set caseId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCaseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaseId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get analystId => $_getSZ(2);
  @$pb.TagNumber(3)
  set analystId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAnalystId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnalystId() => $_clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get assignedAt => $_getN(3);
  @$pb.TagNumber(4)
  set assignedAt($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAssignedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearAssignedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureAssignedAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.Timestamp get unassignedAt => $_getN(4);
  @$pb.TagNumber(5)
  set unassignedAt($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasUnassignedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearUnassignedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureUnassignedAt() => $_ensure(4);
}

class GetCaseRequest extends $pb.GeneratedMessage {
  factory GetCaseRequest({
    $core.String? caseId,
    $core.String? tenantId,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  GetCaseRequest._();

  factory GetCaseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCaseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCaseRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseRequest copyWith(void Function(GetCaseRequest) updates) =>
      super.copyWith((message) => updates(message as GetCaseRequest))
          as GetCaseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCaseRequest create() => GetCaseRequest._();
  @$core.override
  GetCaseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCaseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCaseRequest>(create);
  static GetCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);
}

class GetCaseResponse extends $pb.GeneratedMessage {
  factory GetCaseResponse({
    Case? case_1,
  }) {
    final result = create();
    if (case_1 != null) result.case_1 = case_1;
    return result;
  }

  GetCaseResponse._();

  factory GetCaseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCaseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCaseResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOM<Case>(1, _omitFieldNames ? '' : 'case', subBuilder: Case.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseResponse copyWith(void Function(GetCaseResponse) updates) =>
      super.copyWith((message) => updates(message as GetCaseResponse))
          as GetCaseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCaseResponse create() => GetCaseResponse._();
  @$core.override
  GetCaseResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCaseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCaseResponse>(create);
  static GetCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Case get case_1 => $_getN(0);
  @$pb.TagNumber(1)
  set case_1(Case value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCase_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearCase_1() => $_clearField(1);
  @$pb.TagNumber(1)
  Case ensureCase_1() => $_ensure(0);
}

class ListCasesRequest extends $pb.GeneratedMessage {
  factory ListCasesRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? state,
    $core.String? priority,
    $core.String? caseType,
    $core.int? page,
    $core.int? limit,
    $core.String? dateFrom,
    $core.String? dateTo,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (state != null) result.state = state;
    if (priority != null) result.priority = priority;
    if (caseType != null) result.caseType = caseType;
    if (page != null) result.page = page;
    if (limit != null) result.limit = limit;
    if (dateFrom != null) result.dateFrom = dateFrom;
    if (dateTo != null) result.dateTo = dateTo;
    return result;
  }

  ListCasesRequest._();

  factory ListCasesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCasesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCasesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'state')
    ..aOS(4, _omitFieldNames ? '' : 'priority')
    ..aOS(5, _omitFieldNames ? '' : 'caseType')
    ..aI(6, _omitFieldNames ? '' : 'page')
    ..aI(7, _omitFieldNames ? '' : 'limit')
    ..aOS(8, _omitFieldNames ? '' : 'dateFrom')
    ..aOS(9, _omitFieldNames ? '' : 'dateTo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCasesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCasesRequest copyWith(void Function(ListCasesRequest) updates) =>
      super.copyWith((message) => updates(message as ListCasesRequest))
          as ListCasesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCasesRequest create() => ListCasesRequest._();
  @$core.override
  ListCasesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCasesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCasesRequest>(create);
  static ListCasesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get workerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set workerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWorkerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get state => $_getSZ(2);
  @$pb.TagNumber(3)
  set state($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(2);
  @$pb.TagNumber(3)
  void clearState() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get priority => $_getSZ(3);
  @$pb.TagNumber(4)
  set priority($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPriority() => $_has(3);
  @$pb.TagNumber(4)
  void clearPriority() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get caseType => $_getSZ(4);
  @$pb.TagNumber(5)
  set caseType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCaseType() => $_has(4);
  @$pb.TagNumber(5)
  void clearCaseType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get page => $_getIZ(5);
  @$pb.TagNumber(6)
  set page($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPage() => $_has(5);
  @$pb.TagNumber(6)
  void clearPage() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get limit => $_getIZ(6);
  @$pb.TagNumber(7)
  set limit($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLimit() => $_has(6);
  @$pb.TagNumber(7)
  void clearLimit() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get dateFrom => $_getSZ(7);
  @$pb.TagNumber(8)
  set dateFrom($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDateFrom() => $_has(7);
  @$pb.TagNumber(8)
  void clearDateFrom() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get dateTo => $_getSZ(8);
  @$pb.TagNumber(9)
  set dateTo($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDateTo() => $_has(8);
  @$pb.TagNumber(9)
  void clearDateTo() => $_clearField(9);
}

class ListCasesResponse extends $pb.GeneratedMessage {
  factory ListCasesResponse({
    $core.Iterable<Case>? cases,
    $core.int? totalItems,
    $core.int? totalPages,
    $core.int? currentPage,
  }) {
    final result = create();
    if (cases != null) result.cases.addAll(cases);
    if (totalItems != null) result.totalItems = totalItems;
    if (totalPages != null) result.totalPages = totalPages;
    if (currentPage != null) result.currentPage = currentPage;
    return result;
  }

  ListCasesResponse._();

  factory ListCasesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListCasesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListCasesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..pPM<Case>(1, _omitFieldNames ? '' : 'cases', subBuilder: Case.create)
    ..aI(2, _omitFieldNames ? '' : 'totalItems')
    ..aI(3, _omitFieldNames ? '' : 'totalPages')
    ..aI(4, _omitFieldNames ? '' : 'currentPage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCasesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListCasesResponse copyWith(void Function(ListCasesResponse) updates) =>
      super.copyWith((message) => updates(message as ListCasesResponse))
          as ListCasesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCasesResponse create() => ListCasesResponse._();
  @$core.override
  ListCasesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListCasesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListCasesResponse>(create);
  static ListCasesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Case> get cases => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalItems => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalItems($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalItems() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalItems() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalPages => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalPages($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalPages() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalPages() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get currentPage => $_getIZ(3);
  @$pb.TagNumber(4)
  set currentPage($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrentPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentPage() => $_clearField(4);
}

class AssignCaseRequest extends $pb.GeneratedMessage {
  factory AssignCaseRequest({
    $core.String? caseId,
    $core.String? tenantId,
    $core.String? analystId,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    if (analystId != null) result.analystId = analystId;
    return result;
  }

  AssignCaseRequest._();

  factory AssignCaseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssignCaseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssignCaseRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'analystId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignCaseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignCaseRequest copyWith(void Function(AssignCaseRequest) updates) =>
      super.copyWith((message) => updates(message as AssignCaseRequest))
          as AssignCaseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignCaseRequest create() => AssignCaseRequest._();
  @$core.override
  AssignCaseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssignCaseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssignCaseRequest>(create);
  static AssignCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get analystId => $_getSZ(2);
  @$pb.TagNumber(3)
  set analystId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAnalystId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnalystId() => $_clearField(3);
}

class AssignCaseResponse extends $pb.GeneratedMessage {
  factory AssignCaseResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AssignCaseResponse._();

  factory AssignCaseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssignCaseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssignCaseResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignCaseResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssignCaseResponse copyWith(void Function(AssignCaseResponse) updates) =>
      super.copyWith((message) => updates(message as AssignCaseResponse))
          as AssignCaseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssignCaseResponse create() => AssignCaseResponse._();
  @$core.override
  AssignCaseResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssignCaseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssignCaseResponse>(create);
  static AssignCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class AddEvidenceRequest extends $pb.GeneratedMessage {
  factory AddEvidenceRequest({
    $core.String? caseId,
    $core.String? tenantId,
    $core.String? fileKey,
    $core.String? description,
    $core.String? objectKey,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    if (fileKey != null) result.fileKey = fileKey;
    if (description != null) result.description = description;
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  AddEvidenceRequest._();

  factory AddEvidenceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddEvidenceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddEvidenceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'fileKey')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOS(5, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEvidenceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEvidenceRequest copyWith(void Function(AddEvidenceRequest) updates) =>
      super.copyWith((message) => updates(message as AddEvidenceRequest))
          as AddEvidenceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEvidenceRequest create() => AddEvidenceRequest._();
  @$core.override
  AddEvidenceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddEvidenceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddEvidenceRequest>(create);
  static AddEvidenceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get objectKey => $_getSZ(4);
  @$pb.TagNumber(5)
  set objectKey($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasObjectKey() => $_has(4);
  @$pb.TagNumber(5)
  void clearObjectKey() => $_clearField(5);
}

class AddEvidenceResponse extends $pb.GeneratedMessage {
  factory AddEvidenceResponse({
    $core.String? evidenceId,
  }) {
    final result = create();
    if (evidenceId != null) result.evidenceId = evidenceId;
    return result;
  }

  AddEvidenceResponse._();

  factory AddEvidenceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddEvidenceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddEvidenceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'evidenceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEvidenceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddEvidenceResponse copyWith(void Function(AddEvidenceResponse) updates) =>
      super.copyWith((message) => updates(message as AddEvidenceResponse))
          as AddEvidenceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEvidenceResponse create() => AddEvidenceResponse._();
  @$core.override
  AddEvidenceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddEvidenceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddEvidenceResponse>(create);
  static AddEvidenceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get evidenceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set evidenceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEvidenceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvidenceId() => $_clearField(1);
}

class GenerateEvidenceUploadURLRequest extends $pb.GeneratedMessage {
  factory GenerateEvidenceUploadURLRequest({
    $core.String? caseId,
    $core.String? tenantId,
    $core.String? fileExt,
    $core.String? contentType,
    $core.String? description,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    if (fileExt != null) result.fileExt = fileExt;
    if (contentType != null) result.contentType = contentType;
    if (description != null) result.description = description;
    return result;
  }

  GenerateEvidenceUploadURLRequest._();

  factory GenerateEvidenceUploadURLRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateEvidenceUploadURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateEvidenceUploadURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'fileExt')
    ..aOS(4, _omitFieldNames ? '' : 'contentType')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateEvidenceUploadURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateEvidenceUploadURLRequest copyWith(
          void Function(GenerateEvidenceUploadURLRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GenerateEvidenceUploadURLRequest))
          as GenerateEvidenceUploadURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateEvidenceUploadURLRequest create() =>
      GenerateEvidenceUploadURLRequest._();
  @$core.override
  GenerateEvidenceUploadURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateEvidenceUploadURLRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateEvidenceUploadURLRequest>(
          create);
  static GenerateEvidenceUploadURLRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileExt => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileExt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileExt() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileExt() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get contentType => $_getSZ(3);
  @$pb.TagNumber(4)
  set contentType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContentType() => $_has(3);
  @$pb.TagNumber(4)
  void clearContentType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);
}

class GenerateEvidenceUploadURLResponse extends $pb.GeneratedMessage {
  factory GenerateEvidenceUploadURLResponse({
    $core.String? uploadUrl,
    $core.String? objectKey,
    $core.int? expiresIn,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? requiredHeaders,
  }) {
    final result = create();
    if (uploadUrl != null) result.uploadUrl = uploadUrl;
    if (objectKey != null) result.objectKey = objectKey;
    if (expiresIn != null) result.expiresIn = expiresIn;
    if (requiredHeaders != null)
      result.requiredHeaders.addEntries(requiredHeaders);
    return result;
  }

  GenerateEvidenceUploadURLResponse._();

  factory GenerateEvidenceUploadURLResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateEvidenceUploadURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateEvidenceUploadURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(2, _omitFieldNames ? '' : 'objectKey')
    ..aI(3, _omitFieldNames ? '' : 'expiresIn')
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'requiredHeaders',
        entryClassName:
            'GenerateEvidenceUploadURLResponse.RequiredHeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('case.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateEvidenceUploadURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateEvidenceUploadURLResponse copyWith(
          void Function(GenerateEvidenceUploadURLResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateEvidenceUploadURLResponse))
          as GenerateEvidenceUploadURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateEvidenceUploadURLResponse create() =>
      GenerateEvidenceUploadURLResponse._();
  @$core.override
  GenerateEvidenceUploadURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateEvidenceUploadURLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateEvidenceUploadURLResponse>(
          create);
  static GenerateEvidenceUploadURLResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uploadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set uploadUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUploadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get objectKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasObjectKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectKey() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get expiresIn => $_getIZ(2);
  @$pb.TagNumber(3)
  set expiresIn($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.String> get requiredHeaders => $_getMap(3);
}

class GetEvidenceDownloadURLRequest extends $pb.GeneratedMessage {
  factory GetEvidenceDownloadURLRequest({
    $core.String? caseId,
    $core.String? tenantId,
    $core.String? evidenceId,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    if (evidenceId != null) result.evidenceId = evidenceId;
    return result;
  }

  GetEvidenceDownloadURLRequest._();

  factory GetEvidenceDownloadURLRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEvidenceDownloadURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEvidenceDownloadURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'evidenceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEvidenceDownloadURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEvidenceDownloadURLRequest copyWith(
          void Function(GetEvidenceDownloadURLRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetEvidenceDownloadURLRequest))
          as GetEvidenceDownloadURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEvidenceDownloadURLRequest create() =>
      GetEvidenceDownloadURLRequest._();
  @$core.override
  GetEvidenceDownloadURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetEvidenceDownloadURLRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEvidenceDownloadURLRequest>(create);
  static GetEvidenceDownloadURLRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get evidenceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set evidenceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEvidenceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearEvidenceId() => $_clearField(3);
}

class GetEvidenceDownloadURLResponse extends $pb.GeneratedMessage {
  factory GetEvidenceDownloadURLResponse({
    $core.String? downloadUrl,
    $core.int? expiresIn,
  }) {
    final result = create();
    if (downloadUrl != null) result.downloadUrl = downloadUrl;
    if (expiresIn != null) result.expiresIn = expiresIn;
    return result;
  }

  GetEvidenceDownloadURLResponse._();

  factory GetEvidenceDownloadURLResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEvidenceDownloadURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEvidenceDownloadURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'downloadUrl')
    ..aI(2, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEvidenceDownloadURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEvidenceDownloadURLResponse copyWith(
          void Function(GetEvidenceDownloadURLResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetEvidenceDownloadURLResponse))
          as GetEvidenceDownloadURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEvidenceDownloadURLResponse create() =>
      GetEvidenceDownloadURLResponse._();
  @$core.override
  GetEvidenceDownloadURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetEvidenceDownloadURLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEvidenceDownloadURLResponse>(create);
  static GetEvidenceDownloadURLResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get downloadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set downloadUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDownloadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearDownloadUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get expiresIn => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiresIn($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiresIn() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresIn() => $_clearField(2);
}

class AddCommentRequest extends $pb.GeneratedMessage {
  factory AddCommentRequest({
    $core.String? caseId,
    $core.String? tenantId,
    $core.String? comment,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    if (comment != null) result.comment = comment;
    return result;
  }

  AddCommentRequest._();

  factory AddCommentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddCommentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddCommentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCommentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCommentRequest copyWith(void Function(AddCommentRequest) updates) =>
      super.copyWith((message) => updates(message as AddCommentRequest))
          as AddCommentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCommentRequest create() => AddCommentRequest._();
  @$core.override
  AddCommentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddCommentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddCommentRequest>(create);
  static AddCommentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => $_clearField(3);
}

class AddCommentResponse extends $pb.GeneratedMessage {
  factory AddCommentResponse({
    $core.String? eventId,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    return result;
  }

  AddCommentResponse._();

  factory AddCommentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddCommentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddCommentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCommentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddCommentResponse copyWith(void Function(AddCommentResponse) updates) =>
      super.copyWith((message) => updates(message as AddCommentResponse))
          as AddCommentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddCommentResponse create() => AddCommentResponse._();
  @$core.override
  AddCommentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddCommentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddCommentResponse>(create);
  static AddCommentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);
}

class ResolveCaseRequest extends $pb.GeneratedMessage {
  factory ResolveCaseRequest({
    $core.String? caseId,
    $core.String? tenantId,
    $core.String? resolutionJson,
    $core.String? finalState,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    if (resolutionJson != null) result.resolutionJson = resolutionJson;
    if (finalState != null) result.finalState = finalState;
    return result;
  }

  ResolveCaseRequest._();

  factory ResolveCaseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveCaseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveCaseRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'resolutionJson')
    ..aOS(4, _omitFieldNames ? '' : 'finalState')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveCaseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveCaseRequest copyWith(void Function(ResolveCaseRequest) updates) =>
      super.copyWith((message) => updates(message as ResolveCaseRequest))
          as ResolveCaseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveCaseRequest create() => ResolveCaseRequest._();
  @$core.override
  ResolveCaseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveCaseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolveCaseRequest>(create);
  static ResolveCaseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resolutionJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set resolutionJson($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResolutionJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolutionJson() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get finalState => $_getSZ(3);
  @$pb.TagNumber(4)
  set finalState($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFinalState() => $_has(3);
  @$pb.TagNumber(4)
  void clearFinalState() => $_clearField(4);
}

class ResolveCaseResponse extends $pb.GeneratedMessage {
  factory ResolveCaseResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ResolveCaseResponse._();

  factory ResolveCaseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveCaseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveCaseResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveCaseResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveCaseResponse copyWith(void Function(ResolveCaseResponse) updates) =>
      super.copyWith((message) => updates(message as ResolveCaseResponse))
          as ResolveCaseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveCaseResponse create() => ResolveCaseResponse._();
  @$core.override
  ResolveCaseResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveCaseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolveCaseResponse>(create);
  static ResolveCaseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class SubmitAppealRequest extends $pb.GeneratedMessage {
  factory SubmitAppealRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? reason,
    $core.String? description,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (reason != null) result.reason = reason;
    if (description != null) result.description = description;
    return result;
  }

  SubmitAppealRequest._();

  factory SubmitAppealRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitAppealRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitAppealRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitAppealRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitAppealRequest copyWith(void Function(SubmitAppealRequest) updates) =>
      super.copyWith((message) => updates(message as SubmitAppealRequest))
          as SubmitAppealRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitAppealRequest create() => SubmitAppealRequest._();
  @$core.override
  SubmitAppealRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitAppealRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitAppealRequest>(create);
  static SubmitAppealRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get workerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set workerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWorkerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);
}

class SubmitAppealResponse extends $pb.GeneratedMessage {
  factory SubmitAppealResponse({
    $core.String? caseId,
    $core.String? reVerificationRequestId,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (reVerificationRequestId != null)
      result.reVerificationRequestId = reVerificationRequestId;
    return result;
  }

  SubmitAppealResponse._();

  factory SubmitAppealResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitAppealResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitAppealResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'reVerificationRequestId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitAppealResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitAppealResponse copyWith(void Function(SubmitAppealResponse) updates) =>
      super.copyWith((message) => updates(message as SubmitAppealResponse))
          as SubmitAppealResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitAppealResponse create() => SubmitAppealResponse._();
  @$core.override
  SubmitAppealResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitAppealResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitAppealResponse>(create);
  static SubmitAppealResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reVerificationRequestId => $_getSZ(1);
  @$pb.TagNumber(2)
  set reVerificationRequestId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReVerificationRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReVerificationRequestId() => $_clearField(2);
}

class GetCaseTimelineRequest extends $pb.GeneratedMessage {
  factory GetCaseTimelineRequest({
    $core.String? caseId,
    $core.String? tenantId,
  }) {
    final result = create();
    if (caseId != null) result.caseId = caseId;
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  GetCaseTimelineRequest._();

  factory GetCaseTimelineRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCaseTimelineRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCaseTimelineRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'caseId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseTimelineRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseTimelineRequest copyWith(
          void Function(GetCaseTimelineRequest) updates) =>
      super.copyWith((message) => updates(message as GetCaseTimelineRequest))
          as GetCaseTimelineRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCaseTimelineRequest create() => GetCaseTimelineRequest._();
  @$core.override
  GetCaseTimelineRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCaseTimelineRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCaseTimelineRequest>(create);
  static GetCaseTimelineRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get caseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set caseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCaseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCaseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);
}

class GetCaseTimelineResponse extends $pb.GeneratedMessage {
  factory GetCaseTimelineResponse({
    $core.Iterable<CaseEvent>? events,
  }) {
    final result = create();
    if (events != null) result.events.addAll(events);
    return result;
  }

  GetCaseTimelineResponse._();

  factory GetCaseTimelineResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCaseTimelineResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCaseTimelineResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..pPM<CaseEvent>(1, _omitFieldNames ? '' : 'events',
        subBuilder: CaseEvent.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseTimelineResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCaseTimelineResponse copyWith(
          void Function(GetCaseTimelineResponse) updates) =>
      super.copyWith((message) => updates(message as GetCaseTimelineResponse))
          as GetCaseTimelineResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCaseTimelineResponse create() => GetCaseTimelineResponse._();
  @$core.override
  GetCaseTimelineResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCaseTimelineResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCaseTimelineResponse>(create);
  static GetCaseTimelineResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CaseEvent> get events => $_getList(0);
}

class ListReverificationQueueRequest extends $pb.GeneratedMessage {
  factory ListReverificationQueueRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListReverificationQueueRequest._();

  factory ListReverificationQueueRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReverificationQueueRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReverificationQueueRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationQueueRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationQueueRequest copyWith(
          void Function(ListReverificationQueueRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListReverificationQueueRequest))
          as ListReverificationQueueRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReverificationQueueRequest create() =>
      ListReverificationQueueRequest._();
  @$core.override
  ListReverificationQueueRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReverificationQueueRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReverificationQueueRequest>(create);
  static ListReverificationQueueRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class ReverificationRequest extends $pb.GeneratedMessage {
  factory ReverificationRequest({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? caseId,
    $core.String? triggerReason,
    $core.String? triggerModule,
    $core.String? status,
    $core.String? deadline,
    $core.String? createdAt,
    $core.String? completedAt,
    $core.Iterable<$core.String>? flaggedDocuments,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (caseId != null) result.caseId = caseId;
    if (triggerReason != null) result.triggerReason = triggerReason;
    if (triggerModule != null) result.triggerModule = triggerModule;
    if (status != null) result.status = status;
    if (deadline != null) result.deadline = deadline;
    if (createdAt != null) result.createdAt = createdAt;
    if (completedAt != null) result.completedAt = completedAt;
    if (flaggedDocuments != null)
      result.flaggedDocuments.addAll(flaggedDocuments);
    return result;
  }

  ReverificationRequest._();

  factory ReverificationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReverificationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReverificationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'caseId')
    ..aOS(5, _omitFieldNames ? '' : 'triggerReason')
    ..aOS(6, _omitFieldNames ? '' : 'triggerModule')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'deadline')
    ..aOS(9, _omitFieldNames ? '' : 'createdAt')
    ..aOS(10, _omitFieldNames ? '' : 'completedAt')
    ..pPS(11, _omitFieldNames ? '' : 'flaggedDocuments')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReverificationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReverificationRequest copyWith(
          void Function(ReverificationRequest) updates) =>
      super.copyWith((message) => updates(message as ReverificationRequest))
          as ReverificationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReverificationRequest create() => ReverificationRequest._();
  @$core.override
  ReverificationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReverificationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReverificationRequest>(create);
  static ReverificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get workerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set workerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWorkerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get tenantId => $_getSZ(2);
  @$pb.TagNumber(3)
  set tenantId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTenantId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTenantId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get caseId => $_getSZ(3);
  @$pb.TagNumber(4)
  set caseId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCaseId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCaseId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get triggerReason => $_getSZ(4);
  @$pb.TagNumber(5)
  set triggerReason($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTriggerReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearTriggerReason() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get triggerModule => $_getSZ(5);
  @$pb.TagNumber(6)
  set triggerModule($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTriggerModule() => $_has(5);
  @$pb.TagNumber(6)
  void clearTriggerModule() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get deadline => $_getSZ(7);
  @$pb.TagNumber(8)
  set deadline($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDeadline() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeadline() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createdAt => $_getSZ(8);
  @$pb.TagNumber(9)
  set createdAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);

  /// RFC 3339; "" while the request is still open (and for one that expired: it was
  /// not completed).
  @$pb.TagNumber(10)
  $core.String get completedAt => $_getSZ(9);
  @$pb.TagNumber(10)
  set completedAt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCompletedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCompletedAt() => $_clearField(10);

  /// What the worker was asked to redo, as RequestReverification stored it: FACE_LIVENESS
  /// for a new face scan, document types for new uploads. Empty = all identity documents.
  @$pb.TagNumber(11)
  $pb.PbList<$core.String> get flaggedDocuments => $_getList(10);
}

class ListReverificationQueueResponse extends $pb.GeneratedMessage {
  factory ListReverificationQueueResponse({
    $core.Iterable<ReverificationRequest>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListReverificationQueueResponse._();

  factory ListReverificationQueueResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReverificationQueueResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReverificationQueueResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..pPM<ReverificationRequest>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ReverificationRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationQueueResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationQueueResponse copyWith(
          void Function(ListReverificationQueueResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListReverificationQueueResponse))
          as ListReverificationQueueResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReverificationQueueResponse create() =>
      ListReverificationQueueResponse._();
  @$core.override
  ListReverificationQueueResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReverificationQueueResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReverificationQueueResponse>(
          create);
  static ListReverificationQueueResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ReverificationRequest> get items => $_getList(0);
}

class RequestReverificationRequest extends $pb.GeneratedMessage {
  factory RequestReverificationRequest({
    $core.String? workerId,
    $core.Iterable<$core.String>? flaggedDocuments,
    $core.int? deadlineDays,
    $core.String? justification,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (flaggedDocuments != null)
      result.flaggedDocuments.addAll(flaggedDocuments);
    if (deadlineDays != null) result.deadlineDays = deadlineDays;
    if (justification != null) result.justification = justification;
    return result;
  }

  RequestReverificationRequest._();

  factory RequestReverificationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestReverificationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestReverificationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..pPS(2, _omitFieldNames ? '' : 'flaggedDocuments')
    ..aI(3, _omitFieldNames ? '' : 'deadlineDays')
    ..aOS(4, _omitFieldNames ? '' : 'justification')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestReverificationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestReverificationRequest copyWith(
          void Function(RequestReverificationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RequestReverificationRequest))
          as RequestReverificationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestReverificationRequest create() =>
      RequestReverificationRequest._();
  @$core.override
  RequestReverificationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestReverificationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestReverificationRequest>(create);
  static RequestReverificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get flaggedDocuments => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get deadlineDays => $_getIZ(2);
  @$pb.TagNumber(3)
  set deadlineDays($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeadlineDays() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeadlineDays() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get justification => $_getSZ(3);
  @$pb.TagNumber(4)
  set justification($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasJustification() => $_has(3);
  @$pb.TagNumber(4)
  void clearJustification() => $_clearField(4);
}

class RequestReverificationResponse extends $pb.GeneratedMessage {
  factory RequestReverificationResponse({
    $core.String? reVerificationRequestId,
  }) {
    final result = create();
    if (reVerificationRequestId != null)
      result.reVerificationRequestId = reVerificationRequestId;
    return result;
  }

  RequestReverificationResponse._();

  factory RequestReverificationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestReverificationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestReverificationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reVerificationRequestId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestReverificationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestReverificationResponse copyWith(
          void Function(RequestReverificationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RequestReverificationResponse))
          as RequestReverificationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestReverificationResponse create() =>
      RequestReverificationResponse._();
  @$core.override
  RequestReverificationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestReverificationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestReverificationResponse>(create);
  static RequestReverificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reVerificationRequestId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reVerificationRequestId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReVerificationRequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReVerificationRequestId() => $_clearField(1);
}

class ListReverificationRequestsRequest extends $pb.GeneratedMessage {
  factory ListReverificationRequestsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListReverificationRequestsRequest._();

  factory ListReverificationRequestsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReverificationRequestsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReverificationRequestsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationRequestsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationRequestsRequest copyWith(
          void Function(ListReverificationRequestsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as ListReverificationRequestsRequest))
          as ListReverificationRequestsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReverificationRequestsRequest create() =>
      ListReverificationRequestsRequest._();
  @$core.override
  ListReverificationRequestsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReverificationRequestsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReverificationRequestsRequest>(
          create);
  static ListReverificationRequestsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class ListReverificationRequestsResponse extends $pb.GeneratedMessage {
  factory ListReverificationRequestsResponse({
    $core.Iterable<ReverificationRequest>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListReverificationRequestsResponse._();

  factory ListReverificationRequestsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReverificationRequestsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReverificationRequestsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'case.v1'),
      createEmptyInstance: create)
    ..pPM<ReverificationRequest>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ReverificationRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationRequestsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReverificationRequestsResponse copyWith(
          void Function(ListReverificationRequestsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ListReverificationRequestsResponse))
          as ListReverificationRequestsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReverificationRequestsResponse create() =>
      ListReverificationRequestsResponse._();
  @$core.override
  ListReverificationRequestsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReverificationRequestsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReverificationRequestsResponse>(
          create);
  static ListReverificationRequestsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ReverificationRequest> get items => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
