//
//  Generated code. Do not modify.
//  source: common_models/event.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $3;
import 'endeavorReference.pb.dart' as $2;

class Event extends $pb.GeneratedMessage {
  factory Event({
    $core.String? userId,
    $core.int? id,
    $core.String? title,
    $2.EndeavorReference? endeavorReference,
    $core.bool? isEndeavorBlock,
    $core.int? repeatingEventId,
    $core.int? taskId,
    $core.int? color,
    $3.Timestamp? startTime,
    $3.Timestamp? endTime,
    $core.int? hoursOffset,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (endeavorReference != null) {
      $result.endeavorReference = endeavorReference;
    }
    if (isEndeavorBlock != null) {
      $result.isEndeavorBlock = isEndeavorBlock;
    }
    if (repeatingEventId != null) {
      $result.repeatingEventId = repeatingEventId;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    if (color != null) {
      $result.color = color;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (hoursOffset != null) {
      $result.hoursOffset = hoursOffset;
    }
    return $result;
  }
  Event._() : super();
  factory Event.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Event.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Event', package: const $pb.PackageName(_omitMessageNames ? '' : 'common_models'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOM<$2.EndeavorReference>(4, _omitFieldNames ? '' : 'endeavorReference', protoName: 'endeavorReference', subBuilder: $2.EndeavorReference.create)
    ..aOB(5, _omitFieldNames ? '' : 'isEndeavorBlock', protoName: 'isEndeavorBlock')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'repeatingEventId', $pb.PbFieldType.O3, protoName: 'repeatingEventId')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'taskId', $pb.PbFieldType.O3, protoName: 'taskId')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'color', $pb.PbFieldType.O3)
    ..aOM<$3.Timestamp>(9, _omitFieldNames ? '' : 'startTime', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(10, _omitFieldNames ? '' : 'endTime', subBuilder: $3.Timestamp.create)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'hoursOffset', $pb.PbFieldType.O3, protoName: 'hoursOffset')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Event clone() => Event()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Event copyWith(void Function(Event) updates) => super.copyWith((message) => updates(message as Event)) as Event;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Event create() => Event._();
  Event createEmptyInstance() => create();
  static $pb.PbList<Event> createRepeated() => $pb.PbList<Event>();
  @$core.pragma('dart2js:noInline')
  static Event getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Event>(create);
  static Event? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $2.EndeavorReference get endeavorReference => $_getN(3);
  @$pb.TagNumber(4)
  set endeavorReference($2.EndeavorReference v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndeavorReference() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndeavorReference() => clearField(4);
  @$pb.TagNumber(4)
  $2.EndeavorReference ensureEndeavorReference() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get isEndeavorBlock => $_getBF(4);
  @$pb.TagNumber(5)
  set isEndeavorBlock($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsEndeavorBlock() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsEndeavorBlock() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get repeatingEventId => $_getIZ(5);
  @$pb.TagNumber(6)
  set repeatingEventId($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRepeatingEventId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRepeatingEventId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get taskId => $_getIZ(6);
  @$pb.TagNumber(7)
  set taskId($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTaskId() => $_has(6);
  @$pb.TagNumber(7)
  void clearTaskId() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get color => $_getIZ(7);
  @$pb.TagNumber(8)
  set color($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearColor() => clearField(8);

  @$pb.TagNumber(9)
  $3.Timestamp get startTime => $_getN(8);
  @$pb.TagNumber(9)
  set startTime($3.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasStartTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearStartTime() => clearField(9);
  @$pb.TagNumber(9)
  $3.Timestamp ensureStartTime() => $_ensure(8);

  @$pb.TagNumber(10)
  $3.Timestamp get endTime => $_getN(9);
  @$pb.TagNumber(10)
  set endTime($3.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasEndTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearEndTime() => clearField(10);
  @$pb.TagNumber(10)
  $3.Timestamp ensureEndTime() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get hoursOffset => $_getIZ(10);
  @$pb.TagNumber(11)
  set hoursOffset($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasHoursOffset() => $_has(10);
  @$pb.TagNumber(11)
  void clearHoursOffset() => clearField(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
