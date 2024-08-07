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
    {'1': 'isEndeavorBlock', '3': 4, '4': 1, '5': 8, '10': 'isEndeavorBlock'},
    {'1': 'endeavorId', '3': 5, '4': 1, '5': 5, '10': 'endeavorId'},
    {'1': 'startTime', '3': 6, '4': 1, '5': 11, '6': '.common_models.Time', '10': 'startTime'},
    {'1': 'endTime', '3': 7, '4': 1, '5': 11, '6': '.common_models.Time', '10': 'endTime'},
    {'1': 'startDate', '3': 8, '4': 1, '5': 11, '6': '.common_models.Date', '10': 'startDate'},
    {'1': 'endDate', '3': 9, '4': 1, '5': 11, '6': '.common_models.Date', '10': 'endDate'},
    {'1': 'hoursOffset', '3': 10, '4': 1, '5': 5, '10': 'hoursOffset'},
    {'1': 'm', '3': 11, '4': 1, '5': 8, '10': 'm'},
    {'1': 't', '3': 12, '4': 1, '5': 8, '10': 't'},
    {'1': 'w', '3': 13, '4': 1, '5': 8, '10': 'w'},
    {'1': 'th', '3': 14, '4': 1, '5': 8, '10': 'th'},
    {'1': 'f', '3': 15, '4': 1, '5': 8, '10': 'f'},
    {'1': 's', '3': 16, '4': 1, '5': 8, '10': 's'},
    {'1': 'su', '3': 17, '4': 1, '5': 8, '10': 'su'},
  ],
};

/// Descriptor for `RepeatingEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List repeatingEventDescriptor = $convert.base64Decode(
    'Cg5SZXBlYXRpbmdFdmVudBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCgJpZBgCIAEoBVICaW'
    'QSFAoFdGl0bGUYAyABKAlSBXRpdGxlEigKD2lzRW5kZWF2b3JCbG9jaxgEIAEoCFIPaXNFbmRl'
    'YXZvckJsb2NrEh4KCmVuZGVhdm9ySWQYBSABKAVSCmVuZGVhdm9ySWQSMQoJc3RhcnRUaW1lGA'
    'YgASgLMhMuY29tbW9uX21vZGVscy5UaW1lUglzdGFydFRpbWUSLQoHZW5kVGltZRgHIAEoCzIT'
    'LmNvbW1vbl9tb2RlbHMuVGltZVIHZW5kVGltZRIxCglzdGFydERhdGUYCCABKAsyEy5jb21tb2'
    '5fbW9kZWxzLkRhdGVSCXN0YXJ0RGF0ZRItCgdlbmREYXRlGAkgASgLMhMuY29tbW9uX21vZGVs'
    'cy5EYXRlUgdlbmREYXRlEiAKC2hvdXJzT2Zmc2V0GAogASgFUgtob3Vyc09mZnNldBIMCgFtGA'
    'sgASgIUgFtEgwKAXQYDCABKAhSAXQSDAoBdxgNIAEoCFIBdxIOCgJ0aBgOIAEoCFICdGgSDAoB'
    'ZhgPIAEoCFIBZhIMCgFzGBAgASgIUgFzEg4KAnN1GBEgASgIUgJzdQ==');

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

@$core.Deprecated('Use dateDescriptor instead')
const Date$json = {
  '1': 'Date',
  '2': [
    {'1': 'day', '3': 1, '4': 1, '5': 5, '10': 'day'},
    {'1': 'month', '3': 2, '4': 1, '5': 5, '10': 'month'},
    {'1': 'year', '3': 3, '4': 1, '5': 5, '10': 'year'},
  ],
};

/// Descriptor for `Date`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateDescriptor = $convert.base64Decode(
    'CgREYXRlEhAKA2RheRgBIAEoBVIDZGF5EhQKBW1vbnRoGAIgASgFUgVtb250aBISCgR5ZWFyGA'
    'MgASgFUgR5ZWFy');

