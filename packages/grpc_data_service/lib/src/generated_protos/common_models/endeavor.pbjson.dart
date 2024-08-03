//
//  Generated code. Do not modify.
//  source: common_models/endeavor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use endeavorDescriptor instead')
const Endeavor$json = {
  '1': 'Endeavor',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'parentEndeavorId', '3': 4, '4': 1, '5': 5, '10': 'parentEndeavorId'},
    {'1': 'subEndeavorReferences', '3': 5, '4': 3, '5': 11, '6': '.common_models.EndeavorReference', '10': 'subEndeavorReferences'},
    {'1': 'task', '3': 6, '4': 3, '5': 11, '6': '.common_models.Task', '10': 'task'},
    {'1': 'color', '3': 7, '4': 1, '5': 5, '10': 'color'},
  ],
};

/// Descriptor for `Endeavor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List endeavorDescriptor = $convert.base64Decode(
    'CghFbmRlYXZvchIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCgJpZBgCIAEoBVICaWQSFAoFdG'
    'l0bGUYAyABKAlSBXRpdGxlEioKEHBhcmVudEVuZGVhdm9ySWQYBCABKAVSEHBhcmVudEVuZGVh'
    'dm9ySWQSVgoVc3ViRW5kZWF2b3JSZWZlcmVuY2VzGAUgAygLMiAuY29tbW9uX21vZGVscy5Fbm'
    'RlYXZvclJlZmVyZW5jZVIVc3ViRW5kZWF2b3JSZWZlcmVuY2VzEicKBHRhc2sYBiADKAsyEy5j'
    'b21tb25fbW9kZWxzLlRhc2tSBHRhc2sSFAoFY29sb3IYByABKAVSBWNvbG9y');

