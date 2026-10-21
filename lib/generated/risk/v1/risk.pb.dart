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

import 'risk.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'risk.pbenum.dart';

class GetRiskAssessmentRequest extends $pb.GeneratedMessage {
  factory GetRiskAssessmentRequest({
    $core.String? workerId,
    $core.String? tenantId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  GetRiskAssessmentRequest._();

  factory GetRiskAssessmentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRiskAssessmentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRiskAssessmentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRiskAssessmentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRiskAssessmentRequest copyWith(
          void Function(GetRiskAssessmentRequest) updates) =>
      super.copyWith((message) => updates(message as GetRiskAssessmentRequest))
          as GetRiskAssessmentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRiskAssessmentRequest create() => GetRiskAssessmentRequest._();
  @$core.override
  GetRiskAssessmentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRiskAssessmentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRiskAssessmentRequest>(create);
  static GetRiskAssessmentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);
}

class GetRiskAssessmentResponse extends $pb.GeneratedMessage {
  factory GetRiskAssessmentResponse({
    $core.String? workerId,
    RiskLevel? riskLevel,
    TrafficLight? trafficLight,
    $core.Iterable<ExplainabilityFactor>? factors,
    $core.String? status,
    $core.String? previousColour,
    $core.String? setAt,
    $core.String? setByModule,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (riskLevel != null) result.riskLevel = riskLevel;
    if (trafficLight != null) result.trafficLight = trafficLight;
    if (factors != null) result.factors.addAll(factors);
    if (status != null) result.status = status;
    if (previousColour != null) result.previousColour = previousColour;
    if (setAt != null) result.setAt = setAt;
    if (setByModule != null) result.setByModule = setByModule;
    return result;
  }

  GetRiskAssessmentResponse._();

  factory GetRiskAssessmentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRiskAssessmentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRiskAssessmentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aE<RiskLevel>(2, _omitFieldNames ? '' : 'riskLevel',
        enumValues: RiskLevel.values)
    ..aE<TrafficLight>(3, _omitFieldNames ? '' : 'trafficLight',
        enumValues: TrafficLight.values)
    ..pPM<ExplainabilityFactor>(4, _omitFieldNames ? '' : 'factors',
        subBuilder: ExplainabilityFactor.create)
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'previousColour')
    ..aOS(7, _omitFieldNames ? '' : 'setAt')
    ..aOS(8, _omitFieldNames ? '' : 'setByModule')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRiskAssessmentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRiskAssessmentResponse copyWith(
          void Function(GetRiskAssessmentResponse) updates) =>
      super.copyWith((message) => updates(message as GetRiskAssessmentResponse))
          as GetRiskAssessmentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRiskAssessmentResponse create() => GetRiskAssessmentResponse._();
  @$core.override
  GetRiskAssessmentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRiskAssessmentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRiskAssessmentResponse>(create);
  static GetRiskAssessmentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  RiskLevel get riskLevel => $_getN(1);
  @$pb.TagNumber(2)
  set riskLevel(RiskLevel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRiskLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearRiskLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  TrafficLight get trafficLight => $_getN(2);
  @$pb.TagNumber(3)
  set trafficLight(TrafficLight value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTrafficLight() => $_has(2);
  @$pb.TagNumber(3)
  void clearTrafficLight() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<ExplainabilityFactor> get factors => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get previousColour => $_getSZ(5);
  @$pb.TagNumber(6)
  set previousColour($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPreviousColour() => $_has(5);
  @$pb.TagNumber(6)
  void clearPreviousColour() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get setAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set setAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSetAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearSetAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get setByModule => $_getSZ(7);
  @$pb.TagNumber(8)
  set setByModule($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSetByModule() => $_has(7);
  @$pb.TagNumber(8)
  void clearSetByModule() => $_clearField(8);
}

class ExplainabilityFactor extends $pb.GeneratedMessage {
  factory ExplainabilityFactor({
    $core.String? source,
    $core.String? signal,
    $core.String? description,
    $core.int? weight,
  }) {
    final result = create();
    if (source != null) result.source = source;
    if (signal != null) result.signal = signal;
    if (description != null) result.description = description;
    if (weight != null) result.weight = weight;
    return result;
  }

  ExplainabilityFactor._();

  factory ExplainabilityFactor.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExplainabilityFactor.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExplainabilityFactor',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'source')
    ..aOS(2, _omitFieldNames ? '' : 'signal')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aI(4, _omitFieldNames ? '' : 'weight')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExplainabilityFactor clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExplainabilityFactor copyWith(void Function(ExplainabilityFactor) updates) =>
      super.copyWith((message) => updates(message as ExplainabilityFactor))
          as ExplainabilityFactor;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExplainabilityFactor create() => ExplainabilityFactor._();
  @$core.override
  ExplainabilityFactor createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExplainabilityFactor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExplainabilityFactor>(create);
  static ExplainabilityFactor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get source => $_getSZ(0);
  @$pb.TagNumber(1)
  set source($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSource() => $_has(0);
  @$pb.TagNumber(1)
  void clearSource() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get signal => $_getSZ(1);
  @$pb.TagNumber(2)
  set signal($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSignal() => $_has(1);
  @$pb.TagNumber(2)
  void clearSignal() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get weight => $_getIZ(3);
  @$pb.TagNumber(4)
  set weight($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeight() => $_clearField(4);
}

class SubmitFinalDecisionRequest extends $pb.GeneratedMessage {
  factory SubmitFinalDecisionRequest({
    $core.String? workerId,
    Decision? decision,
    $core.String? justification,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (decision != null) result.decision = decision;
    if (justification != null) result.justification = justification;
    return result;
  }

  SubmitFinalDecisionRequest._();

  factory SubmitFinalDecisionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitFinalDecisionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitFinalDecisionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aE<Decision>(2, _omitFieldNames ? '' : 'decision',
        enumValues: Decision.values)
    ..aOS(3, _omitFieldNames ? '' : 'justification')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitFinalDecisionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitFinalDecisionRequest copyWith(
          void Function(SubmitFinalDecisionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitFinalDecisionRequest))
          as SubmitFinalDecisionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitFinalDecisionRequest create() => SubmitFinalDecisionRequest._();
  @$core.override
  SubmitFinalDecisionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitFinalDecisionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitFinalDecisionRequest>(create);
  static SubmitFinalDecisionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  Decision get decision => $_getN(1);
  @$pb.TagNumber(2)
  set decision(Decision value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDecision() => $_has(1);
  @$pb.TagNumber(2)
  void clearDecision() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get justification => $_getSZ(2);
  @$pb.TagNumber(3)
  set justification($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasJustification() => $_has(2);
  @$pb.TagNumber(3)
  void clearJustification() => $_clearField(3);
}

class SubmitFinalDecisionResponse extends $pb.GeneratedMessage {
  factory SubmitFinalDecisionResponse({
    $core.String? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  SubmitFinalDecisionResponse._();

  factory SubmitFinalDecisionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitFinalDecisionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitFinalDecisionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitFinalDecisionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitFinalDecisionResponse copyWith(
          void Function(SubmitFinalDecisionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitFinalDecisionResponse))
          as SubmitFinalDecisionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitFinalDecisionResponse create() =>
      SubmitFinalDecisionResponse._();
  @$core.override
  SubmitFinalDecisionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitFinalDecisionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitFinalDecisionResponse>(create);
  static SubmitFinalDecisionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

class SubmitBlockDecisionRequest extends $pb.GeneratedMessage {
  factory SubmitBlockDecisionRequest({
    $core.String? workerId,
    $core.String? reason,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (reason != null) result.reason = reason;
    return result;
  }

  SubmitBlockDecisionRequest._();

  factory SubmitBlockDecisionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitBlockDecisionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitBlockDecisionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockDecisionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockDecisionRequest copyWith(
          void Function(SubmitBlockDecisionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitBlockDecisionRequest))
          as SubmitBlockDecisionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitBlockDecisionRequest create() => SubmitBlockDecisionRequest._();
  @$core.override
  SubmitBlockDecisionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitBlockDecisionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitBlockDecisionRequest>(create);
  static SubmitBlockDecisionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class SubmitBlockDecisionResponse extends $pb.GeneratedMessage {
  factory SubmitBlockDecisionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  SubmitBlockDecisionResponse._();

  factory SubmitBlockDecisionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitBlockDecisionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitBlockDecisionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockDecisionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitBlockDecisionResponse copyWith(
          void Function(SubmitBlockDecisionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitBlockDecisionResponse))
          as SubmitBlockDecisionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitBlockDecisionResponse create() =>
      SubmitBlockDecisionResponse._();
  @$core.override
  SubmitBlockDecisionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitBlockDecisionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitBlockDecisionResponse>(create);
  static SubmitBlockDecisionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RemoveFromBlocklistRequest extends $pb.GeneratedMessage {
  factory RemoveFromBlocklistRequest({
    $core.String? workerId,
    $core.String? reason,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (reason != null) result.reason = reason;
    return result;
  }

  RemoveFromBlocklistRequest._();

  factory RemoveFromBlocklistRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveFromBlocklistRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveFromBlocklistRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromBlocklistRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromBlocklistRequest copyWith(
          void Function(RemoveFromBlocklistRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveFromBlocklistRequest))
          as RemoveFromBlocklistRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveFromBlocklistRequest create() => RemoveFromBlocklistRequest._();
  @$core.override
  RemoveFromBlocklistRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveFromBlocklistRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveFromBlocklistRequest>(create);
  static RemoveFromBlocklistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);
}

class RemoveFromBlocklistResponse extends $pb.GeneratedMessage {
  factory RemoveFromBlocklistResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  RemoveFromBlocklistResponse._();

  factory RemoveFromBlocklistResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveFromBlocklistResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveFromBlocklistResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromBlocklistResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveFromBlocklistResponse copyWith(
          void Function(RemoveFromBlocklistResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveFromBlocklistResponse))
          as RemoveFromBlocklistResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveFromBlocklistResponse create() =>
      RemoveFromBlocklistResponse._();
  @$core.override
  RemoveFromBlocklistResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveFromBlocklistResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveFromBlocklistResponse>(create);
  static RemoveFromBlocklistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class TriggerSanctionsReScreenRequest extends $pb.GeneratedMessage {
  factory TriggerSanctionsReScreenRequest() => create();

  TriggerSanctionsReScreenRequest._();

  factory TriggerSanctionsReScreenRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TriggerSanctionsReScreenRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TriggerSanctionsReScreenRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenRequest copyWith(
          void Function(TriggerSanctionsReScreenRequest) updates) =>
      super.copyWith(
              (message) => updates(message as TriggerSanctionsReScreenRequest))
          as TriggerSanctionsReScreenRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenRequest create() =>
      TriggerSanctionsReScreenRequest._();
  @$core.override
  TriggerSanctionsReScreenRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TriggerSanctionsReScreenRequest>(
          create);
  static TriggerSanctionsReScreenRequest? _defaultInstance;
}

class TriggerSanctionsReScreenResponse extends $pb.GeneratedMessage {
  factory TriggerSanctionsReScreenResponse({
    $core.bool? success,
    $core.int? checksRun,
    $core.int? hitsFound,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (checksRun != null) result.checksRun = checksRun;
    if (hitsFound != null) result.hitsFound = hitsFound;
    return result;
  }

  TriggerSanctionsReScreenResponse._();

  factory TriggerSanctionsReScreenResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TriggerSanctionsReScreenResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TriggerSanctionsReScreenResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'checksRun')
    ..aI(3, _omitFieldNames ? '' : 'hitsFound')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenResponse copyWith(
          void Function(TriggerSanctionsReScreenResponse) updates) =>
      super.copyWith(
              (message) => updates(message as TriggerSanctionsReScreenResponse))
          as TriggerSanctionsReScreenResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenResponse create() =>
      TriggerSanctionsReScreenResponse._();
  @$core.override
  TriggerSanctionsReScreenResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TriggerSanctionsReScreenResponse>(
          create);
  static TriggerSanctionsReScreenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get checksRun => $_getIZ(1);
  @$pb.TagNumber(2)
  set checksRun($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChecksRun() => $_has(1);
  @$pb.TagNumber(2)
  void clearChecksRun() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get hitsFound => $_getIZ(2);
  @$pb.TagNumber(3)
  set hitsFound($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHitsFound() => $_has(2);
  @$pb.TagNumber(3)
  void clearHitsFound() => $_clearField(3);
}

class ListSanctionsHitsRequest extends $pb.GeneratedMessage {
  factory ListSanctionsHitsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListSanctionsHitsRequest._();

  factory ListSanctionsHitsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSanctionsHitsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSanctionsHitsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSanctionsHitsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSanctionsHitsRequest copyWith(
          void Function(ListSanctionsHitsRequest) updates) =>
      super.copyWith((message) => updates(message as ListSanctionsHitsRequest))
          as ListSanctionsHitsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSanctionsHitsRequest create() => ListSanctionsHitsRequest._();
  @$core.override
  ListSanctionsHitsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSanctionsHitsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSanctionsHitsRequest>(create);
  static ListSanctionsHitsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class SanctionsHit extends $pb.GeneratedMessage {
  factory SanctionsHit({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? listName,
    $core.double? matchScore,
    $core.String? matchedEntry,
    $core.String? checkedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (listName != null) result.listName = listName;
    if (matchScore != null) result.matchScore = matchScore;
    if (matchedEntry != null) result.matchedEntry = matchedEntry;
    if (checkedAt != null) result.checkedAt = checkedAt;
    return result;
  }

  SanctionsHit._();

  factory SanctionsHit.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SanctionsHit.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SanctionsHit',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'listName')
    ..aD(5, _omitFieldNames ? '' : 'matchScore', fieldType: $pb.PbFieldType.OF)
    ..aOS(6, _omitFieldNames ? '' : 'matchedEntry')
    ..aOS(7, _omitFieldNames ? '' : 'checkedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SanctionsHit clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SanctionsHit copyWith(void Function(SanctionsHit) updates) =>
      super.copyWith((message) => updates(message as SanctionsHit))
          as SanctionsHit;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SanctionsHit create() => SanctionsHit._();
  @$core.override
  SanctionsHit createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SanctionsHit getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SanctionsHit>(create);
  static SanctionsHit? _defaultInstance;

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
  $core.String get listName => $_getSZ(3);
  @$pb.TagNumber(4)
  set listName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasListName() => $_has(3);
  @$pb.TagNumber(4)
  void clearListName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get matchScore => $_getN(4);
  @$pb.TagNumber(5)
  set matchScore($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMatchScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearMatchScore() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get matchedEntry => $_getSZ(5);
  @$pb.TagNumber(6)
  set matchedEntry($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMatchedEntry() => $_has(5);
  @$pb.TagNumber(6)
  void clearMatchedEntry() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get checkedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set checkedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCheckedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCheckedAt() => $_clearField(7);
}

class ListSanctionsHitsResponse extends $pb.GeneratedMessage {
  factory ListSanctionsHitsResponse({
    $core.Iterable<SanctionsHit>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSanctionsHitsResponse._();

  factory ListSanctionsHitsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSanctionsHitsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSanctionsHitsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..pPM<SanctionsHit>(1, _omitFieldNames ? '' : 'items',
        subBuilder: SanctionsHit.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSanctionsHitsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSanctionsHitsResponse copyWith(
          void Function(ListSanctionsHitsResponse) updates) =>
      super.copyWith((message) => updates(message as ListSanctionsHitsResponse))
          as ListSanctionsHitsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSanctionsHitsResponse create() => ListSanctionsHitsResponse._();
  @$core.override
  ListSanctionsHitsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSanctionsHitsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSanctionsHitsResponse>(create);
  static ListSanctionsHitsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SanctionsHit> get items => $_getList(0);
}

class TriggerSanctionsReScreenForWorkerRequest extends $pb.GeneratedMessage {
  factory TriggerSanctionsReScreenForWorkerRequest({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  TriggerSanctionsReScreenForWorkerRequest._();

  factory TriggerSanctionsReScreenForWorkerRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TriggerSanctionsReScreenForWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TriggerSanctionsReScreenForWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenForWorkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenForWorkerRequest copyWith(
          void Function(TriggerSanctionsReScreenForWorkerRequest) updates) =>
      super.copyWith((message) =>
              updates(message as TriggerSanctionsReScreenForWorkerRequest))
          as TriggerSanctionsReScreenForWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenForWorkerRequest create() =>
      TriggerSanctionsReScreenForWorkerRequest._();
  @$core.override
  TriggerSanctionsReScreenForWorkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenForWorkerRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          TriggerSanctionsReScreenForWorkerRequest>(create);
  static TriggerSanctionsReScreenForWorkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class TriggerSanctionsReScreenForWorkerResponse extends $pb.GeneratedMessage {
  factory TriggerSanctionsReScreenForWorkerResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  TriggerSanctionsReScreenForWorkerResponse._();

  factory TriggerSanctionsReScreenForWorkerResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TriggerSanctionsReScreenForWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TriggerSanctionsReScreenForWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenForWorkerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TriggerSanctionsReScreenForWorkerResponse copyWith(
          void Function(TriggerSanctionsReScreenForWorkerResponse) updates) =>
      super.copyWith((message) =>
              updates(message as TriggerSanctionsReScreenForWorkerResponse))
          as TriggerSanctionsReScreenForWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenForWorkerResponse create() =>
      TriggerSanctionsReScreenForWorkerResponse._();
  @$core.override
  TriggerSanctionsReScreenForWorkerResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TriggerSanctionsReScreenForWorkerResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          TriggerSanctionsReScreenForWorkerResponse>(create);
  static TriggerSanctionsReScreenForWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ListTravelFlagsRequest extends $pb.GeneratedMessage {
  factory ListTravelFlagsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListTravelFlagsRequest._();

  factory ListTravelFlagsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTravelFlagsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTravelFlagsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTravelFlagsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTravelFlagsRequest copyWith(
          void Function(ListTravelFlagsRequest) updates) =>
      super.copyWith((message) => updates(message as ListTravelFlagsRequest))
          as ListTravelFlagsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTravelFlagsRequest create() => ListTravelFlagsRequest._();
  @$core.override
  ListTravelFlagsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTravelFlagsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTravelFlagsRequest>(create);
  static ListTravelFlagsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class TravelFlag extends $pb.GeneratedMessage {
  factory TravelFlag({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? deviceId,
    $core.String? originCountry,
    $core.String? destinationCountry,
    $core.String? distanceKm,
    $core.String? detectedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (deviceId != null) result.deviceId = deviceId;
    if (originCountry != null) result.originCountry = originCountry;
    if (destinationCountry != null)
      result.destinationCountry = destinationCountry;
    if (distanceKm != null) result.distanceKm = distanceKm;
    if (detectedAt != null) result.detectedAt = detectedAt;
    return result;
  }

  TravelFlag._();

  factory TravelFlag.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TravelFlag.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TravelFlag',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'deviceId')
    ..aOS(5, _omitFieldNames ? '' : 'originCountry')
    ..aOS(6, _omitFieldNames ? '' : 'destinationCountry')
    ..aOS(7, _omitFieldNames ? '' : 'distanceKm')
    ..aOS(8, _omitFieldNames ? '' : 'detectedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TravelFlag clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TravelFlag copyWith(void Function(TravelFlag) updates) =>
      super.copyWith((message) => updates(message as TravelFlag)) as TravelFlag;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TravelFlag create() => TravelFlag._();
  @$core.override
  TravelFlag createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TravelFlag getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TravelFlag>(create);
  static TravelFlag? _defaultInstance;

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
  $core.String get deviceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get originCountry => $_getSZ(4);
  @$pb.TagNumber(5)
  set originCountry($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOriginCountry() => $_has(4);
  @$pb.TagNumber(5)
  void clearOriginCountry() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get destinationCountry => $_getSZ(5);
  @$pb.TagNumber(6)
  set destinationCountry($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDestinationCountry() => $_has(5);
  @$pb.TagNumber(6)
  void clearDestinationCountry() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get distanceKm => $_getSZ(6);
  @$pb.TagNumber(7)
  set distanceKm($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDistanceKm() => $_has(6);
  @$pb.TagNumber(7)
  void clearDistanceKm() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get detectedAt => $_getSZ(7);
  @$pb.TagNumber(8)
  set detectedAt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDetectedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearDetectedAt() => $_clearField(8);
}

class ListTravelFlagsResponse extends $pb.GeneratedMessage {
  factory ListTravelFlagsResponse({
    $core.Iterable<TravelFlag>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListTravelFlagsResponse._();

  factory ListTravelFlagsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTravelFlagsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTravelFlagsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..pPM<TravelFlag>(1, _omitFieldNames ? '' : 'items',
        subBuilder: TravelFlag.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTravelFlagsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTravelFlagsResponse copyWith(
          void Function(ListTravelFlagsResponse) updates) =>
      super.copyWith((message) => updates(message as ListTravelFlagsResponse))
          as ListTravelFlagsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTravelFlagsResponse create() => ListTravelFlagsResponse._();
  @$core.override
  ListTravelFlagsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTravelFlagsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTravelFlagsResponse>(create);
  static ListTravelFlagsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TravelFlag> get items => $_getList(0);
}

class ListBlocklistRequest extends $pb.GeneratedMessage {
  factory ListBlocklistRequest({
    $core.String? tenantId,
    $core.bool? activeOnly,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (activeOnly != null) result.activeOnly = activeOnly;
    return result;
  }

  ListBlocklistRequest._();

  factory ListBlocklistRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBlocklistRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBlocklistRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOB(2, _omitFieldNames ? '' : 'activeOnly')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBlocklistRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBlocklistRequest copyWith(void Function(ListBlocklistRequest) updates) =>
      super.copyWith((message) => updates(message as ListBlocklistRequest))
          as ListBlocklistRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBlocklistRequest create() => ListBlocklistRequest._();
  @$core.override
  ListBlocklistRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBlocklistRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBlocklistRequest>(create);
  static ListBlocklistRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get activeOnly => $_getBF(1);
  @$pb.TagNumber(2)
  set activeOnly($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActiveOnly() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveOnly() => $_clearField(2);
}

class BlocklistEntry extends $pb.GeneratedMessage {
  factory BlocklistEntry({
    $core.String? id,
    $core.String? workerId,
    $core.String? workerName,
    $core.String? embeddingHash,
    $core.String? blockedBy,
    $core.String? reason,
    $core.String? blockedAt,
    $core.bool? active,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (workerName != null) result.workerName = workerName;
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    if (blockedBy != null) result.blockedBy = blockedBy;
    if (reason != null) result.reason = reason;
    if (blockedAt != null) result.blockedAt = blockedAt;
    if (active != null) result.active = active;
    return result;
  }

  BlocklistEntry._();

  factory BlocklistEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlocklistEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlocklistEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'workerName')
    ..aOS(4, _omitFieldNames ? '' : 'embeddingHash')
    ..aOS(5, _omitFieldNames ? '' : 'blockedBy')
    ..aOS(6, _omitFieldNames ? '' : 'reason')
    ..aOS(7, _omitFieldNames ? '' : 'blockedAt')
    ..aOB(8, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlocklistEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlocklistEntry copyWith(void Function(BlocklistEntry) updates) =>
      super.copyWith((message) => updates(message as BlocklistEntry))
          as BlocklistEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlocklistEntry create() => BlocklistEntry._();
  @$core.override
  BlocklistEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlocklistEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlocklistEntry>(create);
  static BlocklistEntry? _defaultInstance;

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
  $core.String get workerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set workerName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWorkerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearWorkerName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get embeddingHash => $_getSZ(3);
  @$pb.TagNumber(4)
  set embeddingHash($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmbeddingHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmbeddingHash() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get blockedBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set blockedBy($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBlockedBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlockedBy() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get reason => $_getSZ(5);
  @$pb.TagNumber(6)
  set reason($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReason() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get blockedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set blockedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBlockedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearBlockedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get active => $_getBF(7);
  @$pb.TagNumber(8)
  set active($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasActive() => $_has(7);
  @$pb.TagNumber(8)
  void clearActive() => $_clearField(8);
}

class ListBlocklistResponse extends $pb.GeneratedMessage {
  factory ListBlocklistResponse({
    $core.Iterable<BlocklistEntry>? entries,
    $core.int? totalActive,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    if (totalActive != null) result.totalActive = totalActive;
    return result;
  }

  ListBlocklistResponse._();

  factory ListBlocklistResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBlocklistResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBlocklistResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..pPM<BlocklistEntry>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: BlocklistEntry.create)
    ..aI(2, _omitFieldNames ? '' : 'totalActive')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBlocklistResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBlocklistResponse copyWith(
          void Function(ListBlocklistResponse) updates) =>
      super.copyWith((message) => updates(message as ListBlocklistResponse))
          as ListBlocklistResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBlocklistResponse create() => ListBlocklistResponse._();
  @$core.override
  ListBlocklistResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBlocklistResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBlocklistResponse>(create);
  static ListBlocklistResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BlocklistEntry> get entries => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalActive => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalActive($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalActive() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalActive() => $_clearField(2);
}

class ListTrafficLightsRequest extends $pb.GeneratedMessage {
  factory ListTrafficLightsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListTrafficLightsRequest._();

  factory ListTrafficLightsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTrafficLightsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTrafficLightsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTrafficLightsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTrafficLightsRequest copyWith(
          void Function(ListTrafficLightsRequest) updates) =>
      super.copyWith((message) => updates(message as ListTrafficLightsRequest))
          as ListTrafficLightsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTrafficLightsRequest create() => ListTrafficLightsRequest._();
  @$core.override
  ListTrafficLightsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTrafficLightsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTrafficLightsRequest>(create);
  static ListTrafficLightsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class WorkerTrafficLight extends $pb.GeneratedMessage {
  factory WorkerTrafficLight({
    $core.String? workerId,
    $core.String? colour,
    $core.String? previousColour,
    $core.String? riskLevel,
    $core.String? setByModule,
    $core.String? setAt,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (colour != null) result.colour = colour;
    if (previousColour != null) result.previousColour = previousColour;
    if (riskLevel != null) result.riskLevel = riskLevel;
    if (setByModule != null) result.setByModule = setByModule;
    if (setAt != null) result.setAt = setAt;
    return result;
  }

  WorkerTrafficLight._();

  factory WorkerTrafficLight.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerTrafficLight.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerTrafficLight',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'colour')
    ..aOS(3, _omitFieldNames ? '' : 'previousColour')
    ..aOS(4, _omitFieldNames ? '' : 'riskLevel')
    ..aOS(5, _omitFieldNames ? '' : 'setByModule')
    ..aOS(6, _omitFieldNames ? '' : 'setAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerTrafficLight clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerTrafficLight copyWith(void Function(WorkerTrafficLight) updates) =>
      super.copyWith((message) => updates(message as WorkerTrafficLight))
          as WorkerTrafficLight;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerTrafficLight create() => WorkerTrafficLight._();
  @$core.override
  WorkerTrafficLight createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerTrafficLight getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerTrafficLight>(create);
  static WorkerTrafficLight? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get colour => $_getSZ(1);
  @$pb.TagNumber(2)
  set colour($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasColour() => $_has(1);
  @$pb.TagNumber(2)
  void clearColour() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get previousColour => $_getSZ(2);
  @$pb.TagNumber(3)
  set previousColour($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPreviousColour() => $_has(2);
  @$pb.TagNumber(3)
  void clearPreviousColour() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get riskLevel => $_getSZ(3);
  @$pb.TagNumber(4)
  set riskLevel($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRiskLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearRiskLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get setByModule => $_getSZ(4);
  @$pb.TagNumber(5)
  set setByModule($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSetByModule() => $_has(4);
  @$pb.TagNumber(5)
  void clearSetByModule() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get setAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set setAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSetAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearSetAt() => $_clearField(6);
}

class ListTrafficLightsResponse extends $pb.GeneratedMessage {
  factory ListTrafficLightsResponse({
    $core.Iterable<WorkerTrafficLight>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListTrafficLightsResponse._();

  factory ListTrafficLightsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTrafficLightsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTrafficLightsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'risk.v1'),
      createEmptyInstance: create)
    ..pPM<WorkerTrafficLight>(1, _omitFieldNames ? '' : 'items',
        subBuilder: WorkerTrafficLight.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTrafficLightsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTrafficLightsResponse copyWith(
          void Function(ListTrafficLightsResponse) updates) =>
      super.copyWith((message) => updates(message as ListTrafficLightsResponse))
          as ListTrafficLightsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTrafficLightsResponse create() => ListTrafficLightsResponse._();
  @$core.override
  ListTrafficLightsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTrafficLightsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTrafficLightsResponse>(create);
  static ListTrafficLightsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WorkerTrafficLight> get items => $_getList(0);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
