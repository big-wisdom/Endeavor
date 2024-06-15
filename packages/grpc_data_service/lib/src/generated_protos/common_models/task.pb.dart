//
//  Generated code. Do not modify.
//  source: common_models/task.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $2;
import 'endeavorReference.pb.dart' as $3;
import 'event.pb.dart' as $4;

class Task extends $pb.GeneratedMessage {
  factory Task({
    $core.int? id,
    $core.String? title,
    $3.EndeavorReference? endeavorReference,
    $core.Iterable<$4.Event>? events,
    $core.int? duration,
    $core.int? minnimumSchedulingDuration,
    $2.Timestamp? dueDate,
    $core.bool? divisible,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (endeavorReference != null) {
      $result.endeavorReference = endeavorReference;
    }
    if (events != null) {
      $result.events.addAll(events);
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (minnimumSchedulingDuration != null) {
      $result.minnimumSchedulingDuration = minnimumSchedulingDuration;
    }
    if (dueDate != null) {
      $result.dueDate = dueDate;
    }
    if (divisible != null) {
      $result.divisible = divisible;
    }
    return $result;
  }
  Task._() : super();
  factory Task.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Task', package: const $pb.PackageName(_omitMessageNames ? '' : 'common_models'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOM<$3.EndeavorReference>(3, _omitFieldNames ? '' : 'endeavorReference', protoName: 'endeavorReference', subBuilder: $3.EndeavorReference.create)
    ..pc<$4.Event>(4, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: $4.Event.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'duration', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'minnimumSchedulingDuration', $pb.PbFieldType.O3, protoName: 'minnimumSchedulingDuration')
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'dueDate', protoName: 'dueDate', subBuilder: $2.Timestamp.create)
    ..aOB(8, _omitFieldNames ? '' : 'divisible')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task)) as Task;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $3.EndeavorReference get endeavorReference => $_getN(2);
  @$pb.TagNumber(3)
  set endeavorReference($3.EndeavorReference v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndeavorReference() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndeavorReference() => clearField(3);
  @$pb.TagNumber(3)
  $3.EndeavorReference ensureEndeavorReference() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$4.Event> get events => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get duration => $_getIZ(4);
  @$pb.TagNumber(5)
  set duration($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDuration() => $_has(4);
  @$pb.TagNumber(5)
  void clearDuration() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get minnimumSchedulingDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set minnimumSchedulingDuration($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinnimumSchedulingDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinnimumSchedulingDuration() => clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get dueDate => $_getN(6);
  @$pb.TagNumber(7)
  set dueDate($2.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasDueDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearDueDate() => clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureDueDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.bool get divisible => $_getBF(7);
  @$pb.TagNumber(8)
  set divisible($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDivisible() => $_has(7);
  @$pb.TagNumber(8)
  void clearDivisible() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
