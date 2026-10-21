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
    $core.String? docType,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (fileExt != null) result.fileExt = fileExt;
    if (docType != null) result.docType = docType;
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
    ..aOS(4, _omitFieldNames ? '' : 'docType')
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

  /// Document type the client is uploading (e.g. PASSPORT, NATIONAL_ID,
  /// DRIVING_LICENSE, WORK_PERMIT, VISA, QUALIFICATION_CERT). Drives the M4
  /// doc_format (TD3/TD1) so verification isn't left to slow auto-classify.
  /// Empty defaults to the generic DOCUMENT type.
  @$pb.TagNumber(4)
  $core.String get docType => $_getSZ(3);
  @$pb.TagNumber(4)
  set docType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDocType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDocType() => $_clearField(4);
}

/// Response containing upload info.
class GenerateUploadURLResponse extends $pb.GeneratedMessage {
  factory GenerateUploadURLResponse({
    $core.String? uploadUrl,
    $core.String? objectKey,
    $core.int? expiresIn,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? requiredHeaders,
    $core.String? documentId,
  }) {
    final result = create();
    if (uploadUrl != null) result.uploadUrl = uploadUrl;
    if (objectKey != null) result.objectKey = objectKey;
    if (expiresIn != null) result.expiresIn = expiresIn;
    if (requiredHeaders != null)
      result.requiredHeaders.addEntries(requiredHeaders);
    if (documentId != null) result.documentId = documentId;
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
    ..aOS(5, _omitFieldNames ? '' : 'documentId')
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

  /// Id of the document record this upload creates. Derived from object_key,
  /// so it is known before the upload happens and stable across retries.
  @$pb.TagNumber(5)
  $core.String get documentId => $_getSZ(4);
  @$pb.TagNumber(5)
  set documentId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDocumentId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDocumentId() => $_clearField(5);
}

/// Request to generate a download URL.
class GenerateDownloadURLRequest extends $pb.GeneratedMessage {
  factory GenerateDownloadURLRequest({
    $core.String? objectKey,
    $core.String? bucket,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    if (bucket != null) result.bucket = bucket;
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
    ..aOS(2, _omitFieldNames ? '' : 'bucket')
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

  /// Optional bucket. Empty defaults to the document bucket. Whitelisted:
  /// "workertrust-docs" (default) and "workertrust-certs" (M18 certificate PDFs,
  /// whose file_key comes from ledger.v1.Certificate). Any other value is rejected.
  @$pb.TagNumber(2)
  $core.String get bucket => $_getSZ(1);
  @$pb.TagNumber(2)
  set bucket($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBucket() => $_has(1);
  @$pb.TagNumber(2)
  void clearBucket() => $_clearField(2);
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
    $core.String? documentId,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (documentId != null) result.documentId = documentId;
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
    ..aOS(2, _omitFieldNames ? '' : 'documentId')
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

  /// Id of the document record for this upload — pass it as document_id to
  /// RPCs that link a document (e.g. QualificationService.SubmitQualification).
  @$pb.TagNumber(2)
  $core.String get documentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set documentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDocumentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDocumentId() => $_clearField(2);
}

/// Request to generate an inline display URL.
class DisplayDocumentRequest extends $pb.GeneratedMessage {
  factory DisplayDocumentRequest({
    $core.String? objectKey,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  DisplayDocumentRequest._();

  factory DisplayDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisplayDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisplayDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisplayDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisplayDocumentRequest copyWith(
          void Function(DisplayDocumentRequest) updates) =>
      super.copyWith((message) => updates(message as DisplayDocumentRequest))
          as DisplayDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisplayDocumentRequest create() => DisplayDocumentRequest._();
  @$core.override
  DisplayDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DisplayDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisplayDocumentRequest>(create);
  static DisplayDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);
}

/// Response containing inline display info.
class DisplayDocumentResponse extends $pb.GeneratedMessage {
  factory DisplayDocumentResponse({
    $core.String? displayUrl,
    $core.int? expiresIn,
    $core.String? contentType,
  }) {
    final result = create();
    if (displayUrl != null) result.displayUrl = displayUrl;
    if (expiresIn != null) result.expiresIn = expiresIn;
    if (contentType != null) result.contentType = contentType;
    return result;
  }

  DisplayDocumentResponse._();

  factory DisplayDocumentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DisplayDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DisplayDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'displayUrl')
    ..aI(2, _omitFieldNames ? '' : 'expiresIn')
    ..aOS(3, _omitFieldNames ? '' : 'contentType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisplayDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DisplayDocumentResponse copyWith(
          void Function(DisplayDocumentResponse) updates) =>
      super.copyWith((message) => updates(message as DisplayDocumentResponse))
          as DisplayDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DisplayDocumentResponse create() => DisplayDocumentResponse._();
  @$core.override
  DisplayDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DisplayDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DisplayDocumentResponse>(create);
  static DisplayDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get displayUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set displayUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDisplayUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisplayUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get expiresIn => $_getIZ(1);
  @$pb.TagNumber(2)
  set expiresIn($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExpiresIn() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresIn() => $_clearField(2);

  /// What the file is, e.g. "application/pdf" or "image/jpeg". Taken from the
  /// key's allow-listed extension (the stored header is client-supplied), else
  /// from the stored object; never empty.
  @$pb.TagNumber(3)
  $core.String get contentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set contentType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentType() => $_clearField(3);
}

/// Request to delete a document.
class DeleteDocumentRequest extends $pb.GeneratedMessage {
  factory DeleteDocumentRequest({
    $core.String? objectKey,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    return result;
  }

  DeleteDocumentRequest._();

  factory DeleteDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDocumentRequest copyWith(
          void Function(DeleteDocumentRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteDocumentRequest))
          as DeleteDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDocumentRequest create() => DeleteDocumentRequest._();
  @$core.override
  DeleteDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDocumentRequest>(create);
  static DeleteDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);
}

/// Response confirming deletion.
class DeleteDocumentResponse extends $pb.GeneratedMessage {
  factory DeleteDocumentResponse({
    $core.String? status,
  }) {
    final result = create();
    if (status != null) result.status = status;
    return result;
  }

  DeleteDocumentResponse._();

  factory DeleteDocumentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteDocumentResponse copyWith(
          void Function(DeleteDocumentResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteDocumentResponse))
          as DeleteDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteDocumentResponse create() => DeleteDocumentResponse._();
  @$core.override
  DeleteDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeleteDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteDocumentResponse>(create);
  static DeleteDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
}

class ListExpiringDocumentsRequest extends $pb.GeneratedMessage {
  factory ListExpiringDocumentsRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListExpiringDocumentsRequest._();

  factory ListExpiringDocumentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListExpiringDocumentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListExpiringDocumentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListExpiringDocumentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListExpiringDocumentsRequest copyWith(
          void Function(ListExpiringDocumentsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListExpiringDocumentsRequest))
          as ListExpiringDocumentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListExpiringDocumentsRequest create() =>
      ListExpiringDocumentsRequest._();
  @$core.override
  ListExpiringDocumentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListExpiringDocumentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListExpiringDocumentsRequest>(create);
  static ListExpiringDocumentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class ExpiringDocument extends $pb.GeneratedMessage {
  factory ExpiringDocument({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? docType,
    $core.String? storedPath,
    $core.String? expiryDate,
    $core.bool? isExpired,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (docType != null) result.docType = docType;
    if (storedPath != null) result.storedPath = storedPath;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (isExpired != null) result.isExpired = isExpired;
    return result;
  }

  ExpiringDocument._();

  factory ExpiringDocument.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExpiringDocument.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExpiringDocument',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'docType')
    ..aOS(5, _omitFieldNames ? '' : 'storedPath')
    ..aOS(6, _omitFieldNames ? '' : 'expiryDate')
    ..aOB(7, _omitFieldNames ? '' : 'isExpired')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExpiringDocument clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExpiringDocument copyWith(void Function(ExpiringDocument) updates) =>
      super.copyWith((message) => updates(message as ExpiringDocument))
          as ExpiringDocument;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExpiringDocument create() => ExpiringDocument._();
  @$core.override
  ExpiringDocument createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExpiringDocument getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExpiringDocument>(create);
  static ExpiringDocument? _defaultInstance;

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
  $core.String get docType => $_getSZ(3);
  @$pb.TagNumber(4)
  set docType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDocType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDocType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get storedPath => $_getSZ(4);
  @$pb.TagNumber(5)
  set storedPath($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStoredPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearStoredPath() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get expiryDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set expiryDate($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiryDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiryDate() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get isExpired => $_getBF(6);
  @$pb.TagNumber(7)
  set isExpired($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIsExpired() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsExpired() => $_clearField(7);
}

class ListExpiringDocumentsResponse extends $pb.GeneratedMessage {
  factory ListExpiringDocumentsResponse({
    $core.Iterable<ExpiringDocument>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListExpiringDocumentsResponse._();

  factory ListExpiringDocumentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListExpiringDocumentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListExpiringDocumentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..pPM<ExpiringDocument>(1, _omitFieldNames ? '' : 'items',
        subBuilder: ExpiringDocument.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListExpiringDocumentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListExpiringDocumentsResponse copyWith(
          void Function(ListExpiringDocumentsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListExpiringDocumentsResponse))
          as ListExpiringDocumentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListExpiringDocumentsResponse create() =>
      ListExpiringDocumentsResponse._();
  @$core.override
  ListExpiringDocumentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListExpiringDocumentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListExpiringDocumentsResponse>(create);
  static ListExpiringDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ExpiringDocument> get items => $_getList(0);
}

class ListDocumentReviewQueueRequest extends $pb.GeneratedMessage {
  factory ListDocumentReviewQueueRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListDocumentReviewQueueRequest._();

  factory ListDocumentReviewQueueRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDocumentReviewQueueRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDocumentReviewQueueRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentReviewQueueRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentReviewQueueRequest copyWith(
          void Function(ListDocumentReviewQueueRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListDocumentReviewQueueRequest))
          as ListDocumentReviewQueueRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDocumentReviewQueueRequest create() =>
      ListDocumentReviewQueueRequest._();
  @$core.override
  ListDocumentReviewQueueRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDocumentReviewQueueRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDocumentReviewQueueRequest>(create);
  static ListDocumentReviewQueueRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class DocumentReviewItem extends $pb.GeneratedMessage {
  factory DocumentReviewItem({
    $core.String? id,
    $core.String? workerId,
    $core.String? tenantId,
    $core.String? docType,
    $core.String? storedPath,
    $core.String? status,
    $core.String? uploadedAt,
    $core.String? expectedType,
    $core.Iterable<$core.String>? reviewReasons,
    $core.String? m4Verdict,
    $core.String? faceBand,
    $core.String? nameBand,
    $core.String? backDocumentId,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (tenantId != null) result.tenantId = tenantId;
    if (docType != null) result.docType = docType;
    if (storedPath != null) result.storedPath = storedPath;
    if (status != null) result.status = status;
    if (uploadedAt != null) result.uploadedAt = uploadedAt;
    if (expectedType != null) result.expectedType = expectedType;
    if (reviewReasons != null) result.reviewReasons.addAll(reviewReasons);
    if (m4Verdict != null) result.m4Verdict = m4Verdict;
    if (faceBand != null) result.faceBand = faceBand;
    if (nameBand != null) result.nameBand = nameBand;
    if (backDocumentId != null) result.backDocumentId = backDocumentId;
    return result;
  }

  DocumentReviewItem._();

  factory DocumentReviewItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DocumentReviewItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DocumentReviewItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'tenantId')
    ..aOS(4, _omitFieldNames ? '' : 'docType')
    ..aOS(5, _omitFieldNames ? '' : 'storedPath')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOS(7, _omitFieldNames ? '' : 'uploadedAt')
    ..aOS(8, _omitFieldNames ? '' : 'expectedType')
    ..pPS(9, _omitFieldNames ? '' : 'reviewReasons')
    ..aOS(10, _omitFieldNames ? '' : 'm4Verdict')
    ..aOS(11, _omitFieldNames ? '' : 'faceBand')
    ..aOS(12, _omitFieldNames ? '' : 'nameBand')
    ..aOS(13, _omitFieldNames ? '' : 'backDocumentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DocumentReviewItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DocumentReviewItem copyWith(void Function(DocumentReviewItem) updates) =>
      super.copyWith((message) => updates(message as DocumentReviewItem))
          as DocumentReviewItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DocumentReviewItem create() => DocumentReviewItem._();
  @$core.override
  DocumentReviewItem createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DocumentReviewItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DocumentReviewItem>(create);
  static DocumentReviewItem? _defaultInstance;

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
  $core.String get docType => $_getSZ(3);
  @$pb.TagNumber(4)
  set docType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDocType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDocType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get storedPath => $_getSZ(4);
  @$pb.TagNumber(5)
  set storedPath($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStoredPath() => $_has(4);
  @$pb.TagNumber(5)
  void clearStoredPath() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get uploadedAt => $_getSZ(6);
  @$pb.TagNumber(7)
  set uploadedAt($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUploadedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUploadedAt() => $_clearField(7);

  /// Why the upload check sent it to review, from the newest accepted check.
  /// Empty for a document from before the upload check.
  @$pb.TagNumber(8)
  $core.String get expectedType => $_getSZ(7);
  @$pb.TagNumber(8)
  set expectedType($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasExpectedType() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpectedType() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get reviewReasons => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get m4Verdict => $_getSZ(9);
  @$pb.TagNumber(10)
  set m4Verdict($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasM4Verdict() => $_has(9);
  @$pb.TagNumber(10)
  void clearM4Verdict() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get faceBand => $_getSZ(10);
  @$pb.TagNumber(11)
  set faceBand($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasFaceBand() => $_has(10);
  @$pb.TagNumber(11)
  void clearFaceBand() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get nameBand => $_getSZ(11);
  @$pb.TagNumber(12)
  set nameBand($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNameBand() => $_has(11);
  @$pb.TagNumber(12)
  void clearNameBand() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get backDocumentId => $_getSZ(12);
  @$pb.TagNumber(13)
  set backDocumentId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasBackDocumentId() => $_has(12);
  @$pb.TagNumber(13)
  void clearBackDocumentId() => $_clearField(13);
}

class ListDocumentReviewQueueResponse extends $pb.GeneratedMessage {
  factory ListDocumentReviewQueueResponse({
    $core.Iterable<DocumentReviewItem>? items,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    return result;
  }

  ListDocumentReviewQueueResponse._();

  factory ListDocumentReviewQueueResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDocumentReviewQueueResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDocumentReviewQueueResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..pPM<DocumentReviewItem>(1, _omitFieldNames ? '' : 'items',
        subBuilder: DocumentReviewItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentReviewQueueResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentReviewQueueResponse copyWith(
          void Function(ListDocumentReviewQueueResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDocumentReviewQueueResponse))
          as ListDocumentReviewQueueResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDocumentReviewQueueResponse create() =>
      ListDocumentReviewQueueResponse._();
  @$core.override
  ListDocumentReviewQueueResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDocumentReviewQueueResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDocumentReviewQueueResponse>(
          create);
  static ListDocumentReviewQueueResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DocumentReviewItem> get items => $_getList(0);
}

class ListDocumentsByTenantRequest extends $pb.GeneratedMessage {
  factory ListDocumentsByTenantRequest({
    $core.String? tenantId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    return result;
  }

  ListDocumentsByTenantRequest._();

  factory ListDocumentsByTenantRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDocumentsByTenantRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDocumentsByTenantRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentsByTenantRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentsByTenantRequest copyWith(
          void Function(ListDocumentsByTenantRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListDocumentsByTenantRequest))
          as ListDocumentsByTenantRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDocumentsByTenantRequest create() =>
      ListDocumentsByTenantRequest._();
  @$core.override
  ListDocumentsByTenantRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDocumentsByTenantRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDocumentsByTenantRequest>(create);
  static ListDocumentsByTenantRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tenantId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tenantId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTenantId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTenantId() => $_clearField(1);
}

class TenantDocument extends $pb.GeneratedMessage {
  factory TenantDocument({
    $core.String? id,
    $core.String? workerId,
    $core.String? docType,
    $core.String? documentNumber,
    $core.String? expiryDate,
    $core.double? confidenceScore,
    $core.String? storedPath,
    $core.String? status,
    $core.String? dateOfBirth,
    $core.String? reviewMessage,
    $core.String? rejectCategory,
    $core.String? uploadedAt,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (workerId != null) result.workerId = workerId;
    if (docType != null) result.docType = docType;
    if (documentNumber != null) result.documentNumber = documentNumber;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (confidenceScore != null) result.confidenceScore = confidenceScore;
    if (storedPath != null) result.storedPath = storedPath;
    if (status != null) result.status = status;
    if (dateOfBirth != null) result.dateOfBirth = dateOfBirth;
    if (reviewMessage != null) result.reviewMessage = reviewMessage;
    if (rejectCategory != null) result.rejectCategory = rejectCategory;
    if (uploadedAt != null) result.uploadedAt = uploadedAt;
    return result;
  }

  TenantDocument._();

  factory TenantDocument.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TenantDocument.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TenantDocument',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'docType')
    ..aOS(4, _omitFieldNames ? '' : 'documentNumber')
    ..aOS(5, _omitFieldNames ? '' : 'expiryDate')
    ..aD(6, _omitFieldNames ? '' : 'confidenceScore')
    ..aOS(7, _omitFieldNames ? '' : 'storedPath')
    ..aOS(8, _omitFieldNames ? '' : 'status')
    ..aOS(9, _omitFieldNames ? '' : 'dateOfBirth')
    ..aOS(10, _omitFieldNames ? '' : 'reviewMessage')
    ..aOS(11, _omitFieldNames ? '' : 'rejectCategory')
    ..aOS(12, _omitFieldNames ? '' : 'uploadedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TenantDocument clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TenantDocument copyWith(void Function(TenantDocument) updates) =>
      super.copyWith((message) => updates(message as TenantDocument))
          as TenantDocument;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TenantDocument create() => TenantDocument._();
  @$core.override
  TenantDocument createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TenantDocument getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TenantDocument>(create);
  static TenantDocument? _defaultInstance;

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
  $core.String get docType => $_getSZ(2);
  @$pb.TagNumber(3)
  set docType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get documentNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set documentNumber($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasDocumentNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearDocumentNumber() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get expiryDate => $_getSZ(4);
  @$pb.TagNumber(5)
  set expiryDate($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasExpiryDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpiryDate() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get confidenceScore => $_getN(5);
  @$pb.TagNumber(6)
  set confidenceScore($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasConfidenceScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearConfidenceScore() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get storedPath => $_getSZ(6);
  @$pb.TagNumber(7)
  set storedPath($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasStoredPath() => $_has(6);
  @$pb.TagNumber(7)
  void clearStoredPath() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  /// Date of birth read from the document's MRZ (YYYY-MM-DD); "" when none was
  /// extracted. Omitted for subcontractor-scoped callers.
  @$pb.TagNumber(9)
  $core.String get dateOfBirth => $_getSZ(8);
  @$pb.TagNumber(9)
  set dateOfBirth($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasDateOfBirth() => $_has(8);
  @$pb.TagNumber(9)
  void clearDateOfBirth() => $_clearField(9);

  /// What HR told the worker about this document: the re-upload instructions
  /// of a REUPLOAD_REQUESTED document, or the fixed sentence of an HR
  /// rejection's category. "" otherwise (an ML rejection carries none).
  @$pb.TagNumber(10)
  $core.String get reviewMessage => $_getSZ(9);
  @$pb.TagNumber(10)
  set reviewMessage($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasReviewMessage() => $_has(9);
  @$pb.TagNumber(10)
  void clearReviewMessage() => $_clearField(10);

  /// HR rejection category (ALTERED | NOT_YOURS | EXPIRED | WRONG_DOCUMENT |
  /// OTHER), for translating review_message. "" unless HR rejected it.
  @$pb.TagNumber(11)
  $core.String get rejectCategory => $_getSZ(10);
  @$pb.TagNumber(11)
  set rejectCategory($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRejectCategory() => $_has(10);
  @$pb.TagNumber(11)
  void clearRejectCategory() => $_clearField(11);

  /// When the file was uploaded (documents.uploaded_at), RFC 3339 UTC, e.g.
  /// "2026-10-03T09:30:00Z". "" when unknown.
  @$pb.TagNumber(12)
  $core.String get uploadedAt => $_getSZ(11);
  @$pb.TagNumber(12)
  set uploadedAt($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasUploadedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearUploadedAt() => $_clearField(12);
}

class ListDocumentsByTenantResponse extends $pb.GeneratedMessage {
  factory ListDocumentsByTenantResponse({
    $core.Iterable<TenantDocument>? documents,
  }) {
    final result = create();
    if (documents != null) result.documents.addAll(documents);
    return result;
  }

  ListDocumentsByTenantResponse._();

  factory ListDocumentsByTenantResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListDocumentsByTenantResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListDocumentsByTenantResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..pPM<TenantDocument>(1, _omitFieldNames ? '' : 'documents',
        subBuilder: TenantDocument.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentsByTenantResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListDocumentsByTenantResponse copyWith(
          void Function(ListDocumentsByTenantResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListDocumentsByTenantResponse))
          as ListDocumentsByTenantResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListDocumentsByTenantResponse create() =>
      ListDocumentsByTenantResponse._();
  @$core.override
  ListDocumentsByTenantResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListDocumentsByTenantResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListDocumentsByTenantResponse>(create);
  static ListDocumentsByTenantResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TenantDocument> get documents => $_getList(0);
}

class ListWorkerDocumentsRequest extends $pb.GeneratedMessage {
  factory ListWorkerDocumentsRequest({
    $core.String? tenantId,
    $core.String? workerId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  ListWorkerDocumentsRequest._();

  factory ListWorkerDocumentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListWorkerDocumentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListWorkerDocumentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWorkerDocumentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWorkerDocumentsRequest copyWith(
          void Function(ListWorkerDocumentsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ListWorkerDocumentsRequest))
          as ListWorkerDocumentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListWorkerDocumentsRequest create() => ListWorkerDocumentsRequest._();
  @$core.override
  ListWorkerDocumentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListWorkerDocumentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListWorkerDocumentsRequest>(create);
  static ListWorkerDocumentsRequest? _defaultInstance;

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

class ListWorkerDocumentsResponse extends $pb.GeneratedMessage {
  factory ListWorkerDocumentsResponse({
    $core.Iterable<TenantDocument>? documents,
  }) {
    final result = create();
    if (documents != null) result.documents.addAll(documents);
    return result;
  }

  ListWorkerDocumentsResponse._();

  factory ListWorkerDocumentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListWorkerDocumentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListWorkerDocumentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..pPM<TenantDocument>(1, _omitFieldNames ? '' : 'documents',
        subBuilder: TenantDocument.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWorkerDocumentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListWorkerDocumentsResponse copyWith(
          void Function(ListWorkerDocumentsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListWorkerDocumentsResponse))
          as ListWorkerDocumentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListWorkerDocumentsResponse create() =>
      ListWorkerDocumentsResponse._();
  @$core.override
  ListWorkerDocumentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListWorkerDocumentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListWorkerDocumentsResponse>(create);
  static ListWorkerDocumentsResponse? _defaultInstance;

  /// Worker-facing: doc_type/status/expiry_date/uploaded_at populated. A WORKER
  /// caller also gets stored_path (the object key DisplayDocument takes, always
  /// one of their own); document_number is never sent to a worker.
  @$pb.TagNumber(1)
  $pb.PbList<TenantDocument> get documents => $_getList(0);
}

/// Request to check an uploaded document against its upload button.
class VerifyDocumentUploadRequest extends $pb.GeneratedMessage {
  factory VerifyDocumentUploadRequest({
    $core.String? objectKey,
    $core.String? backObjectKey,
    $core.String? expectedType,
    $core.List<$core.int>? selfie,
  }) {
    final result = create();
    if (objectKey != null) result.objectKey = objectKey;
    if (backObjectKey != null) result.backObjectKey = backObjectKey;
    if (expectedType != null) result.expectedType = expectedType;
    if (selfie != null) result.selfie = selfie;
    return result;
  }

  VerifyDocumentUploadRequest._();

  factory VerifyDocumentUploadRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyDocumentUploadRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyDocumentUploadRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'objectKey')
    ..aOS(2, _omitFieldNames ? '' : 'backObjectKey')
    ..aOS(3, _omitFieldNames ? '' : 'expectedType')
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'selfie', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyDocumentUploadRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyDocumentUploadRequest copyWith(
          void Function(VerifyDocumentUploadRequest) updates) =>
      super.copyWith(
              (message) => updates(message as VerifyDocumentUploadRequest))
          as VerifyDocumentUploadRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyDocumentUploadRequest create() =>
      VerifyDocumentUploadRequest._();
  @$core.override
  VerifyDocumentUploadRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VerifyDocumentUploadRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyDocumentUploadRequest>(create);
  static VerifyDocumentUploadRequest? _defaultInstance;

  /// object_key returned by GenerateUploadURL for the uploaded file (the front
  /// side for national_id / driving_licence).
  @$pb.TagNumber(1)
  $core.String get objectKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set objectKey($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasObjectKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearObjectKey() => $_clearField(1);

  /// Back side of a national_id / driving_licence (its own GenerateUploadURL
  /// upload). Optional, but without it most ID cards cannot be read. Must be
  /// empty for every other expected_type.
  @$pb.TagNumber(2)
  $core.String get backObjectKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set backObjectKey($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBackObjectKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearBackObjectKey() => $_clearField(2);

  /// The upload button: passport | national_id | driving_licence |
  /// work_permit | visa | cv | diploma | certificate. Diploma and certificate
  /// are accepted on either button. passport / national_id / driving_licence
  /// take JPEG or PNG photos; the others also PDF and Word (.docx).
  @$pb.TagNumber(3)
  $core.String get expectedType => $_getSZ(2);
  @$pb.TagNumber(3)
  set expectedType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpectedType() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpectedType() => $_clearField(3);

  /// The user's selfie (JPEG/PNG, max 5 MB). Optional: when sent and the
  /// document carries a face, the two are compared for HR review.
  @$pb.TagNumber(4)
  $core.List<$core.int> get selfie => $_getN(3);
  @$pb.TagNumber(4)
  set selfie($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSelfie() => $_has(3);
  @$pb.TagNumber(4)
  void clearSelfie() => $_clearField(4);
}

/// Result of an upload check. Only what the user needs: review flags, the
/// face match and the extracted data stay server-side.
class VerifyDocumentUploadResponse extends $pb.GeneratedMessage {
  factory VerifyDocumentUploadResponse({
    $core.bool? accepted,
    $core.String? status,
    $core.String? reason,
    $core.String? expectedType,
    $core.String? detectedType,
    $core.String? message,
    $core.String? documentId,
  }) {
    final result = create();
    if (accepted != null) result.accepted = accepted;
    if (status != null) result.status = status;
    if (reason != null) result.reason = reason;
    if (expectedType != null) result.expectedType = expectedType;
    if (detectedType != null) result.detectedType = detectedType;
    if (message != null) result.message = message;
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  VerifyDocumentUploadResponse._();

  factory VerifyDocumentUploadResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VerifyDocumentUploadResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VerifyDocumentUploadResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'accepted')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..aOS(4, _omitFieldNames ? '' : 'expectedType')
    ..aOS(5, _omitFieldNames ? '' : 'detectedType')
    ..aOS(6, _omitFieldNames ? '' : 'message')
    ..aOS(7, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyDocumentUploadResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VerifyDocumentUploadResponse copyWith(
          void Function(VerifyDocumentUploadResponse) updates) =>
      super.copyWith(
              (message) => updates(message as VerifyDocumentUploadResponse))
          as VerifyDocumentUploadResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VerifyDocumentUploadResponse create() =>
      VerifyDocumentUploadResponse._();
  @$core.override
  VerifyDocumentUploadResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VerifyDocumentUploadResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VerifyDocumentUploadResponse>(create);
  static VerifyDocumentUploadResponse? _defaultInstance;

  /// true = the right document, continue. false = upload the right document.
  @$pb.TagNumber(1)
  $core.bool get accepted => $_getBF(0);
  @$pb.TagNumber(1)
  set accepted($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAccepted() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccepted() => $_clearField(1);

  /// match | wrong_type | unreadable
  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// recognised | other_type_detected | mrz_not_found | not_recognised
  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);

  /// The expected_type that was checked.
  @$pb.TagNumber(4)
  $core.String get expectedType => $_getSZ(3);
  @$pb.TagNumber(4)
  set expectedType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasExpectedType() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpectedType() => $_clearField(4);

  /// What the file looks like (an expected_type value); "" when unreadable.
  @$pb.TagNumber(5)
  $core.String get detectedType => $_getSZ(4);
  @$pb.TagNumber(5)
  set detectedType($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDetectedType() => $_has(4);
  @$pb.TagNumber(5)
  void clearDetectedType() => $_clearField(5);

  /// Ready-to-show English, "" when accepted. To translate, key off
  /// status + reason and put expected_type / detected_type in the sentence.
  @$pb.TagNumber(6)
  $core.String get message => $_getSZ(5);
  @$pb.TagNumber(6)
  set message($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessage() => $_clearField(6);

  /// Id of the document record of object_key.
  @$pb.TagNumber(7)
  $core.String get documentId => $_getSZ(6);
  @$pb.TagNumber(7)
  set documentId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasDocumentId() => $_has(6);
  @$pb.TagNumber(7)
  void clearDocumentId() => $_clearField(7);
}

class GetDocumentExtractionRequest extends $pb.GeneratedMessage {
  factory GetDocumentExtractionRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? storedPath,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (storedPath != null) result.storedPath = storedPath;
    return result;
  }

  GetDocumentExtractionRequest._();

  factory GetDocumentExtractionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDocumentExtractionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDocumentExtractionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'storedPath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentExtractionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentExtractionRequest copyWith(
          void Function(GetDocumentExtractionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetDocumentExtractionRequest))
          as GetDocumentExtractionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDocumentExtractionRequest create() =>
      GetDocumentExtractionRequest._();
  @$core.override
  GetDocumentExtractionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDocumentExtractionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDocumentExtractionRequest>(create);
  static GetDocumentExtractionRequest? _defaultInstance;

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

  /// object_key of the document ({tenant}/{worker}/{name}.{ext}).
  @$pb.TagNumber(3)
  $core.String get storedPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set storedPath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoredPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoredPath() => $_clearField(3);
}

class GetDocumentExtractionResponse extends $pb.GeneratedMessage {
  factory GetDocumentExtractionResponse({
    $core.String? documentId,
    $core.String? extractionJson,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (extractionJson != null) result.extractionJson = extractionJson;
    return result;
  }

  GetDocumentExtractionResponse._();

  factory GetDocumentExtractionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDocumentExtractionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDocumentExtractionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'extractionJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentExtractionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentExtractionResponse copyWith(
          void Function(GetDocumentExtractionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetDocumentExtractionResponse))
          as GetDocumentExtractionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDocumentExtractionResponse create() =>
      GetDocumentExtractionResponse._();
  @$core.override
  GetDocumentExtractionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDocumentExtractionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDocumentExtractionResponse>(create);
  static GetDocumentExtractionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  /// The M7 extraction object as the ML gateway returned it (base64 fields
  /// stripped): text, fields, experience, education, sections, name_check.
  /// Decode with pkg/mlgateway.M7Extraction.
  @$pb.TagNumber(2)
  $core.String get extractionJson => $_getSZ(1);
  @$pb.TagNumber(2)
  set extractionJson($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExtractionJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearExtractionJson() => $_clearField(2);
}

class ReviewDocumentRequest extends $pb.GeneratedMessage {
  factory ReviewDocumentRequest({
    $core.String? documentId,
    $core.String? decision,
    $core.String? reason,
    $core.String? workerMessage,
    $core.String? rejectCategory,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (decision != null) result.decision = decision;
    if (reason != null) result.reason = reason;
    if (workerMessage != null) result.workerMessage = workerMessage;
    if (rejectCategory != null) result.rejectCategory = rejectCategory;
    return result;
  }

  ReviewDocumentRequest._();

  factory ReviewDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReviewDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReviewDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'decision')
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..aOS(4, _omitFieldNames ? '' : 'workerMessage')
    ..aOS(5, _omitFieldNames ? '' : 'rejectCategory')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReviewDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReviewDocumentRequest copyWith(
          void Function(ReviewDocumentRequest) updates) =>
      super.copyWith((message) => updates(message as ReviewDocumentRequest))
          as ReviewDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReviewDocumentRequest create() => ReviewDocumentRequest._();
  @$core.override
  ReviewDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReviewDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReviewDocumentRequest>(create);
  static ReviewDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  /// ACCEPT | REUPLOAD | REJECT
  @$pb.TagNumber(2)
  $core.String get decision => $_getSZ(1);
  @$pb.TagNumber(2)
  set decision($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDecision() => $_has(1);
  @$pb.TagNumber(2)
  void clearDecision() => $_clearField(2);

  /// Staff note for the audit trail, never shown to the worker (max 2000).
  /// Required for REJECT and for ACCEPT of a REJECTED document.
  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);

  /// REUPLOAD only, required (max 500): what the worker must fix, shown to them.
  @$pb.TagNumber(4)
  $core.String get workerMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set workerMessage($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWorkerMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearWorkerMessage() => $_clearField(4);

  /// REJECT only, required: ALTERED | NOT_YOURS | EXPIRED | WRONG_DOCUMENT | OTHER.
  /// The worker sees the category's fixed sentence, never the staff reason.
  @$pb.TagNumber(5)
  $core.String get rejectCategory => $_getSZ(4);
  @$pb.TagNumber(5)
  set rejectCategory($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRejectCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearRejectCategory() => $_clearField(5);
}

class ReviewDocumentResponse extends $pb.GeneratedMessage {
  factory ReviewDocumentResponse({
    $core.String? documentId,
    $core.String? status,
    $core.String? reviewedAt,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (status != null) result.status = status;
    if (reviewedAt != null) result.reviewedAt = reviewedAt;
    return result;
  }

  ReviewDocumentResponse._();

  factory ReviewDocumentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReviewDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReviewDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..aOS(3, _omitFieldNames ? '' : 'reviewedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReviewDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReviewDocumentResponse copyWith(
          void Function(ReviewDocumentResponse) updates) =>
      super.copyWith((message) => updates(message as ReviewDocumentResponse))
          as ReviewDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReviewDocumentResponse create() => ReviewDocumentResponse._();
  @$core.override
  ReviewDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReviewDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReviewDocumentResponse>(create);
  static ReviewDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  /// Status after the decision: VERIFIED | REUPLOAD_REQUESTED | REJECTED.
  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// RFC 3339 time of the decision (of the earlier one when it was repeated).
  @$pb.TagNumber(3)
  $core.String get reviewedAt => $_getSZ(2);
  @$pb.TagNumber(3)
  set reviewedAt($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReviewedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearReviewedAt() => $_clearField(3);
}

class GetDocumentIdentityFieldsRequest extends $pb.GeneratedMessage {
  factory GetDocumentIdentityFieldsRequest({
    $core.String? tenantId,
    $core.String? workerId,
    $core.String? documentId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  GetDocumentIdentityFieldsRequest._();

  factory GetDocumentIdentityFieldsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDocumentIdentityFieldsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDocumentIdentityFieldsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..aOS(3, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentIdentityFieldsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentIdentityFieldsRequest copyWith(
          void Function(GetDocumentIdentityFieldsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetDocumentIdentityFieldsRequest))
          as GetDocumentIdentityFieldsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDocumentIdentityFieldsRequest create() =>
      GetDocumentIdentityFieldsRequest._();
  @$core.override
  GetDocumentIdentityFieldsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDocumentIdentityFieldsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDocumentIdentityFieldsRequest>(
          create);
  static GetDocumentIdentityFieldsRequest? _defaultInstance;

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

  /// Id of the identity document (from GenerateUploadURL / VerifyDocumentUpload).
  @$pb.TagNumber(3)
  $core.String get documentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentId() => $_clearField(3);
}

class GetDocumentIdentityFieldsResponse extends $pb.GeneratedMessage {
  factory GetDocumentIdentityFieldsResponse({
    $core.String? documentId,
    $core.String? checkId,
    $core.String? identityJson,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (checkId != null) result.checkId = checkId;
    if (identityJson != null) result.identityJson = identityJson;
    return result;
  }

  GetDocumentIdentityFieldsResponse._();

  factory GetDocumentIdentityFieldsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetDocumentIdentityFieldsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetDocumentIdentityFieldsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'checkId')
    ..aOS(3, _omitFieldNames ? '' : 'identityJson')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentIdentityFieldsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetDocumentIdentityFieldsResponse copyWith(
          void Function(GetDocumentIdentityFieldsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetDocumentIdentityFieldsResponse))
          as GetDocumentIdentityFieldsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetDocumentIdentityFieldsResponse create() =>
      GetDocumentIdentityFieldsResponse._();
  @$core.override
  GetDocumentIdentityFieldsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetDocumentIdentityFieldsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetDocumentIdentityFieldsResponse>(
          create);
  static GetDocumentIdentityFieldsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  /// Id of the upload check these fields were read by.
  @$pb.TagNumber(2)
  $core.String get checkId => $_getSZ(1);
  @$pb.TagNumber(2)
  set checkId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCheckId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCheckId() => $_clearField(2);

  /// The ML gateway's identity object as received: doc_type, source, verified
  /// (always false), sides_read, unread_sides, missing, checks, name_check and
  /// fields{value, side, confidence, source}. Values can be Arabic.
  /// Decode with pkg/mlgateway.IdentityBlock.
  @$pb.TagNumber(3)
  $core.String get identityJson => $_getSZ(2);
  @$pb.TagNumber(3)
  set identityJson($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIdentityJson() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdentityJson() => $_clearField(3);
}

class GetIdentityPortraitRequest extends $pb.GeneratedMessage {
  factory GetIdentityPortraitRequest({
    $core.String? tenantId,
    $core.String? workerId,
  }) {
    final result = create();
    if (tenantId != null) result.tenantId = tenantId;
    if (workerId != null) result.workerId = workerId;
    return result;
  }

  GetIdentityPortraitRequest._();

  factory GetIdentityPortraitRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetIdentityPortraitRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetIdentityPortraitRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tenantId')
    ..aOS(2, _omitFieldNames ? '' : 'workerId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetIdentityPortraitRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetIdentityPortraitRequest copyWith(
          void Function(GetIdentityPortraitRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetIdentityPortraitRequest))
          as GetIdentityPortraitRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIdentityPortraitRequest create() => GetIdentityPortraitRequest._();
  @$core.override
  GetIdentityPortraitRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetIdentityPortraitRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetIdentityPortraitRequest>(create);
  static GetIdentityPortraitRequest? _defaultInstance;

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

class GetIdentityPortraitResponse extends $pb.GeneratedMessage {
  factory GetIdentityPortraitResponse({
    $core.List<$core.int>? portrait,
    $core.String? documentId,
  }) {
    final result = create();
    if (portrait != null) result.portrait = portrait;
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  GetIdentityPortraitResponse._();

  factory GetIdentityPortraitResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetIdentityPortraitResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetIdentityPortraitResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'document.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'portrait', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetIdentityPortraitResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetIdentityPortraitResponse copyWith(
          void Function(GetIdentityPortraitResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetIdentityPortraitResponse))
          as GetIdentityPortraitResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetIdentityPortraitResponse create() =>
      GetIdentityPortraitResponse._();
  @$core.override
  GetIdentityPortraitResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetIdentityPortraitResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetIdentityPortraitResponse>(create);
  static GetIdentityPortraitResponse? _defaultInstance;

  /// JPEG portrait cropped by M4 from the identity document.
  @$pb.TagNumber(1)
  $core.List<$core.int> get portrait => $_getN(0);
  @$pb.TagNumber(1)
  set portrait($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPortrait() => $_has(0);
  @$pb.TagNumber(1)
  void clearPortrait() => $_clearField(1);

  /// The identity document it was cropped from.
  @$pb.TagNumber(2)
  $core.String get documentId => $_getSZ(1);
  @$pb.TagNumber(2)
  set documentId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDocumentId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDocumentId() => $_clearField(2);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
