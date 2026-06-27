// This is a generated file - do not edit.
//
// Generated from platform/v1/platform.proto.

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

@$core.Deprecated('Use syncUserRequestDescriptor instead')
const SyncUserRequest$json = {
  '1': 'SyncUserRequest',
};

/// Descriptor for `SyncUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncUserRequestDescriptor =
    $convert.base64Decode('Cg9TeW5jVXNlclJlcXVlc3Q=');

@$core.Deprecated('Use syncUserResponseDescriptor instead')
const SyncUserResponse$json = {
  '1': 'SyncUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'created', '3': 2, '4': 1, '5': 8, '10': 'created'},
  ],
};

/// Descriptor for `SyncUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncUserResponseDescriptor = $convert.base64Decode(
    'ChBTeW5jVXNlclJlc3BvbnNlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIYCgdjcmVhdGVkGA'
    'IgASgIUgdjcmVhdGVk');

@$core.Deprecated('Use getUserProfileRequestDescriptor instead')
const GetUserProfileRequest$json = {
  '1': 'GetUserProfileRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileRequestDescriptor =
    $convert.base64Decode(
        'ChVHZXRVc2VyUHJvZmlsZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use getUserProfileResponseDescriptor instead')
const GetUserProfileResponse$json = {
  '1': 'GetUserProfileResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'full_name', '3': 3, '4': 1, '5': 9, '10': 'fullName'},
    {'1': 'active', '3': 4, '4': 1, '5': 8, '10': 'active'},
  ],
};

/// Descriptor for `GetUserProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserProfileResponseDescriptor = $convert.base64Decode(
    'ChZHZXRVc2VyUHJvZmlsZVJlc3BvbnNlEhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIUCgVlbW'
    'FpbBgCIAEoCVIFZW1haWwSGwoJZnVsbF9uYW1lGAMgASgJUghmdWxsTmFtZRIWCgZhY3RpdmUY'
    'BCABKAhSBmFjdGl2ZQ==');
