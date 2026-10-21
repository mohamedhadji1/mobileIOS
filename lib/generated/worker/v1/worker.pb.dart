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

class ParseCvRequest extends $pb.GeneratedMessage {
  factory ParseCvRequest({
    $core.String? storedPath,
    $core.String? workerId,
  }) {
    final result = create();
    if (storedPath != null) result.storedPath = storedPath;
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  ParseCvRequest._();

  factory ParseCvRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParseCvRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParseCvRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storedPath')
    ..aOS(3, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseCvRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseCvRequest copyWith(void Function(ParseCvRequest) updates) =>
      super.copyWith((message) => updates(message as ParseCvRequest))
          as ParseCvRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseCvRequest create() => ParseCvRequest._();
  @$core.override
  ParseCvRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParseCvRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParseCvRequest>(create);
  static ParseCvRequest? _defaultInstance;

  /// Object key returned by GenerateUploadURL: {tenant_id}/{worker_id}/{uuid}.{ext}
  @$pb.TagNumber(1)
  $core.String get storedPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set storedPath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoredPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoredPath() => $_clearField(1);

  /// Worker the CV belongs to. Empty = the calling worker; staff callers must set it.
  @$pb.TagNumber(3)
  $core.String get workerId => $_getSZ(1);
  @$pb.TagNumber(3)
  set workerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasWorkerId() => $_has(1);
  @$pb.TagNumber(3)
  void clearWorkerId() => $_clearField(3);
}

class CvJob extends $pb.GeneratedMessage {
  factory CvJob({
    $core.String? employer,
    $core.String? title,
    $core.String? startDate,
    $core.String? endDate,
    $core.String? description,
    $core.String? location,
    $core.bool? needsCheck,
  }) {
    final result = create();
    if (employer != null) result.employer = employer;
    if (title != null) result.title = title;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (description != null) result.description = description;
    if (location != null) result.location = location;
    if (needsCheck != null) result.needsCheck = needsCheck;
    return result;
  }

  CvJob._();

  factory CvJob.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CvJob.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CvJob',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'employer')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'startDate')
    ..aOS(4, _omitFieldNames ? '' : 'endDate')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'location')
    ..aOB(7, _omitFieldNames ? '' : 'needsCheck')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvJob clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvJob copyWith(void Function(CvJob) updates) =>
      super.copyWith((message) => updates(message as CvJob)) as CvJob;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CvJob create() => CvJob._();
  @$core.override
  CvJob createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CvJob getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CvJob>(create);
  static CvJob? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get employer => $_getSZ(0);
  @$pb.TagNumber(1)
  set employer($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmployer() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmployer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get startDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set startDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStartDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartDate() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get endDate => $_getSZ(3);
  @$pb.TagNumber(4)
  set endDate($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndDate() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get location => $_getSZ(5);
  @$pb.TagNumber(6)
  set location($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLocation() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocation() => $_clearField(6);

  /// true when the reading is a guess: show it for the worker to confirm instead
  /// of saving it as it is.
  @$pb.TagNumber(7)
  $core.bool get needsCheck => $_getBF(6);
  @$pb.TagNumber(7)
  set needsCheck($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNeedsCheck() => $_has(6);
  @$pb.TagNumber(7)
  void clearNeedsCheck() => $_clearField(7);
}

class CvQualification extends $pb.GeneratedMessage {
  factory CvQualification({
    $core.String? type,
    $core.String? institution,
    $core.String? title,
    $core.String? location,
    $core.bool? needsCheck,
  }) {
    final result = create();
    if (type != null) result.type = type;
    if (institution != null) result.institution = institution;
    if (title != null) result.title = title;
    if (location != null) result.location = location;
    if (needsCheck != null) result.needsCheck = needsCheck;
    return result;
  }

  CvQualification._();

  factory CvQualification.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CvQualification.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CvQualification',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..aOS(2, _omitFieldNames ? '' : 'institution')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'location')
    ..aOB(5, _omitFieldNames ? '' : 'needsCheck')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvQualification clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvQualification copyWith(void Function(CvQualification) updates) =>
      super.copyWith((message) => updates(message as CvQualification))
          as CvQualification;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CvQualification create() => CvQualification._();
  @$core.override
  CvQualification createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CvQualification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CvQualification>(create);
  static CvQualification? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get institution => $_getSZ(1);
  @$pb.TagNumber(2)
  set institution($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasInstitution() => $_has(1);
  @$pb.TagNumber(2)
  void clearInstitution() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get location => $_getSZ(3);
  @$pb.TagNumber(4)
  set location($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocation() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get needsCheck => $_getBF(4);
  @$pb.TagNumber(5)
  set needsCheck($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNeedsCheck() => $_has(4);
  @$pb.TagNumber(5)
  void clearNeedsCheck() => $_clearField(5);
}

/// A link a PDF carries (a certificate's verification page, a profile). The
/// uploader chose these addresses: show them as text, and never open one from
/// the server without checking it first.
class CvLink extends $pb.GeneratedMessage {
  factory CvLink({
    $core.String? uri,
    $core.String? text,
    $core.String? line,
    $core.int? page,
  }) {
    final result = create();
    if (uri != null) result.uri = uri;
    if (text != null) result.text = text;
    if (line != null) result.line = line;
    if (page != null) result.page = page;
    return result;
  }

  CvLink._();

  factory CvLink.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CvLink.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CvLink',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uri')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOS(3, _omitFieldNames ? '' : 'line')
    ..aI(4, _omitFieldNames ? '' : 'page')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvLink clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvLink copyWith(void Function(CvLink) updates) =>
      super.copyWith((message) => updates(message as CvLink)) as CvLink;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CvLink create() => CvLink._();
  @$core.override
  CvLink createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CvLink getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CvLink>(create);
  static CvLink? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uri => $_getSZ(0);
  @$pb.TagNumber(1)
  set uri($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUri() => $_has(0);
  @$pb.TagNumber(1)
  void clearUri() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get line => $_getSZ(2);
  @$pb.TagNumber(3)
  set line($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLine() => $_has(2);
  @$pb.TagNumber(3)
  void clearLine() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get page => $_getIZ(3);
  @$pb.TagNumber(4)
  set page($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => $_clearField(4);
}

/// Contact details read off the CV. A CV rarely labels them, so most are read
/// from where they sit on the page — needs_check says so.
class CvContact extends $pb.GeneratedMessage {
  factory CvContact({
    $core.String? fullName,
    $core.String? location,
    $core.String? currentTitle,
    $core.String? email,
    $core.String? phone,
    $core.bool? needsCheck,
  }) {
    final result = create();
    if (fullName != null) result.fullName = fullName;
    if (location != null) result.location = location;
    if (currentTitle != null) result.currentTitle = currentTitle;
    if (email != null) result.email = email;
    if (phone != null) result.phone = phone;
    if (needsCheck != null) result.needsCheck = needsCheck;
    return result;
  }

  CvContact._();

  factory CvContact.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CvContact.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CvContact',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fullName')
    ..aOS(2, _omitFieldNames ? '' : 'location')
    ..aOS(3, _omitFieldNames ? '' : 'currentTitle')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'phone')
    ..aOB(6, _omitFieldNames ? '' : 'needsCheck')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvContact clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CvContact copyWith(void Function(CvContact) updates) =>
      super.copyWith((message) => updates(message as CvContact)) as CvContact;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CvContact create() => CvContact._();
  @$core.override
  CvContact createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CvContact getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CvContact>(create);
  static CvContact? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fullName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fullName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFullName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFullName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get location => $_getSZ(1);
  @$pb.TagNumber(2)
  set location($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocation() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get currentTitle => $_getSZ(2);
  @$pb.TagNumber(3)
  set currentTitle($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(5)
  set phone($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get needsCheck => $_getBF(5);
  @$pb.TagNumber(6)
  set needsCheck($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNeedsCheck() => $_has(5);
  @$pb.TagNumber(6)
  void clearNeedsCheck() => $_clearField(6);
}

class ParseCvResponse extends $pb.GeneratedMessage {
  factory ParseCvResponse({
    $core.Iterable<CvJob>? jobs,
    $core.Iterable<CvQualification>? qualifications,
    $core.String? rawText,
    $core.Iterable<CvLink>? links,
    CvContact? contact,
  }) {
    final result = create();
    if (jobs != null) result.jobs.addAll(jobs);
    if (qualifications != null) result.qualifications.addAll(qualifications);
    if (rawText != null) result.rawText = rawText;
    if (links != null) result.links.addAll(links);
    if (contact != null) result.contact = contact;
    return result;
  }

  ParseCvResponse._();

  factory ParseCvResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParseCvResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParseCvResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<CvJob>(1, _omitFieldNames ? '' : 'jobs', subBuilder: CvJob.create)
    ..pPM<CvQualification>(2, _omitFieldNames ? '' : 'qualifications',
        subBuilder: CvQualification.create)
    ..aOS(3, _omitFieldNames ? '' : 'rawText')
    ..pPM<CvLink>(4, _omitFieldNames ? '' : 'links', subBuilder: CvLink.create)
    ..aOM<CvContact>(5, _omitFieldNames ? '' : 'contact',
        subBuilder: CvContact.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseCvResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseCvResponse copyWith(void Function(ParseCvResponse) updates) =>
      super.copyWith((message) => updates(message as ParseCvResponse))
          as ParseCvResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseCvResponse create() => ParseCvResponse._();
  @$core.override
  ParseCvResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParseCvResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParseCvResponse>(create);
  static ParseCvResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CvJob> get jobs => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<CvQualification> get qualifications => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get rawText => $_getSZ(2);
  @$pb.TagNumber(3)
  set rawText($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRawText() => $_has(2);
  @$pb.TagNumber(3)
  void clearRawText() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<CvLink> get links => $_getList(3);

  @$pb.TagNumber(5)
  CvContact get contact => $_getN(4);
  @$pb.TagNumber(5)
  set contact(CvContact value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasContact() => $_has(4);
  @$pb.TagNumber(5)
  void clearContact() => $_clearField(5);
  @$pb.TagNumber(5)
  CvContact ensureContact() => $_ensure(4);
}

class GetInstitutionOutreachRequest extends $pb.GeneratedMessage {
  factory GetInstitutionOutreachRequest({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  GetInstitutionOutreachRequest._();

  factory GetInstitutionOutreachRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstitutionOutreachRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstitutionOutreachRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstitutionOutreachRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstitutionOutreachRequest copyWith(
          void Function(GetInstitutionOutreachRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetInstitutionOutreachRequest))
          as GetInstitutionOutreachRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstitutionOutreachRequest create() =>
      GetInstitutionOutreachRequest._();
  @$core.override
  GetInstitutionOutreachRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstitutionOutreachRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstitutionOutreachRequest>(create);
  static GetInstitutionOutreachRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class DiplomaExtraction extends $pb.GeneratedMessage {
  factory DiplomaExtraction({
    $core.String? qualificationId,
    $core.String? documentId,
    $core.String? holderName,
    $core.String? degree,
    $core.String? institution,
    $core.String? institutionEmail,
    $core.String? graduationYear,
    $core.double? confidence,
    $core.Iterable<CvLink>? links,
  }) {
    final result = create();
    if (qualificationId != null) result.qualificationId = qualificationId;
    if (documentId != null) result.documentId = documentId;
    if (holderName != null) result.holderName = holderName;
    if (degree != null) result.degree = degree;
    if (institution != null) result.institution = institution;
    if (institutionEmail != null) result.institutionEmail = institutionEmail;
    if (graduationYear != null) result.graduationYear = graduationYear;
    if (confidence != null) result.confidence = confidence;
    if (links != null) result.links.addAll(links);
    return result;
  }

  DiplomaExtraction._();

  factory DiplomaExtraction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DiplomaExtraction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DiplomaExtraction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'qualificationId')
    ..aOS(2, _omitFieldNames ? '' : 'documentId')
    ..aOS(3, _omitFieldNames ? '' : 'holderName')
    ..aOS(4, _omitFieldNames ? '' : 'degree')
    ..aOS(5, _omitFieldNames ? '' : 'institution')
    ..aOS(6, _omitFieldNames ? '' : 'institutionEmail')
    ..aOS(7, _omitFieldNames ? '' : 'graduationYear')
    ..aD(8, _omitFieldNames ? '' : 'confidence')
    ..pPM<CvLink>(9, _omitFieldNames ? '' : 'links', subBuilder: CvLink.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DiplomaExtraction clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DiplomaExtraction copyWith(void Function(DiplomaExtraction) updates) =>
      super.copyWith((message) => updates(message as DiplomaExtraction))
          as DiplomaExtraction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DiplomaExtraction create() => DiplomaExtraction._();
  @$core.override
  DiplomaExtraction createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DiplomaExtraction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DiplomaExtraction>(create);
  static DiplomaExtraction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get qualificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set qualificationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQualificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQualificationId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get documentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set documentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDocumentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDocumentId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get holderName => $_getSZ(2);
  @$pb.TagNumber(3)
  set holderName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHolderName() => $_has(2);
  @$pb.TagNumber(3)
  void clearHolderName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get degree => $_getSZ(3);
  @$pb.TagNumber(4)
  set degree($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDegree() => $_has(3);
  @$pb.TagNumber(4)
  void clearDegree() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get institution => $_getSZ(4);
  @$pb.TagNumber(5)
  set institution($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInstitution() => $_has(4);
  @$pb.TagNumber(5)
  void clearInstitution() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get institutionEmail => $_getSZ(5);
  @$pb.TagNumber(6)
  set institutionEmail($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInstitutionEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearInstitutionEmail() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get graduationYear => $_getSZ(6);
  @$pb.TagNumber(7)
  set graduationYear($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasGraduationYear() => $_has(6);
  @$pb.TagNumber(7)
  void clearGraduationYear() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get confidence => $_getN(7);
  @$pb.TagNumber(8)
  set confidence($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasConfidence() => $_has(7);
  @$pb.TagNumber(8)
  void clearConfidence() => $_clearField(8);

  /// Links printed in the document, e.g. a certificate's own verification page.
  /// Shown to the analyst as text; never opened by the server unchecked.
  @$pb.TagNumber(9)
  $pb.PbList<CvLink> get links => $_getList(8);
}

class OutreachTemplate extends $pb.GeneratedMessage {
  factory OutreachTemplate({
    $core.String? subject,
    $core.String? body,
  }) {
    final result = create();
    if (subject != null) result.subject = subject;
    if (body != null) result.body = body;
    return result;
  }

  OutreachTemplate._();

  factory OutreachTemplate.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutreachTemplate.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutreachTemplate',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subject')
    ..aOS(2, _omitFieldNames ? '' : 'body')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutreachTemplate clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutreachTemplate copyWith(void Function(OutreachTemplate) updates) =>
      super.copyWith((message) => updates(message as OutreachTemplate))
          as OutreachTemplate;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutreachTemplate create() => OutreachTemplate._();
  @$core.override
  OutreachTemplate createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutreachTemplate getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutreachTemplate>(create);
  static OutreachTemplate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subject => $_getSZ(0);
  @$pb.TagNumber(1)
  set subject($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubject() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubject() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get body => $_getSZ(1);
  @$pb.TagNumber(2)
  set body($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBody() => $_has(1);
  @$pb.TagNumber(2)
  void clearBody() => $_clearField(2);
}

class InstitutionOutreach extends $pb.GeneratedMessage {
  factory InstitutionOutreach({
    $core.String? outreachId,
    $core.String? status,
    $core.String? toAddress,
    $core.String? subject,
    $core.String? body,
    $core.String? sentAt,
    $core.String? responseReceivedAt,
    $core.String? responseContent,
    $core.String? responseVerdict,
  }) {
    final result = create();
    if (outreachId != null) result.outreachId = outreachId;
    if (status != null) result.status = status;
    if (toAddress != null) result.toAddress = toAddress;
    if (subject != null) result.subject = subject;
    if (body != null) result.body = body;
    if (sentAt != null) result.sentAt = sentAt;
    if (responseReceivedAt != null)
      result.responseReceivedAt = responseReceivedAt;
    if (responseContent != null) result.responseContent = responseContent;
    if (responseVerdict != null) result.responseVerdict = responseVerdict;
    return result;
  }

  InstitutionOutreach._();

  factory InstitutionOutreach.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InstitutionOutreach.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InstitutionOutreach',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'outreachId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'toAddress')
    ..aOS(4, _omitFieldNames ? '' : 'subject')
    ..aOS(5, _omitFieldNames ? '' : 'body')
    ..aOS(6, _omitFieldNames ? '' : 'sentAt')
    ..aOS(7, _omitFieldNames ? '' : 'responseReceivedAt')
    ..aOS(8, _omitFieldNames ? '' : 'responseContent')
    ..aOS(9, _omitFieldNames ? '' : 'responseVerdict')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstitutionOutreach clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstitutionOutreach copyWith(void Function(InstitutionOutreach) updates) =>
      super.copyWith((message) => updates(message as InstitutionOutreach))
          as InstitutionOutreach;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InstitutionOutreach create() => InstitutionOutreach._();
  @$core.override
  InstitutionOutreach createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InstitutionOutreach getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InstitutionOutreach>(create);
  static InstitutionOutreach? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get outreachId => $_getSZ(0);
  @$pb.TagNumber(1)
  set outreachId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOutreachId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutreachId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get toAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set toAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get subject => $_getSZ(3);
  @$pb.TagNumber(4)
  set subject($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSubject() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubject() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get body => $_getSZ(4);
  @$pb.TagNumber(5)
  set body($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBody() => $_has(4);
  @$pb.TagNumber(5)
  void clearBody() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get sentAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set sentAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSentAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearSentAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get responseReceivedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set responseReceivedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasResponseReceivedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearResponseReceivedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get responseContent => $_getSZ(7);
  @$pb.TagNumber(8)
  set responseContent($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasResponseContent() => $_has(7);
  @$pb.TagNumber(8)
  void clearResponseContent() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get responseVerdict => $_getSZ(8);
  @$pb.TagNumber(9)
  set responseVerdict($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasResponseVerdict() => $_has(8);
  @$pb.TagNumber(9)
  void clearResponseVerdict() => $_clearField(9);
}

class GetInstitutionOutreachResponse extends $pb.GeneratedMessage {
  factory GetInstitutionOutreachResponse({
    DiplomaExtraction? diploma,
    OutreachTemplate? template,
    InstitutionOutreach? latest,
  }) {
    final result = create();
    if (diploma != null) result.diploma = diploma;
    if (template != null) result.template = template;
    if (latest != null) result.latest = latest;
    return result;
  }

  GetInstitutionOutreachResponse._();

  factory GetInstitutionOutreachResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstitutionOutreachResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstitutionOutreachResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOM<DiplomaExtraction>(1, _omitFieldNames ? '' : 'diploma',
        subBuilder: DiplomaExtraction.create)
    ..aOM<OutreachTemplate>(2, _omitFieldNames ? '' : 'template',
        subBuilder: OutreachTemplate.create)
    ..aOM<InstitutionOutreach>(3, _omitFieldNames ? '' : 'latest',
        subBuilder: InstitutionOutreach.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstitutionOutreachResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstitutionOutreachResponse copyWith(
          void Function(GetInstitutionOutreachResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetInstitutionOutreachResponse))
          as GetInstitutionOutreachResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstitutionOutreachResponse create() =>
      GetInstitutionOutreachResponse._();
  @$core.override
  GetInstitutionOutreachResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstitutionOutreachResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstitutionOutreachResponse>(create);
  static GetInstitutionOutreachResponse? _defaultInstance;

  @$pb.TagNumber(1)
  DiplomaExtraction get diploma => $_getN(0);
  @$pb.TagNumber(1)
  set diploma(DiplomaExtraction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDiploma() => $_has(0);
  @$pb.TagNumber(1)
  void clearDiploma() => $_clearField(1);
  @$pb.TagNumber(1)
  DiplomaExtraction ensureDiploma() => $_ensure(0);

  @$pb.TagNumber(2)
  OutreachTemplate get template => $_getN(1);
  @$pb.TagNumber(2)
  set template(OutreachTemplate value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTemplate() => $_has(1);
  @$pb.TagNumber(2)
  void clearTemplate() => $_clearField(2);
  @$pb.TagNumber(2)
  OutreachTemplate ensureTemplate() => $_ensure(1);

  @$pb.TagNumber(3)
  InstitutionOutreach get latest => $_getN(2);
  @$pb.TagNumber(3)
  set latest(InstitutionOutreach value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLatest() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatest() => $_clearField(3);
  @$pb.TagNumber(3)
  InstitutionOutreach ensureLatest() => $_ensure(2);
}

class SendInstitutionOutreachRequest extends $pb.GeneratedMessage {
  factory SendInstitutionOutreachRequest({
    $core.String? workerId,
    $core.String? qualificationId,
    $core.String? toAddress,
    $core.String? subject,
    $core.String? body,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (qualificationId != null) result.qualificationId = qualificationId;
    if (toAddress != null) result.toAddress = toAddress;
    if (subject != null) result.subject = subject;
    if (body != null) result.body = body;
    return result;
  }

  SendInstitutionOutreachRequest._();

  factory SendInstitutionOutreachRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendInstitutionOutreachRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendInstitutionOutreachRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'qualificationId')
    ..aOS(3, _omitFieldNames ? '' : 'toAddress')
    ..aOS(4, _omitFieldNames ? '' : 'subject')
    ..aOS(5, _omitFieldNames ? '' : 'body')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendInstitutionOutreachRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendInstitutionOutreachRequest copyWith(
          void Function(SendInstitutionOutreachRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SendInstitutionOutreachRequest))
          as SendInstitutionOutreachRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendInstitutionOutreachRequest create() =>
      SendInstitutionOutreachRequest._();
  @$core.override
  SendInstitutionOutreachRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendInstitutionOutreachRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendInstitutionOutreachRequest>(create);
  static SendInstitutionOutreachRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get qualificationId => $_getSZ(1);
  @$pb.TagNumber(2)
  set qualificationId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQualificationId() => $_has(1);
  @$pb.TagNumber(2)
  void clearQualificationId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get toAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set toAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasToAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearToAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get subject => $_getSZ(3);
  @$pb.TagNumber(4)
  set subject($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSubject() => $_has(3);
  @$pb.TagNumber(4)
  void clearSubject() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get body => $_getSZ(4);
  @$pb.TagNumber(5)
  set body($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBody() => $_has(4);
  @$pb.TagNumber(5)
  void clearBody() => $_clearField(5);
}

class SendInstitutionOutreachResponse extends $pb.GeneratedMessage {
  factory SendInstitutionOutreachResponse({
    InstitutionOutreach? outreach,
  }) {
    final result = create();
    if (outreach != null) result.outreach = outreach;
    return result;
  }

  SendInstitutionOutreachResponse._();

  factory SendInstitutionOutreachResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendInstitutionOutreachResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendInstitutionOutreachResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOM<InstitutionOutreach>(1, _omitFieldNames ? '' : 'outreach',
        subBuilder: InstitutionOutreach.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendInstitutionOutreachResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendInstitutionOutreachResponse copyWith(
          void Function(SendInstitutionOutreachResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SendInstitutionOutreachResponse))
          as SendInstitutionOutreachResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendInstitutionOutreachResponse create() =>
      SendInstitutionOutreachResponse._();
  @$core.override
  SendInstitutionOutreachResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendInstitutionOutreachResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendInstitutionOutreachResponse>(
          create);
  static SendInstitutionOutreachResponse? _defaultInstance;

  @$pb.TagNumber(1)
  InstitutionOutreach get outreach => $_getN(0);
  @$pb.TagNumber(1)
  set outreach(InstitutionOutreach value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOutreach() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutreach() => $_clearField(1);
  @$pb.TagNumber(1)
  InstitutionOutreach ensureOutreach() => $_ensure(0);
}

class ListOutreachRepliesRequest extends $pb.GeneratedMessage {
  factory ListOutreachRepliesRequest({
    $core.String? since,
  }) {
    final result = create();
    if (since != null) result.since = since;
    return result;
  }

  ListOutreachRepliesRequest._();

  factory ListOutreachRepliesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListOutreachRepliesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListOutreachRepliesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'since')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListOutreachRepliesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListOutreachRepliesRequest copyWith(
          void Function(ListOutreachRepliesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListOutreachRepliesRequest))
          as ListOutreachRepliesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOutreachRepliesRequest create() => ListOutreachRepliesRequest._();
  @$core.override
  ListOutreachRepliesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListOutreachRepliesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListOutreachRepliesRequest>(create);
  static ListOutreachRepliesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get since => $_getSZ(0);
  @$pb.TagNumber(1)
  set since($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSince() => $_has(0);
  @$pb.TagNumber(1)
  void clearSince() => $_clearField(1);
}

class OutreachReply extends $pb.GeneratedMessage {
  factory OutreachReply({
    $core.String? outreachId,
    $core.String? workerId,
    $core.String? workerName,
    $core.String? institution,
    $core.String? receivedAt,
    $core.String? responseVerdict,
  }) {
    final result = create();
    if (outreachId != null) result.outreachId = outreachId;
    if (workerId != null) result.workerId = workerId;
    if (workerName != null) result.workerName = workerName;
    if (institution != null) result.institution = institution;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (responseVerdict != null) result.responseVerdict = responseVerdict;
    return result;
  }

  OutreachReply._();

  factory OutreachReply.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OutreachReply.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OutreachReply',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'outreachId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'workerName')
    ..aOS(4, _omitFieldNames ? '' : 'institution')
    ..aOS(5, _omitFieldNames ? '' : 'receivedAt')
    ..aOS(6, _omitFieldNames ? '' : 'responseVerdict')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutreachReply clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OutreachReply copyWith(void Function(OutreachReply) updates) =>
      super.copyWith((message) => updates(message as OutreachReply))
          as OutreachReply;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OutreachReply create() => OutreachReply._();
  @$core.override
  OutreachReply createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OutreachReply getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OutreachReply>(create);
  static OutreachReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get outreachId => $_getSZ(0);
  @$pb.TagNumber(1)
  set outreachId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOutreachId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOutreachId() => $_clearField(1);

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
  $core.String get institution => $_getSZ(3);
  @$pb.TagNumber(4)
  set institution($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInstitution() => $_has(3);
  @$pb.TagNumber(4)
  void clearInstitution() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get receivedAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set receivedAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReceivedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceivedAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get responseVerdict => $_getSZ(5);
  @$pb.TagNumber(6)
  set responseVerdict($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasResponseVerdict() => $_has(5);
  @$pb.TagNumber(6)
  void clearResponseVerdict() => $_clearField(6);
}

class ListOutreachRepliesResponse extends $pb.GeneratedMessage {
  factory ListOutreachRepliesResponse({
    $core.Iterable<OutreachReply>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListOutreachRepliesResponse._();

  factory ListOutreachRepliesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListOutreachRepliesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListOutreachRepliesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<OutreachReply>(1, _omitFieldNames ? '' : 'items',
        subBuilder: OutreachReply.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListOutreachRepliesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListOutreachRepliesResponse copyWith(
          void Function(ListOutreachRepliesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListOutreachRepliesResponse))
          as ListOutreachRepliesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListOutreachRepliesResponse create() =>
      ListOutreachRepliesResponse._();
  @$core.override
  ListOutreachRepliesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListOutreachRepliesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListOutreachRepliesResponse>(create);
  static ListOutreachRepliesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<OutreachReply> get items => $_getList(0);
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
    $core.String? description,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (employerName != null) result.employerName = employerName;
    if (contactEmail != null) result.contactEmail = contactEmail;
    if (position != null) result.position = position;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (description != null) result.description = description;
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
    ..aOS(8, _omitFieldNames ? '' : 'description')
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

  /// Optional. With an address the request is emailed straight away (status
  /// PENDING). Without one the entry is only saved (status UNVERIFIED) and waits
  /// for SendReferenceRequest; it does not count toward the open-reference cap.
  @$pb.TagNumber(4)
  $core.String get contactEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set contactEmail($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContactEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearContactEmail() => $_clearField(4);

  /// The job title only (max 255 characters).
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

  /// What the worker did in that job (CvJob.description), max 2000 characters.
  /// Send it here, not appended to position. A position of the form
  /// "Title — description" with this field empty is still split for older builds.
  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => $_clearField(8);
}

class SendReferenceRequestRequest extends $pb.GeneratedMessage {
  factory SendReferenceRequestRequest({
    $core.String? referenceId,
    $core.String? toAddress,
  }) {
    final result = create();
    if (referenceId != null) result.referenceId = referenceId;
    if (toAddress != null) result.toAddress = toAddress;
    return result;
  }

  SendReferenceRequestRequest._();

  factory SendReferenceRequestRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendReferenceRequestRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendReferenceRequestRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referenceId')
    ..aOS(2, _omitFieldNames ? '' : 'toAddress')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendReferenceRequestRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendReferenceRequestRequest copyWith(
          void Function(SendReferenceRequestRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SendReferenceRequestRequest))
          as SendReferenceRequestRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendReferenceRequestRequest create() =>
      SendReferenceRequestRequest._();
  @$core.override
  SendReferenceRequestRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendReferenceRequestRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendReferenceRequestRequest>(create);
  static SendReferenceRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get referenceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set referenceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReferenceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReferenceId() => $_clearField(1);

  /// The employer's address. Replaces whatever the entry was saved with.
  @$pb.TagNumber(2)
  $core.String get toAddress => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAddress($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddress() => $_clearField(2);
}

class SendReferenceRequestResponse extends $pb.GeneratedMessage {
  factory SendReferenceRequestResponse({
    $core.String? referenceId,
    $core.String? status,
  }) {
    final result = create();
    if (referenceId != null) result.referenceId = referenceId;
    if (status != null) result.status = status;
    return result;
  }

  SendReferenceRequestResponse._();

  factory SendReferenceRequestResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendReferenceRequestResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendReferenceRequestResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'referenceId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendReferenceRequestResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendReferenceRequestResponse copyWith(
          void Function(SendReferenceRequestResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SendReferenceRequestResponse))
          as SendReferenceRequestResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendReferenceRequestResponse create() =>
      SendReferenceRequestResponse._();
  @$core.override
  SendReferenceRequestResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendReferenceRequestResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendReferenceRequestResponse>(create);
  static SendReferenceRequestResponse? _defaultInstance;

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

  /// PENDING when the request was sent, UNVERIFIED when it was only saved.
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
    $core.String? dateOfBirth,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (surname != null) result.surname = surname;
    if (givenNames != null) result.givenNames = givenNames;
    if (nationality != null) result.nationality = nationality;
    if (profileType != null) result.profileType = profileType;
    if (position != null) result.position = position;
    if (dateOfBirth != null) result.dateOfBirth = dateOfBirth;
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
    ..aOS(7, _omitFieldNames ? '' : 'dateOfBirth')
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

  /// Worker-claimed date of birth, YYYY-MM-DD. Optional; when set it must be a
  /// real date and the worker must be between 18 and 60 years old (inclusive).
  @$pb.TagNumber(7)
  $core.String get dateOfBirth => $_getSZ(6);
  @$pb.TagNumber(7)
  set dateOfBirth($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDateOfBirth() => $_has(6);
  @$pb.TagNumber(7)
  void clearDateOfBirth() => $_clearField(7);
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

/// A user selected from the tenant's directory to be invited as a worker.
class DirectoryInvitee extends $pb.GeneratedMessage {
  factory DirectoryInvitee({
    $core.String? email,
    $core.String? displayName,
    $core.String? externalId,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (displayName != null) result.displayName = displayName;
    if (externalId != null) result.externalId = externalId;
    return result;
  }

  DirectoryInvitee._();

  factory DirectoryInvitee.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectoryInvitee.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectoryInvitee',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..aOS(3, _omitFieldNames ? '' : 'externalId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectoryInvitee clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectoryInvitee copyWith(void Function(DirectoryInvitee) updates) =>
      super.copyWith((message) => updates(message as DirectoryInvitee))
          as DirectoryInvitee;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectoryInvitee create() => DirectoryInvitee._();
  @$core.override
  DirectoryInvitee createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectoryInvitee getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectoryInvitee>(create);
  static DirectoryInvitee? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get externalId => $_getSZ(2);
  @$pb.TagNumber(3)
  set externalId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExternalId() => $_has(2);
  @$pb.TagNumber(3)
  void clearExternalId() => $_clearField(3);
}

class InviteDirectoryUsersRequest extends $pb.GeneratedMessage {
  factory InviteDirectoryUsersRequest({
    $core.String? tenantId,
    $core.Iterable<DirectoryInvitee>? invitees,
    $core.String? subcontractorId,
    WorkerPosition? position,
    SentVia? sentVia,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (invitees != null) result.invitees.addAll(invitees);
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (position != null) result.position = position;
    if (sentVia != null) result.sentVia = sentVia;
    return result;
  }

  InviteDirectoryUsersRequest._();

  factory InviteDirectoryUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteDirectoryUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteDirectoryUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..pPM<DirectoryInvitee>(2, _omitFieldNames ? '' : 'invitees',
        subBuilder: DirectoryInvitee.create)
    ..aOS(3, _omitFieldNames ? '' : 'subcontractorId')
    ..aE<WorkerPosition>(4, _omitFieldNames ? '' : 'position',
        enumValues: WorkerPosition.values)
    ..aE<SentVia>(5, _omitFieldNames ? '' : 'sentVia',
        enumValues: SentVia.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteDirectoryUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteDirectoryUsersRequest copyWith(
          void Function(InviteDirectoryUsersRequest) updates) =>
      super.copyWith(
              (message) => updates(message as InviteDirectoryUsersRequest))
          as InviteDirectoryUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteDirectoryUsersRequest create() =>
      InviteDirectoryUsersRequest._();
  @$core.override
  InviteDirectoryUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteDirectoryUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteDirectoryUsersRequest>(create);
  static InviteDirectoryUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<DirectoryInvitee> get invitees => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get subcontractorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set subcontractorId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubcontractorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubcontractorId() => $_clearField(3);

  @$pb.TagNumber(4)
  WorkerPosition get position => $_getN(3);
  @$pb.TagNumber(4)
  set position(WorkerPosition value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPosition() => $_has(3);
  @$pb.TagNumber(4)
  void clearPosition() => $_clearField(4);

  @$pb.TagNumber(5)
  SentVia get sentVia => $_getN(4);
  @$pb.TagNumber(5)
  set sentVia(SentVia value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSentVia() => $_has(4);
  @$pb.TagNumber(5)
  void clearSentVia() => $_clearField(5);
}

class InviteDirectoryUsersResult extends $pb.GeneratedMessage {
  factory InviteDirectoryUsersResult({
    $core.String? email,
    $core.String? status,
    $core.String? invitationId,
    $core.String? error,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (status != null) result.status = status;
    if (invitationId != null) result.invitationId = invitationId;
    if (error != null) result.error = error;
    return result;
  }

  InviteDirectoryUsersResult._();

  factory InviteDirectoryUsersResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteDirectoryUsersResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteDirectoryUsersResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'invitationId')
    ..aOS(4, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteDirectoryUsersResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteDirectoryUsersResult copyWith(
          void Function(InviteDirectoryUsersResult) updates) =>
      super.copyWith(
              (message) => updates(message as InviteDirectoryUsersResult))
          as InviteDirectoryUsersResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteDirectoryUsersResult create() => InviteDirectoryUsersResult._();
  @$core.override
  InviteDirectoryUsersResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteDirectoryUsersResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteDirectoryUsersResult>(create);
  static InviteDirectoryUsersResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get invitationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set invitationId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInvitationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvitationId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get error => $_getSZ(3);
  @$pb.TagNumber(4)
  set error($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
}

class InviteDirectoryUsersResponse extends $pb.GeneratedMessage {
  factory InviteDirectoryUsersResponse({
    $core.Iterable<InviteDirectoryUsersResult>? results,
    $core.int? created,
    $core.int? skipped,
    $core.int? failed,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    if (created != null) result.created = created;
    if (skipped != null) result.skipped = skipped;
    if (failed != null) result.failed = failed;
    return result;
  }

  InviteDirectoryUsersResponse._();

  factory InviteDirectoryUsersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteDirectoryUsersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteDirectoryUsersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<InviteDirectoryUsersResult>(1, _omitFieldNames ? '' : 'results',
        subBuilder: InviteDirectoryUsersResult.create)
    ..aI(2, _omitFieldNames ? '' : 'created')
    ..aI(3, _omitFieldNames ? '' : 'skipped')
    ..aI(4, _omitFieldNames ? '' : 'failed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteDirectoryUsersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteDirectoryUsersResponse copyWith(
          void Function(InviteDirectoryUsersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as InviteDirectoryUsersResponse))
          as InviteDirectoryUsersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteDirectoryUsersResponse create() =>
      InviteDirectoryUsersResponse._();
  @$core.override
  InviteDirectoryUsersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InviteDirectoryUsersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteDirectoryUsersResponse>(create);
  static InviteDirectoryUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InviteDirectoryUsersResult> get results => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get created => $_getIZ(1);
  @$pb.TagNumber(2)
  set created($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreated() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreated() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get skipped => $_getIZ(2);
  @$pb.TagNumber(3)
  set skipped($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSkipped() => $_has(2);
  @$pb.TagNumber(3)
  void clearSkipped() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get failed => $_getIZ(3);
  @$pb.TagNumber(4)
  set failed($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFailed() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailed() => $_clearField(4);
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
    $core.String? subcontractorId,
    $core.String? contactEmail,
    $core.String? dateOfBirth,
    $core.String? deletedAt,
    $core.String? deletedBy,
    $core.String? deletionReason,
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
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (contactEmail != null) result.contactEmail = contactEmail;
    if (dateOfBirth != null) result.dateOfBirth = dateOfBirth;
    if (deletedAt != null) result.deletedAt = deletedAt;
    if (deletedBy != null) result.deletedBy = deletedBy;
    if (deletionReason != null) result.deletionReason = deletionReason;
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
    ..aOS(12, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(13, _omitFieldNames ? '' : 'contactEmail')
    ..aOS(14, _omitFieldNames ? '' : 'dateOfBirth')
    ..aOS(15, _omitFieldNames ? '' : 'deletedAt')
    ..aOS(16, _omitFieldNames ? '' : 'deletedBy')
    ..aOS(17, _omitFieldNames ? '' : 'deletionReason')
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

  @$pb.TagNumber(12)
  $core.String get subcontractorId => $_getSZ(11);
  @$pb.TagNumber(12)
  set subcontractorId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSubcontractorId() => $_has(11);
  @$pb.TagNumber(12)
  void clearSubcontractorId() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get contactEmail => $_getSZ(12);
  @$pb.TagNumber(13)
  set contactEmail($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasContactEmail() => $_has(12);
  @$pb.TagNumber(13)
  void clearContactEmail() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get dateOfBirth => $_getSZ(13);
  @$pb.TagNumber(14)
  set dateOfBirth($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasDateOfBirth() => $_has(13);
  @$pb.TagNumber(14)
  void clearDateOfBirth() => $_clearField(14);

  /// Soft-delete metadata. Populated only for tombstoned workers (ListDeletedWorkers);
  /// empty on live workers.
  @$pb.TagNumber(15)
  $core.String get deletedAt => $_getSZ(14);
  @$pb.TagNumber(15)
  set deletedAt($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasDeletedAt() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeletedAt() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.String get deletedBy => $_getSZ(15);
  @$pb.TagNumber(16)
  set deletedBy($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasDeletedBy() => $_has(15);
  @$pb.TagNumber(16)
  void clearDeletedBy() => $_clearField(16);

  @$pb.TagNumber(17)
  $core.String get deletionReason => $_getSZ(16);
  @$pb.TagNumber(17)
  set deletionReason($core.String value) => $_setString(16, value);
  @$pb.TagNumber(17)
  $core.bool hasDeletionReason() => $_has(16);
  @$pb.TagNumber(17)
  void clearDeletionReason() => $_clearField(17);
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
    $core.String? gotifyToken,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    if (publicKey != null) result.publicKey = publicKey;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (osVersion != null) result.osVersion = osVersion;
    if (platform != null) result.platform = platform;
    if (changeReason != null) result.changeReason = changeReason;
    if (gotifyToken != null) result.gotifyToken = gotifyToken;
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
    ..aOS(8, _omitFieldNames ? '' : 'gotifyToken')
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

  @$pb.TagNumber(8)
  $core.String get gotifyToken => $_getSZ(7);
  @$pb.TagNumber(8)
  set gotifyToken($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasGotifyToken() => $_has(7);
  @$pb.TagNumber(8)
  void clearGotifyToken() => $_clearField(8);
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

class RegisterPushTokenRequest extends $pb.GeneratedMessage {
  factory RegisterPushTokenRequest({
    $core.String? workerId,
    $core.String? deviceId,
    $core.String? gotifyToken,
    $core.String? endpointUrl,
    $core.String? source,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    if (gotifyToken != null) result.gotifyToken = gotifyToken;
    if (endpointUrl != null) result.endpointUrl = endpointUrl;
    if (source != null) result.source = source;
    return result;
  }

  RegisterPushTokenRequest._();

  factory RegisterPushTokenRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterPushTokenRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterPushTokenRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..aOS(3, _omitFieldNames ? '' : 'gotifyToken')
    ..aOS(4, _omitFieldNames ? '' : 'endpointUrl')
    ..aOS(5, _omitFieldNames ? '' : 'source')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterPushTokenRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterPushTokenRequest copyWith(
          void Function(RegisterPushTokenRequest) updates) =>
      super.copyWith((message) => updates(message as RegisterPushTokenRequest))
          as RegisterPushTokenRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterPushTokenRequest create() => RegisterPushTokenRequest._();
  @$core.override
  RegisterPushTokenRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterPushTokenRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterPushTokenRequest>(create);
  static RegisterPushTokenRequest? _defaultInstance;

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
  $core.String get gotifyToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set gotifyToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGotifyToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearGotifyToken() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get endpointUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set endpointUrl($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEndpointUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndpointUrl() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get source => $_getSZ(4);
  @$pb.TagNumber(5)
  set source($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSource() => $_has(4);
  @$pb.TagNumber(5)
  void clearSource() => $_clearField(5);
}

class RegisterPushTokenResponse extends $pb.GeneratedMessage {
  factory RegisterPushTokenResponse({
    $core.bool? accepted,
  }) {
    final result = create();
    if (accepted != null) result.accepted = accepted;
    return result;
  }

  RegisterPushTokenResponse._();

  factory RegisterPushTokenResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterPushTokenResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterPushTokenResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterPushTokenResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterPushTokenResponse copyWith(
          void Function(RegisterPushTokenResponse) updates) =>
      super.copyWith((message) => updates(message as RegisterPushTokenResponse))
          as RegisterPushTokenResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterPushTokenResponse create() => RegisterPushTokenResponse._();
  @$core.override
  RegisterPushTokenResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterPushTokenResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterPushTokenResponse>(create);
  static RegisterPushTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => $_clearField(1);
}

class ProvisionPushTargetRequest extends $pb.GeneratedMessage {
  factory ProvisionPushTargetRequest({
    $core.String? workerId,
    $core.String? deviceId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  ProvisionPushTargetRequest._();

  factory ProvisionPushTargetRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProvisionPushTargetRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProvisionPushTargetRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvisionPushTargetRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvisionPushTargetRequest copyWith(
          void Function(ProvisionPushTargetRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ProvisionPushTargetRequest))
          as ProvisionPushTargetRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProvisionPushTargetRequest create() => ProvisionPushTargetRequest._();
  @$core.override
  ProvisionPushTargetRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProvisionPushTargetRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProvisionPushTargetRequest>(create);
  static ProvisionPushTargetRequest? _defaultInstance;

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
}

class ProvisionPushTargetResponse extends $pb.GeneratedMessage {
  factory ProvisionPushTargetResponse({
    $core.String? clientToken,
    $core.String? streamUrl,
  }) {
    final result = create();
    if (clientToken != null) result.clientToken = clientToken;
    if (streamUrl != null) result.streamUrl = streamUrl;
    return result;
  }

  ProvisionPushTargetResponse._();

  factory ProvisionPushTargetResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProvisionPushTargetResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProvisionPushTargetResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'clientToken')
    ..aOS(2, _omitFieldNames ? '' : 'streamUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvisionPushTargetResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProvisionPushTargetResponse copyWith(
          void Function(ProvisionPushTargetResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ProvisionPushTargetResponse))
          as ProvisionPushTargetResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProvisionPushTargetResponse create() =>
      ProvisionPushTargetResponse._();
  @$core.override
  ProvisionPushTargetResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProvisionPushTargetResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProvisionPushTargetResponse>(create);
  static ProvisionPushTargetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get clientToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set clientToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasClientToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearClientToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get streamUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set streamUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStreamUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamUrl() => $_clearField(2);
}

class CreateSubcontractorRequest extends $pb.GeneratedMessage {
  factory CreateSubcontractorRequest({
    $core.String? tenantId,
    $core.String? orgName,
    $core.String? contactName,
    $core.String? contactEmail,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (orgName != null) result.orgName = orgName;
    if (contactName != null) result.contactName = contactName;
    if (contactEmail != null) result.contactEmail = contactEmail;
    return result;
  }

  CreateSubcontractorRequest._();

  factory CreateSubcontractorRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSubcontractorRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSubcontractorRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'orgName')
    ..aOS(3, _omitFieldNames ? '' : 'contactName')
    ..aOS(4, _omitFieldNames ? '' : 'contactEmail')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSubcontractorRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSubcontractorRequest copyWith(
          void Function(CreateSubcontractorRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSubcontractorRequest))
          as CreateSubcontractorRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSubcontractorRequest create() => CreateSubcontractorRequest._();
  @$core.override
  CreateSubcontractorRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSubcontractorRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSubcontractorRequest>(create);
  static CreateSubcontractorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get orgName => $_getSZ(1);
  @$pb.TagNumber(2)
  set orgName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrgName() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrgName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get contactName => $_getSZ(2);
  @$pb.TagNumber(3)
  set contactName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContactName() => $_has(2);
  @$pb.TagNumber(3)
  void clearContactName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get contactEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set contactEmail($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContactEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearContactEmail() => $_clearField(4);
}

class Subcontractor extends $pb.GeneratedMessage {
  factory Subcontractor({
    $core.String? id,
    $core.String? orgName,
    $core.String? contactName,
    $core.String? contactEmail,
    $core.String? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (orgName != null) result.orgName = orgName;
    if (contactName != null) result.contactName = contactName;
    if (contactEmail != null) result.contactEmail = contactEmail;
    if (status != null) result.status = status;
    return result;
  }

  Subcontractor._();

  factory Subcontractor.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Subcontractor.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Subcontractor',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'orgName')
    ..aOS(3, _omitFieldNames ? '' : 'contactName')
    ..aOS(4, _omitFieldNames ? '' : 'contactEmail')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Subcontractor clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Subcontractor copyWith(void Function(Subcontractor) updates) =>
      super.copyWith((message) => updates(message as Subcontractor))
          as Subcontractor;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Subcontractor create() => Subcontractor._();
  @$core.override
  Subcontractor createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Subcontractor getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Subcontractor>(create);
  static Subcontractor? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get orgName => $_getSZ(1);
  @$pb.TagNumber(2)
  set orgName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrgName() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrgName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get contactName => $_getSZ(2);
  @$pb.TagNumber(3)
  set contactName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContactName() => $_has(2);
  @$pb.TagNumber(3)
  void clearContactName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get contactEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set contactEmail($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContactEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearContactEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
}

class CreateSubcontractorResponse extends $pb.GeneratedMessage {
  factory CreateSubcontractorResponse({
    Subcontractor? item,
  }) {
    final result = create();
    if (item != null) result.item = item;
    return result;
  }

  CreateSubcontractorResponse._();

  factory CreateSubcontractorResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSubcontractorResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSubcontractorResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOM<Subcontractor>(1, _omitFieldNames ? '' : 'item',
        subBuilder: Subcontractor.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSubcontractorResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSubcontractorResponse copyWith(
          void Function(CreateSubcontractorResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateSubcontractorResponse))
          as CreateSubcontractorResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSubcontractorResponse create() =>
      CreateSubcontractorResponse._();
  @$core.override
  CreateSubcontractorResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateSubcontractorResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSubcontractorResponse>(create);
  static CreateSubcontractorResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Subcontractor get item => $_getN(0);
  @$pb.TagNumber(1)
  set item(Subcontractor value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasItem() => $_has(0);
  @$pb.TagNumber(1)
  void clearItem() => $_clearField(1);
  @$pb.TagNumber(1)
  Subcontractor ensureItem() => $_ensure(0);
}

class ListSubcontractorsRequest extends $pb.GeneratedMessage {
  factory ListSubcontractorsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListSubcontractorsRequest._();

  factory ListSubcontractorsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSubcontractorsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSubcontractorsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorsRequest copyWith(
          void Function(ListSubcontractorsRequest) updates) =>
      super.copyWith((message) => updates(message as ListSubcontractorsRequest))
          as ListSubcontractorsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSubcontractorsRequest create() => ListSubcontractorsRequest._();
  @$core.override
  ListSubcontractorsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSubcontractorsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSubcontractorsRequest>(create);
  static ListSubcontractorsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class ListSubcontractorsResponse extends $pb.GeneratedMessage {
  factory ListSubcontractorsResponse({
    $core.Iterable<Subcontractor>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSubcontractorsResponse._();

  factory ListSubcontractorsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSubcontractorsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSubcontractorsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<Subcontractor>(1, _omitFieldNames ? '' : 'items',
        subBuilder: Subcontractor.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorsResponse copyWith(
          void Function(ListSubcontractorsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListSubcontractorsResponse))
          as ListSubcontractorsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSubcontractorsResponse create() => ListSubcontractorsResponse._();
  @$core.override
  ListSubcontractorsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSubcontractorsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSubcontractorsResponse>(create);
  static ListSubcontractorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Subcontractor> get items => $_getList(0);
}

class ListInvitationsRequest extends $pb.GeneratedMessage {
  factory ListInvitationsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListInvitationsRequest._();

  factory ListInvitationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListInvitationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListInvitationsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationsRequest copyWith(
          void Function(ListInvitationsRequest) updates) =>
      super.copyWith((message) => updates(message as ListInvitationsRequest))
          as ListInvitationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInvitationsRequest create() => ListInvitationsRequest._();
  @$core.override
  ListInvitationsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListInvitationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListInvitationsRequest>(create);
  static ListInvitationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class WorkerInvitation extends $pb.GeneratedMessage {
  factory WorkerInvitation({
    $core.String? id,
    $core.String? tenantId,
    $core.String? subcontractorId,
    $core.String? workerId,
    $core.String? phoneNumber,
    $core.String? email,
    $core.String? status,
    $core.String? sentVia,
    $core.String? expiresAt,
    $core.String? position,
    $core.String? createdAt,
    $core.String? acceptedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (tenantId != null) result.tenantId = tenantId;
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (workerId != null) result.workerId = workerId;
    if (phoneNumber != null) result.phoneNumber = phoneNumber;
    if (email != null) result.email = email;
    if (status != null) result.status = status;
    if (sentVia != null) result.sentVia = sentVia;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (position != null) result.position = position;
    if (createdAt != null) result.createdAt = createdAt;
    if (acceptedAt != null) result.acceptedAt = acceptedAt;
    return result;
  }

  WorkerInvitation._();

  factory WorkerInvitation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerInvitation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerInvitation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(4, _omitFieldNames ? '' : 'workerId')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(6, _omitFieldNames ? '' : 'email')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..aOS(8, _omitFieldNames ? '' : 'sentVia')
    ..aOS(9, _omitFieldNames ? '' : 'expiresAt')
    ..aOS(10, _omitFieldNames ? '' : 'position')
    ..aOS(11, _omitFieldNames ? '' : 'createdAt')
    ..aOS(12, _omitFieldNames ? '' : 'acceptedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerInvitation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerInvitation copyWith(void Function(WorkerInvitation) updates) =>
      super.copyWith((message) => updates(message as WorkerInvitation))
          as WorkerInvitation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerInvitation create() => WorkerInvitation._();
  @$core.override
  WorkerInvitation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerInvitation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerInvitation>(create);
  static WorkerInvitation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subcontractorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set subcontractorId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubcontractorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubcontractorId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get workerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set workerId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWorkerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearWorkerId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get email => $_getSZ(5);
  @$pb.TagNumber(6)
  set email($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEmail() => $_has(5);
  @$pb.TagNumber(6)
  void clearEmail() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get sentVia => $_getSZ(7);
  @$pb.TagNumber(8)
  set sentVia($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSentVia() => $_has(7);
  @$pb.TagNumber(8)
  void clearSentVia() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get expiresAt => $_getSZ(8);
  @$pb.TagNumber(9)
  set expiresAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasExpiresAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpiresAt() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get position => $_getSZ(9);
  @$pb.TagNumber(10)
  set position($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasPosition() => $_has(9);
  @$pb.TagNumber(10)
  void clearPosition() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get createdAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set createdAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get acceptedAt => $_getSZ(11);
  @$pb.TagNumber(12)
  set acceptedAt($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasAcceptedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearAcceptedAt() => $_clearField(12);
}

class ListInvitationsResponse extends $pb.GeneratedMessage {
  factory ListInvitationsResponse({
    $core.Iterable<WorkerInvitation>? invitations,
  }) {
    final result = create();
    if (invitations != null) result.invitations.addAll(invitations);
    return result;
  }

  ListInvitationsResponse._();

  factory ListInvitationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListInvitationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListInvitationsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<WorkerInvitation>(1, _omitFieldNames ? '' : 'invitations',
        subBuilder: WorkerInvitation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationsResponse copyWith(
          void Function(ListInvitationsResponse) updates) =>
      super.copyWith((message) => updates(message as ListInvitationsResponse))
          as ListInvitationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInvitationsResponse create() => ListInvitationsResponse._();
  @$core.override
  ListInvitationsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListInvitationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListInvitationsResponse>(create);
  static ListInvitationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WorkerInvitation> get invitations => $_getList(0);
}

/// Step 1: caller asks for a pre-signed URL to upload the spreadsheet to.
class GenerateInvitationBatchUploadURLRequest extends $pb.GeneratedMessage {
  factory GenerateInvitationBatchUploadURLRequest({
    $core.String? tenantId,
    $core.String? fileName,
    $core.String? subcontractorId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (fileName != null) result.fileName = fileName;
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    return result;
  }

  GenerateInvitationBatchUploadURLRequest._();

  factory GenerateInvitationBatchUploadURLRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateInvitationBatchUploadURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateInvitationBatchUploadURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'fileName')
    ..aOS(3, _omitFieldNames ? '' : 'subcontractorId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvitationBatchUploadURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvitationBatchUploadURLRequest copyWith(
          void Function(GenerateInvitationBatchUploadURLRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateInvitationBatchUploadURLRequest))
          as GenerateInvitationBatchUploadURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateInvitationBatchUploadURLRequest create() =>
      GenerateInvitationBatchUploadURLRequest._();
  @$core.override
  GenerateInvitationBatchUploadURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateInvitationBatchUploadURLRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GenerateInvitationBatchUploadURLRequest>(create);
  static GenerateInvitationBatchUploadURLRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subcontractorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set subcontractorId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubcontractorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubcontractorId() => $_clearField(3);
}

class GenerateInvitationBatchUploadURLResponse extends $pb.GeneratedMessage {
  factory GenerateInvitationBatchUploadURLResponse({
    $core.String? batchId,
    $core.String? uploadUrl,
    $core.String? objectKey,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (uploadUrl != null) result.uploadUrl = uploadUrl;
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  GenerateInvitationBatchUploadURLResponse._();

  factory GenerateInvitationBatchUploadURLResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateInvitationBatchUploadURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateInvitationBatchUploadURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..aOS(2, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(3, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvitationBatchUploadURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvitationBatchUploadURLResponse copyWith(
          void Function(GenerateInvitationBatchUploadURLResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GenerateInvitationBatchUploadURLResponse))
          as GenerateInvitationBatchUploadURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateInvitationBatchUploadURLResponse create() =>
      GenerateInvitationBatchUploadURLResponse._();
  @$core.override
  GenerateInvitationBatchUploadURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateInvitationBatchUploadURLResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GenerateInvitationBatchUploadURLResponse>(create);
  static GenerateInvitationBatchUploadURLResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get uploadUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set uploadUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUploadUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUploadUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasObjectKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectKey() => $_clearField(3);
}

/// Step 2: caller confirms the upload finished; kicks off async processing.
class StartInvitationBatchRequest extends $pb.GeneratedMessage {
  factory StartInvitationBatchRequest({
    $core.String? batchId,
    $core.String? tenantId,
    $core.String? subcontractorId,
    $core.String? objectKey,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (tenantId != null) result.tenantId = tenantId;
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  StartInvitationBatchRequest._();

  factory StartInvitationBatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartInvitationBatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartInvitationBatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(4, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartInvitationBatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartInvitationBatchRequest copyWith(
          void Function(StartInvitationBatchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StartInvitationBatchRequest))
          as StartInvitationBatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartInvitationBatchRequest create() =>
      StartInvitationBatchRequest._();
  @$core.override
  StartInvitationBatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartInvitationBatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartInvitationBatchRequest>(create);
  static StartInvitationBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subcontractorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set subcontractorId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubcontractorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubcontractorId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get objectKey => $_getSZ(3);
  @$pb.TagNumber(4)
  set objectKey($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasObjectKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearObjectKey() => $_clearField(4);
}

class StartInvitationBatchResponse extends $pb.GeneratedMessage {
  factory StartInvitationBatchResponse({
    $core.String? batchId,
    $core.String? status,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (status != null) result.status = status;
    return result;
  }

  StartInvitationBatchResponse._();

  factory StartInvitationBatchResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartInvitationBatchResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartInvitationBatchResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartInvitationBatchResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartInvitationBatchResponse copyWith(
          void Function(StartInvitationBatchResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StartInvitationBatchResponse))
          as StartInvitationBatchResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartInvitationBatchResponse create() =>
      StartInvitationBatchResponse._();
  @$core.override
  StartInvitationBatchResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartInvitationBatchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartInvitationBatchResponse>(create);
  static StartInvitationBatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

/// Step 3: poll for progress + per-row results.
class GetInvitationBatchStatusRequest extends $pb.GeneratedMessage {
  factory GetInvitationBatchStatusRequest({
    $core.String? batchId,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    return result;
  }

  GetInvitationBatchStatusRequest._();

  factory GetInvitationBatchStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInvitationBatchStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInvitationBatchStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInvitationBatchStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInvitationBatchStatusRequest copyWith(
          void Function(GetInvitationBatchStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetInvitationBatchStatusRequest))
          as GetInvitationBatchStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInvitationBatchStatusRequest create() =>
      GetInvitationBatchStatusRequest._();
  @$core.override
  GetInvitationBatchStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInvitationBatchStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInvitationBatchStatusRequest>(
          create);
  static GetInvitationBatchStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);
}

class InvitationBatchRowResult extends $pb.GeneratedMessage {
  factory InvitationBatchRowResult({
    $core.int? rowNumber,
    $core.String? email,
    $core.String? status,
    $core.String? errorMessage,
    $core.String? invitationId,
  }) {
    final result = create();
    if (rowNumber != null) result.rowNumber = rowNumber;
    if (email != null) result.email = email;
    if (status != null) result.status = status;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (invitationId != null) result.invitationId = invitationId;
    return result;
  }

  InvitationBatchRowResult._();

  factory InvitationBatchRowResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvitationBatchRowResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvitationBatchRowResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'rowNumber')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..aOS(4, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(5, _omitFieldNames ? '' : 'invitationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvitationBatchRowResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvitationBatchRowResult copyWith(
          void Function(InvitationBatchRowResult) updates) =>
      super.copyWith((message) => updates(message as InvitationBatchRowResult))
          as InvitationBatchRowResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvitationBatchRowResult create() => InvitationBatchRowResult._();
  @$core.override
  InvitationBatchRowResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InvitationBatchRowResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvitationBatchRowResult>(create);
  static InvitationBatchRowResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get rowNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set rowNumber($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRowNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearRowNumber() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get errorMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set errorMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasErrorMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearErrorMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get invitationId => $_getSZ(4);
  @$pb.TagNumber(5)
  set invitationId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInvitationId() => $_has(4);
  @$pb.TagNumber(5)
  void clearInvitationId() => $_clearField(5);
}

class GetInvitationBatchStatusResponse extends $pb.GeneratedMessage {
  factory GetInvitationBatchStatusResponse({
    $core.String? batchId,
    $core.String? status,
    $core.int? total,
    $core.int? created,
    $core.int? skipped,
    $core.int? invalid,
    $core.int? sent,
    $core.Iterable<InvitationBatchRowResult>? rows,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (status != null) result.status = status;
    if (total != null) result.total = total;
    if (created != null) result.created = created;
    if (skipped != null) result.skipped = skipped;
    if (invalid != null) result.invalid = invalid;
    if (sent != null) result.sent = sent;
    if (rows != null) result.rows.addAll(rows);
    return result;
  }

  GetInvitationBatchStatusResponse._();

  factory GetInvitationBatchStatusResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInvitationBatchStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInvitationBatchStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aI(3, _omitFieldNames ? '' : 'total')
    ..aI(4, _omitFieldNames ? '' : 'created')
    ..aI(5, _omitFieldNames ? '' : 'skipped')
    ..aI(6, _omitFieldNames ? '' : 'invalid')
    ..aI(7, _omitFieldNames ? '' : 'sent')
    ..pPM<InvitationBatchRowResult>(8, _omitFieldNames ? '' : 'rows',
        subBuilder: InvitationBatchRowResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInvitationBatchStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInvitationBatchStatusResponse copyWith(
          void Function(GetInvitationBatchStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetInvitationBatchStatusResponse))
          as GetInvitationBatchStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInvitationBatchStatusResponse create() =>
      GetInvitationBatchStatusResponse._();
  @$core.override
  GetInvitationBatchStatusResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInvitationBatchStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInvitationBatchStatusResponse>(
          create);
  static GetInvitationBatchStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get total => $_getIZ(2);
  @$pb.TagNumber(3)
  set total($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotal() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotal() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get created => $_getIZ(3);
  @$pb.TagNumber(4)
  set created($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreated() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreated() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get skipped => $_getIZ(4);
  @$pb.TagNumber(5)
  set skipped($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSkipped() => $_has(4);
  @$pb.TagNumber(5)
  void clearSkipped() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get invalid => $_getIZ(5);
  @$pb.TagNumber(6)
  set invalid($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInvalid() => $_has(5);
  @$pb.TagNumber(6)
  void clearInvalid() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get sent => $_getIZ(6);
  @$pb.TagNumber(7)
  set sent($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSent() => $_has(6);
  @$pb.TagNumber(7)
  void clearSent() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<InvitationBatchRowResult> get rows => $_getList(7);
}

/// Step 4 (optional): list recent batches for a tenant. Backed by Temporal
/// visibility, so only batches still within the workflow retention window appear.
class ListInvitationBatchesRequest extends $pb.GeneratedMessage {
  factory ListInvitationBatchesRequest({
    $core.String? tenantId,
    $core.int? pageSize,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (pageSize != null) result.pageSize = pageSize;
    return result;
  }

  ListInvitationBatchesRequest._();

  factory ListInvitationBatchesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListInvitationBatchesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListInvitationBatchesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aI(2, _omitFieldNames ? '' : 'pageSize')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationBatchesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationBatchesRequest copyWith(
          void Function(ListInvitationBatchesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListInvitationBatchesRequest))
          as ListInvitationBatchesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInvitationBatchesRequest create() =>
      ListInvitationBatchesRequest._();
  @$core.override
  ListInvitationBatchesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListInvitationBatchesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListInvitationBatchesRequest>(create);
  static ListInvitationBatchesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageSize($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPageSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageSize() => $_clearField(2);
}

class InvitationBatchSummary extends $pb.GeneratedMessage {
  factory InvitationBatchSummary({
    $core.String? batchId,
    $core.String? status,
    $core.String? subcontractorId,
    $core.String? createdAt,
    $core.int? total,
    $core.int? created,
    $core.int? skipped,
    $core.int? invalid,
    $core.int? sent,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (status != null) result.status = status;
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (createdAt != null) result.createdAt = createdAt;
    if (total != null) result.total = total;
    if (created != null) result.created = created;
    if (skipped != null) result.skipped = skipped;
    if (invalid != null) result.invalid = invalid;
    if (sent != null) result.sent = sent;
    return result;
  }

  InvitationBatchSummary._();

  factory InvitationBatchSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InvitationBatchSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InvitationBatchSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(4, _omitFieldNames ? '' : 'createdAt')
    ..aI(5, _omitFieldNames ? '' : 'total')
    ..aI(6, _omitFieldNames ? '' : 'created')
    ..aI(7, _omitFieldNames ? '' : 'skipped')
    ..aI(8, _omitFieldNames ? '' : 'invalid')
    ..aI(9, _omitFieldNames ? '' : 'sent')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvitationBatchSummary clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InvitationBatchSummary copyWith(
          void Function(InvitationBatchSummary) updates) =>
      super.copyWith((message) => updates(message as InvitationBatchSummary))
          as InvitationBatchSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InvitationBatchSummary create() => InvitationBatchSummary._();
  @$core.override
  InvitationBatchSummary createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InvitationBatchSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InvitationBatchSummary>(create);
  static InvitationBatchSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get subcontractorId => $_getSZ(2);
  @$pb.TagNumber(3)
  set subcontractorId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSubcontractorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSubcontractorId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get total => $_getIZ(4);
  @$pb.TagNumber(5)
  set total($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get created => $_getIZ(5);
  @$pb.TagNumber(6)
  set created($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreated() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreated() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get skipped => $_getIZ(6);
  @$pb.TagNumber(7)
  set skipped($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSkipped() => $_has(6);
  @$pb.TagNumber(7)
  void clearSkipped() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get invalid => $_getIZ(7);
  @$pb.TagNumber(8)
  set invalid($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasInvalid() => $_has(7);
  @$pb.TagNumber(8)
  void clearInvalid() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get sent => $_getIZ(8);
  @$pb.TagNumber(9)
  set sent($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSent() => $_has(8);
  @$pb.TagNumber(9)
  void clearSent() => $_clearField(9);
}

class ListInvitationBatchesResponse extends $pb.GeneratedMessage {
  factory ListInvitationBatchesResponse({
    $core.Iterable<InvitationBatchSummary>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListInvitationBatchesResponse._();

  factory ListInvitationBatchesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListInvitationBatchesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListInvitationBatchesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<InvitationBatchSummary>(1, _omitFieldNames ? '' : 'items',
        subBuilder: InvitationBatchSummary.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationBatchesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInvitationBatchesResponse copyWith(
          void Function(ListInvitationBatchesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListInvitationBatchesResponse))
          as ListInvitationBatchesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInvitationBatchesResponse create() =>
      ListInvitationBatchesResponse._();
  @$core.override
  ListInvitationBatchesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListInvitationBatchesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListInvitationBatchesResponse>(create);
  static ListInvitationBatchesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InvitationBatchSummary> get items => $_getList(0);
}

class ListEmployerReferencesRequest extends $pb.GeneratedMessage {
  factory ListEmployerReferencesRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListEmployerReferencesRequest._();

  factory ListEmployerReferencesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListEmployerReferencesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListEmployerReferencesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEmployerReferencesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEmployerReferencesRequest copyWith(
          void Function(ListEmployerReferencesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListEmployerReferencesRequest))
          as ListEmployerReferencesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmployerReferencesRequest create() =>
      ListEmployerReferencesRequest._();
  @$core.override
  ListEmployerReferencesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListEmployerReferencesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListEmployerReferencesRequest>(create);
  static ListEmployerReferencesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class EmployerReference extends $pb.GeneratedMessage {
  factory EmployerReference({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? employerName,
    $core.String? contactEmail,
    $core.String? position,
    $core.String? startDate,
    $core.String? endDate,
    $core.String? status,
    $core.String? description,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (employerName != null) result.employerName = employerName;
    if (contactEmail != null) result.contactEmail = contactEmail;
    if (position != null) result.position = position;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (status != null) result.status = status;
    if (description != null) result.description = description;
    return result;
  }

  EmployerReference._();

  factory EmployerReference.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmployerReference.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmployerReference',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'employerName')
    ..aOS(5, _omitFieldNames ? '' : 'contactEmail')
    ..aOS(6, _omitFieldNames ? '' : 'position')
    ..aOS(7, _omitFieldNames ? '' : 'startDate')
    ..aOS(8, _omitFieldNames ? '' : 'endDate')
    ..aOS(9, _omitFieldNames ? '' : 'status')
    ..aOS(10, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployerReference clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmployerReference copyWith(void Function(EmployerReference) updates) =>
      super.copyWith((message) => updates(message as EmployerReference))
          as EmployerReference;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmployerReference create() => EmployerReference._();
  @$core.override
  EmployerReference createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmployerReference getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmployerReference>(create);
  static EmployerReference? _defaultInstance;

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
  $core.String get employerName => $_getSZ(3);
  @$pb.TagNumber(4)
  set employerName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmployerName() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmployerName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get contactEmail => $_getSZ(4);
  @$pb.TagNumber(5)
  set contactEmail($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasContactEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearContactEmail() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get position => $_getSZ(5);
  @$pb.TagNumber(6)
  set position($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPosition() => $_has(5);
  @$pb.TagNumber(6)
  void clearPosition() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get startDate => $_getSZ(6);
  @$pb.TagNumber(7)
  set startDate($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStartDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearStartDate() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get endDate => $_getSZ(7);
  @$pb.TagNumber(8)
  set endDate($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEndDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearEndDate() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get status => $_getSZ(8);
  @$pb.TagNumber(9)
  set status($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get description => $_getSZ(9);
  @$pb.TagNumber(10)
  set description($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasDescription() => $_has(9);
  @$pb.TagNumber(10)
  void clearDescription() => $_clearField(10);
}

class ListEmployerReferencesResponse extends $pb.GeneratedMessage {
  factory ListEmployerReferencesResponse({
    $core.Iterable<EmployerReference>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListEmployerReferencesResponse._();

  factory ListEmployerReferencesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListEmployerReferencesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListEmployerReferencesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<EmployerReference>(1, _omitFieldNames ? '' : 'items',
        subBuilder: EmployerReference.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEmployerReferencesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListEmployerReferencesResponse copyWith(
          void Function(ListEmployerReferencesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListEmployerReferencesResponse))
          as ListEmployerReferencesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEmployerReferencesResponse create() =>
      ListEmployerReferencesResponse._();
  @$core.override
  ListEmployerReferencesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListEmployerReferencesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListEmployerReferencesResponse>(create);
  static ListEmployerReferencesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<EmployerReference> get items => $_getList(0);
}

class ListQualificationsRequest extends $pb.GeneratedMessage {
  factory ListQualificationsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListQualificationsRequest._();

  factory ListQualificationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListQualificationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListQualificationsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQualificationsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQualificationsRequest copyWith(
          void Function(ListQualificationsRequest) updates) =>
      super.copyWith((message) => updates(message as ListQualificationsRequest))
          as ListQualificationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListQualificationsRequest create() => ListQualificationsRequest._();
  @$core.override
  ListQualificationsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListQualificationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListQualificationsRequest>(create);
  static ListQualificationsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class Qualification extends $pb.GeneratedMessage {
  factory Qualification({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? documentId,
    $core.String? qualificationType,
    $core.String? institution,
    $core.String? status,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (documentId != null) result.documentId = documentId;
    if (qualificationType != null) result.qualificationType = qualificationType;
    if (institution != null) result.institution = institution;
    if (status != null) result.status = status;
    return result;
  }

  Qualification._();

  factory Qualification.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Qualification.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Qualification',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'documentId')
    ..aOS(5, _omitFieldNames ? '' : 'qualificationType')
    ..aOS(6, _omitFieldNames ? '' : 'institution')
    ..aOS(7, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Qualification clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Qualification copyWith(void Function(Qualification) updates) =>
      super.copyWith((message) => updates(message as Qualification))
          as Qualification;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Qualification create() => Qualification._();
  @$core.override
  Qualification createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Qualification getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Qualification>(create);
  static Qualification? _defaultInstance;

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
  $core.String get documentId => $_getSZ(3);
  @$pb.TagNumber(4)
  set documentId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDocumentId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDocumentId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get qualificationType => $_getSZ(4);
  @$pb.TagNumber(5)
  set qualificationType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQualificationType() => $_has(4);
  @$pb.TagNumber(5)
  void clearQualificationType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get institution => $_getSZ(5);
  @$pb.TagNumber(6)
  set institution($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasInstitution() => $_has(5);
  @$pb.TagNumber(6)
  void clearInstitution() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get status => $_getSZ(6);
  @$pb.TagNumber(7)
  set status($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);
}

class ListQualificationsResponse extends $pb.GeneratedMessage {
  factory ListQualificationsResponse({
    $core.Iterable<Qualification>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListQualificationsResponse._();

  factory ListQualificationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListQualificationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListQualificationsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<Qualification>(1, _omitFieldNames ? '' : 'items',
        subBuilder: Qualification.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQualificationsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListQualificationsResponse copyWith(
          void Function(ListQualificationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListQualificationsResponse))
          as ListQualificationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListQualificationsResponse create() => ListQualificationsResponse._();
  @$core.override
  ListQualificationsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListQualificationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListQualificationsResponse>(create);
  static ListQualificationsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Qualification> get items => $_getList(0);
}

class ListDeviceChangeRequestsRequest extends $pb.GeneratedMessage {
  factory ListDeviceChangeRequestsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListDeviceChangeRequestsRequest._();

  factory ListDeviceChangeRequestsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeviceChangeRequestsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeviceChangeRequestsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceChangeRequestsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceChangeRequestsRequest copyWith(
          void Function(ListDeviceChangeRequestsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeviceChangeRequestsRequest))
          as ListDeviceChangeRequestsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeviceChangeRequestsRequest create() =>
      ListDeviceChangeRequestsRequest._();
  @$core.override
  ListDeviceChangeRequestsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeviceChangeRequestsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeviceChangeRequestsRequest>(
          create);
  static ListDeviceChangeRequestsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class DeviceChangeRequest extends $pb.GeneratedMessage {
  factory DeviceChangeRequest({
    $core.String? id,
    $core.String? workerId,
    $core.String? deviceId,
    $core.String? deviceModel,
    $core.String? osVersion,
    $core.String? changeReason,
    $core.String? createdAt,
    $core.String? status,
    $core.String? workerName,
    $core.String? swapOrigin,
    $core.int? seenOnOtherWorkers,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (osVersion != null) result.osVersion = osVersion;
    if (changeReason != null) result.changeReason = changeReason;
    if (createdAt != null) result.createdAt = createdAt;
    if (status != null) result.status = status;
    if (workerName != null) result.workerName = workerName;
    if (swapOrigin != null) result.swapOrigin = swapOrigin;
    if (seenOnOtherWorkers != null)
      result.seenOnOtherWorkers = seenOnOtherWorkers;
    return result;
  }

  DeviceChangeRequest._();

  factory DeviceChangeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceChangeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceChangeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'deviceId')
    ..aOS(4, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(5, _omitFieldNames ? '' : 'osVersion')
    ..aOS(6, _omitFieldNames ? '' : 'changeReason')
    ..aOS(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(8, _omitFieldNames ? '' : 'status')
    ..aOS(9, _omitFieldNames ? '' : 'workerName')
    ..aOS(10, _omitFieldNames ? '' : 'swapOrigin')
    ..aI(11, _omitFieldNames ? '' : 'seenOnOtherWorkers')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceChangeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceChangeRequest copyWith(void Function(DeviceChangeRequest) updates) =>
      super.copyWith((message) => updates(message as DeviceChangeRequest))
          as DeviceChangeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceChangeRequest create() => DeviceChangeRequest._();
  @$core.override
  DeviceChangeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceChangeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceChangeRequest>(create);
  static DeviceChangeRequest? _defaultInstance;

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
  $core.String get deviceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDeviceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceId() => $_clearField(3);

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
  $core.String get changeReason => $_getSZ(5);
  @$pb.TagNumber(6)
  set changeReason($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasChangeReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearChangeReason() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get createdAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set createdAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get workerName => $_getSZ(8);
  @$pb.TagNumber(9)
  set workerName($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasWorkerName() => $_has(8);
  @$pb.TagNumber(9)
  void clearWorkerName() => $_clearField(9);

  /// PRE-WIRED. REQUESTED: the worker sent RequestDeviceSwap first (no colour
  /// change). UNANNOUNCED: signed in on this phone without asking (worker set
  /// YELLOW). "" from a backend without swap requests.
  @$pb.TagNumber(10)
  $core.String get swapOrigin => $_getSZ(9);
  @$pb.TagNumber(10)
  set swapOrigin($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSwapOrigin() => $_has(9);
  @$pb.TagNumber(10)
  void clearSwapOrigin() => $_clearField(10);

  /// PRE-WIRED. How many OTHER workers this fingerprint is recorded for, in any
  /// state and any tenant. Existence only, never who. > 0 means HR rejects.
  @$pb.TagNumber(11)
  $core.int get seenOnOtherWorkers => $_getIZ(10);
  @$pb.TagNumber(11)
  set seenOnOtherWorkers($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasSeenOnOtherWorkers() => $_has(10);
  @$pb.TagNumber(11)
  void clearSeenOnOtherWorkers() => $_clearField(11);
}

class ListDeviceChangeRequestsResponse extends $pb.GeneratedMessage {
  factory ListDeviceChangeRequestsResponse({
    $core.Iterable<DeviceChangeRequest>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListDeviceChangeRequestsResponse._();

  factory ListDeviceChangeRequestsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeviceChangeRequestsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeviceChangeRequestsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<DeviceChangeRequest>(1, _omitFieldNames ? '' : 'items',
        subBuilder: DeviceChangeRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceChangeRequestsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceChangeRequestsResponse copyWith(
          void Function(ListDeviceChangeRequestsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeviceChangeRequestsResponse))
          as ListDeviceChangeRequestsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeviceChangeRequestsResponse create() =>
      ListDeviceChangeRequestsResponse._();
  @$core.override
  ListDeviceChangeRequestsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeviceChangeRequestsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeviceChangeRequestsResponse>(
          create);
  static ListDeviceChangeRequestsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DeviceChangeRequest> get items => $_getList(0);
}

class DecideDeviceChangeRequest extends $pb.GeneratedMessage {
  factory DecideDeviceChangeRequest({
    $core.String? id,
    $core.String? decision,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (decision != null) result.decision = decision;
    return result;
  }

  DecideDeviceChangeRequest._();

  factory DecideDeviceChangeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DecideDeviceChangeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DecideDeviceChangeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'decision')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DecideDeviceChangeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DecideDeviceChangeRequest copyWith(
          void Function(DecideDeviceChangeRequest) updates) =>
      super.copyWith((message) => updates(message as DecideDeviceChangeRequest))
          as DecideDeviceChangeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecideDeviceChangeRequest create() => DecideDeviceChangeRequest._();
  @$core.override
  DecideDeviceChangeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DecideDeviceChangeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecideDeviceChangeRequest>(create);
  static DecideDeviceChangeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get decision => $_getSZ(1);
  @$pb.TagNumber(2)
  set decision($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDecision() => $_has(1);
  @$pb.TagNumber(2)
  void clearDecision() => $_clearField(2);
}

class DecideDeviceChangeResponse extends $pb.GeneratedMessage {
  factory DecideDeviceChangeResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DecideDeviceChangeResponse._();

  factory DecideDeviceChangeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DecideDeviceChangeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DecideDeviceChangeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DecideDeviceChangeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DecideDeviceChangeResponse copyWith(
          void Function(DecideDeviceChangeResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DecideDeviceChangeResponse))
          as DecideDeviceChangeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DecideDeviceChangeResponse create() => DecideDeviceChangeResponse._();
  @$core.override
  DecideDeviceChangeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DecideDeviceChangeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DecideDeviceChangeResponse>(create);
  static DecideDeviceChangeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

/// PRE-WIRED (see RequestDeviceSwap).
class RequestDeviceSwapRequest extends $pb.GeneratedMessage {
  factory RequestDeviceSwapRequest({
    $core.String? workerId,
    $core.String? deviceId,
    $core.String? reason,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    if (reason != null) result.reason = reason;
    return result;
  }

  RequestDeviceSwapRequest._();

  factory RequestDeviceSwapRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDeviceSwapRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDeviceSwapRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeviceSwapRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeviceSwapRequest copyWith(
          void Function(RequestDeviceSwapRequest) updates) =>
      super.copyWith((message) => updates(message as RequestDeviceSwapRequest))
          as RequestDeviceSwapRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeviceSwapRequest create() => RequestDeviceSwapRequest._();
  @$core.override
  RequestDeviceSwapRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestDeviceSwapRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDeviceSwapRequest>(create);
  static RequestDeviceSwapRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  /// The phone bound now. Must be the worker's ACTIVE device, else
  /// FAILED_PRECONDITION.
  @$pb.TagNumber(2)
  $core.String get deviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deviceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);
}

class RequestDeviceSwapResponse extends $pb.GeneratedMessage {
  factory RequestDeviceSwapResponse({
    $core.bool? success,
    $core.String? requestId,
    $core.String? expiresAt,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (requestId != null) result.requestId = requestId;
    if (expiresAt != null) result.expiresAt = expiresAt;
    return result;
  }

  RequestDeviceSwapResponse._();

  factory RequestDeviceSwapResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDeviceSwapResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDeviceSwapResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'requestId')
    ..aOS(3, _omitFieldNames ? '' : 'expiresAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeviceSwapResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeviceSwapResponse copyWith(
          void Function(RequestDeviceSwapResponse) updates) =>
      super.copyWith((message) => updates(message as RequestDeviceSwapResponse))
          as RequestDeviceSwapResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeviceSwapResponse create() => RequestDeviceSwapResponse._();
  @$core.override
  RequestDeviceSwapResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RequestDeviceSwapResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDeviceSwapResponse>(create);
  static RequestDeviceSwapResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get requestId => $_getSZ(1);
  @$pb.TagNumber(2)
  set requestId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRequestId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get expiresAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set expiresAt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiresAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresAt() => $_clearField(3);
}

/// PRE-WIRED (see GetMyDeviceStatus).
class GetMyDeviceStatusRequest extends $pb.GeneratedMessage {
  factory GetMyDeviceStatusRequest({
    $core.String? workerId,
    $core.String? deviceId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    return result;
  }

  GetMyDeviceStatusRequest._();

  factory GetMyDeviceStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMyDeviceStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMyDeviceStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyDeviceStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyDeviceStatusRequest copyWith(
          void Function(GetMyDeviceStatusRequest) updates) =>
      super.copyWith((message) => updates(message as GetMyDeviceStatusRequest))
          as GetMyDeviceStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyDeviceStatusRequest create() => GetMyDeviceStatusRequest._();
  @$core.override
  GetMyDeviceStatusRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMyDeviceStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMyDeviceStatusRequest>(create);
  static GetMyDeviceStatusRequest? _defaultInstance;

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
}

class GetMyDeviceStatusResponse extends $pb.GeneratedMessage {
  factory GetMyDeviceStatusResponse({
    $core.String? status,
    $core.bool? swapRequested,
    $core.bool? swapRequestOpen,
    $core.String? decidedAt,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (swapRequested != null) result.swapRequested = swapRequested;
    if (swapRequestOpen != null) result.swapRequestOpen = swapRequestOpen;
    if (decidedAt != null) result.decidedAt = decidedAt;
    return result;
  }

  GetMyDeviceStatusResponse._();

  factory GetMyDeviceStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMyDeviceStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMyDeviceStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOB(2, _omitFieldNames ? '' : 'swapRequested')
    ..aOB(3, _omitFieldNames ? '' : 'swapRequestOpen')
    ..aOS(4, _omitFieldNames ? '' : 'decidedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyDeviceStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMyDeviceStatusResponse copyWith(
          void Function(GetMyDeviceStatusResponse) updates) =>
      super.copyWith((message) => updates(message as GetMyDeviceStatusResponse))
          as GetMyDeviceStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyDeviceStatusResponse create() => GetMyDeviceStatusResponse._();
  @$core.override
  GetMyDeviceStatusResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetMyDeviceStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMyDeviceStatusResponse>(create);
  static GetMyDeviceStatusResponse? _defaultInstance;

  /// ACTIVE:   this phone is the worker's bound phone.
  /// PENDING:  registered, waiting for HR (a swap).
  /// REJECTED: HR refused this phone.
  /// REPLACED: was the bound phone; an approved swap moved the worker to another.
  /// NONE:     never registered for this worker.
  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  /// PENDING only: true = the worker asked first (RequestDeviceSwap).
  @$pb.TagNumber(2)
  $core.bool get swapRequested => $_getBF(1);
  @$pb.TagNumber(2)
  set swapRequested($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSwapRequested() => $_has(1);
  @$pb.TagNumber(2)
  void clearSwapRequested() => $_clearField(2);

  /// ACTIVE only: a swap request sent from this phone is still open.
  @$pb.TagNumber(3)
  $core.bool get swapRequestOpen => $_getBF(2);
  @$pb.TagNumber(3)
  set swapRequestOpen($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSwapRequestOpen() => $_has(2);
  @$pb.TagNumber(3)
  void clearSwapRequestOpen() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get decidedAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set decidedAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDecidedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearDecidedAt() => $_clearField(4);
}

/// PRE-WIRED (see StartShift). Coordinates are 0,0 when the phone has no fix.
class StartShiftRequest extends $pb.GeneratedMessage {
  factory StartShiftRequest({
    $core.String? workerId,
    $core.String? deviceId,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (deviceId != null) result.deviceId = deviceId;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  StartShiftRequest._();

  factory StartShiftRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartShiftRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartShiftRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'deviceId')
    ..aD(3, _omitFieldNames ? '' : 'latitude')
    ..aD(4, _omitFieldNames ? '' : 'longitude')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartShiftRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartShiftRequest copyWith(void Function(StartShiftRequest) updates) =>
      super.copyWith((message) => updates(message as StartShiftRequest))
          as StartShiftRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartShiftRequest create() => StartShiftRequest._();
  @$core.override
  StartShiftRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartShiftRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartShiftRequest>(create);
  static StartShiftRequest? _defaultInstance;

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
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(3)
  set latitude($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitude() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get longitude => $_getN(3);
  @$pb.TagNumber(4)
  set longitude($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLongitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongitude() => $_clearField(4);
}

class StartShiftResponse extends $pb.GeneratedMessage {
  factory StartShiftResponse({
    $core.String? shiftId,
    $core.String? startedAt,
  }) {
    final result = create();
    if (shiftId != null) result.shiftId = shiftId;
    if (startedAt != null) result.startedAt = startedAt;
    return result;
  }

  StartShiftResponse._();

  factory StartShiftResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StartShiftResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StartShiftResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'shiftId')
    ..aOS(2, _omitFieldNames ? '' : 'startedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartShiftResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StartShiftResponse copyWith(void Function(StartShiftResponse) updates) =>
      super.copyWith((message) => updates(message as StartShiftResponse))
          as StartShiftResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartShiftResponse create() => StartShiftResponse._();
  @$core.override
  StartShiftResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StartShiftResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StartShiftResponse>(create);
  static StartShiftResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get shiftId => $_getSZ(0);
  @$pb.TagNumber(1)
  set shiftId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasShiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShiftId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get startedAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set startedAt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartedAt() => $_clearField(2);
}

class EndShiftRequest extends $pb.GeneratedMessage {
  factory EndShiftRequest({
    $core.String? workerId,
    $core.String? shiftId,
    $core.double? latitude,
    $core.double? longitude,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (shiftId != null) result.shiftId = shiftId;
    if (latitude != null) result.latitude = latitude;
    if (longitude != null) result.longitude = longitude;
    return result;
  }

  EndShiftRequest._();

  factory EndShiftRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndShiftRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndShiftRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'shiftId')
    ..aD(3, _omitFieldNames ? '' : 'latitude')
    ..aD(4, _omitFieldNames ? '' : 'longitude')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndShiftRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndShiftRequest copyWith(void Function(EndShiftRequest) updates) =>
      super.copyWith((message) => updates(message as EndShiftRequest))
          as EndShiftRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndShiftRequest create() => EndShiftRequest._();
  @$core.override
  EndShiftRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndShiftRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndShiftRequest>(create);
  static EndShiftRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get shiftId => $_getSZ(1);
  @$pb.TagNumber(2)
  set shiftId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasShiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearShiftId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get latitude => $_getN(2);
  @$pb.TagNumber(3)
  set latitude($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLatitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearLatitude() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get longitude => $_getN(3);
  @$pb.TagNumber(4)
  set longitude($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLongitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearLongitude() => $_clearField(4);
}

class EndShiftResponse extends $pb.GeneratedMessage {
  factory EndShiftResponse({
    $core.String? endedAt,
  }) {
    final result = create();
    if (endedAt != null) result.endedAt = endedAt;
    return result;
  }

  EndShiftResponse._();

  factory EndShiftResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EndShiftResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EndShiftResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'endedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndShiftResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EndShiftResponse copyWith(void Function(EndShiftResponse) updates) =>
      super.copyWith((message) => updates(message as EndShiftResponse))
          as EndShiftResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndShiftResponse create() => EndShiftResponse._();
  @$core.override
  EndShiftResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EndShiftResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EndShiftResponse>(create);
  static EndShiftResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get endedAt => $_getSZ(0);
  @$pb.TagNumber(1)
  set endedAt($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEndedAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndedAt() => $_clearField(1);
}

class SubmitDeploymentListRequest extends $pb.GeneratedMessage {
  factory SubmitDeploymentListRequest({
    $core.String? subcontractorId,
    $core.String? deploymentAt,
    $core.Iterable<DeploymentWorker>? workers,
  }) {
    final result = create();
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (deploymentAt != null) result.deploymentAt = deploymentAt;
    if (workers != null) result.workers.addAll(workers);
    return result;
  }

  SubmitDeploymentListRequest._();

  factory SubmitDeploymentListRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitDeploymentListRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitDeploymentListRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(2, _omitFieldNames ? '' : 'deploymentAt')
    ..pPM<DeploymentWorker>(3, _omitFieldNames ? '' : 'workers',
        subBuilder: DeploymentWorker.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitDeploymentListRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitDeploymentListRequest copyWith(
          void Function(SubmitDeploymentListRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitDeploymentListRequest))
          as SubmitDeploymentListRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitDeploymentListRequest create() =>
      SubmitDeploymentListRequest._();
  @$core.override
  SubmitDeploymentListRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitDeploymentListRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitDeploymentListRequest>(create);
  static SubmitDeploymentListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subcontractorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subcontractorId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubcontractorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubcontractorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deploymentAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set deploymentAt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeploymentAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeploymentAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<DeploymentWorker> get workers => $_getList(2);
}

class DeploymentWorker extends $pb.GeneratedMessage {
  factory DeploymentWorker({
    $core.String? surname,
    $core.String? givenNames,
    $core.String? nationality,
    $core.String? email,
  }) {
    final result = create();
    if (surname != null) result.surname = surname;
    if (givenNames != null) result.givenNames = givenNames;
    if (nationality != null) result.nationality = nationality;
    if (email != null) result.email = email;
    return result;
  }

  DeploymentWorker._();

  factory DeploymentWorker.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeploymentWorker.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeploymentWorker',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'surname')
    ..aOS(2, _omitFieldNames ? '' : 'givenNames')
    ..aOS(3, _omitFieldNames ? '' : 'nationality')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeploymentWorker clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeploymentWorker copyWith(void Function(DeploymentWorker) updates) =>
      super.copyWith((message) => updates(message as DeploymentWorker))
          as DeploymentWorker;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeploymentWorker create() => DeploymentWorker._();
  @$core.override
  DeploymentWorker createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeploymentWorker getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeploymentWorker>(create);
  static DeploymentWorker? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get surname => $_getSZ(0);
  @$pb.TagNumber(1)
  set surname($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSurname() => $_has(0);
  @$pb.TagNumber(1)
  void clearSurname() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get givenNames => $_getSZ(1);
  @$pb.TagNumber(2)
  set givenNames($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGivenNames() => $_has(1);
  @$pb.TagNumber(2)
  void clearGivenNames() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nationality => $_getSZ(2);
  @$pb.TagNumber(3)
  set nationality($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNationality() => $_has(2);
  @$pb.TagNumber(3)
  void clearNationality() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);
}

class SubmitDeploymentListResponse extends $pb.GeneratedMessage {
  factory SubmitDeploymentListResponse({
    $core.String? deploymentId,
    $core.int? totalCount,
    $core.int? flaggedCount,
    $core.int? rejectedCount,
    $core.String? status,
  }) {
    final result = create();
    if (deploymentId != null) result.deploymentId = deploymentId;
    if (totalCount != null) result.totalCount = totalCount;
    if (flaggedCount != null) result.flaggedCount = flaggedCount;
    if (rejectedCount != null) result.rejectedCount = rejectedCount;
    if (status != null) result.status = status;
    return result;
  }

  SubmitDeploymentListResponse._();

  factory SubmitDeploymentListResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitDeploymentListResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitDeploymentListResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deploymentId')
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..aI(3, _omitFieldNames ? '' : 'flaggedCount')
    ..aI(4, _omitFieldNames ? '' : 'rejectedCount')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitDeploymentListResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitDeploymentListResponse copyWith(
          void Function(SubmitDeploymentListResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitDeploymentListResponse))
          as SubmitDeploymentListResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitDeploymentListResponse create() =>
      SubmitDeploymentListResponse._();
  @$core.override
  SubmitDeploymentListResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubmitDeploymentListResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitDeploymentListResponse>(create);
  static SubmitDeploymentListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deploymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deploymentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeploymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeploymentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get flaggedCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set flaggedCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFlaggedCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlaggedCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get rejectedCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set rejectedCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRejectedCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearRejectedCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
}

class ListSubcontractorWorkforceRequest extends $pb.GeneratedMessage {
  factory ListSubcontractorWorkforceRequest({
    $core.String? subcontractorId,
  }) {
    final result = create();
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    return result;
  }

  ListSubcontractorWorkforceRequest._();

  factory ListSubcontractorWorkforceRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSubcontractorWorkforceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSubcontractorWorkforceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subcontractorId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorWorkforceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorWorkforceRequest copyWith(
          void Function(ListSubcontractorWorkforceRequest) updates) =>
      super.copyWith((message) =>
              updates(message as ListSubcontractorWorkforceRequest))
          as ListSubcontractorWorkforceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSubcontractorWorkforceRequest create() =>
      ListSubcontractorWorkforceRequest._();
  @$core.override
  ListSubcontractorWorkforceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSubcontractorWorkforceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSubcontractorWorkforceRequest>(
          create);
  static ListSubcontractorWorkforceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subcontractorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subcontractorId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubcontractorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubcontractorId() => $_clearField(1);
}

class SubcontractorWorkerProfile extends $pb.GeneratedMessage {
  factory SubcontractorWorkerProfile({
    $core.String? workerId,
    $core.String? surname,
    $core.String? givenNames,
    $core.String? email,
    $core.String? status,
    $core.String? trafficLight,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (surname != null) result.surname = surname;
    if (givenNames != null) result.givenNames = givenNames;
    if (email != null) result.email = email;
    if (status != null) result.status = status;
    if (trafficLight != null) result.trafficLight = trafficLight;
    return result;
  }

  SubcontractorWorkerProfile._();

  factory SubcontractorWorkerProfile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubcontractorWorkerProfile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubcontractorWorkerProfile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'surname')
    ..aOS(3, _omitFieldNames ? '' : 'givenNames')
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'trafficLight')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubcontractorWorkerProfile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubcontractorWorkerProfile copyWith(
          void Function(SubcontractorWorkerProfile) updates) =>
      super.copyWith(
              (message) => updates(message as SubcontractorWorkerProfile))
          as SubcontractorWorkerProfile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubcontractorWorkerProfile create() => SubcontractorWorkerProfile._();
  @$core.override
  SubcontractorWorkerProfile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SubcontractorWorkerProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubcontractorWorkerProfile>(create);
  static SubcontractorWorkerProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

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
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get trafficLight => $_getSZ(5);
  @$pb.TagNumber(6)
  set trafficLight($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTrafficLight() => $_has(5);
  @$pb.TagNumber(6)
  void clearTrafficLight() => $_clearField(6);
}

class ListSubcontractorWorkforceResponse extends $pb.GeneratedMessage {
  factory ListSubcontractorWorkforceResponse({
    $core.Iterable<SubcontractorWorkerProfile>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListSubcontractorWorkforceResponse._();

  factory ListSubcontractorWorkforceResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSubcontractorWorkforceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSubcontractorWorkforceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<SubcontractorWorkerProfile>(1, _omitFieldNames ? '' : 'items',
        subBuilder: SubcontractorWorkerProfile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorWorkforceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSubcontractorWorkforceResponse copyWith(
          void Function(ListSubcontractorWorkforceResponse) updates) =>
      super.copyWith((message) =>
              updates(message as ListSubcontractorWorkforceResponse))
          as ListSubcontractorWorkforceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSubcontractorWorkforceResponse create() =>
      ListSubcontractorWorkforceResponse._();
  @$core.override
  ListSubcontractorWorkforceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListSubcontractorWorkforceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSubcontractorWorkforceResponse>(
          create);
  static ListSubcontractorWorkforceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SubcontractorWorkerProfile> get items => $_getList(0);
}

class GetDeploymentValidationRequest extends $pb.GeneratedMessage {
  factory GetDeploymentValidationRequest({
    $core.String? deploymentId,
  }) {
    final result = create();
    if (deploymentId != null) result.deploymentId = deploymentId;
    return result;
  }

  GetDeploymentValidationRequest._();

  factory GetDeploymentValidationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDeploymentValidationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDeploymentValidationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deploymentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDeploymentValidationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDeploymentValidationRequest copyWith(
          void Function(GetDeploymentValidationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetDeploymentValidationRequest))
          as GetDeploymentValidationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDeploymentValidationRequest create() =>
      GetDeploymentValidationRequest._();
  @$core.override
  GetDeploymentValidationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDeploymentValidationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDeploymentValidationRequest>(create);
  static GetDeploymentValidationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deploymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deploymentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeploymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeploymentId() => $_clearField(1);
}

class GetDeploymentValidationResponse extends $pb.GeneratedMessage {
  factory GetDeploymentValidationResponse({
    $core.String? deploymentId,
    $core.String? status,
    $core.int? totalCount,
    $core.int? flaggedCount,
  }) {
    final result = create();
    if (deploymentId != null) result.deploymentId = deploymentId;
    if (status != null) result.status = status;
    if (totalCount != null) result.totalCount = totalCount;
    if (flaggedCount != null) result.flaggedCount = flaggedCount;
    return result;
  }

  GetDeploymentValidationResponse._();

  factory GetDeploymentValidationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDeploymentValidationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDeploymentValidationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'deploymentId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aI(3, _omitFieldNames ? '' : 'totalCount')
    ..aI(4, _omitFieldNames ? '' : 'flaggedCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDeploymentValidationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDeploymentValidationResponse copyWith(
          void Function(GetDeploymentValidationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetDeploymentValidationResponse))
          as GetDeploymentValidationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDeploymentValidationResponse create() =>
      GetDeploymentValidationResponse._();
  @$core.override
  GetDeploymentValidationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDeploymentValidationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDeploymentValidationResponse>(
          create);
  static GetDeploymentValidationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get deploymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set deploymentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDeploymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeploymentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get flaggedCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set flaggedCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFlaggedCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearFlaggedCount() => $_clearField(4);
}

class ListDeploymentsRequest extends $pb.GeneratedMessage {
  factory ListDeploymentsRequest({
    $core.String? subcontractorId,
    $core.String? status,
  }) {
    final result = create();
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (status != null) result.status = status;
    return result;
  }

  ListDeploymentsRequest._();

  factory ListDeploymentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeploymentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeploymentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeploymentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeploymentsRequest copyWith(
          void Function(ListDeploymentsRequest) updates) =>
      super.copyWith((message) => updates(message as ListDeploymentsRequest))
          as ListDeploymentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeploymentsRequest create() => ListDeploymentsRequest._();
  @$core.override
  ListDeploymentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeploymentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeploymentsRequest>(create);
  static ListDeploymentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subcontractorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subcontractorId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubcontractorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubcontractorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);
}

class DeploymentItem extends $pb.GeneratedMessage {
  factory DeploymentItem({
    $core.String? id,
    $core.String? deploymentAt,
    $core.String? status,
    $core.int? totalCount,
    $core.int? flaggedCount,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (deploymentAt != null) result.deploymentAt = deploymentAt;
    if (status != null) result.status = status;
    if (totalCount != null) result.totalCount = totalCount;
    if (flaggedCount != null) result.flaggedCount = flaggedCount;
    return result;
  }

  DeploymentItem._();

  factory DeploymentItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeploymentItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeploymentItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'deploymentAt')
    ..aOS(3, _omitFieldNames ? '' : 'status')
    ..aI(4, _omitFieldNames ? '' : 'totalCount')
    ..aI(5, _omitFieldNames ? '' : 'flaggedCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeploymentItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeploymentItem copyWith(void Function(DeploymentItem) updates) =>
      super.copyWith((message) => updates(message as DeploymentItem))
          as DeploymentItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeploymentItem create() => DeploymentItem._();
  @$core.override
  DeploymentItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeploymentItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeploymentItem>(create);
  static DeploymentItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deploymentAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set deploymentAt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeploymentAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeploymentAt() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalCount($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalCount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get flaggedCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set flaggedCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFlaggedCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearFlaggedCount() => $_clearField(5);
}

class ListDeploymentsResponse extends $pb.GeneratedMessage {
  factory ListDeploymentsResponse({
    $core.Iterable<DeploymentItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListDeploymentsResponse._();

  factory ListDeploymentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeploymentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeploymentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<DeploymentItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: DeploymentItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeploymentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeploymentsResponse copyWith(
          void Function(ListDeploymentsResponse) updates) =>
      super.copyWith((message) => updates(message as ListDeploymentsResponse))
          as ListDeploymentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeploymentsResponse create() => ListDeploymentsResponse._();
  @$core.override
  ListDeploymentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeploymentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeploymentsResponse>(create);
  static ListDeploymentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DeploymentItem> get items => $_getList(0);
}

class SendSubcontractorMessageRequest extends $pb.GeneratedMessage {
  factory SendSubcontractorMessageRequest({
    $core.String? subcontractorId,
    $core.String? subject,
    $core.String? workerId,
    $core.String? body,
  }) {
    final result = create();
    if (subcontractorId != null) result.subcontractorId = subcontractorId;
    if (subject != null) result.subject = subject;
    if (workerId != null) result.workerId = workerId;
    if (body != null) result.body = body;
    return result;
  }

  SendSubcontractorMessageRequest._();

  factory SendSubcontractorMessageRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendSubcontractorMessageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendSubcontractorMessageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'subcontractorId')
    ..aOS(2, _omitFieldNames ? '' : 'subject')
    ..aOS(3, _omitFieldNames ? '' : 'workerId')
    ..aOS(4, _omitFieldNames ? '' : 'body')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendSubcontractorMessageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendSubcontractorMessageRequest copyWith(
          void Function(SendSubcontractorMessageRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SendSubcontractorMessageRequest))
          as SendSubcontractorMessageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendSubcontractorMessageRequest create() =>
      SendSubcontractorMessageRequest._();
  @$core.override
  SendSubcontractorMessageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendSubcontractorMessageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendSubcontractorMessageRequest>(
          create);
  static SendSubcontractorMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get subcontractorId => $_getSZ(0);
  @$pb.TagNumber(1)
  set subcontractorId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubcontractorId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubcontractorId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get subject => $_getSZ(1);
  @$pb.TagNumber(2)
  set subject($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSubject() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubject() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get workerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set workerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWorkerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWorkerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get body => $_getSZ(3);
  @$pb.TagNumber(4)
  set body($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => $_clearField(4);
}

class SendSubcontractorMessageResponse extends $pb.GeneratedMessage {
  factory SendSubcontractorMessageResponse({
    $core.String? messageId,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    return result;
  }

  SendSubcontractorMessageResponse._();

  factory SendSubcontractorMessageResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendSubcontractorMessageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendSubcontractorMessageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendSubcontractorMessageResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendSubcontractorMessageResponse copyWith(
          void Function(SendSubcontractorMessageResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SendSubcontractorMessageResponse))
          as SendSubcontractorMessageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendSubcontractorMessageResponse create() =>
      SendSubcontractorMessageResponse._();
  @$core.override
  SendSubcontractorMessageResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendSubcontractorMessageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendSubcontractorMessageResponse>(
          create);
  static SendSubcontractorMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);
}

class SendDocumentReminderRequest extends $pb.GeneratedMessage {
  factory SendDocumentReminderRequest({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  SendDocumentReminderRequest._();

  factory SendDocumentReminderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendDocumentReminderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendDocumentReminderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendDocumentReminderRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendDocumentReminderRequest copyWith(
          void Function(SendDocumentReminderRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SendDocumentReminderRequest))
          as SendDocumentReminderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendDocumentReminderRequest create() =>
      SendDocumentReminderRequest._();
  @$core.override
  SendDocumentReminderRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendDocumentReminderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendDocumentReminderRequest>(create);
  static SendDocumentReminderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class SendDocumentReminderResponse extends $pb.GeneratedMessage {
  factory SendDocumentReminderResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  SendDocumentReminderResponse._();

  factory SendDocumentReminderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SendDocumentReminderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SendDocumentReminderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendDocumentReminderResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SendDocumentReminderResponse copyWith(
          void Function(SendDocumentReminderResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SendDocumentReminderResponse))
          as SendDocumentReminderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendDocumentReminderResponse create() =>
      SendDocumentReminderResponse._();
  @$core.override
  SendDocumentReminderResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SendDocumentReminderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SendDocumentReminderResponse>(create);
  static SendDocumentReminderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class AdjudicateWorkerRequest extends $pb.GeneratedMessage {
  factory AdjudicateWorkerRequest({
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

  AdjudicateWorkerRequest._();

  factory AdjudicateWorkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdjudicateWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdjudicateWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'decision')
    ..aOS(3, _omitFieldNames ? '' : 'justification')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdjudicateWorkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdjudicateWorkerRequest copyWith(
          void Function(AdjudicateWorkerRequest) updates) =>
      super.copyWith((message) => updates(message as AdjudicateWorkerRequest))
          as AdjudicateWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdjudicateWorkerRequest create() => AdjudicateWorkerRequest._();
  @$core.override
  AdjudicateWorkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdjudicateWorkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdjudicateWorkerRequest>(create);
  static AdjudicateWorkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  /// APPROVED | BLOCKED | NEEDS_RESUBMISSION
  ///   APPROVED           -> worker VERIFIED, traffic light GREEN, open cases closed
  ///   BLOCKED            -> worker SUSPENDED, traffic light RED, open cases closed
  ///   NEEDS_RESUBMISSION -> enrollment review sent back: worker stays GREY, the
  ///                         ENROLLMENT_REVIEW case stays OPEN, and a
  ///                         re-verification request is raised. justification is
  ///                         REQUIRED (it is the message shown to the worker).
  /// Colour overrides GREEN | AMBER | RED are also accepted. justification is
  /// REQUIRED for BLOCKED and RED (both suspend the worker).
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

class AdjudicateWorkerResponse extends $pb.GeneratedMessage {
  factory AdjudicateWorkerResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AdjudicateWorkerResponse._();

  factory AdjudicateWorkerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AdjudicateWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AdjudicateWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdjudicateWorkerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AdjudicateWorkerResponse copyWith(
          void Function(AdjudicateWorkerResponse) updates) =>
      super.copyWith((message) => updates(message as AdjudicateWorkerResponse))
          as AdjudicateWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AdjudicateWorkerResponse create() => AdjudicateWorkerResponse._();
  @$core.override
  AdjudicateWorkerResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AdjudicateWorkerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AdjudicateWorkerResponse>(create);
  static AdjudicateWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class EscalateWorkerRequest extends $pb.GeneratedMessage {
  factory EscalateWorkerRequest({
    $core.String? workerId,
    $core.String? reason,
    $core.String? priority,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (reason != null) result.reason = reason;
    if (priority != null) result.priority = priority;
    return result;
  }

  EscalateWorkerRequest._();

  factory EscalateWorkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EscalateWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EscalateWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..aOS(3, _omitFieldNames ? '' : 'priority')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EscalateWorkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EscalateWorkerRequest copyWith(
          void Function(EscalateWorkerRequest) updates) =>
      super.copyWith((message) => updates(message as EscalateWorkerRequest))
          as EscalateWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EscalateWorkerRequest create() => EscalateWorkerRequest._();
  @$core.override
  EscalateWorkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EscalateWorkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EscalateWorkerRequest>(create);
  static EscalateWorkerRequest? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get priority => $_getSZ(2);
  @$pb.TagNumber(3)
  set priority($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPriority() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriority() => $_clearField(3);
}

class EscalateWorkerResponse extends $pb.GeneratedMessage {
  factory EscalateWorkerResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  EscalateWorkerResponse._();

  factory EscalateWorkerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EscalateWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EscalateWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EscalateWorkerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EscalateWorkerResponse copyWith(
          void Function(EscalateWorkerResponse) updates) =>
      super.copyWith((message) => updates(message as EscalateWorkerResponse))
          as EscalateWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EscalateWorkerResponse create() => EscalateWorkerResponse._();
  @$core.override
  EscalateWorkerResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EscalateWorkerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EscalateWorkerResponse>(create);
  static EscalateWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RemoveWorkerFromTenantRequest extends $pb.GeneratedMessage {
  factory RemoveWorkerFromTenantRequest({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  RemoveWorkerFromTenantRequest._();

  factory RemoveWorkerFromTenantRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveWorkerFromTenantRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveWorkerFromTenantRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveWorkerFromTenantRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveWorkerFromTenantRequest copyWith(
          void Function(RemoveWorkerFromTenantRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveWorkerFromTenantRequest))
          as RemoveWorkerFromTenantRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveWorkerFromTenantRequest create() =>
      RemoveWorkerFromTenantRequest._();
  @$core.override
  RemoveWorkerFromTenantRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveWorkerFromTenantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveWorkerFromTenantRequest>(create);
  static RemoveWorkerFromTenantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class RemoveWorkerFromTenantResponse extends $pb.GeneratedMessage {
  factory RemoveWorkerFromTenantResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  RemoveWorkerFromTenantResponse._();

  factory RemoveWorkerFromTenantResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveWorkerFromTenantResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveWorkerFromTenantResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveWorkerFromTenantResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveWorkerFromTenantResponse copyWith(
          void Function(RemoveWorkerFromTenantResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RemoveWorkerFromTenantResponse))
          as RemoveWorkerFromTenantResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveWorkerFromTenantResponse create() =>
      RemoveWorkerFromTenantResponse._();
  @$core.override
  RemoveWorkerFromTenantResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveWorkerFromTenantResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveWorkerFromTenantResponse>(create);
  static RemoveWorkerFromTenantResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ListDevicesRequest extends $pb.GeneratedMessage {
  factory ListDevicesRequest({
    $core.String? tenantId,
    $core.String? workerId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  ListDevicesRequest._();

  factory ListDevicesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDevicesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDevicesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDevicesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDevicesRequest copyWith(void Function(ListDevicesRequest) updates) =>
      super.copyWith((message) => updates(message as ListDevicesRequest))
          as ListDevicesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDevicesRequest create() => ListDevicesRequest._();
  @$core.override
  ListDevicesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDevicesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDevicesRequest>(create);
  static ListDevicesRequest? _defaultInstance;

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
}

class DeviceInfo extends $pb.GeneratedMessage {
  factory DeviceInfo({
    $core.String? id,
    $core.String? workerId,
    $core.String? workerName,
    $core.String? model,
    $core.String? platform,
    $core.String? status,
    $core.String? boundAt,
    $core.String? lastSeenAt,
    $core.double? anomalyScore,
    $core.String? carrier,
    $core.String? network,
    $core.String? lastGps,
    $core.String? wifiSsid,
    $core.String? wifiIp,
    $core.String? mobileGeneration,
    $core.bool? isAirplaneMode,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (workerName != null) result.workerName = workerName;
    if (model != null) result.model = model;
    if (platform != null) result.platform = platform;
    if (status != null) result.status = status;
    if (boundAt != null) result.boundAt = boundAt;
    if (lastSeenAt != null) result.lastSeenAt = lastSeenAt;
    if (anomalyScore != null) result.anomalyScore = anomalyScore;
    if (carrier != null) result.carrier = carrier;
    if (network != null) result.network = network;
    if (lastGps != null) result.lastGps = lastGps;
    if (wifiSsid != null) result.wifiSsid = wifiSsid;
    if (wifiIp != null) result.wifiIp = wifiIp;
    if (mobileGeneration != null) result.mobileGeneration = mobileGeneration;
    if (isAirplaneMode != null) result.isAirplaneMode = isAirplaneMode;
    return result;
  }

  DeviceInfo._();

  factory DeviceInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'workerName')
    ..aOS(4, _omitFieldNames ? '' : 'model')
    ..aOS(5, _omitFieldNames ? '' : 'platform')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'boundAt')
    ..aOS(8, _omitFieldNames ? '' : 'lastSeenAt')
    ..aD(9, _omitFieldNames ? '' : 'anomalyScore')
    ..aOS(10, _omitFieldNames ? '' : 'carrier')
    ..aOS(11, _omitFieldNames ? '' : 'network')
    ..aOS(12, _omitFieldNames ? '' : 'lastGps')
    ..aOS(13, _omitFieldNames ? '' : 'wifiSsid')
    ..aOS(14, _omitFieldNames ? '' : 'wifiIp')
    ..aOS(15, _omitFieldNames ? '' : 'mobileGeneration')
    ..aOB(16, _omitFieldNames ? '' : 'isAirplaneMode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceInfo copyWith(void Function(DeviceInfo) updates) =>
      super.copyWith((message) => updates(message as DeviceInfo)) as DeviceInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceInfo create() => DeviceInfo._();
  @$core.override
  DeviceInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceInfo>(create);
  static DeviceInfo? _defaultInstance;

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
  $core.String get model => $_getSZ(3);
  @$pb.TagNumber(4)
  set model($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearModel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get platform => $_getSZ(4);
  @$pb.TagNumber(5)
  set platform($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPlatform() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlatform() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get boundAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set boundAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBoundAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearBoundAt() => $_clearField(7);

  /// latest signal batch:
  @$pb.TagNumber(8)
  $core.String get lastSeenAt => $_getSZ(7);
  @$pb.TagNumber(8)
  set lastSeenAt($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLastSeenAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastSeenAt() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get anomalyScore => $_getN(8);
  @$pb.TagNumber(9)
  set anomalyScore($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAnomalyScore() => $_has(8);
  @$pb.TagNumber(9)
  void clearAnomalyScore() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get carrier => $_getSZ(9);
  @$pb.TagNumber(10)
  set carrier($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCarrier() => $_has(9);
  @$pb.TagNumber(10)
  void clearCarrier() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get network => $_getSZ(10);
  @$pb.TagNumber(11)
  set network($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasNetwork() => $_has(10);
  @$pb.TagNumber(11)
  void clearNetwork() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get lastGps => $_getSZ(11);
  @$pb.TagNumber(12)
  set lastGps($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasLastGps() => $_has(11);
  @$pb.TagNumber(12)
  void clearLastGps() => $_clearField(12);

  /// --- new: latest telemetry batch signals, empty string = unknown ---
  @$pb.TagNumber(13)
  $core.String get wifiSsid => $_getSZ(12);
  @$pb.TagNumber(13)
  set wifiSsid($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasWifiSsid() => $_has(12);
  @$pb.TagNumber(13)
  void clearWifiSsid() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get wifiIp => $_getSZ(13);
  @$pb.TagNumber(14)
  set wifiIp($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasWifiIp() => $_has(13);
  @$pb.TagNumber(14)
  void clearWifiIp() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get mobileGeneration => $_getSZ(14);
  @$pb.TagNumber(15)
  set mobileGeneration($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasMobileGeneration() => $_has(14);
  @$pb.TagNumber(15)
  void clearMobileGeneration() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.bool get isAirplaneMode => $_getBF(15);
  @$pb.TagNumber(16)
  set isAirplaneMode($core.bool value) => $_setBool(15, value);
  @$pb.TagNumber(16)
  $core.bool hasIsAirplaneMode() => $_has(15);
  @$pb.TagNumber(16)
  void clearIsAirplaneMode() => $_clearField(16);
}

class ListDevicesResponse extends $pb.GeneratedMessage {
  factory ListDevicesResponse({
    $core.Iterable<DeviceInfo>? devices,
  }) {
    final result = create();
    if (devices != null) result.devices.addAll(devices);
    return result;
  }

  ListDevicesResponse._();

  factory ListDevicesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDevicesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDevicesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<DeviceInfo>(1, _omitFieldNames ? '' : 'devices',
        subBuilder: DeviceInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDevicesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDevicesResponse copyWith(void Function(ListDevicesResponse) updates) =>
      super.copyWith((message) => updates(message as ListDevicesResponse))
          as ListDevicesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDevicesResponse create() => ListDevicesResponse._();
  @$core.override
  ListDevicesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDevicesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDevicesResponse>(create);
  static ListDevicesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DeviceInfo> get devices => $_getList(0);
}

class ListDeviceSignalBatchesRequest extends $pb.GeneratedMessage {
  factory ListDeviceSignalBatchesRequest({
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

  ListDeviceSignalBatchesRequest._();

  factory ListDeviceSignalBatchesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeviceSignalBatchesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeviceSignalBatchesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aI(2, _omitFieldNames ? '' : 'page')
    ..aI(3, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceSignalBatchesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceSignalBatchesRequest copyWith(
          void Function(ListDeviceSignalBatchesRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeviceSignalBatchesRequest))
          as ListDeviceSignalBatchesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeviceSignalBatchesRequest create() =>
      ListDeviceSignalBatchesRequest._();
  @$core.override
  ListDeviceSignalBatchesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeviceSignalBatchesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeviceSignalBatchesRequest>(create);
  static ListDeviceSignalBatchesRequest? _defaultInstance;

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

class DeviceSignalBatchInfo extends $pb.GeneratedMessage {
  factory DeviceSignalBatchInfo({
    $core.String? id,
    $core.String? workerId,
    $core.String? workerName,
    $core.String? deviceModel,
    $core.String? devicePlatform,
    $core.double? anomalyScore,
    $core.String? receivedAt,
    $core.String? carrier,
    $core.String? network,
    $core.String? wifiSsid,
    $core.String? wifiIp,
    $core.String? mobileGeneration,
    $core.bool? isAirplaneMode,
    $core.String? lastGps,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (workerName != null) result.workerName = workerName;
    if (deviceModel != null) result.deviceModel = deviceModel;
    if (devicePlatform != null) result.devicePlatform = devicePlatform;
    if (anomalyScore != null) result.anomalyScore = anomalyScore;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (carrier != null) result.carrier = carrier;
    if (network != null) result.network = network;
    if (wifiSsid != null) result.wifiSsid = wifiSsid;
    if (wifiIp != null) result.wifiIp = wifiIp;
    if (mobileGeneration != null) result.mobileGeneration = mobileGeneration;
    if (isAirplaneMode != null) result.isAirplaneMode = isAirplaneMode;
    if (lastGps != null) result.lastGps = lastGps;
    return result;
  }

  DeviceSignalBatchInfo._();

  factory DeviceSignalBatchInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceSignalBatchInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceSignalBatchInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'workerName')
    ..aOS(4, _omitFieldNames ? '' : 'deviceModel')
    ..aOS(5, _omitFieldNames ? '' : 'devicePlatform')
    ..aD(6, _omitFieldNames ? '' : 'anomalyScore')
    ..aOS(7, _omitFieldNames ? '' : 'receivedAt')
    ..aOS(8, _omitFieldNames ? '' : 'carrier')
    ..aOS(9, _omitFieldNames ? '' : 'network')
    ..aOS(10, _omitFieldNames ? '' : 'wifiSsid')
    ..aOS(11, _omitFieldNames ? '' : 'wifiIp')
    ..aOS(12, _omitFieldNames ? '' : 'mobileGeneration')
    ..aOB(13, _omitFieldNames ? '' : 'isAirplaneMode')
    ..aOS(14, _omitFieldNames ? '' : 'lastGps')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceSignalBatchInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceSignalBatchInfo copyWith(
          void Function(DeviceSignalBatchInfo) updates) =>
      super.copyWith((message) => updates(message as DeviceSignalBatchInfo))
          as DeviceSignalBatchInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceSignalBatchInfo create() => DeviceSignalBatchInfo._();
  @$core.override
  DeviceSignalBatchInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceSignalBatchInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceSignalBatchInfo>(create);
  static DeviceSignalBatchInfo? _defaultInstance;

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
  $core.String get deviceModel => $_getSZ(3);
  @$pb.TagNumber(4)
  set deviceModel($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDeviceModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeviceModel() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get devicePlatform => $_getSZ(4);
  @$pb.TagNumber(5)
  set devicePlatform($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDevicePlatform() => $_has(4);
  @$pb.TagNumber(5)
  void clearDevicePlatform() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get anomalyScore => $_getN(5);
  @$pb.TagNumber(6)
  set anomalyScore($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAnomalyScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearAnomalyScore() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get receivedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set receivedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasReceivedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceivedAt() => $_clearField(7);

  /// --- new: curated per-batch signals (empty string = unknown). No raw signals
  /// blob and no wifi_bssid — PII-adjacent MAC is deliberately not surfaced. ---
  @$pb.TagNumber(8)
  $core.String get carrier => $_getSZ(7);
  @$pb.TagNumber(8)
  set carrier($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCarrier() => $_has(7);
  @$pb.TagNumber(8)
  void clearCarrier() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get network => $_getSZ(8);
  @$pb.TagNumber(9)
  set network($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNetwork() => $_has(8);
  @$pb.TagNumber(9)
  void clearNetwork() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get wifiSsid => $_getSZ(9);
  @$pb.TagNumber(10)
  set wifiSsid($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasWifiSsid() => $_has(9);
  @$pb.TagNumber(10)
  void clearWifiSsid() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get wifiIp => $_getSZ(10);
  @$pb.TagNumber(11)
  set wifiIp($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasWifiIp() => $_has(10);
  @$pb.TagNumber(11)
  void clearWifiIp() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get mobileGeneration => $_getSZ(11);
  @$pb.TagNumber(12)
  set mobileGeneration($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasMobileGeneration() => $_has(11);
  @$pb.TagNumber(12)
  void clearMobileGeneration() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.bool get isAirplaneMode => $_getBF(12);
  @$pb.TagNumber(13)
  set isAirplaneMode($core.bool value) => $_setBool(12, value);
  @$pb.TagNumber(13)
  $core.bool hasIsAirplaneMode() => $_has(12);
  @$pb.TagNumber(13)
  void clearIsAirplaneMode() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get lastGps => $_getSZ(13);
  @$pb.TagNumber(14)
  set lastGps($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasLastGps() => $_has(13);
  @$pb.TagNumber(14)
  void clearLastGps() => $_clearField(14);
}

class ListDeviceSignalBatchesResponse extends $pb.GeneratedMessage {
  factory ListDeviceSignalBatchesResponse({
    $core.Iterable<DeviceSignalBatchInfo>? items,
    $core.int? totalItems,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (totalItems != null) result.totalItems = totalItems;
    return result;
  }

  ListDeviceSignalBatchesResponse._();

  factory ListDeviceSignalBatchesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeviceSignalBatchesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeviceSignalBatchesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<DeviceSignalBatchInfo>(1, _omitFieldNames ? '' : 'items',
        subBuilder: DeviceSignalBatchInfo.create)
    ..aI(2, _omitFieldNames ? '' : 'totalItems')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceSignalBatchesResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeviceSignalBatchesResponse copyWith(
          void Function(ListDeviceSignalBatchesResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeviceSignalBatchesResponse))
          as ListDeviceSignalBatchesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeviceSignalBatchesResponse create() =>
      ListDeviceSignalBatchesResponse._();
  @$core.override
  ListDeviceSignalBatchesResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeviceSignalBatchesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeviceSignalBatchesResponse>(
          create);
  static ListDeviceSignalBatchesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DeviceSignalBatchInfo> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalItems => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalItems($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalItems() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalItems() => $_clearField(2);
}

class ValidateWorkersRequest extends $pb.GeneratedMessage {
  factory ValidateWorkersRequest({
    $core.String? tenantId,
    $core.Iterable<$core.String>? identifiers,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (identifiers != null) result.identifiers.addAll(identifiers);
    return result;
  }

  ValidateWorkersRequest._();

  factory ValidateWorkersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateWorkersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateWorkersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..pPS(2, _omitFieldNames ? '' : 'identifiers')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateWorkersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateWorkersRequest copyWith(
          void Function(ValidateWorkersRequest) updates) =>
      super.copyWith((message) => updates(message as ValidateWorkersRequest))
          as ValidateWorkersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateWorkersRequest create() => ValidateWorkersRequest._();
  @$core.override
  ValidateWorkersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValidateWorkersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateWorkersRequest>(create);
  static ValidateWorkersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get identifiers => $_getList(1);
}

class WorkerValidation extends $pb.GeneratedMessage {
  factory WorkerValidation({
    $core.String? identifier,
    $core.bool? found,
    $core.String? workerId,
    $core.String? name,
    $core.String? status,
    $core.String? riskLevel,
    $core.String? trafficLight,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (found != null) result.found = found;
    if (workerId != null) result.workerId = workerId;
    if (name != null) result.name = name;
    if (status != null) result.status = status;
    if (riskLevel != null) result.riskLevel = riskLevel;
    if (trafficLight != null) result.trafficLight = trafficLight;
    return result;
  }

  WorkerValidation._();

  factory WorkerValidation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WorkerValidation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WorkerValidation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'identifier')
    ..aOB(2, _omitFieldNames ? '' : 'found')
    ..aOS(3, _omitFieldNames ? '' : 'workerId')
    ..aOS(4, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'riskLevel')
    ..aOS(7, _omitFieldNames ? '' : 'trafficLight')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerValidation clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WorkerValidation copyWith(void Function(WorkerValidation) updates) =>
      super.copyWith((message) => updates(message as WorkerValidation))
          as WorkerValidation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WorkerValidation create() => WorkerValidation._();
  @$core.override
  WorkerValidation createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WorkerValidation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WorkerValidation>(create);
  static WorkerValidation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get identifier => $_getSZ(0);
  @$pb.TagNumber(1)
  set identifier($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get found => $_getBF(1);
  @$pb.TagNumber(2)
  set found($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFound() => $_has(1);
  @$pb.TagNumber(2)
  void clearFound() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get workerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set workerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWorkerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWorkerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get riskLevel => $_getSZ(5);
  @$pb.TagNumber(6)
  set riskLevel($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRiskLevel() => $_has(5);
  @$pb.TagNumber(6)
  void clearRiskLevel() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get trafficLight => $_getSZ(6);
  @$pb.TagNumber(7)
  set trafficLight($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTrafficLight() => $_has(6);
  @$pb.TagNumber(7)
  void clearTrafficLight() => $_clearField(7);
}

class ValidateWorkersResponse extends $pb.GeneratedMessage {
  factory ValidateWorkersResponse({
    $core.Iterable<WorkerValidation>? results,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    return result;
  }

  ValidateWorkersResponse._();

  factory ValidateWorkersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateWorkersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateWorkersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<WorkerValidation>(1, _omitFieldNames ? '' : 'results',
        subBuilder: WorkerValidation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateWorkersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateWorkersResponse copyWith(
          void Function(ValidateWorkersResponse) updates) =>
      super.copyWith((message) => updates(message as ValidateWorkersResponse))
          as ValidateWorkersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateWorkersResponse create() => ValidateWorkersResponse._();
  @$core.override
  ValidateWorkersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValidateWorkersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateWorkersResponse>(create);
  static ValidateWorkersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WorkerValidation> get results => $_getList(0);
}

class RerunBackgroundChecksRequest extends $pb.GeneratedMessage {
  factory RerunBackgroundChecksRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.Iterable<$core.String>? checkTypes,
    $core.bool? includeSettled,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (checkTypes != null) result.checkTypes.addAll(checkTypes);
    if (includeSettled != null) result.includeSettled = includeSettled;
    return result;
  }

  RerunBackgroundChecksRequest._();

  factory RerunBackgroundChecksRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RerunBackgroundChecksRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RerunBackgroundChecksRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..pPS(3, _omitFieldNames ? '' : 'checkTypes')
    ..aOB(4, _omitFieldNames ? '' : 'includeSettled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RerunBackgroundChecksRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RerunBackgroundChecksRequest copyWith(
          void Function(RerunBackgroundChecksRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RerunBackgroundChecksRequest))
          as RerunBackgroundChecksRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RerunBackgroundChecksRequest create() =>
      RerunBackgroundChecksRequest._();
  @$core.override
  RerunBackgroundChecksRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RerunBackgroundChecksRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RerunBackgroundChecksRequest>(create);
  static RerunBackgroundChecksRequest? _defaultInstance;

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
  $pb.PbList<$core.String> get checkTypes => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get includeSettled => $_getBF(3);
  @$pb.TagNumber(4)
  set includeSettled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIncludeSettled() => $_has(3);
  @$pb.TagNumber(4)
  void clearIncludeSettled() => $_clearField(4);
}

class RerunBackgroundChecksResponse extends $pb.GeneratedMessage {
  factory RerunBackgroundChecksResponse({
    $core.bool? success,
    $core.int? checksTriggered,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (checksTriggered != null) result.checksTriggered = checksTriggered;
    return result;
  }

  RerunBackgroundChecksResponse._();

  factory RerunBackgroundChecksResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RerunBackgroundChecksResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RerunBackgroundChecksResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'checksTriggered')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RerunBackgroundChecksResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RerunBackgroundChecksResponse copyWith(
          void Function(RerunBackgroundChecksResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RerunBackgroundChecksResponse))
          as RerunBackgroundChecksResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RerunBackgroundChecksResponse create() =>
      RerunBackgroundChecksResponse._();
  @$core.override
  RerunBackgroundChecksResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RerunBackgroundChecksResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RerunBackgroundChecksResponse>(create);
  static RerunBackgroundChecksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get checksTriggered => $_getIZ(1);
  @$pb.TagNumber(2)
  set checksTriggered($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChecksTriggered() => $_has(1);
  @$pb.TagNumber(2)
  void clearChecksTriggered() => $_clearField(2);
}

class DeleteWorkerRequest extends $pb.GeneratedMessage {
  factory DeleteWorkerRequest({
    $core.String? workerId,
    $core.String? reason,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (reason != null) result.reason = reason;
    return result;
  }

  DeleteWorkerRequest._();

  factory DeleteWorkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteWorkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteWorkerRequest copyWith(void Function(DeleteWorkerRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteWorkerRequest))
          as DeleteWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteWorkerRequest create() => DeleteWorkerRequest._();
  @$core.override
  DeleteWorkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteWorkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteWorkerRequest>(create);
  static DeleteWorkerRequest? _defaultInstance;

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

class DeleteWorkerResponse extends $pb.GeneratedMessage {
  factory DeleteWorkerResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteWorkerResponse._();

  factory DeleteWorkerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteWorkerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteWorkerResponse copyWith(void Function(DeleteWorkerResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteWorkerResponse))
          as DeleteWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteWorkerResponse create() => DeleteWorkerResponse._();
  @$core.override
  DeleteWorkerResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteWorkerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteWorkerResponse>(create);
  static DeleteWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RestoreWorkerRequest extends $pb.GeneratedMessage {
  factory RestoreWorkerRequest({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  RestoreWorkerRequest._();

  factory RestoreWorkerRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RestoreWorkerRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RestoreWorkerRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreWorkerRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreWorkerRequest copyWith(void Function(RestoreWorkerRequest) updates) =>
      super.copyWith((message) => updates(message as RestoreWorkerRequest))
          as RestoreWorkerRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoreWorkerRequest create() => RestoreWorkerRequest._();
  @$core.override
  RestoreWorkerRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RestoreWorkerRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RestoreWorkerRequest>(create);
  static RestoreWorkerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class RestoreWorkerResponse extends $pb.GeneratedMessage {
  factory RestoreWorkerResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  RestoreWorkerResponse._();

  factory RestoreWorkerResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RestoreWorkerResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RestoreWorkerResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreWorkerResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RestoreWorkerResponse copyWith(
          void Function(RestoreWorkerResponse) updates) =>
      super.copyWith((message) => updates(message as RestoreWorkerResponse))
          as RestoreWorkerResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RestoreWorkerResponse create() => RestoreWorkerResponse._();
  @$core.override
  RestoreWorkerResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RestoreWorkerResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RestoreWorkerResponse>(create);
  static RestoreWorkerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ListDeletedWorkersRequest extends $pb.GeneratedMessage {
  factory ListDeletedWorkersRequest({
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

  ListDeletedWorkersRequest._();

  factory ListDeletedWorkersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeletedWorkersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeletedWorkersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aI(2, _omitFieldNames ? '' : 'page')
    ..aI(3, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedWorkersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedWorkersRequest copyWith(
          void Function(ListDeletedWorkersRequest) updates) =>
      super.copyWith((message) => updates(message as ListDeletedWorkersRequest))
          as ListDeletedWorkersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeletedWorkersRequest create() => ListDeletedWorkersRequest._();
  @$core.override
  ListDeletedWorkersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeletedWorkersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeletedWorkersRequest>(create);
  static ListDeletedWorkersRequest? _defaultInstance;

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

class ListDeletedWorkersResponse extends $pb.GeneratedMessage {
  factory ListDeletedWorkersResponse({
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

  ListDeletedWorkersResponse._();

  factory ListDeletedWorkersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDeletedWorkersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDeletedWorkersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'worker.v1'),
      createEmptyInstance: create)
    ..pPM<WorkerProfile>(1, _omitFieldNames ? '' : 'workers',
        subBuilder: WorkerProfile.create)
    ..aI(2, _omitFieldNames ? '' : 'totalItems')
    ..aI(3, _omitFieldNames ? '' : 'totalPages')
    ..aI(4, _omitFieldNames ? '' : 'currentPage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedWorkersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDeletedWorkersResponse copyWith(
          void Function(ListDeletedWorkersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDeletedWorkersResponse))
          as ListDeletedWorkersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDeletedWorkersResponse create() => ListDeletedWorkersResponse._();
  @$core.override
  ListDeletedWorkersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDeletedWorkersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDeletedWorkersResponse>(create);
  static ListDeletedWorkersResponse? _defaultInstance;

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
