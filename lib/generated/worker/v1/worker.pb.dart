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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'worker.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'worker.pbenum.dart';

class SubmitQualificationRequest extends $pb.GeneratedMessage {
  factory SubmitQualificationRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? documentId,
    QualificationType? qualificationType,
    $core.String? institution,
    $core.String? storedPath,
    $core.String? contactEmail,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (documentId != null) result.documentId = documentId;
    if (qualificationType != null) result.qualificationType = qualificationType;
    if (institution != null) result.institution = institution;
    if (storedPath != null) result.storedPath = storedPath;
    if (contactEmail != null) result.contactEmail = contactEmail;
    return result;
  }

  SubmitQualificationRequest._();

  factory SubmitQualificationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitQualificationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitQualificationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'documentId')
    ..aE<QualificationType>(4, _omitFieldNames ? '' : 'qualificationType',
        enumValues: QualificationType.values)
    ..aOS(5, _omitFieldNames ? '' : 'institution')
    ..aOS(6, _omitFieldNames ? '' : 'storedPath')
    ..aOS(7, _omitFieldNames ? '' : 'contactEmail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitQualificationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitQualificationRequest copyWith(
          void Function(SubmitQualificationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitQualificationRequest))
          as SubmitQualificationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitQualificationRequest create() => SubmitQualificationRequest._();
  @$core.override
  SubmitQualificationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitQualificationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitQualificationRequest>(create);
  static SubmitQualificationRequest? _defaultInstance;

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
  $core.String get documentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentId() => $_clearField(3);

  @$pb.TagNumber(4)
  QualificationType get qualificationType => $_getN(3);
  @$pb.TagNumber(4)
  set qualificationType(QualificationType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasQualificationType() => $_has(3);
  @$pb.TagNumber(4)
  void clearQualificationType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get institution => $_getSZ(4);
  @$pb.TagNumber(5)
  set institution($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInstitution() => $_has(4);
  @$pb.TagNumber(5)
  void clearInstitution() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get storedPath => $_getSZ(5);
  @$pb.TagNumber(6)
  set storedPath($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStoredPath() => $_has(5);
  @$pb.TagNumber(6)
  void clearStoredPath() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get contactEmail => $_getSZ(6);
  @$pb.TagNumber(7)
  set contactEmail($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasContactEmail() => $_has(6);
  @$pb.TagNumber(7)
  void clearContactEmail() => $_clearField(7);
}

class SubmitQualificationResponse extends $pb.GeneratedMessage {
  factory SubmitQualificationResponse({
    $core.String? qualificationId,
    $core.String? status,
  }) {
    final result = create();
    if (qualificationId != null) result.qualificationId = qualificationId;
    if (status != null) result.status = status;
    return result;
  }

  SubmitQualificationResponse._();

  factory SubmitQualificationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitQualificationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitQualificationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'qualificationId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitQualificationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitQualificationResponse copyWith(
          void Function(SubmitQualificationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitQualificationResponse))
          as SubmitQualificationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitQualificationResponse create() =>
      SubmitQualificationResponse._();
  @$core.override
  SubmitQualificationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitQualificationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitQualificationResponse>(create);
  static SubmitQualificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qualificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set qualificationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQualificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQualificationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class GetQualificationStatusRequest extends $pb.GeneratedMessage {
  factory GetQualificationStatusRequest({
    $core.String? qualificationId,
  }) {
    final result = create();
    if (qualificationId != null) result.qualificationId = qualificationId;
    return result;
  }

  GetQualificationStatusRequest._();

  factory GetQualificationStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetQualificationStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetQualificationStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'qualificationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQualificationStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQualificationStatusRequest copyWith(
          void Function(GetQualificationStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetQualificationStatusRequest))
          as GetQualificationStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetQualificationStatusRequest create() =>
      GetQualificationStatusRequest._();
  @$core.override
  GetQualificationStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetQualificationStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetQualificationStatusRequest>(create);
  static GetQualificationStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qualificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set qualificationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQualificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQualificationId() => $_clearField(1);
}

class GetQualificationStatusResponse extends $pb.GeneratedMessage {
  factory GetQualificationStatusResponse({
    $core.String? qualificationId,
    $core.String? status,
    $core.String? institution,
    $core.String? verifiedAt,
  }) {
    final result = create();
    if (qualificationId != null) result.qualificationId = qualificationId;
    if (status != null) result.status = status;
    if (institution != null) result.institution = institution;
    if (verifiedAt != null) result.verifiedAt = verifiedAt;
    return result;
  }

  GetQualificationStatusResponse._();

  factory GetQualificationStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetQualificationStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetQualificationStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'qualificationId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'institution')
    ..aOS(4, _omitFieldNames ? '' : 'verifiedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQualificationStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetQualificationStatusResponse copyWith(
          void Function(GetQualificationStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetQualificationStatusResponse))
          as GetQualificationStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetQualificationStatusResponse create() =>
      GetQualificationStatusResponse._();
  @$core.override
  GetQualificationStatusResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetQualificationStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetQualificationStatusResponse>(create);
  static GetQualificationStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qualificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set qualificationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQualificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQualificationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get institution => $_getSZ(2);
  @$pb.TagNumber(3)
  set institution($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInstitution() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstitution() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get verifiedAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set verifiedAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVerifiedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearVerifiedAt() => $_clearField(4);
}

class AnalystOverrideRequest extends $pb.GeneratedMessage {
  factory AnalystOverrideRequest({
    $core.String? qualificationId,
    $core.String? justification,
    $core.bool? approved,
  }) {
    final result = create();
    if (qualificationId != null) result.qualificationId = qualificationId;
    if (justification != null) result.justification = justification;
    if (approved != null) result.approved = approved;
    return result;
  }

  AnalystOverrideRequest._();

  factory AnalystOverrideRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalystOverrideRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalystOverrideRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'qualificationId')
    ..aOS(2, _omitFieldNames ? '' : 'justification')
    ..aOB(3, _omitFieldNames ? '' : 'approved')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalystOverrideRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalystOverrideRequest copyWith(
          void Function(AnalystOverrideRequest) updates) =>
      super.copyWith((message) => updates(message as AnalystOverrideRequest))
          as AnalystOverrideRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalystOverrideRequest create() => AnalystOverrideRequest._();
  @$core.override
  AnalystOverrideRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalystOverrideRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalystOverrideRequest>(create);
  static AnalystOverrideRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qualificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set qualificationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQualificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQualificationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get justification => $_getSZ(1);
  @$pb.TagNumber(2)
  set justification($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJustification() => $_has(1);
  @$pb.TagNumber(2)
  void clearJustification() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get approved => $_getBF(2);
  @$pb.TagNumber(3)
  set approved($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasApproved() => $_has(2);
  @$pb.TagNumber(3)
  void clearApproved() => $_clearField(3);
}

class AnalystOverrideResponse extends $pb.GeneratedMessage {
  factory AnalystOverrideResponse({
    $core.String? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  AnalystOverrideResponse._();

  factory AnalystOverrideResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AnalystOverrideResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AnalystOverrideResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalystOverrideResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AnalystOverrideResponse copyWith(
          void Function(AnalystOverrideResponse) updates) =>
      super.copyWith((message) => updates(message as AnalystOverrideResponse))
          as AnalystOverrideResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalystOverrideResponse create() => AnalystOverrideResponse._();
  @$core.override
  AnalystOverrideResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AnalystOverrideResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AnalystOverrideResponse>(create);
  static AnalystOverrideResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

class RequestEmployerReferenceRequest extends $pb.GeneratedMessage {
  factory RequestEmployerReferenceRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? employerName,
    $core.String? contactEmail,
    $core.String? position,
    $core.String? startDate,
    $core.String? endDate,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (employerName != null) result.employerName = employerName;
    if (contactEmail != null) result.contactEmail = contactEmail;
    if (position != null) result.position = position;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  RequestEmployerReferenceRequest._();

  factory RequestEmployerReferenceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestEmployerReferenceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestEmployerReferenceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'employerName')
    ..aOS(4, _omitFieldNames ? '' : 'contactEmail')
    ..aOS(5, _omitFieldNames ? '' : 'position')
    ..aOS(6, _omitFieldNames ? '' : 'startDate')
    ..aOS(7, _omitFieldNames ? '' : 'endDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestEmployerReferenceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestEmployerReferenceRequest copyWith(
          void Function(RequestEmployerReferenceRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RequestEmployerReferenceRequest))
          as RequestEmployerReferenceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestEmployerReferenceRequest create() =>
      RequestEmployerReferenceRequest._();
  @$core.override
  RequestEmployerReferenceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestEmployerReferenceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestEmployerReferenceRequest>(
          create);
  static RequestEmployerReferenceRequest? _defaultInstance;

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
  $core.String get employerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set employerName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmployerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmployerName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get contactEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set contactEmail($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContactEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearContactEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get position => $_getSZ(4);
  @$pb.TagNumber(5)
  set position($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosition() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get startDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set startDate($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStartDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartDate() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get endDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set endDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEndDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndDate() => $_clearField(7);
}

class RequestEmployerReferenceResponse extends $pb.GeneratedMessage {
  factory RequestEmployerReferenceResponse({
    $core.String? referenceId,
    $core.String? status,
  }) {
    final result = create();
    if (referenceId != null) result.referenceId = referenceId;
    if (status != null) result.status = status;
    return result;
  }

  RequestEmployerReferenceResponse._();

  factory RequestEmployerReferenceResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestEmployerReferenceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestEmployerReferenceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referenceId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestEmployerReferenceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestEmployerReferenceResponse copyWith(
          void Function(RequestEmployerReferenceResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RequestEmployerReferenceResponse))
          as RequestEmployerReferenceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestEmployerReferenceResponse create() =>
      RequestEmployerReferenceResponse._();
  @$core.override
  RequestEmployerReferenceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestEmployerReferenceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestEmployerReferenceResponse>(
          create);
  static RequestEmployerReferenceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get referenceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set referenceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReferenceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferenceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class GetEmployerReferenceStatusRequest extends $pb.GeneratedMessage {
  factory GetEmployerReferenceStatusRequest({
    $core.String? referenceId,
  }) {
    final result = create();
    if (referenceId != null) result.referenceId = referenceId;
    return result;
  }

  GetEmployerReferenceStatusRequest._();

  factory GetEmployerReferenceStatusRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEmployerReferenceStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEmployerReferenceStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referenceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployerReferenceStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployerReferenceStatusRequest copyWith(
          void Function(GetEmployerReferenceStatusRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetEmployerReferenceStatusRequest))
          as GetEmployerReferenceStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEmployerReferenceStatusRequest create() =>
      GetEmployerReferenceStatusRequest._();
  @$core.override
  GetEmployerReferenceStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetEmployerReferenceStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEmployerReferenceStatusRequest>(
          create);
  static GetEmployerReferenceStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get referenceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set referenceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReferenceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferenceId() => $_clearField(1);
}

class GetEmployerReferenceStatusResponse extends $pb.GeneratedMessage {
  factory GetEmployerReferenceStatusResponse({
    $core.String? referenceId,
    $core.String? status,
    $core.String? employerName,
    $core.int? chaseCount,
    $core.String? responseReceivedAt,
  }) {
    final result = create();
    if (referenceId != null) result.referenceId = referenceId;
    if (status != null) result.status = status;
    if (employerName != null) result.employerName = employerName;
    if (chaseCount != null) result.chaseCount = chaseCount;
    if (responseReceivedAt != null)
      result.responseReceivedAt = responseReceivedAt;
    return result;
  }

  GetEmployerReferenceStatusResponse._();

  factory GetEmployerReferenceStatusResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetEmployerReferenceStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetEmployerReferenceStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referenceId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'employerName')
    ..aI(4, _omitFieldNames ? '' : 'chaseCount')
    ..aOS(5, _omitFieldNames ? '' : 'responseReceivedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployerReferenceStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetEmployerReferenceStatusResponse copyWith(
          void Function(GetEmployerReferenceStatusResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetEmployerReferenceStatusResponse))
          as GetEmployerReferenceStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetEmployerReferenceStatusResponse create() =>
      GetEmployerReferenceStatusResponse._();
  @$core.override
  GetEmployerReferenceStatusResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetEmployerReferenceStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetEmployerReferenceStatusResponse>(
          create);
  static GetEmployerReferenceStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get referenceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set referenceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReferenceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferenceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get employerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set employerName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmployerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmployerName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get chaseCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set chaseCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChaseCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearChaseCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get responseReceivedAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set responseReceivedAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasResponseReceivedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearResponseReceivedAt() => $_clearField(5);
}

class EnrollWorkerRequest extends $pb.GeneratedMessage {
  factory EnrollWorkerRequest({
    $core.String? tenantId,
    $core.String? surname,
    $core.String? givenNames,
    $core.String? nationality,
    ProfileType? profileType,
    WorkerPosition? position,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (surname != null) result.surname = surname;
    if (givenNames != null) result.givenNames = givenNames;
    if (nationality != null) result.nationality = nationality;
    if (profileType != null) result.profileType = profileType;
    if (position != null) result.position = position;
    return result;
  }

  EnrollWorkerRequest._();

  factory EnrollWorkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnrollWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnrollWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'surname')
    ..aOS(3, _omitFieldNames ? '' : 'givenNames')
    ..aOS(4, _omitFieldNames ? '' : 'nationality')
    ..aE<ProfileType>(5, _omitFieldNames ? '' : 'profileType',
        enumValues: ProfileType.values)
    ..aE<WorkerPosition>(6, _omitFieldNames ? '' : 'position',
        enumValues: WorkerPosition.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollWorkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollWorkerRequest copyWith(void Function(EnrollWorkerRequest) updates) =>
      super.copyWith((message) => updates(message as EnrollWorkerRequest))
          as EnrollWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnrollWorkerRequest create() => EnrollWorkerRequest._();
  @$core.override
  EnrollWorkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnrollWorkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnrollWorkerRequest>(create);
  static EnrollWorkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get surname => $_getSZ(1);
  @$pb.TagNumber(2)
  set surname($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSurname() => $_has(1);
  @$pb.TagNumber(2)
  void clearSurname() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get givenNames => $_getSZ(2);
  @$pb.TagNumber(3)
  set givenNames($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGivenNames() => $_has(2);
  @$pb.TagNumber(3)
  void clearGivenNames() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get nationality => $_getSZ(3);
  @$pb.TagNumber(4)
  set nationality($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNationality() => $_has(3);
  @$pb.TagNumber(4)
  void clearNationality() => $_clearField(4);

  @$pb.TagNumber(5)
  ProfileType get profileType => $_getN(4);
  @$pb.TagNumber(5)
  set profileType(ProfileType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProfileType() => $_has(4);
  @$pb.TagNumber(5)
  void clearProfileType() => $_clearField(5);

  @$pb.TagNumber(6)
  WorkerPosition get position => $_getN(5);
  @$pb.TagNumber(6)
  set position(WorkerPosition value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPosition() => $_has(5);
  @$pb.TagNumber(6)
  void clearPosition() => $_clearField(6);
}

class EnrollWorkerResponse extends $pb.GeneratedMessage {
  factory EnrollWorkerResponse({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  EnrollWorkerResponse._();

  factory EnrollWorkerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnrollWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnrollWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollWorkerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollWorkerResponse copyWith(void Function(EnrollWorkerResponse) updates) =>
      super.copyWith((message) => updates(message as EnrollWorkerResponse))
          as EnrollWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnrollWorkerResponse create() => EnrollWorkerResponse._();
  @$core.override
  EnrollWorkerResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnrollWorkerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnrollWorkerResponse>(create);
  static EnrollWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class ValidateInvitationRequest extends $pb.GeneratedMessage {
  factory ValidateInvitationRequest({
    $core.String? token,
    $core.String? tenant,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (tenant != null) result.tenant = tenant;
    return result;
  }

  ValidateInvitationRequest._();

  factory ValidateInvitationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateInvitationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateInvitationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'tenant')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateInvitationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateInvitationRequest copyWith(
          void Function(ValidateInvitationRequest) updates) =>
      super.copyWith((message) => updates(message as ValidateInvitationRequest))
          as ValidateInvitationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateInvitationRequest create() => ValidateInvitationRequest._();
  @$core.override
  ValidateInvitationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValidateInvitationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateInvitationRequest>(create);
  static ValidateInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenant => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenant($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenant() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenant() => $_clearField(2);
}

class ValidateInvitationResponse extends $pb.GeneratedMessage {
  factory ValidateInvitationResponse({
    $core.String? invitationId,
    $core.String? tenantId,
    $core.String? email,
    $core.String? status,
    WorkerPosition? position,
  }) {
    final result = create();
    if (invitationId != null) result.invitationId = invitationId;
    if (tenantId != null) result.tenantId = tenantId;
    if (email != null) result.email = email;
    if (status != null) result.status = status;
    if (position != null) result.position = position;
    return result;
  }

  ValidateInvitationResponse._();

  factory ValidateInvitationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateInvitationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateInvitationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'invitationId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aE<WorkerPosition>(5, _omitFieldNames ? '' : 'position',
        enumValues: WorkerPosition.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateInvitationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateInvitationResponse copyWith(
          void Function(ValidateInvitationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ValidateInvitationResponse))
          as ValidateInvitationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateInvitationResponse create() => ValidateInvitationResponse._();
  @$core.override
  ValidateInvitationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValidateInvitationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateInvitationResponse>(create);
  static ValidateInvitationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get invitationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set invitationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInvitationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvitationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  WorkerPosition get position => $_getN(4);
  @$pb.TagNumber(5)
  set position(WorkerPosition value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosition() => $_clearField(5);
}

class CreateInvitationRequest extends $pb.GeneratedMessage {
  factory CreateInvitationRequest({
    $core.String? tenantId,
    $core.String? subcontractorId,
    $core.String? email,
    $core.String? phoneNumber,
    SentVia? sentVia,
    WorkerPosition? position,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (email != null) result.email = email;
    if (phoneNumber != null) result.phoneNumber = phoneNumber;
    if (sentVia != null) result.sentVia = sentVia;
    if (position != null) result.position = position;
    return result;
  }

  CreateInvitationRequest._();

  factory CreateInvitationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInvitationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInvitationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aE<SentVia>(5, _omitFieldNames ? '' : 'sentVia',
        enumValues: SentVia.values)
    ..aE<WorkerPosition>(6, _omitFieldNames ? '' : 'position',
        enumValues: WorkerPosition.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvitationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvitationRequest copyWith(
          void Function(CreateInvitationRequest) updates) =>
      super.copyWith((message) => updates(message as CreateInvitationRequest))
          as CreateInvitationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInvitationRequest create() => CreateInvitationRequest._();
  @$core.override
  CreateInvitationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateInvitationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateInvitationRequest>(create);
  static CreateInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get subcontractorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set subcontractorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSubcontractorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubcontractorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => $_clearField(4);

  @$pb.TagNumber(5)
  SentVia get sentVia => $_getN(4);
  @$pb.TagNumber(5)
  set sentVia(SentVia value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSentVia() => $_has(4);
  @$pb.TagNumber(5)
  void clearSentVia() => $_clearField(5);

  @$pb.TagNumber(6)
  WorkerPosition get position => $_getN(5);
  @$pb.TagNumber(6)
  set position(WorkerPosition value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPosition() => $_has(5);
  @$pb.TagNumber(6)
  void clearPosition() => $_clearField(6);
}

class CreateInvitationResponse extends $pb.GeneratedMessage {
  factory CreateInvitationResponse({
    $core.String? invitationId,
    $core.String? token,
    $core.String? inviteUrl,
  }) {
    final result = create();
    if (invitationId != null) result.invitationId = invitationId;
    if (token != null) result.token = token;
    if (inviteUrl != null) result.inviteUrl = inviteUrl;
    return result;
  }

  CreateInvitationResponse._();

  factory CreateInvitationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInvitationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInvitationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'invitationId')
    ..aOS(2, _omitFieldNames ? '' : 'token')
    ..aOS(3, _omitFieldNames ? '' : 'inviteUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvitationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvitationResponse copyWith(
          void Function(CreateInvitationResponse) updates) =>
      super.copyWith((message) => updates(message as CreateInvitationResponse))
          as CreateInvitationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInvitationResponse create() => CreateInvitationResponse._();
  @$core.override
  CreateInvitationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateInvitationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateInvitationResponse>(create);
  static CreateInvitationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get invitationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set invitationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInvitationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvitationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get inviteUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set inviteUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInviteUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearInviteUrl() => $_clearField(3);
}

class GetWorkersByTenantRequest extends $pb.GeneratedMessage {
  factory GetWorkersByTenantRequest({
    $core.String? tenantId,
    $core.int? page,
    $core.int? limit,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (page != null) result.page = page;
    if (limit != null) result.limit = limit;
    return result;
  }

  GetWorkersByTenantRequest._();

  factory GetWorkersByTenantRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWorkersByTenantRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWorkersByTenantRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aI(2, _omitFieldNames ? '' : 'page')
    ..aI(3, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkersByTenantRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkersByTenantRequest copyWith(
          void Function(GetWorkersByTenantRequest) updates) =>
      super.copyWith((message) => updates(message as GetWorkersByTenantRequest))
          as GetWorkersByTenantRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWorkersByTenantRequest create() => GetWorkersByTenantRequest._();
  @$core.override
  GetWorkersByTenantRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetWorkersByTenantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWorkersByTenantRequest>(create);
  static GetWorkersByTenantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get page => $_getIZ(1);
  @$pb.TagNumber(2)
  set page($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get limit => $_getIZ(2);
  @$pb.TagNumber(3)
  set limit($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => $_clearField(3);
}

class WorkerProfile extends $pb.GeneratedMessage {
  factory WorkerProfile({
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? keycloakUserId,
    $core.String? surname,
    $core.String? givenNames,
    $core.String? nationality,
    ProfileType? profileType,
    $core.String? status,
    $core.String? enrolledAt,
    $core.String? lastVerifiedAt,
    WorkerPosition? position,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (keycloakUserId != null) result.keycloakUserId = keycloakUserId;
    if (surname != null) result.surname = surname;
    if (givenNames != null) result.givenNames = givenNames;
    if (nationality != null) result.nationality = nationality;
    if (profileType != null) result.profileType = profileType;
    if (status != null) result.status = status;
    if (enrolledAt != null) result.enrolledAt = enrolledAt;
    if (lastVerifiedAt != null) result.lastVerifiedAt = lastVerifiedAt;
    if (position != null) result.position = position;
    return result;
  }

  WorkerProfile._();

  factory WorkerProfile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerProfile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerProfile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'keycloakUserId')
    ..aOS(4, _omitFieldNames ? '' : 'surname')
    ..aOS(5, _omitFieldNames ? '' : 'givenNames')
    ..aOS(6, _omitFieldNames ? '' : 'nationality')
    ..aE<ProfileType>(7, _omitFieldNames ? '' : 'profileType',
        enumValues: ProfileType.values)
    ..aOS(8, _omitFieldNames ? '' : 'status')
    ..aOS(9, _omitFieldNames ? '' : 'enrolledAt')
    ..aOS(10, _omitFieldNames ? '' : 'lastVerifiedAt')
    ..aE<WorkerPosition>(11, _omitFieldNames ? '' : 'position',
        enumValues: WorkerPosition.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerProfile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerProfile copyWith(void Function(WorkerProfile) updates) =>
      super.copyWith((message) => updates(message as WorkerProfile))
          as WorkerProfile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerProfile create() => WorkerProfile._();
  @$core.override
  WorkerProfile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerProfile>(create);
  static WorkerProfile? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get keycloakUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set keycloakUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasKeycloakUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearKeycloakUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get surname => $_getSZ(3);
  @$pb.TagNumber(4)
  set surname($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSurname() => $_has(3);
  @$pb.TagNumber(4)
  void clearSurname() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get givenNames => $_getSZ(4);
  @$pb.TagNumber(5)
  set givenNames($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGivenNames() => $_has(4);
  @$pb.TagNumber(5)
  void clearGivenNames() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get nationality => $_getSZ(5);
  @$pb.TagNumber(6)
  set nationality($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNationality() => $_has(5);
  @$pb.TagNumber(6)
  void clearNationality() => $_clearField(6);

  @$pb.TagNumber(7)
  ProfileType get profileType => $_getN(6);
  @$pb.TagNumber(7)
  set profileType(ProfileType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasProfileType() => $_has(6);
  @$pb.TagNumber(7)
  void clearProfileType() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get enrolledAt => $_getSZ(8);
  @$pb.TagNumber(9)
  set enrolledAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasEnrolledAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearEnrolledAt() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get lastVerifiedAt => $_getSZ(9);
  @$pb.TagNumber(10)
  set lastVerifiedAt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLastVerifiedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastVerifiedAt() => $_clearField(10);

  @$pb.TagNumber(11)
  WorkerPosition get position => $_getN(10);
  @$pb.TagNumber(11)
  set position(WorkerPosition value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasPosition() => $_has(10);
  @$pb.TagNumber(11)
  void clearPosition() => $_clearField(11);
}

class GetWorkersByTenantResponse extends $pb.GeneratedMessage {
  factory GetWorkersByTenantResponse({
    $core.Iterable<WorkerProfile>? workers,
    $core.int? totalItems,
    $core.int? totalPages,
    $core.int? currentPage,
  }) {
    final result = create();
    if (workers != null) result.workers.addAll(workers);
    if (totalItems != null) result.totalItems = totalItems;
    if (totalPages != null) result.totalPages = totalPages;
    if (currentPage != null) result.currentPage = currentPage;
    return result;
  }

  GetWorkersByTenantResponse._();

  factory GetWorkersByTenantResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWorkersByTenantResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWorkersByTenantResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<WorkerProfile>(1, _omitFieldNames ? '' : 'workers',
        subBuilder: WorkerProfile.create)
    ..aI(2, _omitFieldNames ? '' : 'totalItems')
    ..aI(3, _omitFieldNames ? '' : 'totalPages')
    ..aI(4, _omitFieldNames ? '' : 'currentPage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkersByTenantResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkersByTenantResponse copyWith(
          void Function(GetWorkersByTenantResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetWorkersByTenantResponse))
          as GetWorkersByTenantResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWorkersByTenantResponse create() => GetWorkersByTenantResponse._();
  @$core.override
  GetWorkersByTenantResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetWorkersByTenantResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWorkersByTenantResponse>(create);
  static GetWorkersByTenantResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WorkerProfile> get workers => $_getList(0);

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

class GetNotificationHistoryRequest extends $pb.GeneratedMessage {
  factory GetNotificationHistoryRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.int? page,
    $core.int? limit,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (page != null) result.page = page;
    if (limit != null) result.limit = limit;
    return result;
  }

  GetNotificationHistoryRequest._();

  factory GetNotificationHistoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNotificationHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNotificationHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aI(3, _omitFieldNames ? '' : 'page')
    ..aI(4, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotificationHistoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotificationHistoryRequest copyWith(
          void Function(GetNotificationHistoryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetNotificationHistoryRequest))
          as GetNotificationHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationHistoryRequest create() =>
      GetNotificationHistoryRequest._();
  @$core.override
  GetNotificationHistoryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetNotificationHistoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNotificationHistoryRequest>(create);
  static GetNotificationHistoryRequest? _defaultInstance;

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
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get limit => $_getIZ(3);
  @$pb.TagNumber(4)
  set limit($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLimit() => $_has(3);
  @$pb.TagNumber(4)
  void clearLimit() => $_clearField(4);
}

class NotificationLog extends $pb.GeneratedMessage {
  factory NotificationLog({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? channel,
    $core.String? notificationType,
    $core.String? status,
    $core.String? failureReason,
    $core.int? retryCount,
    $core.String? sentAt,
    $core.String? deliveredAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (channel != null) result.channel = channel;
    if (notificationType != null) result.notificationType = notificationType;
    if (status != null) result.status = status;
    if (failureReason != null) result.failureReason = failureReason;
    if (retryCount != null) result.retryCount = retryCount;
    if (sentAt != null) result.sentAt = sentAt;
    if (deliveredAt != null) result.deliveredAt = deliveredAt;
    return result;
  }

  NotificationLog._();

  factory NotificationLog.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NotificationLog.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NotificationLog',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'channel')
    ..aOS(5, _omitFieldNames ? '' : 'notificationType')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'failureReason')
    ..aI(8, _omitFieldNames ? '' : 'retryCount')
    ..aOS(9, _omitFieldNames ? '' : 'sentAt')
    ..aOS(10, _omitFieldNames ? '' : 'deliveredAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationLog clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NotificationLog copyWith(void Function(NotificationLog) updates) =>
      super.copyWith((message) => updates(message as NotificationLog))
          as NotificationLog;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationLog create() => NotificationLog._();
  @$core.override
  NotificationLog createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NotificationLog getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NotificationLog>(create);
  static NotificationLog? _defaultInstance;

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
  $core.String get channel => $_getSZ(3);
  @$pb.TagNumber(4)
  set channel($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasChannel() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get notificationType => $_getSZ(4);
  @$pb.TagNumber(5)
  set notificationType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNotificationType() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotificationType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get failureReason => $_getSZ(6);
  @$pb.TagNumber(7)
  set failureReason($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFailureReason() => $_has(6);
  @$pb.TagNumber(7)
  void clearFailureReason() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get retryCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set retryCount($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRetryCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearRetryCount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get sentAt => $_getSZ(8);
  @$pb.TagNumber(9)
  set sentAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSentAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearSentAt() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get deliveredAt => $_getSZ(9);
  @$pb.TagNumber(10)
  set deliveredAt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDeliveredAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeliveredAt() => $_clearField(10);
}

class GetNotificationHistoryResponse extends $pb.GeneratedMessage {
  factory GetNotificationHistoryResponse({
    $core.Iterable<NotificationLog>? logs,
    $core.int? totalItems,
    $core.int? totalPages,
    $core.int? currentPage,
  }) {
    final result = create();
    if (logs != null) result.logs.addAll(logs);
    if (totalItems != null) result.totalItems = totalItems;
    if (totalPages != null) result.totalPages = totalPages;
    if (currentPage != null) result.currentPage = currentPage;
    return result;
  }

  GetNotificationHistoryResponse._();

  factory GetNotificationHistoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetNotificationHistoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetNotificationHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<NotificationLog>(1, _omitFieldNames ? '' : 'logs',
        subBuilder: NotificationLog.create)
    ..aI(2, _omitFieldNames ? '' : 'totalItems')
    ..aI(3, _omitFieldNames ? '' : 'totalPages')
    ..aI(4, _omitFieldNames ? '' : 'currentPage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotificationHistoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetNotificationHistoryResponse copyWith(
          void Function(GetNotificationHistoryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetNotificationHistoryResponse))
          as GetNotificationHistoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationHistoryResponse create() =>
      GetNotificationHistoryResponse._();
  @$core.override
  GetNotificationHistoryResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetNotificationHistoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetNotificationHistoryResponse>(create);
  static GetNotificationHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NotificationLog> get logs => $_getList(0);

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

class IngestTelemetryRequest extends $pb.GeneratedMessage {
  factory IngestTelemetryRequest({
    $core.String? workerId,
    $fixnum.Int64? timestampMs,
    $core.String? deviceModel,
    $core.String? osVersion,
    $core.String? networkType,
    $core.bool? isOnline,
    $core.bool? isAirplaneMode,
    $core.String? wifiSsid,
    $core.String? wifiBssid,
    $core.String? wifiIp,
    $core.String? simCarrierName,
    $core.String? simMcc,
    $core.String? simMnc,
    $core.String? mobileNetworkGeneration,
    $core.String? simState,
    $core.double? gpsLatitude,
    $core.double? gpsLongitude,
    $core.double? gpsAccuracy,
    $core.double? accelX,
    $core.double? accelY,
    $core.double? accelZ,
    $core.String? signature,
    $core.String? deviceId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (timestampMs != null) result.timestampMs = timestampMs;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (osVersion != null) result.osVersion = osVersion;
    if (networkType != null) result.networkType = networkType;
    if (isOnline != null) result.isOnline = isOnline;
    if (isAirplaneMode != null) result.isAirplaneMode = isAirplaneMode;
    if (wifiSsid != null) result.wifiSsid = wifiSsid;
    if (wifiBssid != null) result.wifiBssid = wifiBssid;
    if (wifiIp != null) result.wifiIp = wifiIp;
    if (simCarrierName != null) result.simCarrierName = simCarrierName;
    if (simMcc != null) result.simMcc = simMcc;
    if (simMnc != null) result.simMnc = simMnc;
    if (mobileNetworkGeneration != null)
      result.mobileNetworkGeneration = mobileNetworkGeneration;
    if (simState != null) result.simState = simState;
    if (gpsLatitude != null) result.gpsLatitude = gpsLatitude;
    if (gpsLongitude != null) result.gpsLongitude = gpsLongitude;
    if (gpsAccuracy != null) result.gpsAccuracy = gpsAccuracy;
    if (accelX != null) result.accelX = accelX;
    if (accelY != null) result.accelY = accelY;
    if (accelZ != null) result.accelZ = accelZ;
    if (signature != null) result.signature = signature;
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  IngestTelemetryRequest._();

  factory IngestTelemetryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngestTelemetryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngestTelemetryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aInt64(2, _omitFieldNames ? '' : 'timestampMs')
    ..aOS(3, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(4, _omitFieldNames ? '' : 'osVersion')
    ..aOS(5, _omitFieldNames ? '' : 'networkType')
    ..aOB(6, _omitFieldNames ? '' : 'isOnline')
    ..aOB(7, _omitFieldNames ? '' : 'isAirplaneMode')
    ..aOS(8, _omitFieldNames ? '' : 'wifiSsid')
    ..aOS(9, _omitFieldNames ? '' : 'wifiBssid')
    ..aOS(10, _omitFieldNames ? '' : 'wifiIp')
    ..aOS(11, _omitFieldNames ? '' : 'simCarrierName')
    ..aOS(12, _omitFieldNames ? '' : 'simMcc')
    ..aOS(13, _omitFieldNames ? '' : 'simMnc')
    ..aOS(14, _omitFieldNames ? '' : 'mobileNetworkGeneration')
    ..aOS(15, _omitFieldNames ? '' : 'simState')
    ..aD(16, _omitFieldNames ? '' : 'gpsLatitude')
    ..aD(17, _omitFieldNames ? '' : 'gpsLongitude')
    ..aD(18, _omitFieldNames ? '' : 'gpsAccuracy')
    ..aD(19, _omitFieldNames ? '' : 'accelX')
    ..aD(20, _omitFieldNames ? '' : 'accelY')
    ..aD(21, _omitFieldNames ? '' : 'accelZ')
    ..aOS(22, _omitFieldNames ? '' : 'signature')
    ..aOS(23, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestTelemetryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestTelemetryRequest copyWith(
          void Function(IngestTelemetryRequest) updates) =>
      super.copyWith((message) => updates(message as IngestTelemetryRequest))
          as IngestTelemetryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngestTelemetryRequest create() => IngestTelemetryRequest._();
  @$core.override
  IngestTelemetryRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngestTelemetryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngestTelemetryRequest>(create);
  static IngestTelemetryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestampMs => $_getI64(1);
  @$pb.TagNumber(2)
  set timestampMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestampMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestampMs() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceModel => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceModel($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceModel() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceModel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get osVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set osVersion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOsVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearOsVersion() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get networkType => $_getSZ(4);
  @$pb.TagNumber(5)
  set networkType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNetworkType() => $_has(4);
  @$pb.TagNumber(5)
  void clearNetworkType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isOnline => $_getBF(5);
  @$pb.TagNumber(6)
  set isOnline($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsOnline() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsOnline() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isAirplaneMode => $_getBF(6);
  @$pb.TagNumber(7)
  set isAirplaneMode($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsAirplaneMode() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsAirplaneMode() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get wifiSsid => $_getSZ(7);
  @$pb.TagNumber(8)
  set wifiSsid($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasWifiSsid() => $_has(7);
  @$pb.TagNumber(8)
  void clearWifiSsid() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get wifiBssid => $_getSZ(8);
  @$pb.TagNumber(9)
  set wifiBssid($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasWifiBssid() => $_has(8);
  @$pb.TagNumber(9)
  void clearWifiBssid() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get wifiIp => $_getSZ(9);
  @$pb.TagNumber(10)
  set wifiIp($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasWifiIp() => $_has(9);
  @$pb.TagNumber(10)
  void clearWifiIp() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get simCarrierName => $_getSZ(10);
  @$pb.TagNumber(11)
  set simCarrierName($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSimCarrierName() => $_has(10);
  @$pb.TagNumber(11)
  void clearSimCarrierName() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get simMcc => $_getSZ(11);
  @$pb.TagNumber(12)
  set simMcc($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSimMcc() => $_has(11);
  @$pb.TagNumber(12)
  void clearSimMcc() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get simMnc => $_getSZ(12);
  @$pb.TagNumber(13)
  set simMnc($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasSimMnc() => $_has(12);
  @$pb.TagNumber(13)
  void clearSimMnc() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get mobileNetworkGeneration => $_getSZ(13);
  @$pb.TagNumber(14)
  set mobileNetworkGeneration($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasMobileNetworkGeneration() => $_has(13);
  @$pb.TagNumber(14)
  void clearMobileNetworkGeneration() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get simState => $_getSZ(14);
  @$pb.TagNumber(15)
  set simState($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasSimState() => $_has(14);
  @$pb.TagNumber(15)
  void clearSimState() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.double get gpsLatitude => $_getN(15);
  @$pb.TagNumber(16)
  set gpsLatitude($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(16)
  $core.bool hasGpsLatitude() => $_has(15);
  @$pb.TagNumber(16)
  void clearGpsLatitude() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.double get gpsLongitude => $_getN(16);
  @$pb.TagNumber(17)
  set gpsLongitude($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(17)
  $core.bool hasGpsLongitude() => $_has(16);
  @$pb.TagNumber(17)
  void clearGpsLongitude() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get gpsAccuracy => $_getN(17);
  @$pb.TagNumber(18)
  set gpsAccuracy($core.double value) => $_setDouble(17, value);
  @$pb.TagNumber(18)
  $core.bool hasGpsAccuracy() => $_has(17);
  @$pb.TagNumber(18)
  void clearGpsAccuracy() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get accelX => $_getN(18);
  @$pb.TagNumber(19)
  set accelX($core.double value) => $_setDouble(18, value);
  @$pb.TagNumber(19)
  $core.bool hasAccelX() => $_has(18);
  @$pb.TagNumber(19)
  void clearAccelX() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.double get accelY => $_getN(19);
  @$pb.TagNumber(20)
  set accelY($core.double value) => $_setDouble(19, value);
  @$pb.TagNumber(20)
  $core.bool hasAccelY() => $_has(19);
  @$pb.TagNumber(20)
  void clearAccelY() => $_clearField(20);

  @$pb.TagNumber(21)
  $core.double get accelZ => $_getN(20);
  @$pb.TagNumber(21)
  set accelZ($core.double value) => $_setDouble(20, value);
  @$pb.TagNumber(21)
  $core.bool hasAccelZ() => $_has(20);
  @$pb.TagNumber(21)
  void clearAccelZ() => $_clearField(21);

  @$pb.TagNumber(22)
  $core.String get signature => $_getSZ(21);
  @$pb.TagNumber(22)
  set signature($core.String value) => $_setString(21, value);
  @$pb.TagNumber(22)
  $core.bool hasSignature() => $_has(21);
  @$pb.TagNumber(22)
  void clearSignature() => $_clearField(22);

  @$pb.TagNumber(23)
  $core.String get deviceId => $_getSZ(22);
  @$pb.TagNumber(23)
  set deviceId($core.String value) => $_setString(22, value);
  @$pb.TagNumber(23)
  $core.bool hasDeviceId() => $_has(22);
  @$pb.TagNumber(23)
  void clearDeviceId() => $_clearField(23);
}

class IngestTelemetryResponse extends $pb.GeneratedMessage {
  factory IngestTelemetryResponse({
    $core.bool? accepted,
  }) {
    final result = create();
    if (accepted != null) result.accepted = accepted;
    return result;
  }

  IngestTelemetryResponse._();

  factory IngestTelemetryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IngestTelemetryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IngestTelemetryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestTelemetryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IngestTelemetryResponse copyWith(
          void Function(IngestTelemetryResponse) updates) =>
      super.copyWith((message) => updates(message as IngestTelemetryResponse))
          as IngestTelemetryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IngestTelemetryResponse create() => IngestTelemetryResponse._();
  @$core.override
  IngestTelemetryResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IngestTelemetryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IngestTelemetryResponse>(create);
  static IngestTelemetryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => $_clearField(1);
}

class RaiseTelemetrySecurityEventRequest_Change extends $pb.GeneratedMessage {
  factory RaiseTelemetrySecurityEventRequest_Change({
    $core.String? field_1,
    $core.String? from,
    $core.String? to,
    $core.String? severity,
  }) {
    final result = create();
    if (field_1 != null) result.field_1 = field_1;
    if (from != null) result.from = from;
    if (to != null) result.to = to;
    if (severity != null) result.severity = severity;
    return result;
  }

  RaiseTelemetrySecurityEventRequest_Change._();

  factory RaiseTelemetrySecurityEventRequest_Change.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RaiseTelemetrySecurityEventRequest_Change.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RaiseTelemetrySecurityEventRequest.Change',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'field')
    ..aOS(2, _omitFieldNames ? '' : 'from')
    ..aOS(3, _omitFieldNames ? '' : 'to')
    ..aOS(4, _omitFieldNames ? '' : 'severity')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaiseTelemetrySecurityEventRequest_Change clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaiseTelemetrySecurityEventRequest_Change copyWith(
          void Function(RaiseTelemetrySecurityEventRequest_Change) updates) =>
      super.copyWith((message) =>
              updates(message as RaiseTelemetrySecurityEventRequest_Change))
          as RaiseTelemetrySecurityEventRequest_Change;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaiseTelemetrySecurityEventRequest_Change create() =>
      RaiseTelemetrySecurityEventRequest_Change._();
  @$core.override
  RaiseTelemetrySecurityEventRequest_Change createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RaiseTelemetrySecurityEventRequest_Change getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RaiseTelemetrySecurityEventRequest_Change>(create);
  static RaiseTelemetrySecurityEventRequest_Change? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get field_1 => $_getSZ(0);
  @$pb.TagNumber(1)
  set field_1($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasField_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearField_1() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get from => $_getSZ(1);
  @$pb.TagNumber(2)
  set from($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(3)
  set to($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get severity => $_getSZ(3);
  @$pb.TagNumber(4)
  set severity($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSeverity() => $_has(3);
  @$pb.TagNumber(4)
  void clearSeverity() => $_clearField(4);
}

class RaiseTelemetrySecurityEventRequest extends $pb.GeneratedMessage {
  factory RaiseTelemetrySecurityEventRequest({
    $core.String? workerId,
    $fixnum.Int64? timestampMs,
    $core.String? deviceModel,
    $core.String? osVersion,
    $core.double? gpsLatitude,
    $core.double? gpsLongitude,
    $core.String? signature,
    $core.String? deviceId,
    $core.Iterable<RaiseTelemetrySecurityEventRequest_Change>? changes,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (timestampMs != null) result.timestampMs = timestampMs;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (osVersion != null) result.osVersion = osVersion;
    if (gpsLatitude != null) result.gpsLatitude = gpsLatitude;
    if (gpsLongitude != null) result.gpsLongitude = gpsLongitude;
    if (signature != null) result.signature = signature;
    if (deviceId != null) result.deviceId = deviceId;
    if (changes != null) result.changes.addAll(changes);
    return result;
  }

  RaiseTelemetrySecurityEventRequest._();

  factory RaiseTelemetrySecurityEventRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RaiseTelemetrySecurityEventRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RaiseTelemetrySecurityEventRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aInt64(2, _omitFieldNames ? '' : 'timestampMs')
    ..aOS(3, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(4, _omitFieldNames ? '' : 'osVersion')
    ..aD(5, _omitFieldNames ? '' : 'gpsLatitude')
    ..aD(6, _omitFieldNames ? '' : 'gpsLongitude')
    ..aOS(7, _omitFieldNames ? '' : 'signature')
    ..aOS(8, _omitFieldNames ? '' : 'deviceId')
    ..pPM<RaiseTelemetrySecurityEventRequest_Change>(
        9, _omitFieldNames ? '' : 'changes',
        subBuilder: RaiseTelemetrySecurityEventRequest_Change.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaiseTelemetrySecurityEventRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaiseTelemetrySecurityEventRequest copyWith(
          void Function(RaiseTelemetrySecurityEventRequest) updates) =>
      super.copyWith((message) =>
              updates(message as RaiseTelemetrySecurityEventRequest))
          as RaiseTelemetrySecurityEventRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaiseTelemetrySecurityEventRequest create() =>
      RaiseTelemetrySecurityEventRequest._();
  @$core.override
  RaiseTelemetrySecurityEventRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RaiseTelemetrySecurityEventRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RaiseTelemetrySecurityEventRequest>(
          create);
  static RaiseTelemetrySecurityEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timestampMs => $_getI64(1);
  @$pb.TagNumber(2)
  set timestampMs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestampMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestampMs() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceModel => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceModel($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceModel() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceModel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get osVersion => $_getSZ(3);
  @$pb.TagNumber(4)
  set osVersion($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOsVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearOsVersion() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get gpsLatitude => $_getN(4);
  @$pb.TagNumber(5)
  set gpsLatitude($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasGpsLatitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearGpsLatitude() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get gpsLongitude => $_getN(5);
  @$pb.TagNumber(6)
  set gpsLongitude($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasGpsLongitude() => $_has(5);
  @$pb.TagNumber(6)
  void clearGpsLongitude() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get signature => $_getSZ(6);
  @$pb.TagNumber(7)
  set signature($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSignature() => $_has(6);
  @$pb.TagNumber(7)
  void clearSignature() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get deviceId => $_getSZ(7);
  @$pb.TagNumber(8)
  set deviceId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDeviceId() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeviceId() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<RaiseTelemetrySecurityEventRequest_Change> get changes =>
      $_getList(8);
}

class RaiseTelemetrySecurityEventResponse extends $pb.GeneratedMessage {
  factory RaiseTelemetrySecurityEventResponse({
    $core.bool? accepted,
  }) {
    final result = create();
    if (accepted != null) result.accepted = accepted;
    return result;
  }

  RaiseTelemetrySecurityEventResponse._();

  factory RaiseTelemetrySecurityEventResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RaiseTelemetrySecurityEventResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RaiseTelemetrySecurityEventResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaiseTelemetrySecurityEventResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RaiseTelemetrySecurityEventResponse copyWith(
          void Function(RaiseTelemetrySecurityEventResponse) updates) =>
      super.copyWith((message) =>
              updates(message as RaiseTelemetrySecurityEventResponse))
          as RaiseTelemetrySecurityEventResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RaiseTelemetrySecurityEventResponse create() =>
      RaiseTelemetrySecurityEventResponse._();
  @$core.override
  RaiseTelemetrySecurityEventResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RaiseTelemetrySecurityEventResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RaiseTelemetrySecurityEventResponse>(create);
  static RaiseTelemetrySecurityEventResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => $_clearField(1);
}

class RegisterDeviceRequest extends $pb.GeneratedMessage {
  factory RegisterDeviceRequest({
    $core.String? workerId,
    $core.String? deviceId,
    $core.String? publicKey,
    $core.String? deviceModel,
    $core.String? osVersion,
    $core.String? platform,
    $core.String? changeReason,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    if (publicKey != null) result.publicKey = publicKey;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (osVersion != null) result.osVersion = osVersion;
    if (platform != null) result.platform = platform;
    if (changeReason != null) result.changeReason = changeReason;
    return result;
  }

  RegisterDeviceRequest._();

  factory RegisterDeviceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterDeviceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterDeviceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..aOS(3, _omitFieldNames ? '' : 'publicKey')
    ..aOS(4, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(5, _omitFieldNames ? '' : 'osVersion')
    ..aOS(6, _omitFieldNames ? '' : 'platform')
    ..aOS(7, _omitFieldNames ? '' : 'changeReason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterDeviceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterDeviceRequest copyWith(
          void Function(RegisterDeviceRequest) updates) =>
      super.copyWith((message) => updates(message as RegisterDeviceRequest))
          as RegisterDeviceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterDeviceRequest create() => RegisterDeviceRequest._();
  @$core.override
  RegisterDeviceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterDeviceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterDeviceRequest>(create);
  static RegisterDeviceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get deviceModel => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceModel($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceModel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get osVersion => $_getSZ(4);
  @$pb.TagNumber(5)
  set osVersion($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOsVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearOsVersion() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get platform => $_getSZ(5);
  @$pb.TagNumber(6)
  set platform($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPlatform() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlatform() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get changeReason => $_getSZ(6);
  @$pb.TagNumber(7)
  set changeReason($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasChangeReason() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangeReason() => $_clearField(7);
}

class RegisterDeviceResponse extends $pb.GeneratedMessage {
  factory RegisterDeviceResponse({
    $core.bool? accepted,
  }) {
    final result = create();
    if (accepted != null) result.accepted = accepted;
    return result;
  }

  RegisterDeviceResponse._();

  factory RegisterDeviceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterDeviceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterDeviceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterDeviceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterDeviceResponse copyWith(
          void Function(RegisterDeviceResponse) updates) =>
      super.copyWith((message) => updates(message as RegisterDeviceResponse))
          as RegisterDeviceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterDeviceResponse create() => RegisterDeviceResponse._();
  @$core.override
  RegisterDeviceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterDeviceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterDeviceResponse>(create);
  static RegisterDeviceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
