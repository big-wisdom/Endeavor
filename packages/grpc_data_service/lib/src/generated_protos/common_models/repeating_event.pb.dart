//
//  Generated code. Do not modify.
//  source: common_models/repeating_event.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../google/protobuf/timestamp.pb.dart' as $3;

class RepeatingEvent extends $pb.GeneratedMessage {
  factory RepeatingEvent({
    $core.String? userId,
    $core.int? id,
    $core.String? title,
    $core.bool? isEndeavorBlock,
    $core.int? endeavorId,
    Time? startTime,
    Time? endTime,
    $3.Timestamp? startDate,
    $3.Timestamp? endDate,
    $core.bool? m,
    $core.bool? t,
    $core.bool? w,
    $core.bool? th,
    $core.bool? f,
    $core.bool? s,
    $core.bool? su,
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
    if (isEndeavorBlock != null) {
      $result.isEndeavorBlock = isEndeavorBlock;
    }
    if (endeavorId != null) {
      $result.endeavorId = endeavorId;
    }
    if (startTime != null) {
      $result.startTime = startTime;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (startDate != null) {
      $result.startDate = startDate;
    }
    if (endDate != null) {
      $result.endDate = endDate;
    }
    if (m != null) {
      $result.m = m;
    }
    if (t != null) {
      $result.t = t;
    }
    if (w != null) {
      $result.w = w;
    }
    if (th != null) {
      $result.th = th;
    }
    if (f != null) {
      $result.f = f;
    }
    if (s != null) {
      $result.s = s;
    }
    if (su != null) {
      $result.su = su;
    }
    return $result;
  }
  RepeatingEvent._() : super();
  factory RepeatingEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RepeatingEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RepeatingEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'common_models'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOB(4, _omitFieldNames ? '' : 'isEndeavorBlock', protoName: 'isEndeavorBlock')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'endeavorId', $pb.PbFieldType.O3, protoName: 'endeavorId')
    ..aOM<Time>(6, _omitFieldNames ? '' : 'startTime', protoName: 'startTime', subBuilder: Time.create)
    ..aOM<Time>(7, _omitFieldNames ? '' : 'endTime', protoName: 'endTime', subBuilder: Time.create)
    ..aOM<$3.Timestamp>(8, _omitFieldNames ? '' : 'startDate', protoName: 'startDate', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(9, _omitFieldNames ? '' : 'endDate', protoName: 'endDate', subBuilder: $3.Timestamp.create)
    ..aOB(10, _omitFieldNames ? '' : 'm')
    ..aOB(11, _omitFieldNames ? '' : 't')
    ..aOB(12, _omitFieldNames ? '' : 'w')
    ..aOB(13, _omitFieldNames ? '' : 'th')
    ..aOB(14, _omitFieldNames ? '' : 'f')
    ..aOB(15, _omitFieldNames ? '' : 's')
    ..aOB(16, _omitFieldNames ? '' : 'su')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RepeatingEvent clone() => RepeatingEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RepeatingEvent copyWith(void Function(RepeatingEvent) updates) => super.copyWith((message) => updates(message as RepeatingEvent)) as RepeatingEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RepeatingEvent create() => RepeatingEvent._();
  RepeatingEvent createEmptyInstance() => create();
  static $pb.PbList<RepeatingEvent> createRepeated() => $pb.PbList<RepeatingEvent>();
  @$core.pragma('dart2js:noInline')
  static RepeatingEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RepeatingEvent>(create);
  static RepeatingEvent? _defaultInstance;

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
  $core.bool get isEndeavorBlock => $_getBF(3);
  @$pb.TagNumber(4)
  set isEndeavorBlock($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsEndeavorBlock() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsEndeavorBlock() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get endeavorId => $_getIZ(4);
  @$pb.TagNumber(5)
  set endeavorId($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndeavorId() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndeavorId() => clearField(5);

  @$pb.TagNumber(6)
  Time get startTime => $_getN(5);
  @$pb.TagNumber(6)
  set startTime(Time v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStartTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearStartTime() => clearField(6);
  @$pb.TagNumber(6)
  Time ensureStartTime() => $_ensure(5);

  @$pb.TagNumber(7)
  Time get endTime => $_getN(6);
  @$pb.TagNumber(7)
  set endTime(Time v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasEndTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEndTime() => clearField(7);
  @$pb.TagNumber(7)
  Time ensureEndTime() => $_ensure(6);

  @$pb.TagNumber(8)
  $3.Timestamp get startDate => $_getN(7);
  @$pb.TagNumber(8)
  set startDate($3.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStartDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearStartDate() => clearField(8);
  @$pb.TagNumber(8)
  $3.Timestamp ensureStartDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $3.Timestamp get endDate => $_getN(8);
  @$pb.TagNumber(9)
  set endDate($3.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasEndDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearEndDate() => clearField(9);
  @$pb.TagNumber(9)
  $3.Timestamp ensureEndDate() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.bool get m => $_getBF(9);
  @$pb.TagNumber(10)
  set m($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasM() => $_has(9);
  @$pb.TagNumber(10)
  void clearM() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get t => $_getBF(10);
  @$pb.TagNumber(11)
  set t($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasT() => $_has(10);
  @$pb.TagNumber(11)
  void clearT() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get w => $_getBF(11);
  @$pb.TagNumber(12)
  set w($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasW() => $_has(11);
  @$pb.TagNumber(12)
  void clearW() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get th => $_getBF(12);
  @$pb.TagNumber(13)
  set th($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasTh() => $_has(12);
  @$pb.TagNumber(13)
  void clearTh() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get f => $_getBF(13);
  @$pb.TagNumber(14)
  set f($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasF() => $_has(13);
  @$pb.TagNumber(14)
  void clearF() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get s => $_getBF(14);
  @$pb.TagNumber(15)
  set s($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasS() => $_has(14);
  @$pb.TagNumber(15)
  void clearS() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get su => $_getBF(15);
  @$pb.TagNumber(16)
  set su($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasSu() => $_has(15);
  @$pb.TagNumber(16)
  void clearSu() => clearField(16);
}

class Time extends $pb.GeneratedMessage {
  factory Time({
    $core.int? hours,
    $core.int? minutes,
  }) {
    final $result = create();
    if (hours != null) {
      $result.hours = hours;
    }
    if (minutes != null) {
      $result.minutes = minutes;
    }
    return $result;
  }
  Time._() : super();
  factory Time.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Time.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Time', package: const $pb.PackageName(_omitMessageNames ? '' : 'common_models'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hours', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'minutes', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Time clone() => Time()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Time copyWith(void Function(Time) updates) => super.copyWith((message) => updates(message as Time)) as Time;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Time create() => Time._();
  Time createEmptyInstance() => create();
  static $pb.PbList<Time> createRepeated() => $pb.PbList<Time>();
  @$core.pragma('dart2js:noInline')
  static Time getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Time>(create);
  static Time? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hours => $_getIZ(0);
  @$pb.TagNumber(1)
  set hours($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHours() => $_has(0);
  @$pb.TagNumber(1)
  void clearHours() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minutes => $_getIZ(1);
  @$pb.TagNumber(2)
  set minutes($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinutes() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinutes() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
