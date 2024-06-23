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
  static final _$createEvent = $grpc.ClientMethod<$0.CreateEventRequest, $0.CreateEventResponse>(
      '/endeavor.service.Endeavor/CreateEvent',
      ($0.CreateEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateEventResponse.fromBuffer(value));
  static final _$updateEvent = $grpc.ClientMethod<$0.UpdateEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/UpdateEvent',
      ($0.UpdateEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteEvent = $grpc.ClientMethod<$0.DeleteEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteEvent',
      ($0.DeleteEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$subscribeToEvents = $grpc.ClientMethod<$0.ListEventsRequest, $0.ListEventsResponse>(
      '/endeavor.service.Endeavor/SubscribeToEvents',
      ($0.ListEventsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListEventsResponse.fromBuffer(value));
  static final _$createRepeatingEvent = $grpc.ClientMethod<$0.CreateRepeatingEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/CreateRepeatingEvent',
      ($0.CreateRepeatingEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$editRepeatingEvent = $grpc.ClientMethod<$0.EditRepeatingEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/EditRepeatingEvent',
      ($0.EditRepeatingEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$editThisAndFollowingEvents = $grpc.ClientMethod<$0.EditThisAndFollowingEventsRequest, $1.Empty>(
      '/endeavor.service.Endeavor/EditThisAndFollowingEvents',
      ($0.EditThisAndFollowingEventsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteRepeatingEvent = $grpc.ClientMethod<$0.DeleteRepeatingEventRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteRepeatingEvent',
      ($0.DeleteRepeatingEventRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$deleteThisAndFollowingEvents = $grpc.ClientMethod<$0.DeleteThisAndFollowingEventsRequest, $1.Empty>(
      '/endeavor.service.Endeavor/DeleteThisAndFollowingEvents',
      ($0.DeleteThisAndFollowingEventsRequest value) => value.writeToBuffer(),
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

  $grpc.ResponseFuture<$0.CreateEventResponse> createEvent($0.CreateEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> updateEvent($0.UpdateEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteEvent($0.DeleteEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEvent, request, options: options);
  }

  $grpc.ResponseStream<$0.ListEventsResponse> subscribeToEvents($async.Stream<$0.ListEventsRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeToEvents, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> createRepeatingEvent($0.CreateRepeatingEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createRepeatingEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> editRepeatingEvent($0.EditRepeatingEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editRepeatingEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> editThisAndFollowingEvents($0.EditThisAndFollowingEventsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editThisAndFollowingEvents, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteRepeatingEvent($0.DeleteRepeatingEventRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteRepeatingEvent, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteThisAndFollowingEvents($0.DeleteThisAndFollowingEventsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteThisAndFollowingEvents, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.CreateEventRequest, $0.CreateEventResponse>(
        'CreateEvent',
        createEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateEventRequest.fromBuffer(value),
        ($0.CreateEventResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateEventRequest, $1.Empty>(
        'UpdateEvent',
        updateEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteEventRequest, $1.Empty>(
        'DeleteEvent',
        deleteEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListEventsRequest, $0.ListEventsResponse>(
        'SubscribeToEvents',
        subscribeToEvents,
        true,
        true,
        ($core.List<$core.int> value) => $0.ListEventsRequest.fromBuffer(value),
        ($0.ListEventsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateRepeatingEventRequest, $1.Empty>(
        'CreateRepeatingEvent',
        createRepeatingEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateRepeatingEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditRepeatingEventRequest, $1.Empty>(
        'EditRepeatingEvent',
        editRepeatingEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditRepeatingEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EditThisAndFollowingEventsRequest, $1.Empty>(
        'EditThisAndFollowingEvents',
        editThisAndFollowingEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EditThisAndFollowingEventsRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteRepeatingEventRequest, $1.Empty>(
        'DeleteRepeatingEvent',
        deleteRepeatingEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteRepeatingEventRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteThisAndFollowingEventsRequest, $1.Empty>(
        'DeleteThisAndFollowingEvents',
        deleteThisAndFollowingEvents_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteThisAndFollowingEventsRequest.fromBuffer(value),
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

  $async.Future<$0.CreateEventResponse> createEvent_Pre($grpc.ServiceCall call, $async.Future<$0.CreateEventRequest> request) async {
    return createEvent(call, await request);
  }

  $async.Future<$1.Empty> updateEvent_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateEventRequest> request) async {
    return updateEvent(call, await request);
  }

  $async.Future<$1.Empty> deleteEvent_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteEventRequest> request) async {
    return deleteEvent(call, await request);
  }

  $async.Future<$1.Empty> createRepeatingEvent_Pre($grpc.ServiceCall call, $async.Future<$0.CreateRepeatingEventRequest> request) async {
    return createRepeatingEvent(call, await request);
  }

  $async.Future<$1.Empty> editRepeatingEvent_Pre($grpc.ServiceCall call, $async.Future<$0.EditRepeatingEventRequest> request) async {
    return editRepeatingEvent(call, await request);
  }

  $async.Future<$1.Empty> editThisAndFollowingEvents_Pre($grpc.ServiceCall call, $async.Future<$0.EditThisAndFollowingEventsRequest> request) async {
    return editThisAndFollowingEvents(call, await request);
  }

  $async.Future<$1.Empty> deleteRepeatingEvent_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteRepeatingEventRequest> request) async {
    return deleteRepeatingEvent(call, await request);
  }

  $async.Future<$1.Empty> deleteThisAndFollowingEvents_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteThisAndFollowingEventsRequest> request) async {
    return deleteThisAndFollowingEvents(call, await request);
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
  $async.Future<$0.CreateEventResponse> createEvent($grpc.ServiceCall call, $0.CreateEventRequest request);
  $async.Future<$1.Empty> updateEvent($grpc.ServiceCall call, $0.UpdateEventRequest request);
  $async.Future<$1.Empty> deleteEvent($grpc.ServiceCall call, $0.DeleteEventRequest request);
  $async.Stream<$0.ListEventsResponse> subscribeToEvents($grpc.ServiceCall call, $async.Stream<$0.ListEventsRequest> request);
  $async.Future<$1.Empty> createRepeatingEvent($grpc.ServiceCall call, $0.CreateRepeatingEventRequest request);
  $async.Future<$1.Empty> editRepeatingEvent($grpc.ServiceCall call, $0.EditRepeatingEventRequest request);
  $async.Future<$1.Empty> editThisAndFollowingEvents($grpc.ServiceCall call, $0.EditThisAndFollowingEventsRequest request);
  $async.Future<$1.Empty> deleteRepeatingEvent($grpc.ServiceCall call, $0.DeleteRepeatingEventRequest request);
  $async.Future<$1.Empty> deleteThisAndFollowingEvents($grpc.ServiceCall call, $0.DeleteThisAndFollowingEventsRequest request);
  $async.Future<$1.Empty> createTask($grpc.ServiceCall call, $0.CreateTaskRequest request);
  $async.Future<$1.Empty> updateTask($grpc.ServiceCall call, $0.UpdateTaskRequest request);
  $async.Future<$1.Empty> deleteTask($grpc.ServiceCall call, $0.DeleteTaskRequest request);
}
