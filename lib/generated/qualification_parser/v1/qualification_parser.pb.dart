// This is a generated file - do not edit.
//
// Generated from qualification_parser/v1/qualification_parser.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ParseQualificationRequest extends $pb.GeneratedMessage {
  factory ParseQualificationRequest({
    $core.String? storedPath,
    $core.String? bucketName,
  }) {
    final result = create();
    if (storedPath != null) result.storedPath = storedPath;
    if (bucketName != null) result.bucketName = bucketName;
    return result;
  }

  ParseQualificationRequest._();

  factory ParseQualificationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParseQualificationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParseQualificationRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'qualification_parser.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storedPath')
    ..aOS(2, _omitFieldNames ? '' : 'bucketName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseQualificationRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseQualificationRequest copyWith(
          void Function(ParseQualificationRequest) updates) =>
      super.copyWith((message) => updates(message as ParseQualificationRequest))
          as ParseQualificationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseQualificationRequest create() => ParseQualificationRequest._();
  @$core.override
  ParseQualificationRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParseQualificationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParseQualificationRequest>(create);
  static ParseQualificationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storedPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set storedPath($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoredPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoredPath() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get bucketName => $_getSZ(1);
  @$pb.TagNumber(2)
  set bucketName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBucketName() => $_has(1);
  @$pb.TagNumber(2)
  void clearBucketName() => $_clearField(2);
}

class ParseQualificationResponse extends $pb.GeneratedMessage {
  factory ParseQualificationResponse({
    $core.String? rawText,
    $core.bool? hasQrCode,
    $core.String? qrCodeContent,
    $core.bool? isDigitallySigned,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>?
        extractedMetadata,
    $core.String? status,
  }) {
    final result = create();
    if (rawText != null) result.rawText = rawText;
    if (hasQrCode != null) result.hasQrCode = hasQrCode;
    if (qrCodeContent != null) result.qrCodeContent = qrCodeContent;
    if (isDigitallySigned != null) result.isDigitallySigned = isDigitallySigned;
    if (extractedMetadata != null)
      result.extractedMetadata.addEntries(extractedMetadata);
    if (status != null) result.status = status;
    return result;
  }

  ParseQualificationResponse._();

  factory ParseQualificationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ParseQualificationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ParseQualificationResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'qualification_parser.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rawText')
    ..aOB(2, _omitFieldNames ? '' : 'hasQrCode')
    ..aOS(3, _omitFieldNames ? '' : 'qrCodeContent')
    ..aOB(4, _omitFieldNames ? '' : 'isDigitallySigned')
    ..m<$core.String, $core.String>(
        5, _omitFieldNames ? '' : 'extractedMetadata',
        entryClassName: 'ParseQualificationResponse.ExtractedMetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('qualification_parser.v1'))
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseQualificationResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ParseQualificationResponse copyWith(
          void Function(ParseQualificationResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ParseQualificationResponse))
          as ParseQualificationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ParseQualificationResponse create() => ParseQualificationResponse._();
  @$core.override
  ParseQualificationResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ParseQualificationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ParseQualificationResponse>(create);
  static ParseQualificationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rawText => $_getSZ(0);
  @$pb.TagNumber(1)
  set rawText($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRawText() => $_has(0);
  @$pb.TagNumber(1)
  void clearRawText() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get hasQrCode => $_getBF(1);
  @$pb.TagNumber(2)
  set hasQrCode($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasHasQrCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasQrCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get qrCodeContent => $_getSZ(2);
  @$pb.TagNumber(3)
  set qrCodeContent($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQrCodeContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearQrCodeContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isDigitallySigned => $_getBF(3);
  @$pb.TagNumber(4)
  set isDigitallySigned($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsDigitallySigned() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsDigitallySigned() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get extractedMetadata => $_getMap(4);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
