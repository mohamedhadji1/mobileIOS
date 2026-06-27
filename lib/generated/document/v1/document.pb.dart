// This is a generated file - do not edit.
//
// Generated from document/v1/document.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Request to generate an upload URL.
class GenerateUploadURLRequest extends $pb.GeneratedMessage {
  factory GenerateUploadURLRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? fileExt,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (fileExt != null) result.fileExt = fileExt;
    return result;
  }

  GenerateUploadURLRequest._();

  factory GenerateUploadURLRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateUploadURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateUploadURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'fileExt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateUploadURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateUploadURLRequest copyWith(
          void Function(GenerateUploadURLRequest) updates) =>
      super.copyWith((message) => updates(message as GenerateUploadURLRequest))
          as GenerateUploadURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateUploadURLRequest create() => GenerateUploadURLRequest._();
  @$core.override
  GenerateUploadURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateUploadURLRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateUploadURLRequest>(create);
  static GenerateUploadURLRequest? _defaultInstance;

  /// Tenant identifier (multi-tenant isolation)
  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);

  /// Worker identifier
  @$pb.TagNumber(2)
  $core.String get workerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set workerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWorkerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearWorkerId() => $_clearField(2);

  /// File extension (allowed: pdf, jpg, png)
  @$pb.TagNumber(3)
  $core.String get fileExt => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileExt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFileExt() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileExt() => $_clearField(3);
}

/// Response containing upload info.
class GenerateUploadURLResponse extends $pb.GeneratedMessage {
  factory GenerateUploadURLResponse({
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

  GenerateUploadURLResponse._();

  factory GenerateUploadURLResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateUploadURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateUploadURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uploadUrl')
    ..aOS(2, _omitFieldNames ? '' : 'objectKey')
    ..aI(3, _omitFieldNames ? '' : 'expiresIn')
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'requiredHeaders',
        entryClassName: 'GenerateUploadURLResponse.RequiredHeadersEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('document.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateUploadURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateUploadURLResponse copyWith(
          void Function(GenerateUploadURLResponse) updates) =>
      super.copyWith((message) => updates(message as GenerateUploadURLResponse))
          as GenerateUploadURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateUploadURLResponse create() => GenerateUploadURLResponse._();
  @$core.override
  GenerateUploadURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateUploadURLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateUploadURLResponse>(create);
  static GenerateUploadURLResponse? _defaultInstance;

  /// Pre-signed HTTP PUT URL used to upload the file
  @$pb.TagNumber(1)
  $core.String get uploadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set uploadUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUploadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadUrl() => $_clearField(1);

  /// Storage key to reference the file later
  /// Example: tenant123/worker456/uuid.pdf
  @$pb.TagNumber(2)
  $core.String get objectKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasObjectKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectKey() => $_clearField(2);

  /// Expiration time in seconds (usually 900 = 15 minutes)
  @$pb.TagNumber(3)
  $core.int get expiresIn => $_getIZ(2);
  @$pb.TagNumber(3)
  set expiresIn($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiresIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiresIn() => $_clearField(3);

  /// HTTP headers that MUST be sent with the PUT request.
  /// For SSE-KMS, this includes x-amz-server-side-encryption, etc.
  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.String> get requiredHeaders => $_getMap(3);
}

/// Request to generate a download URL.
class GenerateDownloadURLRequest extends $pb.GeneratedMessage {
  factory GenerateDownloadURLRequest({
    $core.String? objectKey,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  GenerateDownloadURLRequest._();

  factory GenerateDownloadURLRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateDownloadURLRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateDownloadURLRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDownloadURLRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDownloadURLRequest copyWith(
          void Function(GenerateDownloadURLRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GenerateDownloadURLRequest))
          as GenerateDownloadURLRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateDownloadURLRequest create() => GenerateDownloadURLRequest._();
  @$core.override
  GenerateDownloadURLRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateDownloadURLRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateDownloadURLRequest>(create);
  static GenerateDownloadURLRequest? _defaultInstance;

  /// Storage key returned from GenerateUploadURL
  /// Example: tenant123/worker456/uuid.pdf
  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);
}

/// Response containing download info.
class GenerateDownloadURLResponse extends $pb.GeneratedMessage {
  factory GenerateDownloadURLResponse({
    $core.String? downloadUrl,
    $core.int? expiresIn,
  }) {
    final result = create();
    if (downloadUrl != null) result.downloadUrl = downloadUrl;
    if (expiresIn != null) result.expiresIn = expiresIn;
    return result;
  }

  GenerateDownloadURLResponse._();

  factory GenerateDownloadURLResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateDownloadURLResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateDownloadURLResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'downloadUrl')
    ..aI(2, _omitFieldNames ? '' : 'expiresIn')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDownloadURLResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateDownloadURLResponse copyWith(
          void Function(GenerateDownloadURLResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GenerateDownloadURLResponse))
          as GenerateDownloadURLResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateDownloadURLResponse create() =>
      GenerateDownloadURLResponse._();
  @$core.override
  GenerateDownloadURLResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GenerateDownloadURLResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateDownloadURLResponse>(create);
  static GenerateDownloadURLResponse? _defaultInstance;

  /// Pre-signed HTTP GET URL used to download the file
  @$pb.TagNumber(1)
  $core.String get downloadUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set downloadUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDownloadUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearDownloadUrl() => $_clearField(1);

  /// Expiration time in seconds
  @$pb.TagNumber(2)
  $core.int get expiresIn => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiresIn($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiresIn() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresIn() => $_clearField(2);
}

/// Request to confirm an upload.
class ConfirmUploadRequest extends $pb.GeneratedMessage {
  factory ConfirmUploadRequest({
    $core.String? objectKey,
    $core.String? docType,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    if (docType != null) result.docType = docType;
    return result;
  }

  ConfirmUploadRequest._();

  factory ConfirmUploadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfirmUploadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfirmUploadRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..aOS(2, _omitFieldNames ? '' : 'docType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfirmUploadRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfirmUploadRequest copyWith(void Function(ConfirmUploadRequest) updates) =>
      super.copyWith((message) => updates(message as ConfirmUploadRequest))
          as ConfirmUploadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfirmUploadRequest create() => ConfirmUploadRequest._();
  @$core.override
  ConfirmUploadRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfirmUploadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfirmUploadRequest>(create);
  static ConfirmUploadRequest? _defaultInstance;

  /// Storage key returned from GenerateUploadURL
  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);

  /// Document type (e.g., "ID", "CONTRACT")
  @$pb.TagNumber(2)
  $core.String get docType => $_getSZ(1);
  @$pb.TagNumber(2)
  set docType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDocType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDocType() => $_clearField(2);
}

/// Response confirming upload.
class ConfirmUploadResponse extends $pb.GeneratedMessage {
  factory ConfirmUploadResponse({
    $core.String? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  ConfirmUploadResponse._();

  factory ConfirmUploadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConfirmUploadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfirmUploadResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfirmUploadResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConfirmUploadResponse copyWith(
          void Function(ConfirmUploadResponse) updates) =>
      super.copyWith((message) => updates(message as ConfirmUploadResponse))
          as ConfirmUploadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfirmUploadResponse create() => ConfirmUploadResponse._();
  @$core.override
  ConfirmUploadResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConfirmUploadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfirmUploadResponse>(create);
  static ConfirmUploadResponse? _defaultInstance;

  /// Status of the document
  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

/// Request to download raw encrypted object.
class DownloadEncryptedRequest extends $pb.GeneratedMessage {
  factory DownloadEncryptedRequest({
    $core.String? objectKey,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  DownloadEncryptedRequest._();

  factory DownloadEncryptedRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DownloadEncryptedRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DownloadEncryptedRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadEncryptedRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadEncryptedRequest copyWith(
          void Function(DownloadEncryptedRequest) updates) =>
      super.copyWith((message) => updates(message as DownloadEncryptedRequest))
          as DownloadEncryptedRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadEncryptedRequest create() => DownloadEncryptedRequest._();
  @$core.override
  DownloadEncryptedRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DownloadEncryptedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DownloadEncryptedRequest>(create);
  static DownloadEncryptedRequest? _defaultInstance;

  /// Storage key returned from GenerateUploadURL
  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);
}

/// Response containing raw encrypted bytes.
class DownloadEncryptedResponse extends $pb.GeneratedMessage {
  factory DownloadEncryptedResponse({
    $core.List<$core.int>? encryptedData,
  }) {
    final result = create();
    if (encryptedData != null) result.encryptedData = encryptedData;
    return result;
  }

  DownloadEncryptedResponse._();

  factory DownloadEncryptedResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DownloadEncryptedResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DownloadEncryptedResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'encryptedData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadEncryptedResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DownloadEncryptedResponse copyWith(
          void Function(DownloadEncryptedResponse) updates) =>
      super.copyWith((message) => updates(message as DownloadEncryptedResponse))
          as DownloadEncryptedResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DownloadEncryptedResponse create() => DownloadEncryptedResponse._();
  @$core.override
  DownloadEncryptedResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DownloadEncryptedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DownloadEncryptedResponse>(create);
  static DownloadEncryptedResponse? _defaultInstance;

  /// Encrypted ciphertext bytes
  @$pb.TagNumber(1)
  $core.List<$core.int> get encryptedData => $_getN(0);
  @$pb.TagNumber(1)
  set encryptedData($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEncryptedData() => $_has(0);
  @$pb.TagNumber(1)
  void clearEncryptedData() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
