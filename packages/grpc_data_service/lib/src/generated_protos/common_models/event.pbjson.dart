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
    {'1': 'endeavorBlockId', '3': 4, '4': 1, '5': 5, '10': 'endeavorBlockId'},
    {'1': 'repeatingEventId', '3': 5, '4': 1, '5': 5, '10': 'repeatingEventId'},
    {'1': 'taskId', '3': 6, '4': 1, '5': 5, '10': 'taskId'},
    {'1': 'color', '3': 7, '4': 1, '5': 5, '10': 'color'},
    {'1': 'start_time', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    {'1': 'end_time', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCgJpZBgCIAEoBVICaWQSFAoFdGl0bG'
    'UYAyABKAlSBXRpdGxlEigKD2VuZGVhdm9yQmxvY2tJZBgEIAEoBVIPZW5kZWF2b3JCbG9ja0lk'
    'EioKEHJlcGVhdGluZ0V2ZW50SWQYBSABKAVSEHJlcGVhdGluZ0V2ZW50SWQSFgoGdGFza0lkGA'
    'YgASgFUgZ0YXNrSWQSFAoFY29sb3IYByABKAVSBWNvbG9yEjkKCnN0YXJ0X3RpbWUYCCABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglzdGFydFRpbWUSNQoIZW5kX3RpbWUYCSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdlbmRUaW1l');

