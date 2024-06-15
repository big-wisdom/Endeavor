//
//  Generated code. Do not modify.
//  source: endeavor/service/endeavor_service.proto
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
import 'endeavor_service.pb.dart' as $0;

export 'endeavor_service.pb.dart';

@$pb.GrpcServiceName('endeavor.service.Endeavor')
class EndeavorClient extends $grpc.Client {
  static final _$createEndeavor = $grpc.ClientMethod<$0.CreateEndeavorRequest, $1.Empty>(
      '/endeavor.service.Endeavor/CreateEndeavor',
      ($0.CreateEndeavorRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$updateEndeavor = $grpc.ClientMethod<$0.UpdateEndeavorRequest, $1.Empty>(
      '/endeavor.service.Endeavor/UpdateEndeavor',
      ($0.UpdateEndeavorRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteEndeavor = $grpc.ClientMethod<$0.DeleteEndeavorRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteEndeavor',
      ($0.DeleteEndeavorRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$subscribeToEndeavorsStream = $grpc.ClientMethod<$0.ListEndeavorsRequest, $0.ListEndeavorsResponse>(
      '/endeavor.service.Endeavor/SubscribeToEndeavorsStream',
      ($0.ListEndeavorsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListEndeavorsResponse.fromBuffer(value));
  static final _$createCalendarEvent = $grpc.ClientMethod<$0.CreateCalendarEventRequest, $0.CreateCalendarEventResponse>(
      '/endeavor.service.Endeavor/CreateCalendarEvent',
      ($0.CreateCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateCalendarEventResponse.fromBuffer(value));
  static final _$updateCalendarEvent = $grpc.ClientMethod<$0.UpdateCalendarEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/UpdateCalendarEvent',
      ($0.UpdateCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteCalendarEvent = $grpc.ClientMethod<$0.DeleteCalendarEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteCalendarEvent',
      ($0.DeleteCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$subscribeToCalendarEvents = $grpc.ClientMethod<$0.ListCalendarEventsRequest, $0.ListCalendarEventsResponse>(
      '/endeavor.service.Endeavor/SubscribeToCalendarEvents',
      ($0.ListCalendarEventsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListCalendarEventsResponse.fromBuffer(value));
  static final _$createRepeatingCalendarEvent = $grpc.ClientMethod<$0.CreateRepeatingCalendarEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/CreateRepeatingCalendarEvent',
      ($0.CreateRepeatingCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$editRepeatingCalendarEvent = $grpc.ClientMethod<$0.EditRepeatingCalendarEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/EditRepeatingCalendarEvent',
      ($0.EditRepeatingCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$editThisAndFollowingCalendarEvents = $grpc.ClientMethod<$0.EditThisAndFollowingCalendarEventsRequest, $1.Empty>(
      '/endeavor.service.Endeavor/EditThisAndFollowingCalendarEvents',
      ($0.EditThisAndFollowingCalendarEventsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteRepeatingCalendarEvent = $grpc.ClientMethod<$0.DeleteRepeatingCalendarEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteRepeatingCalendarEvent',
      ($0.DeleteRepeatingCalendarEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteThisAndFollowingCalendarEvents = $grpc.ClientMethod<$0.DeleteThisAndFollowingCalendarEventsRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteThisAndFollowingCalendarEvents',
      ($0.DeleteThisAndFollowingCalendarEventsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$createTask = $grpc.ClientMethod<$0.CreateTaskRequest, $1.Empty>(
      '/endeavor.service.Endeavor/CreateTask',
      ($0.CreateTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$updateTask = $grpc.ClientMethod<$0.UpdateTaskRequest, $1.Empty>(
      '/endeavor.service.Endeavor/UpdateTask',
      ($0.UpdateTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteTask = $grpc.ClientMethod<$0.DeleteTaskRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteTask',
      ($0.DeleteTaskRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  EndeavorClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Empty> createEndeavor($0.CreateEndeavorRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEndeavor, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateEndeavor($0.UpdateEndeavorRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateEndeavor, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteEndeavor($0.DeleteEndeavorRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEndeavor, request, options: options);
  }

  $grpc.ResponseStream<$0.ListEndeavorsResponse> subscribeToEndeavorsStream($async.Stream<$0.ListEndeavorsRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToEndeavorsStream, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateCalendarEventResponse> createCalendarEvent($0.CreateCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCalendarEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateCalendarEvent($0.UpdateCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCalendarEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteCalendarEvent($0.DeleteCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteCalendarEvent, request, options: options);
  }

  $grpc.ResponseStream<$0.ListCalendarEventsResponse> subscribeToCalendarEvents($async.Stream<$0.ListCalendarEventsRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToCalendarEvents, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> createRepeatingCalendarEvent($0.CreateRepeatingCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRepeatingCalendarEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> editRepeatingCalendarEvent($0.EditRepeatingCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editRepeatingCalendarEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> editThisAndFollowingCalendarEvents($0.EditThisAndFollowingCalendarEventsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editThisAndFollowingCalendarEvents, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteRepeatingCalendarEvent($0.DeleteRepeatingCalendarEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteRepeatingCalendarEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteThisAndFollowingCalendarEvents($0.DeleteThisAndFollowingCalendarEventsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteThisAndFollowingCalendarEvents, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> createTask($0.CreateTaskRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTask, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateTask($0.UpdateTaskRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTask, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteTask($0.DeleteTaskRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTask, request, options: options);
  }
}

@$pb.GrpcServiceName('endeavor.service.Endeavor')
abstract class EndeavorServiceBase extends $grpc.Service {
  $core.String get $name => 'endeavor.service.Endeavor';

  EndeavorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateEndeavorRequest, $1.Empty>(
        'CreateEndeavor',
        createEndeavor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateEndeavorRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEndeavorRequest, $1.Empty>(
        'UpdateEndeavor',
        updateEndeavor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateEndeavorRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEndeavorRequest, $1.Empty>(
        'DeleteEndeavor',
        deleteEndeavor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteEndeavorRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListEndeavorsRequest, $0.ListEndeavorsResponse>(
        'SubscribeToEndeavorsStream',
        subscribeToEndeavorsStream,
        true,
        true,
        ($core.List<$core.int> value) => $0.ListEndeavorsRequest.fromBuffer(value),
        ($0.ListEndeavorsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateCalendarEventRequest, $0.CreateCalendarEventResponse>(
        'CreateCalendarEvent',
        createCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateCalendarEventRequest.fromBuffer(value),
        ($0.CreateCalendarEventResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateCalendarEventRequest, $1.Empty>(
        'UpdateCalendarEvent',
        updateCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateCalendarEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCalendarEventRequest, $1.Empty>(
        'DeleteCalendarEvent',
        deleteCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteCalendarEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListCalendarEventsRequest, $0.ListCalendarEventsResponse>(
        'SubscribeToCalendarEvents',
        subscribeToCalendarEvents,
        true,
        true,
        ($core.List<$core.int> value) => $0.ListCalendarEventsRequest.fromBuffer(value),
        ($0.ListCalendarEventsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateRepeatingCalendarEventRequest, $1.Empty>(
        'CreateRepeatingCalendarEvent',
        createRepeatingCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRepeatingCalendarEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditRepeatingCalendarEventRequest, $1.Empty>(
        'EditRepeatingCalendarEvent',
        editRepeatingCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditRepeatingCalendarEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditThisAndFollowingCalendarEventsRequest, $1.Empty>(
        'EditThisAndFollowingCalendarEvents',
        editThisAndFollowingCalendarEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditThisAndFollowingCalendarEventsRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteRepeatingCalendarEventRequest, $1.Empty>(
        'DeleteRepeatingCalendarEvent',
        deleteRepeatingCalendarEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteRepeatingCalendarEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteThisAndFollowingCalendarEventsRequest, $1.Empty>(
        'DeleteThisAndFollowingCalendarEvents',
        deleteThisAndFollowingCalendarEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteThisAndFollowingCalendarEventsRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTaskRequest, $1.Empty>(
        'CreateTask',
        createTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTaskRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateTaskRequest, $1.Empty>(
        'UpdateTask',
        updateTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateTaskRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTaskRequest, $1.Empty>(
        'DeleteTask',
        deleteTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTaskRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Empty> createEndeavor_Pre($grpc.ServiceCall call, $async.Future<$0.CreateEndeavorRequest> request) async {
    return createEndeavor(call, await request);
  }

  $async.Future<$1.Empty> updateEndeavor_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateEndeavorRequest> request) async {
    return updateEndeavor(call, await request);
  }

  $async.Future<$1.Empty> deleteEndeavor_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteEndeavorRequest> request) async {
    return deleteEndeavor(call, await request);
  }

  $async.Future<$0.CreateCalendarEventResponse> createCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.CreateCalendarEventRequest> request) async {
    return createCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> updateCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateCalendarEventRequest> request) async {
    return updateCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> deleteCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteCalendarEventRequest> request) async {
    return deleteCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> createRepeatingCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRepeatingCalendarEventRequest> request) async {
    return createRepeatingCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> editRepeatingCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.EditRepeatingCalendarEventRequest> request) async {
    return editRepeatingCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> editThisAndFollowingCalendarEvents_Pre($grpc.ServiceCall call, $async.Future<$0.EditThisAndFollowingCalendarEventsRequest> request) async {
    return editThisAndFollowingCalendarEvents(call, await request);
  }

  $async.Future<$1.Empty> deleteRepeatingCalendarEvent_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteRepeatingCalendarEventRequest> request) async {
    return deleteRepeatingCalendarEvent(call, await request);
  }

  $async.Future<$1.Empty> deleteThisAndFollowingCalendarEvents_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteThisAndFollowingCalendarEventsRequest> request) async {
    return deleteThisAndFollowingCalendarEvents(call, await request);
  }

  $async.Future<$1.Empty> createTask_Pre($grpc.ServiceCall call, $async.Future<$0.CreateTaskRequest> request) async {
    return createTask(call, await request);
  }

  $async.Future<$1.Empty> updateTask_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateTaskRequest> request) async {
    return updateTask(call, await request);
  }

  $async.Future<$1.Empty> deleteTask_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteTaskRequest> request) async {
    return deleteTask(call, await request);
  }

  $async.Future<$1.Empty> createEndeavor($grpc.ServiceCall call, $0.CreateEndeavorRequest request);
  $async.Future<$1.Empty> updateEndeavor($grpc.ServiceCall call, $0.UpdateEndeavorRequest request);
  $async.Future<$1.Empty> deleteEndeavor($grpc.ServiceCall call, $0.DeleteEndeavorRequest request);
  $async.Stream<$0.ListEndeavorsResponse> subscribeToEndeavorsStream($grpc.ServiceCall call, $async.Stream<$0.ListEndeavorsRequest> request);
  $async.Future<$0.CreateCalendarEventResponse> createCalendarEvent($grpc.ServiceCall call, $0.CreateCalendarEventRequest request);
  $async.Future<$1.Empty> updateCalendarEvent($grpc.ServiceCall call, $0.UpdateCalendarEventRequest request);
  $async.Future<$1.Empty> deleteCalendarEvent($grpc.ServiceCall call, $0.DeleteCalendarEventRequest request);
  $async.Stream<$0.ListCalendarEventsResponse> subscribeToCalendarEvents($grpc.ServiceCall call, $async.Stream<$0.ListCalendarEventsRequest> request);
  $async.Future<$1.Empty> createRepeatingCalendarEvent($grpc.ServiceCall call, $0.CreateRepeatingCalendarEventRequest request);
  $async.Future<$1.Empty> editRepeatingCalendarEvent($grpc.ServiceCall call, $0.EditRepeatingCalendarEventRequest request);
  $async.Future<$1.Empty> editThisAndFollowingCalendarEvents($grpc.ServiceCall call, $0.EditThisAndFollowingCalendarEventsRequest request);
  $async.Future<$1.Empty> deleteRepeatingCalendarEvent($grpc.ServiceCall call, $0.DeleteRepeatingCalendarEventRequest request);
  $async.Future<$1.Empty> deleteThisAndFollowingCalendarEvents($grpc.ServiceCall call, $0.DeleteThisAndFollowingCalendarEventsRequest request);
  $async.Future<$1.Empty> createTask($grpc.ServiceCall call, $0.CreateTaskRequest request);
  $async.Future<$1.Empty> updateTask($grpc.ServiceCall call, $0.UpdateTaskRequest request);
  $async.Future<$1.Empty> deleteTask($grpc.ServiceCall call, $0.DeleteTaskRequest request);
}
