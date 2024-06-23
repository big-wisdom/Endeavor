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
    {'1': 'endeavorReference', '3': 4, '4': 1, '5': 11, '6': '.common_models.EndeavorReference', '10': 'endeavorReference'},
    {'1': 'isEndeavorBlock', '3': 5, '4': 1, '5': 8, '10': 'isEndeavorBlock'},
    {'1': 'repeatingEventId', '3': 6, '4': 1, '5': 5, '10': 'repeatingEventId'},
    {'1': 'taskId', '3': 7, '4': 1, '5': 5, '10': 'taskId'},
    {'1': 'color', '3': 8, '4': 1, '5': 5, '10': 'color'},
    {'1': 'start_time', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startTime'},
    {'1': 'end_time', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endTime'},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode(
    'CgVFdmVudBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCgJpZBgCIAEoBVICaWQSFAoFdGl0bG'
    'UYAyABKAlSBXRpdGxlEk4KEWVuZGVhdm9yUmVmZXJlbmNlGAQgASgLMiAuY29tbW9uX21vZGVs'
    'cy5FbmRlYXZvclJlZmVyZW5jZVIRZW5kZWF2b3JSZWZlcmVuY2USKAoPaXNFbmRlYXZvckJsb2'
    'NrGAUgASgIUg9pc0VuZGVhdm9yQmxvY2sSKgoQcmVwZWF0aW5nRXZlbnRJZBgGIAEoBVIQcmVw'
    'ZWF0aW5nRXZlbnRJZBIWCgZ0YXNrSWQYByABKAVSBnRhc2tJZBIUCgVjb2xvchgIIAEoBVIFY2'
    '9sb3ISOQoKc3RhcnRfdGltZRgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0'
    'YXJ0VGltZRI1CghlbmRfdGltZRgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2'
    'VuZFRpbWU=');

