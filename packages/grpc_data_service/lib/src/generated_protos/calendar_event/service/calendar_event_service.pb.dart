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

import '../../common_models/event.pb.dart' as $2;

class CreateCalendarEventRequest extends $pb.GeneratedMessage {
  factory CreateCalendarEventRequest({
    $2.Event? event,
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
    ..aOM<$2.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $2.Event.create)
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
  $2.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($2.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $2.Event ensureEvent() => $_ensure(0);
}

class CreateCalendarEventResponse extends $pb.GeneratedMessage {
  factory CreateCalendarEventResponse({
    $2.Event? event,
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
    ..aOM<$2.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $2.Event.create)
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
  $2.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($2.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $2.Event ensureEvent() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
