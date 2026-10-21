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

class GetWorkerEmbeddingRequest extends $pb.GeneratedMessage {
  factory GetWorkerEmbeddingRequest({
    $core.String? workerId,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  GetWorkerEmbeddingRequest._();

  factory GetWorkerEmbeddingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWorkerEmbeddingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWorkerEmbeddingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkerEmbeddingRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkerEmbeddingRequest copyWith(
          void Function(GetWorkerEmbeddingRequest) updates) =>
      super.copyWith((message) => updates(message as GetWorkerEmbeddingRequest))
          as GetWorkerEmbeddingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWorkerEmbeddingRequest create() => GetWorkerEmbeddingRequest._();
  @$core.override
  GetWorkerEmbeddingRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetWorkerEmbeddingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWorkerEmbeddingRequest>(create);
  static GetWorkerEmbeddingRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);
}

class GetWorkerEmbeddingResponse extends $pb.GeneratedMessage {
  factory GetWorkerEmbeddingResponse({
    $core.String? embeddingHash,
  }) {
    final result = create();
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    return result;
  }

  GetWorkerEmbeddingResponse._();

  factory GetWorkerEmbeddingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetWorkerEmbeddingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetWorkerEmbeddingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'embeddingHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkerEmbeddingResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetWorkerEmbeddingResponse copyWith(
          void Function(GetWorkerEmbeddingResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetWorkerEmbeddingResponse))
          as GetWorkerEmbeddingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetWorkerEmbeddingResponse create() => GetWorkerEmbeddingResponse._();
  @$core.override
  GetWorkerEmbeddingResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetWorkerEmbeddingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetWorkerEmbeddingResponse>(create);
  static GetWorkerEmbeddingResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get embeddingHash => $_getSZ(0);
  @$pb.TagNumber(1)
  set embeddingHash($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmbeddingHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmbeddingHash() => $_clearField(1);
}

class GetChallengeRequest extends $pb.GeneratedMessage {
  factory GetChallengeRequest() => create();

  GetChallengeRequest._();

  factory GetChallengeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChallengeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChallengeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeRequest copyWith(void Function(GetChallengeRequest) updates) =>
      super.copyWith((message) => updates(message as GetChallengeRequest))
          as GetChallengeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChallengeRequest create() => GetChallengeRequest._();
  @$core.override
  GetChallengeRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChallengeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChallengeRequest>(create);
  static GetChallengeRequest? _defaultInstance;
}

class GetChallengeResponse extends $pb.GeneratedMessage {
  factory GetChallengeResponse({
    $core.String? challengeId,
    $core.Iterable<$core.String>? steps,
  }) {
    final result = create();
    if (challengeId != null) result.challengeId = challengeId;
    if (steps != null) result.steps.addAll(steps);
    return result;
  }

  GetChallengeResponse._();

  factory GetChallengeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetChallengeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetChallengeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'challengeId')
    ..pPS(2, _omitFieldNames ? '' : 'steps')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetChallengeResponse copyWith(void Function(GetChallengeResponse) updates) =>
      super.copyWith((message) => updates(message as GetChallengeResponse))
          as GetChallengeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChallengeResponse create() => GetChallengeResponse._();
  @$core.override
  GetChallengeResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetChallengeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetChallengeResponse>(create);
  static GetChallengeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challengeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set challengeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChallengeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallengeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get steps => $_getList(1);
}

enum LivenessClientMsg_Msg { start, frame, notSet }

class LivenessClientMsg extends $pb.GeneratedMessage {
  factory LivenessClientMsg({
    LivenessStart? start,
    $core.List<$core.int>? frame,
  }) {
    final result = create();
    if (start != null) result.start = start;
    if (frame != null) result.frame = frame;
    return result;
  }

  LivenessClientMsg._();

  factory LivenessClientMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessClientMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, LivenessClientMsg_Msg>
      _LivenessClientMsg_MsgByTag = {
    1: LivenessClientMsg_Msg.start,
    2: LivenessClientMsg_Msg.frame,
    0: LivenessClientMsg_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessClientMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<LivenessStart>(1, _omitFieldNames ? '' : 'start',
        subBuilder: LivenessStart.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'frame', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessClientMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessClientMsg copyWith(void Function(LivenessClientMsg) updates) =>
      super.copyWith((message) => updates(message as LivenessClientMsg))
          as LivenessClientMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessClientMsg create() => LivenessClientMsg._();
  @$core.override
  LivenessClientMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessClientMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessClientMsg>(create);
  static LivenessClientMsg? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  LivenessClientMsg_Msg whichMsg() =>
      _LivenessClientMsg_MsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LivenessStart get start => $_getN(0);
  @$pb.TagNumber(1)
  set start(LivenessStart value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => $_clearField(1);
  @$pb.TagNumber(1)
  LivenessStart ensureStart() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get frame => $_getN(1);
  @$pb.TagNumber(2)
  set frame($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFrame() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrame() => $_clearField(2);
}

class LivenessStart extends $pb.GeneratedMessage {
  factory LivenessStart({
    $core.String? challengeId,
    $core.String? workerId,
    $core.String? tenantId,
    $core.List<$core.int>? docFace,
  }) {
    final result = create();
    if (challengeId != null) result.challengeId = challengeId;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (docFace != null) result.docFace = docFace;
    return result;
  }

  LivenessStart._();

  factory LivenessStart.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessStart.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessStart',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'challengeId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'docFace', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStart clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStart copyWith(void Function(LivenessStart) updates) =>
      super.copyWith((message) => updates(message as LivenessStart))
          as LivenessStart;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessStart create() => LivenessStart._();
  @$core.override
  LivenessStart createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessStart getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessStart>(create);
  static LivenessStart? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get challengeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set challengeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasChallengeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChallengeId() => $_clearField(1);

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
  $core.List<$core.int> get docFace => $_getN(3);
  @$pb.TagNumber(4)
  set docFace($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDocFace() => $_has(3);
  @$pb.TagNumber(4)
  void clearDocFace() => $_clearField(4);
}

enum LivenessServerMsg_Msg {
  step,
  stepPassed,
  stepTimeout,
  result,
  error,
  notSet
}

class LivenessServerMsg extends $pb.GeneratedMessage {
  factory LivenessServerMsg({
    LivenessStep? step,
    LivenessStepPassed? stepPassed,
    LivenessStepTimeout? stepTimeout,
    LivenessResult? result,
    LivenessError? error,
  }) {
    final result$ = create();
    if (step != null) result$.step = step;
    if (stepPassed != null) result$.stepPassed = stepPassed;
    if (stepTimeout != null) result$.stepTimeout = stepTimeout;
    if (result != null) result$.result = result;
    if (error != null) result$.error = error;
    return result$;
  }

  LivenessServerMsg._();

  factory LivenessServerMsg.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessServerMsg.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, LivenessServerMsg_Msg>
      _LivenessServerMsg_MsgByTag = {
    1: LivenessServerMsg_Msg.step,
    2: LivenessServerMsg_Msg.stepPassed,
    3: LivenessServerMsg_Msg.stepTimeout,
    4: LivenessServerMsg_Msg.result,
    5: LivenessServerMsg_Msg.error,
    0: LivenessServerMsg_Msg.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessServerMsg',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<LivenessStep>(1, _omitFieldNames ? '' : 'step',
        subBuilder: LivenessStep.create)
    ..aOM<LivenessStepPassed>(2, _omitFieldNames ? '' : 'stepPassed',
        subBuilder: LivenessStepPassed.create)
    ..aOM<LivenessStepTimeout>(3, _omitFieldNames ? '' : 'stepTimeout',
        subBuilder: LivenessStepTimeout.create)
    ..aOM<LivenessResult>(4, _omitFieldNames ? '' : 'result',
        subBuilder: LivenessResult.create)
    ..aOM<LivenessError>(5, _omitFieldNames ? '' : 'error',
        subBuilder: LivenessError.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessServerMsg clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessServerMsg copyWith(void Function(LivenessServerMsg) updates) =>
      super.copyWith((message) => updates(message as LivenessServerMsg))
          as LivenessServerMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessServerMsg create() => LivenessServerMsg._();
  @$core.override
  LivenessServerMsg createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessServerMsg getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessServerMsg>(create);
  static LivenessServerMsg? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  LivenessServerMsg_Msg whichMsg() =>
      _LivenessServerMsg_MsgByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearMsg() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  LivenessStep get step => $_getN(0);
  @$pb.TagNumber(1)
  set step(LivenessStep value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStep() => $_has(0);
  @$pb.TagNumber(1)
  void clearStep() => $_clearField(1);
  @$pb.TagNumber(1)
  LivenessStep ensureStep() => $_ensure(0);

  @$pb.TagNumber(2)
  LivenessStepPassed get stepPassed => $_getN(1);
  @$pb.TagNumber(2)
  set stepPassed(LivenessStepPassed value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStepPassed() => $_has(1);
  @$pb.TagNumber(2)
  void clearStepPassed() => $_clearField(2);
  @$pb.TagNumber(2)
  LivenessStepPassed ensureStepPassed() => $_ensure(1);

  @$pb.TagNumber(3)
  LivenessStepTimeout get stepTimeout => $_getN(2);
  @$pb.TagNumber(3)
  set stepTimeout(LivenessStepTimeout value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStepTimeout() => $_has(2);
  @$pb.TagNumber(3)
  void clearStepTimeout() => $_clearField(3);
  @$pb.TagNumber(3)
  LivenessStepTimeout ensureStepTimeout() => $_ensure(2);

  @$pb.TagNumber(4)
  LivenessResult get result => $_getN(3);
  @$pb.TagNumber(4)
  set result(LivenessResult value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasResult() => $_has(3);
  @$pb.TagNumber(4)
  void clearResult() => $_clearField(4);
  @$pb.TagNumber(4)
  LivenessResult ensureResult() => $_ensure(3);

  @$pb.TagNumber(5)
  LivenessError get error => $_getN(4);
  @$pb.TagNumber(5)
  set error(LivenessError value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);
  @$pb.TagNumber(5)
  LivenessError ensureError() => $_ensure(4);
}

/// attempt is which try of this step the user is on (1-based); attempts_left is
/// how many retries remain after this one. attempt > 1 means the step was
/// re-issued (re-randomised) after a timeout — always render the new instruction.
class LivenessStep extends $pb.GeneratedMessage {
  factory LivenessStep({
    $core.int? index,
    $core.int? total,
    $core.String? instruction,
    $core.int? attempt,
    $core.int? attemptsLeft,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (total != null) result.total = total;
    if (instruction != null) result.instruction = instruction;
    if (attempt != null) result.attempt = attempt;
    if (attemptsLeft != null) result.attemptsLeft = attemptsLeft;
    return result;
  }

  LivenessStep._();

  factory LivenessStep.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessStep.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessStep',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index')
    ..aI(2, _omitFieldNames ? '' : 'total')
    ..aOS(3, _omitFieldNames ? '' : 'instruction')
    ..aI(4, _omitFieldNames ? '' : 'attempt')
    ..aI(5, _omitFieldNames ? '' : 'attemptsLeft')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStep clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStep copyWith(void Function(LivenessStep) updates) =>
      super.copyWith((message) => updates(message as LivenessStep))
          as LivenessStep;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessStep create() => LivenessStep._();
  @$core.override
  LivenessStep createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessStep getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessStep>(create);
  static LivenessStep? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get total => $_getIZ(1);
  @$pb.TagNumber(2)
  set total($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotal() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotal() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get instruction => $_getSZ(2);
  @$pb.TagNumber(3)
  set instruction($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInstruction() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstruction() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get attempt => $_getIZ(3);
  @$pb.TagNumber(4)
  set attempt($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAttempt() => $_has(3);
  @$pb.TagNumber(4)
  void clearAttempt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get attemptsLeft => $_getIZ(4);
  @$pb.TagNumber(5)
  set attemptsLeft($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAttemptsLeft() => $_has(4);
  @$pb.TagNumber(5)
  void clearAttemptsLeft() => $_clearField(5);
}

class LivenessStepPassed extends $pb.GeneratedMessage {
  factory LivenessStepPassed({
    $core.int? index,
  }) {
    final result = create();
    if (index != null) result.index = index;
    return result;
  }

  LivenessStepPassed._();

  factory LivenessStepPassed.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessStepPassed.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessStepPassed',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStepPassed clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStepPassed copyWith(void Function(LivenessStepPassed) updates) =>
      super.copyWith((message) => updates(message as LivenessStepPassed))
          as LivenessStepPassed;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessStepPassed create() => LivenessStepPassed._();
  @$core.override
  LivenessStepPassed createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessStepPassed getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessStepPassed>(create);
  static LivenessStepPassed? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);
}

/// failed=false: the step timed out but will be re-issued — keep streaming
/// frames. failed=true: the step is out of attempts; the result follows.
class LivenessStepTimeout extends $pb.GeneratedMessage {
  factory LivenessStepTimeout({
    $core.int? index,
    $core.int? attempt,
    $core.int? attemptsLeft,
    $core.bool? failed,
  }) {
    final result = create();
    if (index != null) result.index = index;
    if (attempt != null) result.attempt = attempt;
    if (attemptsLeft != null) result.attemptsLeft = attemptsLeft;
    if (failed != null) result.failed = failed;
    return result;
  }

  LivenessStepTimeout._();

  factory LivenessStepTimeout.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessStepTimeout.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessStepTimeout',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'index')
    ..aI(2, _omitFieldNames ? '' : 'attempt')
    ..aI(3, _omitFieldNames ? '' : 'attemptsLeft')
    ..aOB(4, _omitFieldNames ? '' : 'failed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStepTimeout clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessStepTimeout copyWith(void Function(LivenessStepTimeout) updates) =>
      super.copyWith((message) => updates(message as LivenessStepTimeout))
          as LivenessStepTimeout;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessStepTimeout create() => LivenessStepTimeout._();
  @$core.override
  LivenessStepTimeout createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessStepTimeout getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessStepTimeout>(create);
  static LivenessStepTimeout? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get index => $_getIZ(0);
  @$pb.TagNumber(1)
  set index($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearIndex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get attempt => $_getIZ(1);
  @$pb.TagNumber(2)
  set attempt($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAttempt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAttempt() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get attemptsLeft => $_getIZ(2);
  @$pb.TagNumber(3)
  set attemptsLeft($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAttemptsLeft() => $_has(2);
  @$pb.TagNumber(3)
  void clearAttemptsLeft() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get failed => $_getBF(3);
  @$pb.TagNumber(4)
  set failed($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasFailed() => $_has(3);
  @$pb.TagNumber(4)
  void clearFailed() => $_clearField(4);
}

class LivenessError extends $pb.GeneratedMessage {
  factory LivenessError({
    $core.String? message,
  }) {
    final result = create();
    if (message != null) result.message = message;
    return result;
  }

  LivenessError._();

  factory LivenessError.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessError.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessError',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessError clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessError copyWith(void Function(LivenessError) updates) =>
      super.copyWith((message) => updates(message as LivenessError))
          as LivenessError;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessError create() => LivenessError._();
  @$core.override
  LivenessError createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessError getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessError>(create);
  static LivenessError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => $_clearField(1);
}

class LivenessResult extends $pb.GeneratedMessage {
  factory LivenessResult({
    $core.String? verdict,
    $core.bool? livenessPassed,
    $core.bool? matched,
    $core.double? matchScore,
    $core.String? matchReason,
    $core.String? spoofClassification,
    $core.String? deepfakeVerdict,
    $core.String? embeddingHash,
  }) {
    final result = create();
    if (verdict != null) result.verdict = verdict;
    if (livenessPassed != null) result.livenessPassed = livenessPassed;
    if (matched != null) result.matched = matched;
    if (matchScore != null) result.matchScore = matchScore;
    if (matchReason != null) result.matchReason = matchReason;
    if (spoofClassification != null)
      result.spoofClassification = spoofClassification;
    if (deepfakeVerdict != null) result.deepfakeVerdict = deepfakeVerdict;
    if (embeddingHash != null) result.embeddingHash = embeddingHash;
    return result;
  }

  LivenessResult._();

  factory LivenessResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LivenessResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LivenessResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'verdict')
    ..aOB(2, _omitFieldNames ? '' : 'livenessPassed')
    ..aOB(3, _omitFieldNames ? '' : 'matched')
    ..aD(4, _omitFieldNames ? '' : 'matchScore', fieldType: $pb.PbFieldType.OF)
    ..aOS(5, _omitFieldNames ? '' : 'matchReason')
    ..aOS(6, _omitFieldNames ? '' : 'spoofClassification')
    ..aOS(7, _omitFieldNames ? '' : 'deepfakeVerdict')
    ..aOS(8, _omitFieldNames ? '' : 'embeddingHash')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LivenessResult copyWith(void Function(LivenessResult) updates) =>
      super.copyWith((message) => updates(message as LivenessResult))
          as LivenessResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LivenessResult create() => LivenessResult._();
  @$core.override
  LivenessResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LivenessResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LivenessResult>(create);
  static LivenessResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get verdict => $_getSZ(0);
  @$pb.TagNumber(1)
  set verdict($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVerdict() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerdict() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get livenessPassed => $_getBF(1);
  @$pb.TagNumber(2)
  set livenessPassed($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLivenessPassed() => $_has(1);
  @$pb.TagNumber(2)
  void clearLivenessPassed() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get matched => $_getBF(2);
  @$pb.TagNumber(3)
  set matched($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMatched() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatched() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get matchScore => $_getN(3);
  @$pb.TagNumber(4)
  set matchScore($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMatchScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearMatchScore() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get matchReason => $_getSZ(4);
  @$pb.TagNumber(5)
  set matchReason($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMatchReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearMatchReason() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get spoofClassification => $_getSZ(5);
  @$pb.TagNumber(6)
  set spoofClassification($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSpoofClassification() => $_has(5);
  @$pb.TagNumber(6)
  void clearSpoofClassification() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get deepfakeVerdict => $_getSZ(6);
  @$pb.TagNumber(7)
  set deepfakeVerdict($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDeepfakeVerdict() => $_has(6);
  @$pb.TagNumber(7)
  void clearDeepfakeVerdict() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get embeddingHash => $_getSZ(7);
  @$pb.TagNumber(8)
  set embeddingHash($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasEmbeddingHash() => $_has(7);
  @$pb.TagNumber(8)
  void clearEmbeddingHash() => $_clearField(8);
}

class ListBiometricReviewQueueRequest extends $pb.GeneratedMessage {
  factory ListBiometricReviewQueueRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListBiometricReviewQueueRequest._();

  factory ListBiometricReviewQueueRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBiometricReviewQueueRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBiometricReviewQueueRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricReviewQueueRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricReviewQueueRequest copyWith(
          void Function(ListBiometricReviewQueueRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListBiometricReviewQueueRequest))
          as ListBiometricReviewQueueRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBiometricReviewQueueRequest create() =>
      ListBiometricReviewQueueRequest._();
  @$core.override
  ListBiometricReviewQueueRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBiometricReviewQueueRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBiometricReviewQueueRequest>(
          create);
  static ListBiometricReviewQueueRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class BiometricReviewItem extends $pb.GeneratedMessage {
  factory BiometricReviewItem({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? sessionToken,
    $core.double? matchScore,
    $core.bool? livenessPassed,
    $core.String? spoofClassification,
    $core.String? deepfakeVerdict,
    $core.String? verifiedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (sessionToken != null) result.sessionToken = sessionToken;
    if (matchScore != null) result.matchScore = matchScore;
    if (livenessPassed != null) result.livenessPassed = livenessPassed;
    if (spoofClassification != null)
      result.spoofClassification = spoofClassification;
    if (deepfakeVerdict != null) result.deepfakeVerdict = deepfakeVerdict;
    if (verifiedAt != null) result.verifiedAt = verifiedAt;
    return result;
  }

  BiometricReviewItem._();

  factory BiometricReviewItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BiometricReviewItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BiometricReviewItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'sessionToken')
    ..aD(5, _omitFieldNames ? '' : 'matchScore', fieldType: $pb.PbFieldType.OF)
    ..aOB(6, _omitFieldNames ? '' : 'livenessPassed')
    ..aOS(7, _omitFieldNames ? '' : 'spoofClassification')
    ..aOS(8, _omitFieldNames ? '' : 'deepfakeVerdict')
    ..aOS(9, _omitFieldNames ? '' : 'verifiedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BiometricReviewItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BiometricReviewItem copyWith(void Function(BiometricReviewItem) updates) =>
      super.copyWith((message) => updates(message as BiometricReviewItem))
          as BiometricReviewItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BiometricReviewItem create() => BiometricReviewItem._();
  @$core.override
  BiometricReviewItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BiometricReviewItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BiometricReviewItem>(create);
  static BiometricReviewItem? _defaultInstance;

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
  $core.String get sessionToken => $_getSZ(3);
  @$pb.TagNumber(4)
  set sessionToken($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSessionToken() => $_has(3);
  @$pb.TagNumber(4)
  void clearSessionToken() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get matchScore => $_getN(4);
  @$pb.TagNumber(5)
  set matchScore($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMatchScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearMatchScore() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get livenessPassed => $_getBF(5);
  @$pb.TagNumber(6)
  set livenessPassed($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLivenessPassed() => $_has(5);
  @$pb.TagNumber(6)
  void clearLivenessPassed() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get spoofClassification => $_getSZ(6);
  @$pb.TagNumber(7)
  set spoofClassification($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSpoofClassification() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpoofClassification() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get deepfakeVerdict => $_getSZ(7);
  @$pb.TagNumber(8)
  set deepfakeVerdict($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasDeepfakeVerdict() => $_has(7);
  @$pb.TagNumber(8)
  void clearDeepfakeVerdict() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get verifiedAt => $_getSZ(8);
  @$pb.TagNumber(9)
  set verifiedAt($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasVerifiedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearVerifiedAt() => $_clearField(9);
}

class ListBiometricReviewQueueResponse extends $pb.GeneratedMessage {
  factory ListBiometricReviewQueueResponse({
    $core.Iterable<BiometricReviewItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListBiometricReviewQueueResponse._();

  factory ListBiometricReviewQueueResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBiometricReviewQueueResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBiometricReviewQueueResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..pPM<BiometricReviewItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: BiometricReviewItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricReviewQueueResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricReviewQueueResponse copyWith(
          void Function(ListBiometricReviewQueueResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListBiometricReviewQueueResponse))
          as ListBiometricReviewQueueResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBiometricReviewQueueResponse create() =>
      ListBiometricReviewQueueResponse._();
  @$core.override
  ListBiometricReviewQueueResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBiometricReviewQueueResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBiometricReviewQueueResponse>(
          create);
  static ListBiometricReviewQueueResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BiometricReviewItem> get items => $_getList(0);
}

class ListBiometricResultsRequest extends $pb.GeneratedMessage {
  factory ListBiometricResultsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListBiometricResultsRequest._();

  factory ListBiometricResultsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBiometricResultsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBiometricResultsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricResultsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricResultsRequest copyWith(
          void Function(ListBiometricResultsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListBiometricResultsRequest))
          as ListBiometricResultsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBiometricResultsRequest create() =>
      ListBiometricResultsRequest._();
  @$core.override
  ListBiometricResultsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBiometricResultsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBiometricResultsRequest>(create);
  static ListBiometricResultsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class BiometricResult extends $pb.GeneratedMessage {
  factory BiometricResult({
    $core.String? workerId,
    $core.double? matchScore,
    $core.double? livenessScore,
    $core.bool? livenessPassed,
    $core.String? verifiedAt,
    $core.String? verdict,
    $core.String? matchBand,
    $core.String? matchReason,
    $core.bool? matched,
  }) {
    final result = create();
    if (workerId != null) result.workerId = workerId;
    if (matchScore != null) result.matchScore = matchScore;
    if (livenessScore != null) result.livenessScore = livenessScore;
    if (livenessPassed != null) result.livenessPassed = livenessPassed;
    if (verifiedAt != null) result.verifiedAt = verifiedAt;
    if (verdict != null) result.verdict = verdict;
    if (matchBand != null) result.matchBand = matchBand;
    if (matchReason != null) result.matchReason = matchReason;
    if (matched != null) result.matched = matched;
    return result;
  }

  BiometricResult._();

  factory BiometricResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BiometricResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BiometricResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'workerId')
    ..aD(2, _omitFieldNames ? '' : 'matchScore', fieldType: $pb.PbFieldType.OF)
    ..aD(3, _omitFieldNames ? '' : 'livenessScore',
        fieldType: $pb.PbFieldType.OF)
    ..aOB(4, _omitFieldNames ? '' : 'livenessPassed')
    ..aOS(5, _omitFieldNames ? '' : 'verifiedAt')
    ..aOS(6, _omitFieldNames ? '' : 'verdict')
    ..aOS(7, _omitFieldNames ? '' : 'matchBand')
    ..aOS(8, _omitFieldNames ? '' : 'matchReason')
    ..aOB(9, _omitFieldNames ? '' : 'matched')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BiometricResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BiometricResult copyWith(void Function(BiometricResult) updates) =>
      super.copyWith((message) => updates(message as BiometricResult))
          as BiometricResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BiometricResult create() => BiometricResult._();
  @$core.override
  BiometricResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BiometricResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BiometricResult>(create);
  static BiometricResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get workerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set workerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWorkerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWorkerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get matchScore => $_getN(1);
  @$pb.TagNumber(2)
  set matchScore($core.double value) => $_setFloat(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMatchScore() => $_has(1);
  @$pb.TagNumber(2)
  void clearMatchScore() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get livenessScore => $_getN(2);
  @$pb.TagNumber(3)
  set livenessScore($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLivenessScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearLivenessScore() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get livenessPassed => $_getBF(3);
  @$pb.TagNumber(4)
  set livenessPassed($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLivenessPassed() => $_has(3);
  @$pb.TagNumber(4)
  void clearLivenessPassed() => $_clearField(4);

  /// When this (the latest) face check finished, RFC 3339 UTC. "" when unknown.
  @$pb.TagNumber(5)
  $core.String get verifiedAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set verifiedAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVerifiedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearVerifiedAt() => $_clearField(5);

  /// How it ended: PASS | REVIEW | REJECT. "" for a row from before verdicts were stored.
  @$pb.TagNumber(6)
  $core.String get verdict => $_getSZ(5);
  @$pb.TagNumber(6)
  set verdict($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVerdict() => $_has(5);
  @$pb.TagNumber(6)
  void clearVerdict() => $_clearField(6);

  /// PRE-WIRED (frontend contract, backend not sending yet): M5's face-match
  /// decision on the live check vs the document portrait. Renumbered from 5-7
  /// on 2026-10-12, when the backend took 5/6 for verified_at/verdict.
  @$pb.TagNumber(7)
  $core.String get matchBand => $_getSZ(6);
  @$pb.TagNumber(7)
  set matchBand($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMatchBand() => $_has(6);
  @$pb.TagNumber(7)
  void clearMatchBand() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get matchReason => $_getSZ(7);
  @$pb.TagNumber(8)
  set matchReason($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMatchReason() => $_has(7);
  @$pb.TagNumber(8)
  void clearMatchReason() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.bool get matched => $_getBF(8);
  @$pb.TagNumber(9)
  set matched($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMatched() => $_has(8);
  @$pb.TagNumber(9)
  void clearMatched() => $_clearField(9);
}

class ListBiometricResultsResponse extends $pb.GeneratedMessage {
  factory ListBiometricResultsResponse({
    $core.Iterable<BiometricResult>? results,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    return result;
  }

  ListBiometricResultsResponse._();

  factory ListBiometricResultsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListBiometricResultsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListBiometricResultsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..pPM<BiometricResult>(1, _omitFieldNames ? '' : 'results',
        subBuilder: BiometricResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricResultsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListBiometricResultsResponse copyWith(
          void Function(ListBiometricResultsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListBiometricResultsResponse))
          as ListBiometricResultsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListBiometricResultsResponse create() =>
      ListBiometricResultsResponse._();
  @$core.override
  ListBiometricResultsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListBiometricResultsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListBiometricResultsResponse>(create);
  static ListBiometricResultsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<BiometricResult> get results => $_getList(0);
}

class GetBiometricEvidenceURLRequest extends $pb.GeneratedMessage {
  factory GetBiometricEvidenceURLRequest({
    $core.String? tenantId,
    $core.String? workerId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  GetBiometricEvidenceURLRequest._();

  factory GetBiometricEvidenceURLRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBiometricEvidenceURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBiometricEvidenceURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBiometricEvidenceURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBiometricEvidenceURLRequest copyWith(
          void Function(GetBiometricEvidenceURLRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetBiometricEvidenceURLRequest))
          as GetBiometricEvidenceURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBiometricEvidenceURLRequest create() =>
      GetBiometricEvidenceURLRequest._();
  @$core.override
  GetBiometricEvidenceURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBiometricEvidenceURLRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBiometricEvidenceURLRequest>(create);
  static GetBiometricEvidenceURLRequest? _defaultInstance;

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

class GetBiometricEvidenceURLResponse extends $pb.GeneratedMessage {
  factory GetBiometricEvidenceURLResponse({
    $core.String? url,
    $core.String? expiresAt,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (expiresAt != null) result.expiresAt = expiresAt;
    return result;
  }

  GetBiometricEvidenceURLResponse._();

  factory GetBiometricEvidenceURLResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBiometricEvidenceURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBiometricEvidenceURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'expiresAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBiometricEvidenceURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBiometricEvidenceURLResponse copyWith(
          void Function(GetBiometricEvidenceURLResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetBiometricEvidenceURLResponse))
          as GetBiometricEvidenceURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBiometricEvidenceURLResponse create() =>
      GetBiometricEvidenceURLResponse._();
  @$core.override
  GetBiometricEvidenceURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBiometricEvidenceURLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBiometricEvidenceURLResponse>(
          create);
  static GetBiometricEvidenceURLResponse? _defaultInstance;

  /// Empty when the worker has no retained evidence frame.
  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  /// RFC3339 expiry of the presigned URL. Empty when url is empty.
  @$pb.TagNumber(2)
  $core.String get expiresAt => $_getSZ(1);
  @$pb.TagNumber(2)
  set expiresAt($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiresAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresAt() => $_clearField(2);
}

class DeleteBiometricEvidenceRequest extends $pb.GeneratedMessage {
  factory DeleteBiometricEvidenceRequest({
    $core.String? tenantId,
    $core.String? workerId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  DeleteBiometricEvidenceRequest._();

  factory DeleteBiometricEvidenceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBiometricEvidenceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBiometricEvidenceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBiometricEvidenceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBiometricEvidenceRequest copyWith(
          void Function(DeleteBiometricEvidenceRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteBiometricEvidenceRequest))
          as DeleteBiometricEvidenceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBiometricEvidenceRequest create() =>
      DeleteBiometricEvidenceRequest._();
  @$core.override
  DeleteBiometricEvidenceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteBiometricEvidenceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBiometricEvidenceRequest>(create);
  static DeleteBiometricEvidenceRequest? _defaultInstance;

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

class DeleteBiometricEvidenceResponse extends $pb.GeneratedMessage {
  factory DeleteBiometricEvidenceResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteBiometricEvidenceResponse._();

  factory DeleteBiometricEvidenceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBiometricEvidenceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBiometricEvidenceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'biometric.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBiometricEvidenceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBiometricEvidenceResponse copyWith(
          void Function(DeleteBiometricEvidenceResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteBiometricEvidenceResponse))
          as DeleteBiometricEvidenceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBiometricEvidenceResponse create() =>
      DeleteBiometricEvidenceResponse._();
  @$core.override
  DeleteBiometricEvidenceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteBiometricEvidenceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBiometricEvidenceResponse>(
          create);
  static DeleteBiometricEvidenceResponse? _defaultInstance;

  /// Idempotent: true even when there was nothing left to delete.
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
