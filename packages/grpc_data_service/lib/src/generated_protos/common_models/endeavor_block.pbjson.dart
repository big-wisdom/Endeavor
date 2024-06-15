//
//  Generated code. Do not modify.
//  source: common_models/endeavor_block.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use endeavorBlockDescriptor instead')
const EndeavorBlock$json = {
  '1': 'EndeavorBlock',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'event', '3': 2, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
    {'1': 'repeatingEndeavorBlockId', '3': 3, '4': 1, '5': 5, '10': 'repeatingEndeavorBlockId'},
    {'1': 'endeavorId', '3': 4, '4': 1, '5': 5, '10': 'endeavorId'},
  ],
};

/// Descriptor for `EndeavorBlock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endeavorBlockDescriptor = $convert.base64Decode(
    'Cg1FbmRlYXZvckJsb2NrEg4KAmlkGAEgASgJUgJpZBIqCgVldmVudBgCIAEoCzIULmNvbW1vbl'
    '9tb2RlbHMuRXZlbnRSBWV2ZW50EjoKGHJlcGVhdGluZ0VuZGVhdm9yQmxvY2tJZBgDIAEoBVIY'
    'cmVwZWF0aW5nRW5kZWF2b3JCbG9ja0lkEh4KCmVuZGVhdm9ySWQYBCABKAVSCmVuZGVhdm9ySW'
    'Q=');

