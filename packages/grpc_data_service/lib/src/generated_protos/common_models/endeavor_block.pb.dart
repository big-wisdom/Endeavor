//
//  Generated code. Do not modify.
//  source: common_models/endeavor_block.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'event.pb.dart' as $4;

class EndeavorBlock extends $pb.GeneratedMessage {
  factory EndeavorBlock({
    $core.String? id,
    $4.Event? event,
    $core.int? repeatingEndeavorBlockId,
    $core.int? endeavorId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (event != null) {
      $result.event = event;
    }
    if (repeatingEndeavorBlockId != null) {
      $result.repeatingEndeavorBlockId = repeatingEndeavorBlockId;
    }
    if (endeavorId != null) {
      $result.endeavorId = endeavorId;
    }
    return $result;
  }
  EndeavorBlock._() : super();
  factory EndeavorBlock.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EndeavorBlock.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EndeavorBlock', package: const $pb.PackageName(_omitMessageNames ? '' : 'common_models'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$4.Event>(2, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'repeatingEndeavorBlockId', $pb.PbFieldType.O3, protoName: 'repeatingEndeavorBlockId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'endeavorId', $pb.PbFieldType.O3, protoName: 'endeavorId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EndeavorBlock clone() => EndeavorBlock()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EndeavorBlock copyWith(void Function(EndeavorBlock) updates) => super.copyWith((message) => updates(message as EndeavorBlock)) as EndeavorBlock;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EndeavorBlock create() => EndeavorBlock._();
  EndeavorBlock createEmptyInstance() => create();
  static $pb.PbList<EndeavorBlock> createRepeated() => $pb.PbList<EndeavorBlock>();
  @$core.pragma('dart2js:noInline')
  static EndeavorBlock getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EndeavorBlock>(create);
  static EndeavorBlock? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $4.Event get event => $_getN(1);
  @$pb.TagNumber(2)
  set event($4.Event v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearEvent() => clearField(2);
  @$pb.TagNumber(2)
  $4.Event ensureEvent() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get repeatingEndeavorBlockId => $_getIZ(2);
  @$pb.TagNumber(3)
  set repeatingEndeavorBlockId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRepeatingEndeavorBlockId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepeatingEndeavorBlockId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get endeavorId => $_getIZ(3);
  @$pb.TagNumber(4)
  set endeavorId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndeavorId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndeavorId() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
