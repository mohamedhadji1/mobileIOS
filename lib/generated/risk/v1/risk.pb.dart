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
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (riskLevel != null) result.riskLevel = riskLevel;
    if (trafficLight != null) result.trafficLight = trafficLight;
    if (factors != null) result.factors.addAll(factors);
    if (status != null) result.status = status;
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
    $core.String? decision,
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
    ..aOS(2, _omitFieldNames ? '' : 'decision')
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
  $core.String get decision => $_getSZ(1);
  @$pb.TagNumber(2)
  set decision($core.String value) => $_setString(1, value);
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
