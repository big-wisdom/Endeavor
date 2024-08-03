//
//  Generated code. Do not modify.
//  source: common_models/task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use taskDescriptor instead')
const Task$json = {
  '1': 'Task',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'endeavorReference', '3': 3, '4': 1, '5': 11, '6': '.common_models.EndeavorReference', '10': 'endeavorReference'},
    {'1': 'events', '3': 4, '4': 3, '5': 11, '6': '.common_models.Event', '10': 'events'},
    {'1': 'duration', '3': 5, '4': 1, '5': 5, '10': 'duration'},
    {'1': 'minnimumSchedulingDuration', '3': 6, '4': 1, '5': 5, '10': 'minnimumSchedulingDuration'},
    {'1': 'dueDate', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dueDate'},
    {'1': 'divisible', '3': 8, '4': 1, '5': 8, '10': 'divisible'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode(
    'CgRUYXNrEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSTgoRZW5kZWF2b3'
    'JSZWZlcmVuY2UYAyABKAsyIC5jb21tb25fbW9kZWxzLkVuZGVhdm9yUmVmZXJlbmNlUhFlbmRl'
    'YXZvclJlZmVyZW5jZRIsCgZldmVudHMYBCADKAsyFC5jb21tb25fbW9kZWxzLkV2ZW50UgZldm'
    'VudHMSGgoIZHVyYXRpb24YBSABKAVSCGR1cmF0aW9uEj4KGm1pbm5pbXVtU2NoZWR1bGluZ0R1'
    'cmF0aW9uGAYgASgFUhptaW5uaW11bVNjaGVkdWxpbmdEdXJhdGlvbhI0CgdkdWVEYXRlGAcgAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZHVlRGF0ZRIcCglkaXZpc2libGUYCCAB'
    'KAhSCWRpdmlzaWJsZQ==');

