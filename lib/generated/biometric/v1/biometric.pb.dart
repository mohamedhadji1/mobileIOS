// This is a generated file - do not edit.
//
// Generated from biometric/v1/biometric.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class EnrollFaceRequest extends $pb.GeneratedMessage {
  factory EnrollFaceRequest({
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? embeddingHash,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    return result;
  }

  EnrollFaceRequest._();

  factory EnrollFaceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnrollFaceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnrollFaceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'tenantId')
    ..aOS(3, _omitFieldNames ? '' : 'embeddingHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollFaceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollFaceRequest copyWith(void Function(EnrollFaceRequest) updates) =>
      super.copyWith((message) => updates(message as EnrollFaceRequest))
          as EnrollFaceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnrollFaceRequest create() => EnrollFaceRequest._();
  @$core.override
  EnrollFaceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnrollFaceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnrollFaceRequest>(create);
  static EnrollFaceRequest? _defaultInstance;

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
  $core.String get embeddingHash => $_getSZ(2);
  @$pb.TagNumber(3)
  set embeddingHash($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEmbeddingHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmbeddingHash() => $_clearField(3);
}

class EnrollFaceResponse extends $pb.GeneratedMessage {
  factory EnrollFaceResponse({
    $core.String? id,
    $core.bool? isNew,
    $core.bool? isCollision,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (isNew != null) result.isNew = isNew;
    if (isCollision != null) result.isCollision = isCollision;
    return result;
  }

  EnrollFaceResponse._();

  factory EnrollFaceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EnrollFaceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EnrollFaceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOB(2, _omitFieldNames ? '' : 'isNew')
    ..aOB(3, _omitFieldNames ? '' : 'isCollision')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollFaceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EnrollFaceResponse copyWith(void Function(EnrollFaceResponse) updates) =>
      super.copyWith((message) => updates(message as EnrollFaceResponse))
          as EnrollFaceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnrollFaceResponse create() => EnrollFaceResponse._();
  @$core.override
  EnrollFaceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EnrollFaceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EnrollFaceResponse>(create);
  static EnrollFaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isNew => $_getBF(1);
  @$pb.TagNumber(2)
  set isNew($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsNew() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsNew() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isCollision => $_getBF(2);
  @$pb.TagNumber(3)
  set isCollision($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsCollision() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsCollision() => $_clearField(3);
}

class SearchCollisionsRequest extends $pb.GeneratedMessage {
  factory SearchCollisionsRequest({
    $core.String? embeddingHash,
  }) {
    final result = create();
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    return result;
  }

  SearchCollisionsRequest._();

  factory SearchCollisionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchCollisionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchCollisionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'embeddingHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchCollisionsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchCollisionsRequest copyWith(
          void Function(SearchCollisionsRequest) updates) =>
      super.copyWith((message) => updates(message as SearchCollisionsRequest))
          as SearchCollisionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchCollisionsRequest create() => SearchCollisionsRequest._();
  @$core.override
  SearchCollisionsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchCollisionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchCollisionsRequest>(create);
  static SearchCollisionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get embeddingHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set embeddingHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmbeddingHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmbeddingHash() => $_clearField(1);
}

class SearchCollisionsResponse extends $pb.GeneratedMessage {
  factory SearchCollisionsResponse({
    $core.Iterable<CollisionResult>? results,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    return result;
  }

  SearchCollisionsResponse._();

  factory SearchCollisionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchCollisionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchCollisionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..pPM<CollisionResult>(1, _omitFieldNames ? '' : 'results',
        subBuilder: CollisionResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchCollisionsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchCollisionsResponse copyWith(
          void Function(SearchCollisionsResponse) updates) =>
      super.copyWith((message) => updates(message as SearchCollisionsResponse))
          as SearchCollisionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchCollisionsResponse create() => SearchCollisionsResponse._();
  @$core.override
  SearchCollisionsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SearchCollisionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchCollisionsResponse>(create);
  static SearchCollisionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<CollisionResult> get results => $_getList(0);
}

class CollisionResult extends $pb.GeneratedMessage {
  factory CollisionResult({
    $core.String? workerId,
    $core.String? label,
    $core.String? detectedAt,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (label != null) result.label = label;
    if (detectedAt != null) result.detectedAt = detectedAt;
    return result;
  }

  CollisionResult._();

  factory CollisionResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CollisionResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CollisionResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aOS(2, _omitFieldNames ? '' : 'label')
    ..aOS(3, _omitFieldNames ? '' : 'detectedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollisionResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CollisionResult copyWith(void Function(CollisionResult) updates) =>
      super.copyWith((message) => updates(message as CollisionResult))
          as CollisionResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CollisionResult create() => CollisionResult._();
  @$core.override
  CollisionResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CollisionResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CollisionResult>(create);
  static CollisionResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get label => $_getSZ(1);
  @$pb.TagNumber(2)
  set label($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLabel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLabel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get detectedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set detectedAt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDetectedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetectedAt() => $_clearField(3);
}

class BlockFaceRequest extends $pb.GeneratedMessage {
  factory BlockFaceRequest({
    $core.String? embeddingHash,
  }) {
    final result = create();
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    return result;
  }

  BlockFaceRequest._();

  factory BlockFaceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockFaceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockFaceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'embeddingHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockFaceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockFaceRequest copyWith(void Function(BlockFaceRequest) updates) =>
      super.copyWith((message) => updates(message as BlockFaceRequest))
          as BlockFaceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockFaceRequest create() => BlockFaceRequest._();
  @$core.override
  BlockFaceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockFaceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockFaceRequest>(create);
  static BlockFaceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get embeddingHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set embeddingHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmbeddingHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmbeddingHash() => $_clearField(1);
}

class BlockFaceResponse extends $pb.GeneratedMessage {
  factory BlockFaceResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  BlockFaceResponse._();

  factory BlockFaceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BlockFaceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BlockFaceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockFaceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BlockFaceResponse copyWith(void Function(BlockFaceResponse) updates) =>
      super.copyWith((message) => updates(message as BlockFaceResponse))
          as BlockFaceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockFaceResponse create() => BlockFaceResponse._();
  @$core.override
  BlockFaceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BlockFaceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BlockFaceResponse>(create);
  static BlockFaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UnblockFaceRequest extends $pb.GeneratedMessage {
  factory UnblockFaceRequest({
    $core.String? embeddingHash,
  }) {
    final result = create();
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    return result;
  }

  UnblockFaceRequest._();

  factory UnblockFaceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnblockFaceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnblockFaceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'embeddingHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnblockFaceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnblockFaceRequest copyWith(void Function(UnblockFaceRequest) updates) =>
      super.copyWith((message) => updates(message as UnblockFaceRequest))
          as UnblockFaceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnblockFaceRequest create() => UnblockFaceRequest._();
  @$core.override
  UnblockFaceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnblockFaceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnblockFaceRequest>(create);
  static UnblockFaceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get embeddingHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set embeddingHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmbeddingHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmbeddingHash() => $_clearField(1);
}

class UnblockFaceResponse extends $pb.GeneratedMessage {
  factory UnblockFaceResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UnblockFaceResponse._();

  factory UnblockFaceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UnblockFaceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnblockFaceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnblockFaceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UnblockFaceResponse copyWith(void Function(UnblockFaceResponse) updates) =>
      super.copyWith((message) => updates(message as UnblockFaceResponse))
          as UnblockFaceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnblockFaceResponse create() => UnblockFaceResponse._();
  @$core.override
  UnblockFaceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UnblockFaceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnblockFaceResponse>(create);
  static UnblockFaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
