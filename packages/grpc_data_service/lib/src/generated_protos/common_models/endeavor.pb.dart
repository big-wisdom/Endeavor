//
//  Generated code. Do not modify.
//  source: common_models/endeavor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'endeavorReference.pb.dart' as $3;
import 'task.pb.dart' as $5;

class Endeavor extends $pb.GeneratedMessage {
  factory Endeavor({
    $core.String? userId,
    $core.int? id,
    $core.String? title,
    $core.int? parentEndeavorId,
    $core.Iterable<$3.EndeavorReference>? subEndeavorReferences,
    $core.Iterable<$5.Task>? task,
    $core.int? color,
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
    if (parentEndeavorId != null) {
      $result.parentEndeavorId = parentEndeavorId;
    }
    if (subEndeavorReferences != null) {
      $result.subEndeavorReferences.addAll(subEndeavorReferences);
    }
    if (task != null) {
      $result.task.addAll(task);
    }
    if (color != null) {
      $result.color = color;
    }
    return $result;
  }
  Endeavor._() : super();
  factory Endeavor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Endeavor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Endeavor', package: const $pb.PackageName(_omitMessageNames ? '' : 'common_models'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'parentEndeavorId', $pb.PbFieldType.O3, protoName: 'parentEndeavorId')
    ..pc<$3.EndeavorReference>(5, _omitFieldNames ? '' : 'subEndeavorReferences', $pb.PbFieldType.PM, protoName: 'subEndeavorReferences', subBuilder: $3.EndeavorReference.create)
    ..pc<$5.Task>(6, _omitFieldNames ? '' : 'task', $pb.PbFieldType.PM, subBuilder: $5.Task.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'color', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Endeavor clone() => Endeavor()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Endeavor copyWith(void Function(Endeavor) updates) => super.copyWith((message) => updates(message as Endeavor)) as Endeavor;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Endeavor create() => Endeavor._();
  Endeavor createEmptyInstance() => create();
  static $pb.PbList<Endeavor> createRepeated() => $pb.PbList<Endeavor>();
  @$core.pragma('dart2js:noInline')
  static Endeavor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Endeavor>(create);
  static Endeavor? _defaultInstance;

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
  $core.int get parentEndeavorId => $_getIZ(3);
  @$pb.TagNumber(4)
  set parentEndeavorId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasParentEndeavorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearParentEndeavorId() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$3.EndeavorReference> get subEndeavorReferences => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$5.Task> get task => $_getList(5);

  @$pb.TagNumber(7)
  $core.int get color => $_getIZ(6);
  @$pb.TagNumber(7)
  set color($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearColor() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
