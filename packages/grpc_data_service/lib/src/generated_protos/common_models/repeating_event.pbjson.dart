//
//  Generated code. Do not modify.
//  source: common_models/repeating_event.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use repeatingEventDescriptor instead')
const RepeatingEvent$json = {
  '1': 'RepeatingEvent',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'endeavorId', '3': 4, '4': 1, '5': 5, '10': 'endeavorId'},
    {'1': 'startTime', '3': 5, '4': 1, '5': 11, '6': '.common_models.Time', '10': 'startTime'},
    {'1': 'endTime', '3': 6, '4': 1, '5': 11, '6': '.common_models.Time', '10': 'endTime'},
    {'1': 'startDate', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startDate'},
    {'1': 'endDate', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endDate'},
    {'1': 'm', '3': 9, '4': 1, '5': 8, '10': 'm'},
    {'1': 't', '3': 10, '4': 1, '5': 8, '10': 't'},
    {'1': 'w', '3': 11, '4': 1, '5': 8, '10': 'w'},
    {'1': 'th', '3': 12, '4': 1, '5': 8, '10': 'th'},
    {'1': 'f', '3': 13, '4': 1, '5': 8, '10': 'f'},
    {'1': 's', '3': 14, '4': 1, '5': 8, '10': 's'},
    {'1': 'su', '3': 15, '4': 1, '5': 8, '10': 'su'},
  ],
};

/// Descriptor for `RepeatingEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repeatingEventDescriptor = $convert.base64Decode(
    'Cg5SZXBlYXRpbmdFdmVudBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCgJpZBgCIAEoBVICaW'
    'QSFAoFdGl0bGUYAyABKAlSBXRpdGxlEh4KCmVuZGVhdm9ySWQYBCABKAVSCmVuZGVhdm9ySWQS'
    'MQoJc3RhcnRUaW1lGAUgASgLMhMuY29tbW9uX21vZGVscy5UaW1lUglzdGFydFRpbWUSLQoHZW'
    '5kVGltZRgGIAEoCzITLmNvbW1vbl9tb2RlbHMuVGltZVIHZW5kVGltZRI4CglzdGFydERhdGUY'
    'ByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglzdGFydERhdGUSNAoHZW5kRGF0ZR'
    'gIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2VuZERhdGUSDAoBbRgJIAEoCFIB'
    'bRIMCgF0GAogASgIUgF0EgwKAXcYCyABKAhSAXcSDgoCdGgYDCABKAhSAnRoEgwKAWYYDSABKA'
    'hSAWYSDAoBcxgOIAEoCFIBcxIOCgJzdRgPIAEoCFICc3U=');

@$core.Deprecated('Use timeDescriptor instead')
const Time$json = {
  '1': 'Time',
  '2': [
    {'1': 'hours', '3': 1, '4': 1, '5': 5, '10': 'hours'},
    {'1': 'minutes', '3': 2, '4': 1, '5': 5, '10': 'minutes'},
  ],
};

/// Descriptor for `Time`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeDescriptor = $convert.base64Decode(
    'CgRUaW1lEhQKBWhvdXJzGAEgASgFUgVob3VycxIYCgdtaW51dGVzGAIgASgFUgdtaW51dGVz');

