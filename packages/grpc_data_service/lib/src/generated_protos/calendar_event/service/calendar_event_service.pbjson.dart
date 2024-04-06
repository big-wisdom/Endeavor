//
//  Generated code. Do not modify.
//  source: calendar_event/service/calendar_event_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createCalendarEventRequestDescriptor instead')
const CreateCalendarEventRequest$json = {
  '1': 'CreateCalendarEventRequest',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateCalendarEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCalendarEventRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVDYWxlbmRhckV2ZW50UmVxdWVzdBIqCgVldmVudBgBIAEoCzIULmNvbW1vbl9tb2'
    'RlbHMuRXZlbnRSBWV2ZW50');

@$core.Deprecated('Use createCalendarEventResponseDescriptor instead')
const CreateCalendarEventResponse$json = {
  '1': 'CreateCalendarEventResponse',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateCalendarEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCalendarEventResponseDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVDYWxlbmRhckV2ZW50UmVzcG9uc2USKgoFZXZlbnQYASABKAsyFC5jb21tb25fbW'
    '9kZWxzLkV2ZW50UgVldmVudA==');

@$core.Deprecated('Use updateCalendarEventRequestDescriptor instead')
const UpdateCalendarEventRequest$json = {
  '1': 'UpdateCalendarEventRequest',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `UpdateCalendarEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCalendarEventRequestDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVDYWxlbmRhckV2ZW50UmVxdWVzdBIqCgVldmVudBgBIAEoCzIULmNvbW1vbl9tb2'
    'RlbHMuRXZlbnRSBWV2ZW50');

@$core.Deprecated('Use deleteCalendarEventRequestDescriptor instead')
const DeleteCalendarEventRequest$json = {
  '1': 'DeleteCalendarEventRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeleteCalendarEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCalendarEventRequestDescriptor = $convert.base64Decode(
    'ChpEZWxldGVDYWxlbmRhckV2ZW50UmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIOCg'
    'JpZBgCIAEoCVICaWQ=');

@$core.Deprecated('Use listCalendarEventsRequestDescriptor instead')
const ListCalendarEventsRequest$json = {
  '1': 'ListCalendarEventsRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ListCalendarEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCalendarEventsRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0Q2FsZW5kYXJFdmVudHNSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use listCalendarEventsResponseDescriptor instead')
const ListCalendarEventsResponse$json = {
  '1': 'ListCalendarEventsResponse',
  '2': [
    {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.common_models.Event', '10': 'events'},
  ],
};

/// Descriptor for `ListCalendarEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listCalendarEventsResponseDescriptor = $convert.base64Decode(
    'ChpMaXN0Q2FsZW5kYXJFdmVudHNSZXNwb25zZRIsCgZldmVudHMYASADKAsyFC5jb21tb25fbW'
    '9kZWxzLkV2ZW50UgZldmVudHM=');

