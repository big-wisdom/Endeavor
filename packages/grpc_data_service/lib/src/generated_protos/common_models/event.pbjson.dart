//
//  Generated code. Do not modify.
//  source: common_models/event.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use eventDescriptor instead')
const Event$json = {
  '1': 'Event',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'endeavorId', '3': 4, '4': 1, '5': 5, '10': 'endeavorId'},
    {'1': 'repeatingEventId', '3': 5, '4': 1, '5': 5, '10': 'repeatingEventId'},
    {'1': 'start_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    {'1': 'end_time', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCgJpZBgCIAEoBVICaWQSFAoFdGl0bG'
    'UYAyABKAlSBXRpdGxlEh4KCmVuZGVhdm9ySWQYBCABKAVSCmVuZGVhdm9ySWQSKgoQcmVwZWF0'
    'aW5nRXZlbnRJZBgFIAEoBVIQcmVwZWF0aW5nRXZlbnRJZBI5CgpzdGFydF90aW1lGAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnRUaW1lEjUKCGVuZF90aW1lGAcgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kVGltZQ==');

