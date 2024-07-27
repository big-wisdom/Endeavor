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

@$core.Deprecated('Use listTasksRequestDescriptor instead')
const ListTasksRequest$json = {
  '1': 'ListTasksRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ListTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0VGFza3NSZXF1ZXN0EhYKBnVzZXJJZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use listTasksResponseDescriptor instead')
const ListTasksResponse$json = {
  '1': 'ListTasksResponse',
  '2': [
    {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.common_models.Task', '10': 'tasks'},
  ],
};

/// Descriptor for `ListTasksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0VGFza3NSZXNwb25zZRIpCgV0YXNrcxgBIAMoCzITLmNvbW1vbl9tb2RlbHMuVGFza1'
    'IFdGFza3M=');

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

@$core.Deprecated('Use deleteThisAndFollowingEventsRequestDescriptor instead')
const DeleteThisAndFollowingEventsRequest$json = {
  '1': 'DeleteThisAndFollowingEventsRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'eventId', '3': 2, '4': 1, '5': 5, '10': 'eventId'},
  ],
};

/// Descriptor for `DeleteThisAndFollowingEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteThisAndFollowingEventsRequestDescriptor = $convert.base64Decode(
    'CiNEZWxldGVUaGlzQW5kRm9sbG93aW5nRXZlbnRzUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBn'
    'VzZXJJZBIYCgdldmVudElkGAIgASgFUgdldmVudElk');

@$core.Deprecated('Use deleteRepeatingEventRequestDescriptor instead')
const DeleteRepeatingEventRequest$json = {
  '1': 'DeleteRepeatingEventRequest',
  '2': [
    {'1': 'repeatingEventId', '3': 1, '4': 1, '5': 9, '10': 'repeatingEventId'},
  ],
};

/// Descriptor for `DeleteRepeatingEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteRepeatingEventRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVSZXBlYXRpbmdFdmVudFJlcXVlc3QSKgoQcmVwZWF0aW5nRXZlbnRJZBgBIAEoCV'
    'IQcmVwZWF0aW5nRXZlbnRJZA==');

@$core.Deprecated('Use editThisAndFollowingEventsRequestDescriptor instead')
const EditThisAndFollowingEventsRequest$json = {
  '1': 'EditThisAndFollowingEventsRequest',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `EditThisAndFollowingEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editThisAndFollowingEventsRequestDescriptor = $convert.base64Decode(
    'CiFFZGl0VGhpc0FuZEZvbGxvd2luZ0V2ZW50c1JlcXVlc3QSKgoFZXZlbnQYASABKAsyFC5jb2'
    '1tb25fbW9kZWxzLkV2ZW50UgVldmVudA==');

@$core.Deprecated('Use editRepeatingEventRequestDescriptor instead')
const EditRepeatingEventRequest$json = {
  '1': 'EditRepeatingEventRequest',
  '2': [
    {'1': 'repeatingEvent', '3': 1, '4': 1, '5': 11, '6': '.common_models.RepeatingEvent', '10': 'repeatingEvent'},
  ],
};

/// Descriptor for `EditRepeatingEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editRepeatingEventRequestDescriptor = $convert.base64Decode(
    'ChlFZGl0UmVwZWF0aW5nRXZlbnRSZXF1ZXN0EkUKDnJlcGVhdGluZ0V2ZW50GAEgASgLMh0uY2'
    '9tbW9uX21vZGVscy5SZXBlYXRpbmdFdmVudFIOcmVwZWF0aW5nRXZlbnQ=');

@$core.Deprecated('Use createEventRequestDescriptor instead')
const CreateEventRequest$json = {
  '1': 'CreateEventRequest',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEventRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVFdmVudFJlcXVlc3QSKgoFZXZlbnQYASABKAsyFC5jb21tb25fbW9kZWxzLkV2ZW'
    '50UgVldmVudA==');

@$core.Deprecated('Use createEventResponseDescriptor instead')
const CreateEventResponse$json = {
  '1': 'CreateEventResponse',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `CreateEventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createEventResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVFdmVudFJlc3BvbnNlEioKBWV2ZW50GAEgASgLMhQuY29tbW9uX21vZGVscy5Fdm'
    'VudFIFZXZlbnQ=');

@$core.Deprecated('Use createRepeatingEventRequestDescriptor instead')
const CreateRepeatingEventRequest$json = {
  '1': 'CreateRepeatingEventRequest',
  '2': [
    {'1': 'repeatingEvent', '3': 1, '4': 1, '5': 11, '6': '.common_models.RepeatingEvent', '10': 'repeatingEvent'},
  ],
};

/// Descriptor for `CreateRepeatingEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRepeatingEventRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVSZXBlYXRpbmdFdmVudFJlcXVlc3QSRQoOcmVwZWF0aW5nRXZlbnQYASABKAsyHS'
    '5jb21tb25fbW9kZWxzLlJlcGVhdGluZ0V2ZW50Ug5yZXBlYXRpbmdFdmVudA==');

@$core.Deprecated('Use updateEventRequestDescriptor instead')
const UpdateEventRequest$json = {
  '1': 'UpdateEventRequest',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 11, '6': '.common_models.Event', '10': 'event'},
  ],
};

/// Descriptor for `UpdateEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateEventRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVFdmVudFJlcXVlc3QSKgoFZXZlbnQYASABKAsyFC5jb21tb25fbW9kZWxzLkV2ZW'
    '50UgVldmVudA==');

@$core.Deprecated('Use deleteEventRequestDescriptor instead')
const DeleteEventRequest$json = {
  '1': 'DeleteEventRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteEventRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteEventRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVFdmVudFJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSDgoCaWQYAiABKA'
    'VSAmlk');

@$core.Deprecated('Use listEventsRequestDescriptor instead')
const ListEventsRequest$json = {
  '1': 'ListEventsRequest',
  '2': [
    {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `ListEventsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEventsRequestDescriptor = $convert.base64Decode(
    'ChFMaXN0RXZlbnRzUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use listEventsResponseDescriptor instead')
const ListEventsResponse$json = {
  '1': 'ListEventsResponse',
  '2': [
    {'1': 'events', '3': 1, '4': 3, '5': 11, '6': '.common_models.Event', '10': 'events'},
  ],
};

/// Descriptor for `ListEventsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEventsResponseDescriptor = $convert.base64Decode(
    'ChJMaXN0RXZlbnRzUmVzcG9uc2USLAoGZXZlbnRzGAEgAygLMhQuY29tbW9uX21vZGVscy5Fdm'
    'VudFIGZXZlbnRz');

