//
//  Generated code. Do not modify.
//  source: endeavor/service/endeavor_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listEndeavorsResponseDescriptor instead')
const ListEndeavorsResponse$json = {
  '1': 'ListEndeavorsResponse',
  '2': [
    {'1': 'endeavors', '3': 1, '4': 3, '5': 11, '6': '.common_models.Endeavor', '10': 'endeavors'},
  ],
};

/// Descriptor for `ListEndeavorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEndeavorsResponseDescriptor = $convert.base64Decode(
    'ChVMaXN0RW5kZWF2b3JzUmVzcG9uc2USNQoJZW5kZWF2b3JzGAEgAygLMhcuY29tbW9uX21vZG'
    'Vscy5FbmRlYXZvclIJZW5kZWF2b3Jz');

@$core.Deprecated('Use listEndeavorsRequestDescriptor instead')
const ListEndeavorsRequest$json = {
  '1': 'ListEndeavorsRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ListEndeavorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEndeavorsRequestDescriptor = $convert.base64Decode(
    'ChRMaXN0RW5kZWF2b3JzUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use createEndeavorRequestDescriptor instead')
const CreateEndeavorRequest$json = {
  '1': 'CreateEndeavorRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'endeavorTitle', '3': 2, '4': 1, '5': 9, '10': 'endeavorTitle'},
    {'1': 'parentEndeavorId', '3': 3, '4': 1, '5': 5, '10': 'parentEndeavorId'},
    {'1': 'color', '3': 4, '4': 1, '5': 5, '10': 'color'},
  ],
};

/// Descriptor for `CreateEndeavorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEndeavorRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVFbmRlYXZvclJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSJAoNZW5kZW'
    'F2b3JUaXRsZRgCIAEoCVINZW5kZWF2b3JUaXRsZRIqChBwYXJlbnRFbmRlYXZvcklkGAMgASgF'
    'UhBwYXJlbnRFbmRlYXZvcklkEhQKBWNvbG9yGAQgASgFUgVjb2xvcg==');

@$core.Deprecated('Use updateEndeavorRequestDescriptor instead')
const UpdateEndeavorRequest$json = {
  '1': 'UpdateEndeavorRequest',
  '2': [
    {'1': 'endeavor', '3': 1, '4': 1, '5': 11, '6': '.common_models.Endeavor', '10': 'endeavor'},
  ],
};

/// Descriptor for `UpdateEndeavorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEndeavorRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVFbmRlYXZvclJlcXVlc3QSMwoIZW5kZWF2b3IYASABKAsyFy5jb21tb25fbW9kZW'
    'xzLkVuZGVhdm9yUghlbmRlYXZvcg==');

@$core.Deprecated('Use deleteEndeavorRequestDescriptor instead')
const DeleteEndeavorRequest$json = {
  '1': 'DeleteEndeavorRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'endeavorId', '3': 2, '4': 1, '5': 5, '10': 'endeavorId'},
  ],
};

/// Descriptor for `DeleteEndeavorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEndeavorRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVFbmRlYXZvclJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSHgoKZW5kZW'
    'F2b3JJZBgCIAEoBVIKZW5kZWF2b3JJZA==');

@$core.Deprecated('Use createTaskRequestDescriptor instead')
const CreateTaskRequest$json = {
  '1': 'CreateTaskRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'task', '3': 2, '4': 1, '5': 11, '6': '.common_models.Task', '10': 'task'},
  ],
};

/// Descriptor for `CreateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVUYXNrUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBInCgR0YXNrGAIgAS'
    'gLMhMuY29tbW9uX21vZGVscy5UYXNrUgR0YXNr');

@$core.Deprecated('Use updateTaskRequestDescriptor instead')
const UpdateTaskRequest$json = {
  '1': 'UpdateTaskRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'task', '3': 2, '4': 1, '5': 11, '6': '.common_models.Task', '10': 'task'},
  ],
};

/// Descriptor for `UpdateTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTaskRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVUYXNrUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBInCgR0YXNrGAIgAS'
    'gLMhMuY29tbW9uX21vZGVscy5UYXNrUgR0YXNr');

@$core.Deprecated('Use deleteTaskRequestDescriptor instead')
const DeleteTaskRequest$json = {
  '1': 'DeleteTaskRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'taskId', '3': 2, '4': 1, '5': 5, '10': 'taskId'},
  ],
};

/// Descriptor for `DeleteTaskRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVUYXNrUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIWCgZ0YXNrSWQYAi'
    'ABKAVSBnRhc2tJZA==');

@$core.Deprecated('Use deleteThisAndFollowingCalendarEventsRequestDescriptor instead')
const DeleteThisAndFollowingCalendarEventsRequest$json = {
  '1': 'DeleteThisAndFollowingCalendarEventsRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'eventId', '3': 2, '4': 1, '5': 9, '10': 'eventId'},
  ],
};

/// Descriptor for `DeleteThisAndFollowingCalendarEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteThisAndFollowingCalendarEventsRequestDescriptor = $convert.base64Decode(
    'CitEZWxldGVUaGlzQW5kRm9sbG93aW5nQ2FsZW5kYXJFdmVudHNSZXF1ZXN0EhYKBnVzZXJJZB'
    'gBIAEoCVIGdXNlcklkEhgKB2V2ZW50SWQYAiABKAlSB2V2ZW50SWQ=');

@$core.Deprecated('Use deleteRepeatingCalendarEventRequestDescriptor instead')
const DeleteRepeatingCalendarEventRequest$json = {
  '1': 'DeleteRepeatingCalendarEventRequest',
  '2': [
    {'1': 'repeatingCalendarEventId', '3': 1, '4': 1, '5': 9, '10': 'repeatingCalendarEventId'},
  ],
};

/// Descriptor for `DeleteRepeatingCalendarEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRepeatingCalendarEventRequestDescriptor = $convert.base64Decode(
    'CiNEZWxldGVSZXBlYXRpbmdDYWxlbmRhckV2ZW50UmVxdWVzdBI6ChhyZXBlYXRpbmdDYWxlbm'
    'RhckV2ZW50SWQYASABKAlSGHJlcGVhdGluZ0NhbGVuZGFyRXZlbnRJZA==');

@$core.Deprecated('Use editThisAndFollowingCalendarEventsRequestDescriptor instead')
const EditThisAndFollowingCalendarEventsRequest$json = {
  '1': 'EditThisAndFollowingCalendarEventsRequest',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `EditThisAndFollowingCalendarEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editThisAndFollowingCalendarEventsRequestDescriptor = $convert.base64Decode(
    'CilFZGl0VGhpc0FuZEZvbGxvd2luZ0NhbGVuZGFyRXZlbnRzUmVxdWVzdBIqCgVldmVudBgBIA'
    'EoCzIULmNvbW1vbl9tb2RlbHMuRXZlbnRSBWV2ZW50');

@$core.Deprecated('Use editRepeatingCalendarEventRequestDescriptor instead')
const EditRepeatingCalendarEventRequest$json = {
  '1': 'EditRepeatingCalendarEventRequest',
  '2': [
    {'1': 'repeatingEvent', '3': 1, '4': 1, '5': 11, '6': '.common_models.RepeatingEvent', '10': 'repeatingEvent'},
  ],
};

/// Descriptor for `EditRepeatingCalendarEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editRepeatingCalendarEventRequestDescriptor = $convert.base64Decode(
    'CiFFZGl0UmVwZWF0aW5nQ2FsZW5kYXJFdmVudFJlcXVlc3QSRQoOcmVwZWF0aW5nRXZlbnQYAS'
    'ABKAsyHS5jb21tb25fbW9kZWxzLlJlcGVhdGluZ0V2ZW50Ug5yZXBlYXRpbmdFdmVudA==');

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

@$core.Deprecated('Use createRepeatingCalendarEventRequestDescriptor instead')
const CreateRepeatingCalendarEventRequest$json = {
  '1': 'CreateRepeatingCalendarEventRequest',
  '2': [
    {'1': 'repeatingEvent', '3': 1, '4': 1, '5': 11, '6': '.common_models.RepeatingEvent', '10': 'repeatingEvent'},
  ],
};

/// Descriptor for `CreateRepeatingCalendarEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRepeatingCalendarEventRequestDescriptor = $convert.base64Decode(
    'CiNDcmVhdGVSZXBlYXRpbmdDYWxlbmRhckV2ZW50UmVxdWVzdBJFCg5yZXBlYXRpbmdFdmVudB'
    'gBIAEoCzIdLmNvbW1vbl9tb2RlbHMuUmVwZWF0aW5nRXZlbnRSDnJlcGVhdGluZ0V2ZW50');

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

