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

import 'package:protobuf/protobuf.dart' as $pb;

class DirectoryType extends $pb.ProtobufEnum {
  static const DirectoryType DIRECTORY_TYPE_UNSPECIFIED =
      DirectoryType._(0, _omitEnumNames ? '' : 'DIRECTORY_TYPE_UNSPECIFIED');
  static const DirectoryType DIRECTORY_TYPE_LDAP =
      DirectoryType._(1, _omitEnumNames ? '' : 'DIRECTORY_TYPE_LDAP');
  static const DirectoryType DIRECTORY_TYPE_AZURE_AD =
      DirectoryType._(2, _omitEnumNames ? '' : 'DIRECTORY_TYPE_AZURE_AD');

  static const $core.List<DirectoryType> values = <DirectoryType>[
    DIRECTORY_TYPE_UNSPECIFIED,
    DIRECTORY_TYPE_LDAP,
    DIRECTORY_TYPE_AZURE_AD,
  ];

  static final $core.List<DirectoryType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static DirectoryType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DirectoryType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
