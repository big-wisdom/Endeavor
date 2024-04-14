//
//  Generated code. Do not modify.
//  source: calendar_event/service/calendar_event_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../common_models/event.pb.dart' as $3;
import '../../common_models/repeating_event.pb.dart' as $4;

class CreateCalendarEventRequest extends $pb.GeneratedMessage {
  factory CreateCalendarEventRequest({
    $3.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  CreateCalendarEventRequest._() : super();
  factory CreateCalendarEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCalendarEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..aOM<$3.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $3.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCalendarEventRequest clone() => CreateCalendarEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCalendarEventRequest copyWith(void Function(CreateCalendarEventRequest) updates) => super.copyWith((message) => updates(message as CreateCalendarEventRequest)) as CreateCalendarEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCalendarEventRequest create() => CreateCalendarEventRequest._();
  CreateCalendarEventRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCalendarEventRequest> createRepeated() => $pb.PbList<CreateCalendarEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCalendarEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCalendarEventRequest>(create);
  static CreateCalendarEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($3.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $3.Event ensureEvent() => $_ensure(0);
}

class CreateCalendarEventResponse extends $pb.GeneratedMessage {
  factory CreateCalendarEventResponse({
    $3.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  CreateCalendarEventResponse._() : super();
  factory CreateCalendarEventResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCalendarEventResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCalendarEventResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..aOM<$3.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $3.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCalendarEventResponse clone() => CreateCalendarEventResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCalendarEventResponse copyWith(void Function(CreateCalendarEventResponse) updates) => super.copyWith((message) => updates(message as CreateCalendarEventResponse)) as CreateCalendarEventResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCalendarEventResponse create() => CreateCalendarEventResponse._();
  CreateCalendarEventResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCalendarEventResponse> createRepeated() => $pb.PbList<CreateCalendarEventResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCalendarEventResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCalendarEventResponse>(create);
  static CreateCalendarEventResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($3.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $3.Event ensureEvent() => $_ensure(0);
}

class CreateRepeatingCalendarEventRequest extends $pb.GeneratedMessage {
  factory CreateRepeatingCalendarEventRequest({
    $4.RepeatingEvent? repeatingEvent,
  }) {
    final $result = create();
    if (repeatingEvent != null) {
      $result.repeatingEvent = repeatingEvent;
    }
    return $result;
  }
  CreateRepeatingCalendarEventRequest._() : super();
  factory CreateRepeatingCalendarEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRepeatingCalendarEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRepeatingCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..aOM<$4.RepeatingEvent>(1, _omitFieldNames ? '' : 'repeatingEvent', protoName: 'repeatingEvent', subBuilder: $4.RepeatingEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRepeatingCalendarEventRequest clone() => CreateRepeatingCalendarEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRepeatingCalendarEventRequest copyWith(void Function(CreateRepeatingCalendarEventRequest) updates) => super.copyWith((message) => updates(message as CreateRepeatingCalendarEventRequest)) as CreateRepeatingCalendarEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRepeatingCalendarEventRequest create() => CreateRepeatingCalendarEventRequest._();
  CreateRepeatingCalendarEventRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRepeatingCalendarEventRequest> createRepeated() => $pb.PbList<CreateRepeatingCalendarEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRepeatingCalendarEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRepeatingCalendarEventRequest>(create);
  static CreateRepeatingCalendarEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $4.RepeatingEvent get repeatingEvent => $_getN(0);
  @$pb.TagNumber(1)
  set repeatingEvent($4.RepeatingEvent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRepeatingEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepeatingEvent() => clearField(1);
  @$pb.TagNumber(1)
  $4.RepeatingEvent ensureRepeatingEvent() => $_ensure(0);
}

class UpdateCalendarEventRequest extends $pb.GeneratedMessage {
  factory UpdateCalendarEventRequest({
    $3.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  UpdateCalendarEventRequest._() : super();
  factory UpdateCalendarEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCalendarEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..aOM<$3.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $3.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCalendarEventRequest clone() => UpdateCalendarEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCalendarEventRequest copyWith(void Function(UpdateCalendarEventRequest) updates) => super.copyWith((message) => updates(message as UpdateCalendarEventRequest)) as UpdateCalendarEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCalendarEventRequest create() => UpdateCalendarEventRequest._();
  UpdateCalendarEventRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateCalendarEventRequest> createRepeated() => $pb.PbList<UpdateCalendarEventRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateCalendarEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCalendarEventRequest>(create);
  static UpdateCalendarEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($3.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $3.Event ensureEvent() => $_ensure(0);
}

class DeleteCalendarEventRequest extends $pb.GeneratedMessage {
  factory DeleteCalendarEventRequest({
    $core.String? userId,
    $core.String? id,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeleteCalendarEventRequest._() : super();
  factory DeleteCalendarEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCalendarEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCalendarEventRequest clone() => DeleteCalendarEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCalendarEventRequest copyWith(void Function(DeleteCalendarEventRequest) updates) => super.copyWith((message) => updates(message as DeleteCalendarEventRequest)) as DeleteCalendarEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCalendarEventRequest create() => DeleteCalendarEventRequest._();
  DeleteCalendarEventRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCalendarEventRequest> createRepeated() => $pb.PbList<DeleteCalendarEventRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCalendarEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCalendarEventRequest>(create);
  static DeleteCalendarEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class ListCalendarEventsRequest extends $pb.GeneratedMessage {
  factory ListCalendarEventsRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  ListCalendarEventsRequest._() : super();
  factory ListCalendarEventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCalendarEventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCalendarEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCalendarEventsRequest clone() => ListCalendarEventsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCalendarEventsRequest copyWith(void Function(ListCalendarEventsRequest) updates) => super.copyWith((message) => updates(message as ListCalendarEventsRequest)) as ListCalendarEventsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCalendarEventsRequest create() => ListCalendarEventsRequest._();
  ListCalendarEventsRequest createEmptyInstance() => create();
  static $pb.PbList<ListCalendarEventsRequest> createRepeated() => $pb.PbList<ListCalendarEventsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListCalendarEventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCalendarEventsRequest>(create);
  static ListCalendarEventsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class ListCalendarEventsResponse extends $pb.GeneratedMessage {
  factory ListCalendarEventsResponse({
    $core.Iterable<$3.Event>? events,
  }) {
    final $result = create();
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  ListCalendarEventsResponse._() : super();
  factory ListCalendarEventsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCalendarEventsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCalendarEventsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'calendar_event.service'), createEmptyInstance: create)
    ..pc<$3.Event>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: $3.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCalendarEventsResponse clone() => ListCalendarEventsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCalendarEventsResponse copyWith(void Function(ListCalendarEventsResponse) updates) => super.copyWith((message) => updates(message as ListCalendarEventsResponse)) as ListCalendarEventsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCalendarEventsResponse create() => ListCalendarEventsResponse._();
  ListCalendarEventsResponse createEmptyInstance() => create();
  static $pb.PbList<ListCalendarEventsResponse> createRepeated() => $pb.PbList<ListCalendarEventsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListCalendarEventsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCalendarEventsResponse>(create);
  static ListCalendarEventsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Event> get events => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
