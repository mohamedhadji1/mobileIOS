// This is a generated file - do not edit.
//
// Generated from qualification_parser/v1/qualification_parser.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use parseQualificationRequestDescriptor instead')
const ParseQualificationRequest$json = {
  '1': 'ParseQualificationRequest',
  '2': [
    {'1': 'stored_path', '3': 1, '4': 1, '5': 9, '10': 'storedPath'},
    {'1': 'bucket_name', '3': 2, '4': 1, '5': 9, '10': 'bucketName'},
  ],
};

/// Descriptor for `ParseQualificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseQualificationRequestDescriptor =
    $convert.base64Decode(
        'ChlQYXJzZVF1YWxpZmljYXRpb25SZXF1ZXN0Eh8KC3N0b3JlZF9wYXRoGAEgASgJUgpzdG9yZW'
        'RQYXRoEh8KC2J1Y2tldF9uYW1lGAIgASgJUgpidWNrZXROYW1l');

@$core.Deprecated('Use parseQualificationResponseDescriptor instead')
const ParseQualificationResponse$json = {
  '1': 'ParseQualificationResponse',
  '2': [
    {'1': 'raw_text', '3': 1, '4': 1, '5': 9, '10': 'rawText'},
    {'1': 'has_qr_code', '3': 2, '4': 1, '5': 8, '10': 'hasQrCode'},
    {'1': 'qr_code_content', '3': 3, '4': 1, '5': 9, '10': 'qrCodeContent'},
    {
      '1': 'is_digitally_signed',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'isDigitallySigned'
    },
    {
      '1': 'extracted_metadata',
      '3': 5,
      '4': 3,
      '5': 11,
      '6':
          '.qualification_parser.v1.ParseQualificationResponse.ExtractedMetadataEntry',
      '10': 'extractedMetadata'
    },
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
  ],
  '3': [ParseQualificationResponse_ExtractedMetadataEntry$json],
};

@$core.Deprecated('Use parseQualificationResponseDescriptor instead')
const ParseQualificationResponse_ExtractedMetadataEntry$json = {
  '1': 'ExtractedMetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ParseQualificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List parseQualificationResponseDescriptor = $convert.base64Decode(
    'ChpQYXJzZVF1YWxpZmljYXRpb25SZXNwb25zZRIZCghyYXdfdGV4dBgBIAEoCVIHcmF3VGV4dB'
    'IeCgtoYXNfcXJfY29kZRgCIAEoCFIJaGFzUXJDb2RlEiYKD3FyX2NvZGVfY29udGVudBgDIAEo'
    'CVINcXJDb2RlQ29udGVudBIuChNpc19kaWdpdGFsbHlfc2lnbmVkGAQgASgIUhFpc0RpZ2l0YW'
    'xseVNpZ25lZBJ5ChJleHRyYWN0ZWRfbWV0YWRhdGEYBSADKAsySi5xdWFsaWZpY2F0aW9uX3Bh'
    'cnNlci52MS5QYXJzZVF1YWxpZmljYXRpb25SZXNwb25zZS5FeHRyYWN0ZWRNZXRhZGF0YUVudH'
    'J5UhFleHRyYWN0ZWRNZXRhZGF0YRIWCgZzdGF0dXMYBiABKAlSBnN0YXR1cxpEChZFeHRyYWN0'
    'ZWRNZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgASgJUgV2YWx1ZT'
    'oCOAE=');
