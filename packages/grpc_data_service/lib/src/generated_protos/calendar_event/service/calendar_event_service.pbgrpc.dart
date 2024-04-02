//
//  Generated code. Do not modify.
//  source: calendar_event/service/calendar_event_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/empty.pb.dart' as $1;
import 'calendar_event_service.pb.dart' as $0;

export 'calendar_event_service.pb.dart';

@$pb.GrpcServiceName('calendar_event.service.CalendarEvent')
class CalendarEventClient extends $grpc.Client {
  static final _$createCalendarEvent = $grpc.ClientMethod<$0.CreateCalendarEventRequest, $0.CreateCalendarEventResponse>(
      '/calendar_event.service.CalendarEvent/CreateCalendarEvent',
      ($0.CreateCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateCalendarEventResponse.fromBuffer(value));
  static final _$deleteCalendarEvent = $grpc.ClientMethod<$0.DeleteCalendarEventRequest, $1.Empty>(
      '/calendar_event.service.CalendarEvent/DeleteCalendarEvent',
      ($0.DeleteCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  CalendarEventClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateCalendarEventResponse> createCalendarEvent($0.CreateCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCalendarEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteCalendarEvent($0.DeleteCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteCalendarEvent, request, options: options);
  }
}

@$pb.GrpcServiceName('calendar_event.service.CalendarEvent')
abstract class CalendarEventServiceBase extends $grpc.Service {
  $core.String get $name => 'calendar_event.service.CalendarEvent';

  CalendarEventServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateCalendarEventRequest, $0.CreateCalendarEventResponse>(
        'CreateCalendarEvent',
        createCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateCalendarEventRequest.fromBuffer(value),
        ($0.CreateCalendarEventResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCalendarEventRequest, $1.Empty>(
        'DeleteCalendarEvent',
        deleteCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteCalendarEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateCalendarEventResponse> createCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.CreateCalendarEventRequest> request) async {
    return createCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> deleteCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteCalendarEventRequest> request) async {
    return deleteCalendarEvent(call, await request);
  }

  $async.Future<$0.CreateCalendarEventResponse> createCalendarEvent($grpc.ServiceCall call, $0.CreateCalendarEventRequest request);
  $async.Future<$1.Empty> deleteCalendarEvent($grpc.ServiceCall call, $0.DeleteCalendarEventRequest request);
}
