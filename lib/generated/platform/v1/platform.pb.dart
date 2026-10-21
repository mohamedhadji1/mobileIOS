// This is a generated file - do not edit.
//
// Generated from platform/v1/platform.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'platform.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'platform.pbenum.dart';

class SyncUserRequest extends $pb.GeneratedMessage {
  factory SyncUserRequest() => create();

  SyncUserRequest._();

  factory SyncUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncUserRequest copyWith(void Function(SyncUserRequest) updates) =>
      super.copyWith((message) => updates(message as SyncUserRequest))
          as SyncUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncUserRequest create() => SyncUserRequest._();
  @$core.override
  SyncUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncUserRequest>(create);
  static SyncUserRequest? _defaultInstance;
}

class SyncUserResponse extends $pb.GeneratedMessage {
  factory SyncUserResponse({
    $core.String? userId,
    $core.bool? created,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (created != null) result.created = created;
    return result;
  }

  SyncUserResponse._();

  factory SyncUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOB(2, _omitFieldNames ? '' : 'created')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncUserResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncUserResponse copyWith(void Function(SyncUserResponse) updates) =>
      super.copyWith((message) => updates(message as SyncUserResponse))
          as SyncUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncUserResponse create() => SyncUserResponse._();
  @$core.override
  SyncUserResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SyncUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncUserResponse>(create);
  static SyncUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get created => $_getBF(1);
  @$pb.TagNumber(2)
  set created($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCreated() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreated() => $_clearField(2);
}

class GetUserProfileRequest extends $pb.GeneratedMessage {
  factory GetUserProfileRequest({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  GetUserProfileRequest._();

  factory GetUserProfileRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserProfileRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserProfileRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserProfileRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserProfileRequest copyWith(
          void Function(GetUserProfileRequest) updates) =>
      super.copyWith((message) => updates(message as GetUserProfileRequest))
          as GetUserProfileRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserProfileRequest create() => GetUserProfileRequest._();
  @$core.override
  GetUserProfileRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserProfileRequest>(create);
  static GetUserProfileRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetUserProfileResponse extends $pb.GeneratedMessage {
  factory GetUserProfileResponse({
    $core.String? userId,
    $core.String? email,
    $core.String? fullName,
    $core.bool? active,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (email != null) result.email = email;
    if (fullName != null) result.fullName = fullName;
    if (active != null) result.active = active;
    return result;
  }

  GetUserProfileResponse._();

  factory GetUserProfileResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserProfileResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserProfileResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'fullName')
    ..aOB(4, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserProfileResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserProfileResponse copyWith(
          void Function(GetUserProfileResponse) updates) =>
      super.copyWith((message) => updates(message as GetUserProfileResponse))
          as GetUserProfileResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse create() => GetUserProfileResponse._();
  @$core.override
  GetUserProfileResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetUserProfileResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserProfileResponse>(create);
  static GetUserProfileResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fullName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fullName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFullName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFullName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get active => $_getBF(3);
  @$pb.TagNumber(4)
  set active($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasActive() => $_has(3);
  @$pb.TagNumber(4)
  void clearActive() => $_clearField(4);
}

class CheckPermissionRequest extends $pb.GeneratedMessage {
  factory CheckPermissionRequest({
    $core.String? userId,
    $core.String? action,
    $core.String? resourceType,
    $core.String? tenantId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (action != null) result.action = action;
    if (resourceType != null) result.resourceType = resourceType;
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  CheckPermissionRequest._();

  factory CheckPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'action')
    ..aOS(3, _omitFieldNames ? '' : 'resourceType')
    ..aOS(4, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionRequest copyWith(
          void Function(CheckPermissionRequest) updates) =>
      super.copyWith((message) => updates(message as CheckPermissionRequest))
          as CheckPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest create() => CheckPermissionRequest._();
  @$core.override
  CheckPermissionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPermissionRequest>(create);
  static CheckPermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get action => $_getSZ(1);
  @$pb.TagNumber(2)
  set action($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAction() => $_has(1);
  @$pb.TagNumber(2)
  void clearAction() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resourceType => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResourceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get tenantId => $_getSZ(3);
  @$pb.TagNumber(4)
  set tenantId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTenantId() => $_has(3);
  @$pb.TagNumber(4)
  void clearTenantId() => $_clearField(4);
}

class CheckPermissionResponse extends $pb.GeneratedMessage {
  factory CheckPermissionResponse({
    $core.bool? allowed,
    $core.String? denialReason,
  }) {
    final result = create();
    if (allowed != null) result.allowed = allowed;
    if (denialReason != null) result.denialReason = denialReason;
    return result;
  }

  CheckPermissionResponse._();

  factory CheckPermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'allowed')
    ..aOS(2, _omitFieldNames ? '' : 'denialReason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionResponse copyWith(
          void Function(CheckPermissionResponse) updates) =>
      super.copyWith((message) => updates(message as CheckPermissionResponse))
          as CheckPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse create() => CheckPermissionResponse._();
  @$core.override
  CheckPermissionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPermissionResponse>(create);
  static CheckPermissionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allowed => $_getBF(0);
  @$pb.TagNumber(1)
  set allowed($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAllowed() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowed() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get denialReason => $_getSZ(1);
  @$pb.TagNumber(2)
  set denialReason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDenialReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearDenialReason() => $_clearField(2);
}

class AuditWriteRequest extends $pb.GeneratedMessage {
  factory AuditWriteRequest({
    $core.String? tenantId,
    $core.String? actorId,
    $core.String? actorRole,
    $core.String? action,
    $core.String? targetType,
    $core.String? targetId,
    $core.String? sourceIp,
    $core.String? userAgent,
    $core.String? requestId,
    $core.String? sessionId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (actorId != null) result.actorId = actorId;
    if (actorRole != null) result.actorRole = actorRole;
    if (action != null) result.action = action;
    if (targetType != null) result.targetType = targetType;
    if (targetId != null) result.targetId = targetId;
    if (sourceIp != null) result.sourceIp = sourceIp;
    if (userAgent != null) result.userAgent = userAgent;
    if (requestId != null) result.requestId = requestId;
    if (sessionId != null) result.sessionId = sessionId;
    return result;
  }

  AuditWriteRequest._();

  factory AuditWriteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuditWriteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuditWriteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'actorId')
    ..aOS(3, _omitFieldNames ? '' : 'actorRole')
    ..aOS(4, _omitFieldNames ? '' : 'action')
    ..aOS(5, _omitFieldNames ? '' : 'targetType')
    ..aOS(6, _omitFieldNames ? '' : 'targetId')
    ..aOS(7, _omitFieldNames ? '' : 'sourceIp')
    ..aOS(8, _omitFieldNames ? '' : 'userAgent')
    ..aOS(9, _omitFieldNames ? '' : 'requestId')
    ..aOS(10, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuditWriteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuditWriteRequest copyWith(void Function(AuditWriteRequest) updates) =>
      super.copyWith((message) => updates(message as AuditWriteRequest))
          as AuditWriteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuditWriteRequest create() => AuditWriteRequest._();
  @$core.override
  AuditWriteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuditWriteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuditWriteRequest>(create);
  static AuditWriteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get actorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set actorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearActorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get actorRole => $_getSZ(2);
  @$pb.TagNumber(3)
  set actorRole($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasActorRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearActorRole() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get action => $_getSZ(3);
  @$pb.TagNumber(4)
  set action($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAction() => $_has(3);
  @$pb.TagNumber(4)
  void clearAction() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get targetType => $_getSZ(4);
  @$pb.TagNumber(5)
  set targetType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTargetType() => $_has(4);
  @$pb.TagNumber(5)
  void clearTargetType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get targetId => $_getSZ(5);
  @$pb.TagNumber(6)
  set targetId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTargetId() => $_has(5);
  @$pb.TagNumber(6)
  void clearTargetId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get sourceIp => $_getSZ(6);
  @$pb.TagNumber(7)
  set sourceIp($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSourceIp() => $_has(6);
  @$pb.TagNumber(7)
  void clearSourceIp() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get userAgent => $_getSZ(7);
  @$pb.TagNumber(8)
  set userAgent($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUserAgent() => $_has(7);
  @$pb.TagNumber(8)
  void clearUserAgent() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get requestId => $_getSZ(8);
  @$pb.TagNumber(9)
  set requestId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRequestId() => $_has(8);
  @$pb.TagNumber(9)
  void clearRequestId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get sessionId => $_getSZ(9);
  @$pb.TagNumber(10)
  set sessionId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSessionId() => $_has(9);
  @$pb.TagNumber(10)
  void clearSessionId() => $_clearField(10);
}

class AuditWriteResponse extends $pb.GeneratedMessage {
  factory AuditWriteResponse({
    $core.String? eventId,
  }) {
    final result = create();
    if (eventId != null) result.eventId = eventId;
    return result;
  }

  AuditWriteResponse._();

  factory AuditWriteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuditWriteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuditWriteResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'eventId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuditWriteResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuditWriteResponse copyWith(void Function(AuditWriteResponse) updates) =>
      super.copyWith((message) => updates(message as AuditWriteResponse))
          as AuditWriteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuditWriteResponse create() => AuditWriteResponse._();
  @$core.override
  AuditWriteResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuditWriteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuditWriteResponse>(create);
  static AuditWriteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get eventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set eventId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEventId() => $_clearField(1);
}

class GivePermissionRequest extends $pb.GeneratedMessage {
  factory GivePermissionRequest({
    $core.String? tenantId,
    $core.String? userId,
    $core.String? action,
    $core.String? resourceType,
    $core.String? email,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (userId != null) result.userId = userId;
    if (action != null) result.action = action;
    if (resourceType != null) result.resourceType = resourceType;
    if (email != null) result.email = email;
    return result;
  }

  GivePermissionRequest._();

  factory GivePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GivePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GivePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'action')
    ..aOS(4, _omitFieldNames ? '' : 'resourceType')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GivePermissionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GivePermissionRequest copyWith(
          void Function(GivePermissionRequest) updates) =>
      super.copyWith((message) => updates(message as GivePermissionRequest))
          as GivePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GivePermissionRequest create() => GivePermissionRequest._();
  @$core.override
  GivePermissionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GivePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GivePermissionRequest>(create);
  static GivePermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get action => $_getSZ(2);
  @$pb.TagNumber(3)
  set action($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get resourceType => $_getSZ(3);
  @$pb.TagNumber(4)
  set resourceType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasResourceType() => $_has(3);
  @$pb.TagNumber(4)
  void clearResourceType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => $_clearField(5);
}

class GivePermissionResponse extends $pb.GeneratedMessage {
  factory GivePermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  GivePermissionResponse._();

  factory GivePermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GivePermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GivePermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GivePermissionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GivePermissionResponse copyWith(
          void Function(GivePermissionResponse) updates) =>
      super.copyWith((message) => updates(message as GivePermissionResponse))
          as GivePermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GivePermissionResponse create() => GivePermissionResponse._();
  @$core.override
  GivePermissionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GivePermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GivePermissionResponse>(create);
  static GivePermissionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class OnboardTenantRequest extends $pb.GeneratedMessage {
  factory OnboardTenantRequest({
    $core.String? name,
    $core.String? slug,
    $core.String? primaryContactEmail,
    $core.String? configJson,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (slug != null) result.slug = slug;
    if (primaryContactEmail != null)
      result.primaryContactEmail = primaryContactEmail;
    if (configJson != null) result.configJson = configJson;
    return result;
  }

  OnboardTenantRequest._();

  factory OnboardTenantRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OnboardTenantRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OnboardTenantRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'slug')
    ..aOS(3, _omitFieldNames ? '' : 'primaryContactEmail')
    ..aOS(4, _omitFieldNames ? '' : 'configJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OnboardTenantRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OnboardTenantRequest copyWith(void Function(OnboardTenantRequest) updates) =>
      super.copyWith((message) => updates(message as OnboardTenantRequest))
          as OnboardTenantRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnboardTenantRequest create() => OnboardTenantRequest._();
  @$core.override
  OnboardTenantRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OnboardTenantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OnboardTenantRequest>(create);
  static OnboardTenantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get slug => $_getSZ(1);
  @$pb.TagNumber(2)
  set slug($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSlug() => $_has(1);
  @$pb.TagNumber(2)
  void clearSlug() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get primaryContactEmail => $_getSZ(2);
  @$pb.TagNumber(3)
  set primaryContactEmail($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPrimaryContactEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrimaryContactEmail() => $_clearField(3);

  /// Optional initial tenant config document (string-encoded JSON object, same
  /// convention as UpdateTenantConfigRequest.config_json). It is merged OVER
  /// the platform defaults: caller keys win, defaults fill only unset keys, and
  /// object values (e.g. risk_thresholds) merge one level deep. Empty means
  /// seed the defaults unchanged. A non-object or malformed value is rejected
  /// with INVALID_ARGUMENT.
  @$pb.TagNumber(4)
  $core.String get configJson => $_getSZ(3);
  @$pb.TagNumber(4)
  set configJson($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConfigJson() => $_has(3);
  @$pb.TagNumber(4)
  void clearConfigJson() => $_clearField(4);
}

class OnboardTenantResponse extends $pb.GeneratedMessage {
  factory OnboardTenantResponse({
    $core.String? tenantId,
    $core.String? keycloakRealmId,
    $core.String? message,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (keycloakRealmId != null) result.keycloakRealmId = keycloakRealmId;
    if (message != null) result.message = message;
    return result;
  }

  OnboardTenantResponse._();

  factory OnboardTenantResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OnboardTenantResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OnboardTenantResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'keycloakRealmId')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OnboardTenantResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OnboardTenantResponse copyWith(
          void Function(OnboardTenantResponse) updates) =>
      super.copyWith((message) => updates(message as OnboardTenantResponse))
          as OnboardTenantResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OnboardTenantResponse create() => OnboardTenantResponse._();
  @$core.override
  OnboardTenantResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static OnboardTenantResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OnboardTenantResponse>(create);
  static OnboardTenantResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get keycloakRealmId => $_getSZ(1);
  @$pb.TagNumber(2)
  set keycloakRealmId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeycloakRealmId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeycloakRealmId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class ForgotPasswordRequest extends $pb.GeneratedMessage {
  factory ForgotPasswordRequest({
    $core.String? email,
    $core.String? tenantId,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ForgotPasswordRequest._();

  factory ForgotPasswordRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgotPasswordRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgotPasswordRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgotPasswordRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgotPasswordRequest copyWith(
          void Function(ForgotPasswordRequest) updates) =>
      super.copyWith((message) => updates(message as ForgotPasswordRequest))
          as ForgotPasswordRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest create() => ForgotPasswordRequest._();
  @$core.override
  ForgotPasswordRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgotPasswordRequest>(create);
  static ForgotPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);
}

class ForgotPasswordResponse extends $pb.GeneratedMessage {
  factory ForgotPasswordResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ForgotPasswordResponse._();

  factory ForgotPasswordResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ForgotPasswordResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ForgotPasswordResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgotPasswordResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ForgotPasswordResponse copyWith(
          void Function(ForgotPasswordResponse) updates) =>
      super.copyWith((message) => updates(message as ForgotPasswordResponse))
          as ForgotPasswordResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForgotPasswordResponse create() => ForgotPasswordResponse._();
  @$core.override
  ForgotPasswordResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ForgotPasswordResponse>(create);
  static ForgotPasswordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UpdatePasswordRequest extends $pb.GeneratedMessage {
  factory UpdatePasswordRequest({
    $core.String? oldPassword,
    $core.String? newPassword,
  }) {
    final result = create();
    if (oldPassword != null) result.oldPassword = oldPassword;
    if (newPassword != null) result.newPassword = newPassword;
    return result;
  }

  UpdatePasswordRequest._();

  factory UpdatePasswordRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePasswordRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePasswordRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'oldPassword')
    ..aOS(2, _omitFieldNames ? '' : 'newPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePasswordRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePasswordRequest copyWith(
          void Function(UpdatePasswordRequest) updates) =>
      super.copyWith((message) => updates(message as UpdatePasswordRequest))
          as UpdatePasswordRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePasswordRequest create() => UpdatePasswordRequest._();
  @$core.override
  UpdatePasswordRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdatePasswordRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePasswordRequest>(create);
  static UpdatePasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get oldPassword => $_getSZ(0);
  @$pb.TagNumber(1)
  set oldPassword($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOldPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearOldPassword() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => $_clearField(2);
}

class UpdatePasswordResponse extends $pb.GeneratedMessage {
  factory UpdatePasswordResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdatePasswordResponse._();

  factory UpdatePasswordResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePasswordResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePasswordResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePasswordResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePasswordResponse copyWith(
          void Function(UpdatePasswordResponse) updates) =>
      super.copyWith((message) => updates(message as UpdatePasswordResponse))
          as UpdatePasswordResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePasswordResponse create() => UpdatePasswordResponse._();
  @$core.override
  UpdatePasswordResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdatePasswordResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePasswordResponse>(create);
  static UpdatePasswordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RegisterWebhookEndpointRequest extends $pb.GeneratedMessage {
  factory RegisterWebhookEndpointRequest({
    $core.String? tenantId,
    $core.String? url,
    $core.String? hmacKey,
    $core.Iterable<$core.String>? eventTypes,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (url != null) result.url = url;
    if (hmacKey != null) result.hmacKey = hmacKey;
    if (eventTypes != null) result.eventTypes.addAll(eventTypes);
    return result;
  }

  RegisterWebhookEndpointRequest._();

  factory RegisterWebhookEndpointRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterWebhookEndpointRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterWebhookEndpointRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'hmacKey')
    ..pPS(4, _omitFieldNames ? '' : 'eventTypes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWebhookEndpointRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWebhookEndpointRequest copyWith(
          void Function(RegisterWebhookEndpointRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RegisterWebhookEndpointRequest))
          as RegisterWebhookEndpointRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterWebhookEndpointRequest create() =>
      RegisterWebhookEndpointRequest._();
  @$core.override
  RegisterWebhookEndpointRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterWebhookEndpointRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterWebhookEndpointRequest>(create);
  static RegisterWebhookEndpointRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hmacKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set hmacKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHmacKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearHmacKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get eventTypes => $_getList(3);
}

class RegisterWebhookEndpointResponse extends $pb.GeneratedMessage {
  factory RegisterWebhookEndpointResponse({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  RegisterWebhookEndpointResponse._();

  factory RegisterWebhookEndpointResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RegisterWebhookEndpointResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RegisterWebhookEndpointResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWebhookEndpointResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RegisterWebhookEndpointResponse copyWith(
          void Function(RegisterWebhookEndpointResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RegisterWebhookEndpointResponse))
          as RegisterWebhookEndpointResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RegisterWebhookEndpointResponse create() =>
      RegisterWebhookEndpointResponse._();
  @$core.override
  RegisterWebhookEndpointResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RegisterWebhookEndpointResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RegisterWebhookEndpointResponse>(
          create);
  static RegisterWebhookEndpointResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class ListWebhookEndpointsRequest extends $pb.GeneratedMessage {
  factory ListWebhookEndpointsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListWebhookEndpointsRequest._();

  factory ListWebhookEndpointsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListWebhookEndpointsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListWebhookEndpointsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWebhookEndpointsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWebhookEndpointsRequest copyWith(
          void Function(ListWebhookEndpointsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListWebhookEndpointsRequest))
          as ListWebhookEndpointsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListWebhookEndpointsRequest create() =>
      ListWebhookEndpointsRequest._();
  @$core.override
  ListWebhookEndpointsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListWebhookEndpointsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListWebhookEndpointsRequest>(create);
  static ListWebhookEndpointsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class WebhookEndpoint extends $pb.GeneratedMessage {
  factory WebhookEndpoint({
    $core.String? id,
    $core.String? url,
    $core.String? hmacKey,
    $core.Iterable<$core.String>? eventTypes,
    $core.bool? active,
    $core.String? createdAt,
    $core.String? lastTriggeredAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (url != null) result.url = url;
    if (hmacKey != null) result.hmacKey = hmacKey;
    if (eventTypes != null) result.eventTypes.addAll(eventTypes);
    if (active != null) result.active = active;
    if (createdAt != null) result.createdAt = createdAt;
    if (lastTriggeredAt != null) result.lastTriggeredAt = lastTriggeredAt;
    return result;
  }

  WebhookEndpoint._();

  factory WebhookEndpoint.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WebhookEndpoint.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WebhookEndpoint',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'hmacKey')
    ..pPS(4, _omitFieldNames ? '' : 'eventTypes')
    ..aOB(5, _omitFieldNames ? '' : 'active')
    ..aOS(6, _omitFieldNames ? '' : 'createdAt')
    ..aOS(7, _omitFieldNames ? '' : 'lastTriggeredAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebhookEndpoint clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WebhookEndpoint copyWith(void Function(WebhookEndpoint) updates) =>
      super.copyWith((message) => updates(message as WebhookEndpoint))
          as WebhookEndpoint;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebhookEndpoint create() => WebhookEndpoint._();
  @$core.override
  WebhookEndpoint createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WebhookEndpoint getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WebhookEndpoint>(create);
  static WebhookEndpoint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get hmacKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set hmacKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHmacKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearHmacKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get eventTypes => $_getList(3);

  @$pb.TagNumber(5)
  $core.bool get active => $_getBF(4);
  @$pb.TagNumber(5)
  set active($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasActive() => $_has(4);
  @$pb.TagNumber(5)
  void clearActive() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get createdAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get lastTriggeredAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastTriggeredAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastTriggeredAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastTriggeredAt() => $_clearField(7);
}

class ListWebhookEndpointsResponse extends $pb.GeneratedMessage {
  factory ListWebhookEndpointsResponse({
    $core.Iterable<WebhookEndpoint>? endpoints,
  }) {
    final result = create();
    if (endpoints != null) result.endpoints.addAll(endpoints);
    return result;
  }

  ListWebhookEndpointsResponse._();

  factory ListWebhookEndpointsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListWebhookEndpointsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListWebhookEndpointsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..pPM<WebhookEndpoint>(1, _omitFieldNames ? '' : 'endpoints',
        subBuilder: WebhookEndpoint.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWebhookEndpointsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWebhookEndpointsResponse copyWith(
          void Function(ListWebhookEndpointsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListWebhookEndpointsResponse))
          as ListWebhookEndpointsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListWebhookEndpointsResponse create() =>
      ListWebhookEndpointsResponse._();
  @$core.override
  ListWebhookEndpointsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListWebhookEndpointsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListWebhookEndpointsResponse>(create);
  static ListWebhookEndpointsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<WebhookEndpoint> get endpoints => $_getList(0);
}

class GetHRIntegrationConfigRequest extends $pb.GeneratedMessage {
  factory GetHRIntegrationConfigRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  GetHRIntegrationConfigRequest._();

  factory GetHRIntegrationConfigRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetHRIntegrationConfigRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetHRIntegrationConfigRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHRIntegrationConfigRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHRIntegrationConfigRequest copyWith(
          void Function(GetHRIntegrationConfigRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetHRIntegrationConfigRequest))
          as GetHRIntegrationConfigRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHRIntegrationConfigRequest create() =>
      GetHRIntegrationConfigRequest._();
  @$core.override
  GetHRIntegrationConfigRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetHRIntegrationConfigRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetHRIntegrationConfigRequest>(create);
  static GetHRIntegrationConfigRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class GetHRIntegrationConfigResponse extends $pb.GeneratedMessage {
  factory GetHRIntegrationConfigResponse({
    $core.String? id,
    $core.String? hrSystem,
    $core.String? scimEndpointUrl,
    $core.String? openbaoCredentialPath,
    $core.String? fieldMapping,
    $core.bool? active,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (hrSystem != null) result.hrSystem = hrSystem;
    if (scimEndpointUrl != null) result.scimEndpointUrl = scimEndpointUrl;
    if (openbaoCredentialPath != null)
      result.openbaoCredentialPath = openbaoCredentialPath;
    if (fieldMapping != null) result.fieldMapping = fieldMapping;
    if (active != null) result.active = active;
    return result;
  }

  GetHRIntegrationConfigResponse._();

  factory GetHRIntegrationConfigResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetHRIntegrationConfigResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetHRIntegrationConfigResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'hrSystem')
    ..aOS(3, _omitFieldNames ? '' : 'scimEndpointUrl')
    ..aOS(4, _omitFieldNames ? '' : 'openbaoCredentialPath')
    ..aOS(5, _omitFieldNames ? '' : 'fieldMapping')
    ..aOB(6, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHRIntegrationConfigResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetHRIntegrationConfigResponse copyWith(
          void Function(GetHRIntegrationConfigResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetHRIntegrationConfigResponse))
          as GetHRIntegrationConfigResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHRIntegrationConfigResponse create() =>
      GetHRIntegrationConfigResponse._();
  @$core.override
  GetHRIntegrationConfigResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetHRIntegrationConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetHRIntegrationConfigResponse>(create);
  static GetHRIntegrationConfigResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get hrSystem => $_getSZ(1);
  @$pb.TagNumber(2)
  set hrSystem($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHrSystem() => $_has(1);
  @$pb.TagNumber(2)
  void clearHrSystem() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get scimEndpointUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set scimEndpointUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasScimEndpointUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearScimEndpointUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get openbaoCredentialPath => $_getSZ(3);
  @$pb.TagNumber(4)
  set openbaoCredentialPath($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOpenbaoCredentialPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpenbaoCredentialPath() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get fieldMapping => $_getSZ(4);
  @$pb.TagNumber(5)
  set fieldMapping($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFieldMapping() => $_has(4);
  @$pb.TagNumber(5)
  void clearFieldMapping() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => $_clearField(6);
}

class UpdateTenantConfigRequest extends $pb.GeneratedMessage {
  factory UpdateTenantConfigRequest({
    $core.String? tenantId,
    $core.String? configJson,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (configJson != null) result.configJson = configJson;
    return result;
  }

  UpdateTenantConfigRequest._();

  factory UpdateTenantConfigRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateTenantConfigRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateTenantConfigRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'configJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTenantConfigRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTenantConfigRequest copyWith(
          void Function(UpdateTenantConfigRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateTenantConfigRequest))
          as UpdateTenantConfigRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTenantConfigRequest create() => UpdateTenantConfigRequest._();
  @$core.override
  UpdateTenantConfigRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateTenantConfigRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateTenantConfigRequest>(create);
  static UpdateTenantConfigRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  /// Partial config document (string-encoded JSON object) merged over the
  /// stored document: top-level keys win, object values (e.g. risk_thresholds)
  /// merge one level deep, and an explicit JSON null deletes the key at its
  /// level. Known keys are shape-validated (thresholds must be numbers in
  /// [0,1], sanctions_block a bool, required_documents an array of strings).
  @$pb.TagNumber(2)
  $core.String get configJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set configJson($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConfigJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigJson() => $_clearField(2);
}

class UpdateTenantConfigResponse extends $pb.GeneratedMessage {
  factory UpdateTenantConfigResponse({
    $core.bool? success,
    $core.String? configJson,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (configJson != null) result.configJson = configJson;
    return result;
  }

  UpdateTenantConfigResponse._();

  factory UpdateTenantConfigResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateTenantConfigResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateTenantConfigResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'configJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTenantConfigResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTenantConfigResponse copyWith(
          void Function(UpdateTenantConfigResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateTenantConfigResponse))
          as UpdateTenantConfigResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTenantConfigResponse create() => UpdateTenantConfigResponse._();
  @$core.override
  UpdateTenantConfigResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateTenantConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateTenantConfigResponse>(create);
  static UpdateTenantConfigResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The tenant's full config document as stored after the merge, so the
  /// caller can read back exactly what landed.
  @$pb.TagNumber(2)
  $core.String get configJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set configJson($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasConfigJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigJson() => $_clearField(2);
}

class GetTenantConfigRequest extends $pb.GeneratedMessage {
  factory GetTenantConfigRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  GetTenantConfigRequest._();

  factory GetTenantConfigRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTenantConfigRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTenantConfigRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTenantConfigRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTenantConfigRequest copyWith(
          void Function(GetTenantConfigRequest) updates) =>
      super.copyWith((message) => updates(message as GetTenantConfigRequest))
          as GetTenantConfigRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTenantConfigRequest create() => GetTenantConfigRequest._();
  @$core.override
  GetTenantConfigRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTenantConfigRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTenantConfigRequest>(create);
  static GetTenantConfigRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class GetTenantConfigResponse extends $pb.GeneratedMessage {
  factory GetTenantConfigResponse({
    $core.String? configJson,
  }) {
    final result = create();
    if (configJson != null) result.configJson = configJson;
    return result;
  }

  GetTenantConfigResponse._();

  factory GetTenantConfigResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTenantConfigResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTenantConfigResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'configJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTenantConfigResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTenantConfigResponse copyWith(
          void Function(GetTenantConfigResponse) updates) =>
      super.copyWith((message) => updates(message as GetTenantConfigResponse))
          as GetTenantConfigResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTenantConfigResponse create() => GetTenantConfigResponse._();
  @$core.override
  GetTenantConfigResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetTenantConfigResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTenantConfigResponse>(create);
  static GetTenantConfigResponse? _defaultInstance;

  /// The tenant's config document (string-encoded JSON object), "{}" when it
  /// has none. Any credential-looking key is redacted.
  @$pb.TagNumber(1)
  $core.String get configJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set configJson($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasConfigJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfigJson() => $_clearField(1);
}

class UpdateRealmSettingsRequest extends $pb.GeneratedMessage {
  factory UpdateRealmSettingsRequest({
    $core.String? tenantId,
    $core.String? displayName,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (displayName != null) result.displayName = displayName;
    return result;
  }

  UpdateRealmSettingsRequest._();

  factory UpdateRealmSettingsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateRealmSettingsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateRealmSettingsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRealmSettingsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRealmSettingsRequest copyWith(
          void Function(UpdateRealmSettingsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateRealmSettingsRequest))
          as UpdateRealmSettingsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRealmSettingsRequest create() => UpdateRealmSettingsRequest._();
  @$core.override
  UpdateRealmSettingsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateRealmSettingsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRealmSettingsRequest>(create);
  static UpdateRealmSettingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => $_clearField(2);
}

class UpdateRealmSettingsResponse extends $pb.GeneratedMessage {
  factory UpdateRealmSettingsResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateRealmSettingsResponse._();

  factory UpdateRealmSettingsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateRealmSettingsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateRealmSettingsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRealmSettingsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRealmSettingsResponse copyWith(
          void Function(UpdateRealmSettingsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateRealmSettingsResponse))
          as UpdateRealmSettingsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRealmSettingsResponse create() =>
      UpdateRealmSettingsResponse._();
  @$core.override
  UpdateRealmSettingsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpdateRealmSettingsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRealmSettingsResponse>(create);
  static UpdateRealmSettingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class CreateKeycloakUserRequest extends $pb.GeneratedMessage {
  factory CreateKeycloakUserRequest({
    $core.String? tenantId,
    $core.String? email,
    $core.String? password,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? appRole,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? attributes,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (appRole != null) result.appRole = appRole;
    if (attributes != null) result.attributes.addEntries(attributes);
    return result;
  }

  CreateKeycloakUserRequest._();

  factory CreateKeycloakUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateKeycloakUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateKeycloakUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'firstName')
    ..aOS(5, _omitFieldNames ? '' : 'lastName')
    ..aOS(6, _omitFieldNames ? '' : 'appRole')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'attributes',
        entryClassName: 'CreateKeycloakUserRequest.AttributesEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('platform.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateKeycloakUserRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateKeycloakUserRequest copyWith(
          void Function(CreateKeycloakUserRequest) updates) =>
      super.copyWith((message) => updates(message as CreateKeycloakUserRequest))
          as CreateKeycloakUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateKeycloakUserRequest create() => CreateKeycloakUserRequest._();
  @$core.override
  CreateKeycloakUserRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateKeycloakUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateKeycloakUserRequest>(create);
  static CreateKeycloakUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get firstName => $_getSZ(3);
  @$pb.TagNumber(4)
  set firstName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFirstName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFirstName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get lastName => $_getSZ(4);
  @$pb.TagNumber(5)
  set lastName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLastName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get appRole => $_getSZ(5);
  @$pb.TagNumber(6)
  set appRole($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAppRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppRole() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get attributes => $_getMap(6);
}

class CreateKeycloakUserResponse extends $pb.GeneratedMessage {
  factory CreateKeycloakUserResponse({
    $core.String? keycloakUserId,
  }) {
    final result = create();
    if (keycloakUserId != null) result.keycloakUserId = keycloakUserId;
    return result;
  }

  CreateKeycloakUserResponse._();

  factory CreateKeycloakUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateKeycloakUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateKeycloakUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keycloakUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateKeycloakUserResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateKeycloakUserResponse copyWith(
          void Function(CreateKeycloakUserResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateKeycloakUserResponse))
          as CreateKeycloakUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateKeycloakUserResponse create() => CreateKeycloakUserResponse._();
  @$core.override
  CreateKeycloakUserResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateKeycloakUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateKeycloakUserResponse>(create);
  static CreateKeycloakUserResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keycloakUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set keycloakUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeycloakUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeycloakUserId() => $_clearField(1);
}

class SetKeycloakUserAttributeRequest extends $pb.GeneratedMessage {
  factory SetKeycloakUserAttributeRequest({
    $core.String? tenantId,
    $core.String? keycloakUserId,
    $core.String? attributeKey,
    $core.String? attributeValue,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (keycloakUserId != null) result.keycloakUserId = keycloakUserId;
    if (attributeKey != null) result.attributeKey = attributeKey;
    if (attributeValue != null) result.attributeValue = attributeValue;
    return result;
  }

  SetKeycloakUserAttributeRequest._();

  factory SetKeycloakUserAttributeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetKeycloakUserAttributeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetKeycloakUserAttributeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'keycloakUserId')
    ..aOS(3, _omitFieldNames ? '' : 'attributeKey')
    ..aOS(4, _omitFieldNames ? '' : 'attributeValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetKeycloakUserAttributeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetKeycloakUserAttributeRequest copyWith(
          void Function(SetKeycloakUserAttributeRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SetKeycloakUserAttributeRequest))
          as SetKeycloakUserAttributeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetKeycloakUserAttributeRequest create() =>
      SetKeycloakUserAttributeRequest._();
  @$core.override
  SetKeycloakUserAttributeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetKeycloakUserAttributeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetKeycloakUserAttributeRequest>(
          create);
  static SetKeycloakUserAttributeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get keycloakUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set keycloakUserId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeycloakUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeycloakUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get attributeKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set attributeKey($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAttributeKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttributeKey() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get attributeValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set attributeValue($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAttributeValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttributeValue() => $_clearField(4);
}

class SetKeycloakUserAttributeResponse extends $pb.GeneratedMessage {
  factory SetKeycloakUserAttributeResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  SetKeycloakUserAttributeResponse._();

  factory SetKeycloakUserAttributeResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetKeycloakUserAttributeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetKeycloakUserAttributeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetKeycloakUserAttributeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetKeycloakUserAttributeResponse copyWith(
          void Function(SetKeycloakUserAttributeResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SetKeycloakUserAttributeResponse))
          as SetKeycloakUserAttributeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetKeycloakUserAttributeResponse create() =>
      SetKeycloakUserAttributeResponse._();
  @$core.override
  SetKeycloakUserAttributeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetKeycloakUserAttributeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetKeycloakUserAttributeResponse>(
          create);
  static SetKeycloakUserAttributeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

/// ListTenants — platform-operator (master token) view of all tenants.
class ListTenantsRequest extends $pb.GeneratedMessage {
  factory ListTenantsRequest() => create();

  ListTenantsRequest._();

  factory ListTenantsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTenantsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTenantsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantsRequest copyWith(void Function(ListTenantsRequest) updates) =>
      super.copyWith((message) => updates(message as ListTenantsRequest))
          as ListTenantsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTenantsRequest create() => ListTenantsRequest._();
  @$core.override
  ListTenantsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTenantsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTenantsRequest>(create);
  static ListTenantsRequest? _defaultInstance;
}

class Tenant extends $pb.GeneratedMessage {
  factory Tenant({
    $core.String? id,
    $core.String? name,
    $core.String? slug,
    $core.String? keycloakRealmId,
    $core.String? primaryContactEmail,
    $core.String? status,
    $core.String? createdAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (slug != null) result.slug = slug;
    if (keycloakRealmId != null) result.keycloakRealmId = keycloakRealmId;
    if (primaryContactEmail != null)
      result.primaryContactEmail = primaryContactEmail;
    if (status != null) result.status = status;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  Tenant._();

  factory Tenant.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Tenant.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Tenant',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'slug')
    ..aOS(4, _omitFieldNames ? '' : 'keycloakRealmId')
    ..aOS(5, _omitFieldNames ? '' : 'primaryContactEmail')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'createdAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tenant clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Tenant copyWith(void Function(Tenant) updates) =>
      super.copyWith((message) => updates(message as Tenant)) as Tenant;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tenant create() => Tenant._();
  @$core.override
  Tenant createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Tenant getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tenant>(create);
  static Tenant? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get slug => $_getSZ(2);
  @$pb.TagNumber(3)
  set slug($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSlug() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlug() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get keycloakRealmId => $_getSZ(3);
  @$pb.TagNumber(4)
  set keycloakRealmId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasKeycloakRealmId() => $_has(3);
  @$pb.TagNumber(4)
  void clearKeycloakRealmId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get primaryContactEmail => $_getSZ(4);
  @$pb.TagNumber(5)
  set primaryContactEmail($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPrimaryContactEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrimaryContactEmail() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get createdAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set createdAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
}

class ListTenantsResponse extends $pb.GeneratedMessage {
  factory ListTenantsResponse({
    $core.Iterable<Tenant>? tenants,
  }) {
    final result = create();
    if (tenants != null) result.tenants.addAll(tenants);
    return result;
  }

  ListTenantsResponse._();

  factory ListTenantsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTenantsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTenantsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..pPM<Tenant>(1, _omitFieldNames ? '' : 'tenants',
        subBuilder: Tenant.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantsResponse copyWith(void Function(ListTenantsResponse) updates) =>
      super.copyWith((message) => updates(message as ListTenantsResponse))
          as ListTenantsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTenantsResponse create() => ListTenantsResponse._();
  @$core.override
  ListTenantsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTenantsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTenantsResponse>(create);
  static ListTenantsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Tenant> get tenants => $_getList(0);
}

/// ResolveRealm — public/whitelisted lookup so a user can log in without knowing
/// their tenant slug. Accepts an email OR a tenant_id; never leaks existence
/// (empty keycloak_realm_id when unknown).
class ResolveRealmRequest extends $pb.GeneratedMessage {
  factory ResolveRealmRequest({
    $core.String? email,
    $core.String? tenantId,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ResolveRealmRequest._();

  factory ResolveRealmRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveRealmRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveRealmRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveRealmRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveRealmRequest copyWith(void Function(ResolveRealmRequest) updates) =>
      super.copyWith((message) => updates(message as ResolveRealmRequest))
          as ResolveRealmRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveRealmRequest create() => ResolveRealmRequest._();
  @$core.override
  ResolveRealmRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveRealmRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolveRealmRequest>(create);
  static ResolveRealmRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);
}

class ResolveRealmResponse extends $pb.GeneratedMessage {
  factory ResolveRealmResponse({
    $core.String? keycloakRealmId,
    $core.String? tenantId,
    $core.String? slug,
  }) {
    final result = create();
    if (keycloakRealmId != null) result.keycloakRealmId = keycloakRealmId;
    if (tenantId != null) result.tenantId = tenantId;
    if (slug != null) result.slug = slug;
    return result;
  }

  ResolveRealmResponse._();

  factory ResolveRealmResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResolveRealmResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResolveRealmResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keycloakRealmId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'slug')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveRealmResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResolveRealmResponse copyWith(void Function(ResolveRealmResponse) updates) =>
      super.copyWith((message) => updates(message as ResolveRealmResponse))
          as ResolveRealmResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResolveRealmResponse create() => ResolveRealmResponse._();
  @$core.override
  ResolveRealmResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResolveRealmResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResolveRealmResponse>(create);
  static ResolveRealmResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keycloakRealmId => $_getSZ(0);
  @$pb.TagNumber(1)
  set keycloakRealmId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasKeycloakRealmId() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeycloakRealmId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get tenantId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tenantId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTenantId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTenantId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get slug => $_getSZ(2);
  @$pb.TagNumber(3)
  set slug($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSlug() => $_has(2);
  @$pb.TagNumber(3)
  void clearSlug() => $_clearField(3);
}

/// ExportAuditReport (US-036-2): synchronous xlsx export of the caller's own
/// tenant audit_events. Deliberately carries NO tenant_id — tenant is derived
/// from the verified token, removing the cross-tenant IDOR vector.
class ExportAuditReportRequest extends $pb.GeneratedMessage {
  factory ExportAuditReportRequest({
    $core.String? startDate,
    $core.String? endDate,
  }) {
    final result = create();
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  ExportAuditReportRequest._();

  factory ExportAuditReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExportAuditReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExportAuditReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'startDate')
    ..aOS(2, _omitFieldNames ? '' : 'endDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportAuditReportRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportAuditReportRequest copyWith(
          void Function(ExportAuditReportRequest) updates) =>
      super.copyWith((message) => updates(message as ExportAuditReportRequest))
          as ExportAuditReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportAuditReportRequest create() => ExportAuditReportRequest._();
  @$core.override
  ExportAuditReportRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExportAuditReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExportAuditReportRequest>(create);
  static ExportAuditReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get startDate => $_getSZ(0);
  @$pb.TagNumber(1)
  set startDate($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartDate() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get endDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set endDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndDate() => $_clearField(2);
}

class ExportAuditReportResponse extends $pb.GeneratedMessage {
  factory ExportAuditReportResponse({
    $core.List<$core.int>? xlsxData,
    $core.String? filename,
    $fixnum.Int64? rowCount,
    $core.bool? truncated,
  }) {
    final result = create();
    if (xlsxData != null) result.xlsxData = xlsxData;
    if (filename != null) result.filename = filename;
    if (rowCount != null) result.rowCount = rowCount;
    if (truncated != null) result.truncated = truncated;
    return result;
  }

  ExportAuditReportResponse._();

  factory ExportAuditReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExportAuditReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExportAuditReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'xlsxData', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..aInt64(3, _omitFieldNames ? '' : 'rowCount')
    ..aOB(4, _omitFieldNames ? '' : 'truncated')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportAuditReportResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportAuditReportResponse copyWith(
          void Function(ExportAuditReportResponse) updates) =>
      super.copyWith((message) => updates(message as ExportAuditReportResponse))
          as ExportAuditReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportAuditReportResponse create() => ExportAuditReportResponse._();
  @$core.override
  ExportAuditReportResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExportAuditReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExportAuditReportResponse>(create);
  static ExportAuditReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get xlsxData => $_getN(0);
  @$pb.TagNumber(1)
  set xlsxData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasXlsxData() => $_has(0);
  @$pb.TagNumber(1)
  void clearXlsxData() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get rowCount => $_getI64(2);
  @$pb.TagNumber(3)
  set rowCount($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRowCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearRowCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get truncated => $_getBF(3);
  @$pb.TagNumber(4)
  set truncated($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTruncated() => $_has(3);
  @$pb.TagNumber(4)
  void clearTruncated() => $_clearField(4);
}

/// ExportWorkerAuditBundle (US-036-2): zip of per-worker xlsx sheets (audit
/// events + verification records + case history). Tenant is derived from the
/// verified token — the worker must belong to the caller's tenant.
class ExportWorkerAuditBundleRequest extends $pb.GeneratedMessage {
  factory ExportWorkerAuditBundleRequest({
    $core.String? workerId,
    $core.String? startDate,
    $core.String? endDate,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    return result;
  }

  ExportWorkerAuditBundleRequest._();

  factory ExportWorkerAuditBundleRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExportWorkerAuditBundleRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExportWorkerAuditBundleRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'startDate')
    ..aOS(3, _omitFieldNames ? '' : 'endDate')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportWorkerAuditBundleRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportWorkerAuditBundleRequest copyWith(
          void Function(ExportWorkerAuditBundleRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ExportWorkerAuditBundleRequest))
          as ExportWorkerAuditBundleRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportWorkerAuditBundleRequest create() =>
      ExportWorkerAuditBundleRequest._();
  @$core.override
  ExportWorkerAuditBundleRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExportWorkerAuditBundleRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExportWorkerAuditBundleRequest>(create);
  static ExportWorkerAuditBundleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get startDate => $_getSZ(1);
  @$pb.TagNumber(2)
  set startDate($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get endDate => $_getSZ(2);
  @$pb.TagNumber(3)
  set endDate($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
}

class ExportWorkerAuditBundleResponse extends $pb.GeneratedMessage {
  factory ExportWorkerAuditBundleResponse({
    $core.List<$core.int>? zipData,
    $core.String? filename,
  }) {
    final result = create();
    if (zipData != null) result.zipData = zipData;
    if (filename != null) result.filename = filename;
    return result;
  }

  ExportWorkerAuditBundleResponse._();

  factory ExportWorkerAuditBundleResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExportWorkerAuditBundleResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExportWorkerAuditBundleResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'zipData', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportWorkerAuditBundleResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExportWorkerAuditBundleResponse copyWith(
          void Function(ExportWorkerAuditBundleResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ExportWorkerAuditBundleResponse))
          as ExportWorkerAuditBundleResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportWorkerAuditBundleResponse create() =>
      ExportWorkerAuditBundleResponse._();
  @$core.override
  ExportWorkerAuditBundleResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExportWorkerAuditBundleResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExportWorkerAuditBundleResponse>(
          create);
  static ExportWorkerAuditBundleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get zipData => $_getN(0);
  @$pb.TagNumber(1)
  set zipData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasZipData() => $_has(0);
  @$pb.TagNumber(1)
  void clearZipData() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);
}

/// ListTenantUsers enumerates the caller's tenant users so the dashboard can source
/// the case-assign dropdown and render timeline actor names (CASES §7). tenant is
/// derived from the verified token, never the request.
class ListTenantUsersRequest extends $pb.GeneratedMessage {
  factory ListTenantUsersRequest({
    $core.String? roleFilter,
  }) {
    final result = create();
    if (roleFilter != null) result.roleFilter = roleFilter;
    return result;
  }

  ListTenantUsersRequest._();

  factory ListTenantUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTenantUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTenantUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'roleFilter')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantUsersRequest copyWith(
          void Function(ListTenantUsersRequest) updates) =>
      super.copyWith((message) => updates(message as ListTenantUsersRequest))
          as ListTenantUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTenantUsersRequest create() => ListTenantUsersRequest._();
  @$core.override
  ListTenantUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTenantUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTenantUsersRequest>(create);
  static ListTenantUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleFilter => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleFilter($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRoleFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleFilter() => $_clearField(1);
}

class ListTenantUsersResponse extends $pb.GeneratedMessage {
  factory ListTenantUsersResponse({
    $core.Iterable<TenantUser>? users,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    return result;
  }

  ListTenantUsersResponse._();

  factory ListTenantUsersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListTenantUsersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListTenantUsersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..pPM<TenantUser>(1, _omitFieldNames ? '' : 'users',
        subBuilder: TenantUser.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantUsersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListTenantUsersResponse copyWith(
          void Function(ListTenantUsersResponse) updates) =>
      super.copyWith((message) => updates(message as ListTenantUsersResponse))
          as ListTenantUsersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTenantUsersResponse create() => ListTenantUsersResponse._();
  @$core.override
  ListTenantUsersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListTenantUsersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListTenantUsersResponse>(create);
  static ListTenantUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TenantUser> get users => $_getList(0);
}

class TenantUser extends $pb.GeneratedMessage {
  factory TenantUser({
    $core.String? id,
    $core.String? keycloakUserId,
    $core.String? email,
    $core.String? fullName,
    $core.String? appRole,
    $core.bool? active,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (keycloakUserId != null) result.keycloakUserId = keycloakUserId;
    if (email != null) result.email = email;
    if (fullName != null) result.fullName = fullName;
    if (appRole != null) result.appRole = appRole;
    if (active != null) result.active = active;
    return result;
  }

  TenantUser._();

  factory TenantUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TenantUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TenantUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'keycloakUserId')
    ..aOS(3, _omitFieldNames ? '' : 'email')
    ..aOS(4, _omitFieldNames ? '' : 'fullName')
    ..aOS(5, _omitFieldNames ? '' : 'appRole')
    ..aOB(6, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TenantUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TenantUser copyWith(void Function(TenantUser) updates) =>
      super.copyWith((message) => updates(message as TenantUser)) as TenantUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TenantUser create() => TenantUser._();
  @$core.override
  TenantUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TenantUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TenantUser>(create);
  static TenantUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get keycloakUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set keycloakUserId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasKeycloakUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearKeycloakUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get fullName => $_getSZ(3);
  @$pb.TagNumber(4)
  set fullName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFullName() => $_has(3);
  @$pb.TagNumber(4)
  void clearFullName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get appRole => $_getSZ(4);
  @$pb.TagNumber(5)
  set appRole($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAppRole() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppRole() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => $_clearField(6);
}

/// CreateReport enqueues a report_jobs row and starts GenerateReportWorkflow.
/// tenant is derived SOLELY from the verified token, never from a request field.
class CreateReportRequest extends $pb.GeneratedMessage {
  factory CreateReportRequest({
    $core.String? reportType,
    $core.String? format,
    $core.String? filters,
    $core.String? options,
  }) {
    final result = create();
    if (reportType != null) result.reportType = reportType;
    if (format != null) result.format = format;
    if (filters != null) result.filters = filters;
    if (options != null) result.options = options;
    return result;
  }

  CreateReportRequest._();

  factory CreateReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reportType')
    ..aOS(2, _omitFieldNames ? '' : 'format')
    ..aOS(3, _omitFieldNames ? '' : 'filters')
    ..aOS(4, _omitFieldNames ? '' : 'options')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReportRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReportRequest copyWith(void Function(CreateReportRequest) updates) =>
      super.copyWith((message) => updates(message as CreateReportRequest))
          as CreateReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReportRequest create() => CreateReportRequest._();
  @$core.override
  CreateReportRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReportRequest>(create);
  static CreateReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportType => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportType($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReportType() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportType() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get format => $_getSZ(1);
  @$pb.TagNumber(2)
  set format($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFormat() => $_has(1);
  @$pb.TagNumber(2)
  void clearFormat() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get filters => $_getSZ(2);
  @$pb.TagNumber(3)
  set filters($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilters() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilters() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get options => $_getSZ(3);
  @$pb.TagNumber(4)
  set options($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOptions() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptions() => $_clearField(4);
}

class CreateReportResponse extends $pb.GeneratedMessage {
  factory CreateReportResponse({
    $core.String? reportId,
  }) {
    final result = create();
    if (reportId != null) result.reportId = reportId;
    return result;
  }

  CreateReportResponse._();

  factory CreateReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reportId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReportResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReportResponse copyWith(void Function(CreateReportResponse) updates) =>
      super.copyWith((message) => updates(message as CreateReportResponse))
          as CreateReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReportResponse create() => CreateReportResponse._();
  @$core.override
  CreateReportResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CreateReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReportResponse>(create);
  static CreateReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReportId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportId() => $_clearField(1);
}

class GetReportRequest extends $pb.GeneratedMessage {
  factory GetReportRequest({
    $core.String? reportId,
  }) {
    final result = create();
    if (reportId != null) result.reportId = reportId;
    return result;
  }

  GetReportRequest._();

  factory GetReportRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReportRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReportRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'reportId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReportRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReportRequest copyWith(void Function(GetReportRequest) updates) =>
      super.copyWith((message) => updates(message as GetReportRequest))
          as GetReportRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReportRequest create() => GetReportRequest._();
  @$core.override
  GetReportRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetReportRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReportRequest>(create);
  static GetReportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get reportId => $_getSZ(0);
  @$pb.TagNumber(1)
  set reportId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReportId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReportId() => $_clearField(1);
}

class GetReportResponse extends $pb.GeneratedMessage {
  factory GetReportResponse({
    $core.String? status,
    $core.String? reportType,
    $core.String? format,
    $core.String? filename,
    $core.String? downloadUrl,
    $core.String? error,
    $fixnum.Int64? rowCount,
    $core.bool? truncated,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (reportType != null) result.reportType = reportType;
    if (format != null) result.format = format;
    if (filename != null) result.filename = filename;
    if (downloadUrl != null) result.downloadUrl = downloadUrl;
    if (error != null) result.error = error;
    if (rowCount != null) result.rowCount = rowCount;
    if (truncated != null) result.truncated = truncated;
    return result;
  }

  GetReportResponse._();

  factory GetReportResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReportResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReportResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'reportType')
    ..aOS(3, _omitFieldNames ? '' : 'format')
    ..aOS(4, _omitFieldNames ? '' : 'filename')
    ..aOS(5, _omitFieldNames ? '' : 'downloadUrl')
    ..aOS(6, _omitFieldNames ? '' : 'error')
    ..aInt64(7, _omitFieldNames ? '' : 'rowCount')
    ..aOB(8, _omitFieldNames ? '' : 'truncated')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReportResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReportResponse copyWith(void Function(GetReportResponse) updates) =>
      super.copyWith((message) => updates(message as GetReportResponse))
          as GetReportResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReportResponse create() => GetReportResponse._();
  @$core.override
  GetReportResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetReportResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReportResponse>(create);
  static GetReportResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reportType => $_getSZ(1);
  @$pb.TagNumber(2)
  set reportType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReportType() => $_has(1);
  @$pb.TagNumber(2)
  void clearReportType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get format => $_getSZ(2);
  @$pb.TagNumber(3)
  set format($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFormat() => $_has(2);
  @$pb.TagNumber(3)
  void clearFormat() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get filename => $_getSZ(3);
  @$pb.TagNumber(4)
  set filename($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFilename() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilename() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get downloadUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set downloadUrl($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDownloadUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearDownloadUrl() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get error => $_getSZ(5);
  @$pb.TagNumber(6)
  set error($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasError() => $_has(5);
  @$pb.TagNumber(6)
  void clearError() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get rowCount => $_getI64(6);
  @$pb.TagNumber(7)
  set rowCount($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRowCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearRowCount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get truncated => $_getBF(7);
  @$pb.TagNumber(8)
  set truncated($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTruncated() => $_has(7);
  @$pb.TagNumber(8)
  void clearTruncated() => $_clearField(8);
}

class ListReportsRequest extends $pb.GeneratedMessage {
  factory ListReportsRequest({
    $core.int? page,
    $core.int? limit,
  }) {
    final result = create();
    if (page != null) result.page = page;
    if (limit != null) result.limit = limit;
    return result;
  }

  ListReportsRequest._();

  factory ListReportsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReportsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReportsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'page')
    ..aI(2, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReportsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReportsRequest copyWith(void Function(ListReportsRequest) updates) =>
      super.copyWith((message) => updates(message as ListReportsRequest))
          as ListReportsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReportsRequest create() => ListReportsRequest._();
  @$core.override
  ListReportsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReportsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReportsRequest>(create);
  static ListReportsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);
}

class ListReportsResponse extends $pb.GeneratedMessage {
  factory ListReportsResponse({
    $core.Iterable<ReportJobSummary>? jobs,
    $core.int? totalItems,
  }) {
    final result = create();
    if (jobs != null) result.jobs.addAll(jobs);
    if (totalItems != null) result.totalItems = totalItems;
    return result;
  }

  ListReportsResponse._();

  factory ListReportsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReportsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReportsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..pPM<ReportJobSummary>(1, _omitFieldNames ? '' : 'jobs',
        subBuilder: ReportJobSummary.create)
    ..aI(2, _omitFieldNames ? '' : 'totalItems')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReportsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReportsResponse copyWith(void Function(ListReportsResponse) updates) =>
      super.copyWith((message) => updates(message as ListReportsResponse))
          as ListReportsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReportsResponse create() => ListReportsResponse._();
  @$core.override
  ListReportsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListReportsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReportsResponse>(create);
  static ListReportsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ReportJobSummary> get jobs => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalItems => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalItems($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalItems() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalItems() => $_clearField(2);
}

class ReportJobSummary extends $pb.GeneratedMessage {
  factory ReportJobSummary({
    $core.String? id,
    $core.String? reportType,
    $core.String? format,
    $core.String? status,
    $core.String? createdAt,
    $core.String? completedAt,
    $core.String? error,
    $core.String? rangeStart,
    $core.String? rangeEnd,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (reportType != null) result.reportType = reportType;
    if (format != null) result.format = format;
    if (status != null) result.status = status;
    if (createdAt != null) result.createdAt = createdAt;
    if (completedAt != null) result.completedAt = completedAt;
    if (error != null) result.error = error;
    if (rangeStart != null) result.rangeStart = rangeStart;
    if (rangeEnd != null) result.rangeEnd = rangeEnd;
    return result;
  }

  ReportJobSummary._();

  factory ReportJobSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReportJobSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReportJobSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'reportType')
    ..aOS(3, _omitFieldNames ? '' : 'format')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aOS(5, _omitFieldNames ? '' : 'createdAt')
    ..aOS(6, _omitFieldNames ? '' : 'completedAt')
    ..aOS(7, _omitFieldNames ? '' : 'error')
    ..aOS(8, _omitFieldNames ? '' : 'rangeStart')
    ..aOS(9, _omitFieldNames ? '' : 'rangeEnd')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportJobSummary clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReportJobSummary copyWith(void Function(ReportJobSummary) updates) =>
      super.copyWith((message) => updates(message as ReportJobSummary))
          as ReportJobSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportJobSummary create() => ReportJobSummary._();
  @$core.override
  ReportJobSummary createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReportJobSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReportJobSummary>(create);
  static ReportJobSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reportType => $_getSZ(1);
  @$pb.TagNumber(2)
  set reportType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReportType() => $_has(1);
  @$pb.TagNumber(2)
  void clearReportType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get format => $_getSZ(2);
  @$pb.TagNumber(3)
  set format($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFormat() => $_has(2);
  @$pb.TagNumber(3)
  void clearFormat() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get createdAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get completedAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set completedAt($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCompletedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompletedAt() => $_clearField(6);

  /// Why a FAILED job failed, in words safe to show a user. "" for any other status.
  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => $_clearField(7);

  /// The date range the request asked for, as it was sent in filters (start_date /
  /// end_date: RFC 3339 or YYYY-MM-DD). "" when the request named none, so a "try
  /// again" can send the same range.
  @$pb.TagNumber(8)
  $core.String get rangeStart => $_getSZ(7);
  @$pb.TagNumber(8)
  set rangeStart($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasRangeStart() => $_has(7);
  @$pb.TagNumber(8)
  void clearRangeStart() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get rangeEnd => $_getSZ(8);
  @$pb.TagNumber(9)
  set rangeEnd($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRangeEnd() => $_has(8);
  @$pb.TagNumber(9)
  void clearRangeEnd() => $_clearField(9);
}

/// Non-secret LDAP / Active Directory connection settings.
class LdapSettings extends $pb.GeneratedMessage {
  factory LdapSettings({
    $core.String? url,
    $core.String? bindDn,
    $core.String? baseDn,
    $core.String? userFilter,
    $core.bool? startTls,
    $core.bool? skipVerify,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (bindDn != null) result.bindDn = bindDn;
    if (baseDn != null) result.baseDn = baseDn;
    if (userFilter != null) result.userFilter = userFilter;
    if (startTls != null) result.startTls = startTls;
    if (skipVerify != null) result.skipVerify = skipVerify;
    return result;
  }

  LdapSettings._();

  factory LdapSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LdapSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LdapSettings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'bindDn')
    ..aOS(3, _omitFieldNames ? '' : 'baseDn')
    ..aOS(4, _omitFieldNames ? '' : 'userFilter')
    ..aOB(5, _omitFieldNames ? '' : 'startTls')
    ..aOB(6, _omitFieldNames ? '' : 'skipVerify')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LdapSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LdapSettings copyWith(void Function(LdapSettings) updates) =>
      super.copyWith((message) => updates(message as LdapSettings))
          as LdapSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LdapSettings create() => LdapSettings._();
  @$core.override
  LdapSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LdapSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LdapSettings>(create);
  static LdapSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bindDn => $_getSZ(1);
  @$pb.TagNumber(2)
  set bindDn($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBindDn() => $_has(1);
  @$pb.TagNumber(2)
  void clearBindDn() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get baseDn => $_getSZ(2);
  @$pb.TagNumber(3)
  set baseDn($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBaseDn() => $_has(2);
  @$pb.TagNumber(3)
  void clearBaseDn() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set userFilter($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserFilter() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get startTls => $_getBF(4);
  @$pb.TagNumber(5)
  set startTls($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStartTls() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTls() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get skipVerify => $_getBF(5);
  @$pb.TagNumber(6)
  set skipVerify($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSkipVerify() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkipVerify() => $_clearField(6);
}

/// Non-secret Azure AD / Entra ID connection settings.
class AzureAdSettings extends $pb.GeneratedMessage {
  factory AzureAdSettings({
    $core.String? tenantId,
    $core.String? clientId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (clientId != null) result.clientId = clientId;
    return result;
  }

  AzureAdSettings._();

  factory AzureAdSettings.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AzureAdSettings.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AzureAdSettings',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AzureAdSettings clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AzureAdSettings copyWith(void Function(AzureAdSettings) updates) =>
      super.copyWith((message) => updates(message as AzureAdSettings))
          as AzureAdSettings;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AzureAdSettings create() => AzureAdSettings._();
  @$core.override
  AzureAdSettings createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AzureAdSettings getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AzureAdSettings>(create);
  static AzureAdSettings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);
}

/// A user as projected from the tenant's directory.
class DirectoryUser extends $pb.GeneratedMessage {
  factory DirectoryUser({
    $core.String? externalId,
    $core.String? email,
    $core.String? displayName,
    $core.String? givenName,
    $core.String? surname,
    $core.String? department,
    $core.bool? enabled,
  }) {
    final result = create();
    if (externalId != null) result.externalId = externalId;
    if (email != null) result.email = email;
    if (displayName != null) result.displayName = displayName;
    if (givenName != null) result.givenName = givenName;
    if (surname != null) result.surname = surname;
    if (department != null) result.department = department;
    if (enabled != null) result.enabled = enabled;
    return result;
  }

  DirectoryUser._();

  factory DirectoryUser.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DirectoryUser.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DirectoryUser',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'externalId')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..aOS(4, _omitFieldNames ? '' : 'givenName')
    ..aOS(5, _omitFieldNames ? '' : 'surname')
    ..aOS(6, _omitFieldNames ? '' : 'department')
    ..aOB(7, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectoryUser clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DirectoryUser copyWith(void Function(DirectoryUser) updates) =>
      super.copyWith((message) => updates(message as DirectoryUser))
          as DirectoryUser;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirectoryUser create() => DirectoryUser._();
  @$core.override
  DirectoryUser createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DirectoryUser getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DirectoryUser>(create);
  static DirectoryUser? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get externalId => $_getSZ(0);
  @$pb.TagNumber(1)
  set externalId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasExternalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get givenName => $_getSZ(3);
  @$pb.TagNumber(4)
  set givenName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGivenName() => $_has(3);
  @$pb.TagNumber(4)
  void clearGivenName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get surname => $_getSZ(4);
  @$pb.TagNumber(5)
  set surname($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSurname() => $_has(4);
  @$pb.TagNumber(5)
  void clearSurname() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get department => $_getSZ(5);
  @$pb.TagNumber(6)
  set department($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDepartment() => $_has(5);
  @$pb.TagNumber(6)
  void clearDepartment() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get enabled => $_getBF(6);
  @$pb.TagNumber(7)
  set enabled($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasEnabled() => $_has(6);
  @$pb.TagNumber(7)
  void clearEnabled() => $_clearField(7);
}

class UpsertDirectoryIntegrationRequest extends $pb.GeneratedMessage {
  factory UpsertDirectoryIntegrationRequest({
    $core.String? tenantId,
    DirectoryType? type,
    LdapSettings? ldap,
    AzureAdSettings? azureAd,
    $core.String? bindPassword,
    $core.String? clientSecret,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? fieldMapping,
    $core.bool? active,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (type != null) result.type = type;
    if (ldap != null) result.ldap = ldap;
    if (azureAd != null) result.azureAd = azureAd;
    if (bindPassword != null) result.bindPassword = bindPassword;
    if (clientSecret != null) result.clientSecret = clientSecret;
    if (fieldMapping != null) result.fieldMapping.addEntries(fieldMapping);
    if (active != null) result.active = active;
    return result;
  }

  UpsertDirectoryIntegrationRequest._();

  factory UpsertDirectoryIntegrationRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpsertDirectoryIntegrationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpsertDirectoryIntegrationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aE<DirectoryType>(2, _omitFieldNames ? '' : 'type',
        enumValues: DirectoryType.values)
    ..aOM<LdapSettings>(3, _omitFieldNames ? '' : 'ldap',
        subBuilder: LdapSettings.create)
    ..aOM<AzureAdSettings>(4, _omitFieldNames ? '' : 'azureAd',
        subBuilder: AzureAdSettings.create)
    ..aOS(5, _omitFieldNames ? '' : 'bindPassword')
    ..aOS(6, _omitFieldNames ? '' : 'clientSecret')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'fieldMapping',
        entryClassName: 'UpsertDirectoryIntegrationRequest.FieldMappingEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('platform.v1'))
    ..aOB(8, _omitFieldNames ? '' : 'active')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpsertDirectoryIntegrationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpsertDirectoryIntegrationRequest copyWith(
          void Function(UpsertDirectoryIntegrationRequest) updates) =>
      super.copyWith((message) =>
              updates(message as UpsertDirectoryIntegrationRequest))
          as UpsertDirectoryIntegrationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertDirectoryIntegrationRequest create() =>
      UpsertDirectoryIntegrationRequest._();
  @$core.override
  UpsertDirectoryIntegrationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpsertDirectoryIntegrationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpsertDirectoryIntegrationRequest>(
          create);
  static UpsertDirectoryIntegrationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  DirectoryType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(DirectoryType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  LdapSettings get ldap => $_getN(2);
  @$pb.TagNumber(3)
  set ldap(LdapSettings value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLdap() => $_has(2);
  @$pb.TagNumber(3)
  void clearLdap() => $_clearField(3);
  @$pb.TagNumber(3)
  LdapSettings ensureLdap() => $_ensure(2);

  @$pb.TagNumber(4)
  AzureAdSettings get azureAd => $_getN(3);
  @$pb.TagNumber(4)
  set azureAd(AzureAdSettings value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAzureAd() => $_has(3);
  @$pb.TagNumber(4)
  void clearAzureAd() => $_clearField(4);
  @$pb.TagNumber(4)
  AzureAdSettings ensureAzureAd() => $_ensure(3);

  /// Secret half — written to OpenBao, never echoed back in responses.
  @$pb.TagNumber(5)
  $core.String get bindPassword => $_getSZ(4);
  @$pb.TagNumber(5)
  set bindPassword($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBindPassword() => $_has(4);
  @$pb.TagNumber(5)
  void clearBindPassword() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get clientSecret => $_getSZ(5);
  @$pb.TagNumber(6)
  set clientSecret($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasClientSecret() => $_has(5);
  @$pb.TagNumber(6)
  void clearClientSecret() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get fieldMapping => $_getMap(6);

  @$pb.TagNumber(8)
  $core.bool get active => $_getBF(7);
  @$pb.TagNumber(8)
  set active($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasActive() => $_has(7);
  @$pb.TagNumber(8)
  void clearActive() => $_clearField(8);
}

class UpsertDirectoryIntegrationResponse extends $pb.GeneratedMessage {
  factory UpsertDirectoryIntegrationResponse({
    $core.String? id,
  }) {
    final result = create();
    if (id != null) result.id = id;
    return result;
  }

  UpsertDirectoryIntegrationResponse._();

  factory UpsertDirectoryIntegrationResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpsertDirectoryIntegrationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpsertDirectoryIntegrationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpsertDirectoryIntegrationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpsertDirectoryIntegrationResponse copyWith(
          void Function(UpsertDirectoryIntegrationResponse) updates) =>
      super.copyWith((message) =>
              updates(message as UpsertDirectoryIntegrationResponse))
          as UpsertDirectoryIntegrationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertDirectoryIntegrationResponse create() =>
      UpsertDirectoryIntegrationResponse._();
  @$core.override
  UpsertDirectoryIntegrationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UpsertDirectoryIntegrationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpsertDirectoryIntegrationResponse>(
          create);
  static UpsertDirectoryIntegrationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);
}

class GetDirectoryIntegrationRequest extends $pb.GeneratedMessage {
  factory GetDirectoryIntegrationRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  GetDirectoryIntegrationRequest._();

  factory GetDirectoryIntegrationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDirectoryIntegrationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDirectoryIntegrationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDirectoryIntegrationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDirectoryIntegrationRequest copyWith(
          void Function(GetDirectoryIntegrationRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetDirectoryIntegrationRequest))
          as GetDirectoryIntegrationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDirectoryIntegrationRequest create() =>
      GetDirectoryIntegrationRequest._();
  @$core.override
  GetDirectoryIntegrationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDirectoryIntegrationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDirectoryIntegrationRequest>(create);
  static GetDirectoryIntegrationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class GetDirectoryIntegrationResponse extends $pb.GeneratedMessage {
  factory GetDirectoryIntegrationResponse({
    $core.String? id,
    DirectoryType? type,
    LdapSettings? ldap,
    AzureAdSettings? azureAd,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? fieldMapping,
    $core.bool? active,
    $core.bool? secretConfigured,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (type != null) result.type = type;
    if (ldap != null) result.ldap = ldap;
    if (azureAd != null) result.azureAd = azureAd;
    if (fieldMapping != null) result.fieldMapping.addEntries(fieldMapping);
    if (active != null) result.active = active;
    if (secretConfigured != null) result.secretConfigured = secretConfigured;
    return result;
  }

  GetDirectoryIntegrationResponse._();

  factory GetDirectoryIntegrationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDirectoryIntegrationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDirectoryIntegrationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aE<DirectoryType>(2, _omitFieldNames ? '' : 'type',
        enumValues: DirectoryType.values)
    ..aOM<LdapSettings>(3, _omitFieldNames ? '' : 'ldap',
        subBuilder: LdapSettings.create)
    ..aOM<AzureAdSettings>(4, _omitFieldNames ? '' : 'azureAd',
        subBuilder: AzureAdSettings.create)
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'fieldMapping',
        entryClassName: 'GetDirectoryIntegrationResponse.FieldMappingEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('platform.v1'))
    ..aOB(6, _omitFieldNames ? '' : 'active')
    ..aOB(7, _omitFieldNames ? '' : 'secretConfigured')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDirectoryIntegrationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDirectoryIntegrationResponse copyWith(
          void Function(GetDirectoryIntegrationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetDirectoryIntegrationResponse))
          as GetDirectoryIntegrationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDirectoryIntegrationResponse create() =>
      GetDirectoryIntegrationResponse._();
  @$core.override
  GetDirectoryIntegrationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDirectoryIntegrationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDirectoryIntegrationResponse>(
          create);
  static GetDirectoryIntegrationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  DirectoryType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(DirectoryType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  @$pb.TagNumber(3)
  LdapSettings get ldap => $_getN(2);
  @$pb.TagNumber(3)
  set ldap(LdapSettings value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLdap() => $_has(2);
  @$pb.TagNumber(3)
  void clearLdap() => $_clearField(3);
  @$pb.TagNumber(3)
  LdapSettings ensureLdap() => $_ensure(2);

  @$pb.TagNumber(4)
  AzureAdSettings get azureAd => $_getN(3);
  @$pb.TagNumber(4)
  set azureAd(AzureAdSettings value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasAzureAd() => $_has(3);
  @$pb.TagNumber(4)
  void clearAzureAd() => $_clearField(4);
  @$pb.TagNumber(4)
  AzureAdSettings ensureAzureAd() => $_ensure(3);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get fieldMapping => $_getMap(4);

  @$pb.TagNumber(6)
  $core.bool get active => $_getBF(5);
  @$pb.TagNumber(6)
  set active($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasActive() => $_has(5);
  @$pb.TagNumber(6)
  void clearActive() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get secretConfigured => $_getBF(6);
  @$pb.TagNumber(7)
  set secretConfigured($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSecretConfigured() => $_has(6);
  @$pb.TagNumber(7)
  void clearSecretConfigured() => $_clearField(7);
}

class TestDirectoryConnectionRequest extends $pb.GeneratedMessage {
  factory TestDirectoryConnectionRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  TestDirectoryConnectionRequest._();

  factory TestDirectoryConnectionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestDirectoryConnectionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestDirectoryConnectionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestDirectoryConnectionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestDirectoryConnectionRequest copyWith(
          void Function(TestDirectoryConnectionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as TestDirectoryConnectionRequest))
          as TestDirectoryConnectionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestDirectoryConnectionRequest create() =>
      TestDirectoryConnectionRequest._();
  @$core.override
  TestDirectoryConnectionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestDirectoryConnectionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestDirectoryConnectionRequest>(create);
  static TestDirectoryConnectionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class TestDirectoryConnectionResponse extends $pb.GeneratedMessage {
  factory TestDirectoryConnectionResponse({
    $core.bool? ok,
    $core.String? error,
  }) {
    final result = create();
    if (ok != null) result.ok = ok;
    if (error != null) result.error = error;
    return result;
  }

  TestDirectoryConnectionResponse._();

  factory TestDirectoryConnectionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TestDirectoryConnectionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestDirectoryConnectionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'ok')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestDirectoryConnectionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TestDirectoryConnectionResponse copyWith(
          void Function(TestDirectoryConnectionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as TestDirectoryConnectionResponse))
          as TestDirectoryConnectionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestDirectoryConnectionResponse create() =>
      TestDirectoryConnectionResponse._();
  @$core.override
  TestDirectoryConnectionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TestDirectoryConnectionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestDirectoryConnectionResponse>(
          create);
  static TestDirectoryConnectionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get ok => $_getBF(0);
  @$pb.TagNumber(1)
  set ok($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearOk() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);
}

class ListDirectoryUsersRequest extends $pb.GeneratedMessage {
  factory ListDirectoryUsersRequest({
    $core.String? tenantId,
    $core.String? query,
    $core.int? page,
    $core.int? pageSize,
    $core.String? cursor,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (query != null) result.query = query;
    if (page != null) result.page = page;
    if (pageSize != null) result.pageSize = pageSize;
    if (cursor != null) result.cursor = cursor;
    return result;
  }

  ListDirectoryUsersRequest._();

  factory ListDirectoryUsersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDirectoryUsersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDirectoryUsersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'query')
    ..aI(3, _omitFieldNames ? '' : 'page')
    ..aI(4, _omitFieldNames ? '' : 'pageSize')
    ..aOS(5, _omitFieldNames ? '' : 'cursor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDirectoryUsersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDirectoryUsersRequest copyWith(
          void Function(ListDirectoryUsersRequest) updates) =>
      super.copyWith((message) => updates(message as ListDirectoryUsersRequest))
          as ListDirectoryUsersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDirectoryUsersRequest create() => ListDirectoryUsersRequest._();
  @$core.override
  ListDirectoryUsersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDirectoryUsersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDirectoryUsersRequest>(create);
  static ListDirectoryUsersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get query => $_getSZ(1);
  @$pb.TagNumber(2)
  set query($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuery() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get page => $_getIZ(2);
  @$pb.TagNumber(3)
  set page($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get pageSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageSize($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get cursor => $_getSZ(4);
  @$pb.TagNumber(5)
  set cursor($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCursor() => $_has(4);
  @$pb.TagNumber(5)
  void clearCursor() => $_clearField(5);
}

class ListDirectoryUsersResponse extends $pb.GeneratedMessage {
  factory ListDirectoryUsersResponse({
    $core.Iterable<DirectoryUser>? users,
    $core.String? nextCursor,
  }) {
    final result = create();
    if (users != null) result.users.addAll(users);
    if (nextCursor != null) result.nextCursor = nextCursor;
    return result;
  }

  ListDirectoryUsersResponse._();

  factory ListDirectoryUsersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDirectoryUsersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDirectoryUsersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'platform.v1'),
      createEmptyInstance: create)
    ..pPM<DirectoryUser>(1, _omitFieldNames ? '' : 'users',
        subBuilder: DirectoryUser.create)
    ..aOS(2, _omitFieldNames ? '' : 'nextCursor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDirectoryUsersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDirectoryUsersResponse copyWith(
          void Function(ListDirectoryUsersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDirectoryUsersResponse))
          as ListDirectoryUsersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDirectoryUsersResponse create() => ListDirectoryUsersResponse._();
  @$core.override
  ListDirectoryUsersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDirectoryUsersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDirectoryUsersResponse>(create);
  static ListDirectoryUsersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DirectoryUser> get users => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get nextCursor => $_getSZ(1);
  @$pb.TagNumber(2)
  set nextCursor($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNextCursor() => $_has(1);
  @$pb.TagNumber(2)
  void clearNextCursor() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
