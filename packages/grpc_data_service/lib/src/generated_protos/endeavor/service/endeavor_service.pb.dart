//
//  Generated code. Do not modify.
//  source: endeavor/service/endeavor_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../common_models/endeavor.pb.dart' as $6;
import '../../common_models/event.pb.dart' as $4;
import '../../common_models/repeating_event.pb.dart' as $7;
import '../../common_models/task.pb.dart' as $5;

class ListEndeavorsResponse extends $pb.GeneratedMessage {
  factory ListEndeavorsResponse({
    $core.Iterable<$6.Endeavor>? endeavors,
  }) {
    final $result = create();
    if (endeavors != null) {
      $result.endeavors.addAll(endeavors);
    }
    return $result;
  }
  ListEndeavorsResponse._() : super();
  factory ListEndeavorsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEndeavorsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEndeavorsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..pc<$6.Endeavor>(1, _omitFieldNames ? '' : 'endeavors', $pb.PbFieldType.PM, subBuilder: $6.Endeavor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEndeavorsResponse clone() => ListEndeavorsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEndeavorsResponse copyWith(void Function(ListEndeavorsResponse) updates) => super.copyWith((message) => updates(message as ListEndeavorsResponse)) as ListEndeavorsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEndeavorsResponse create() => ListEndeavorsResponse._();
  ListEndeavorsResponse createEmptyInstance() => create();
  static $pb.PbList<ListEndeavorsResponse> createRepeated() => $pb.PbList<ListEndeavorsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListEndeavorsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEndeavorsResponse>(create);
  static ListEndeavorsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$6.Endeavor> get endeavors => $_getList(0);
}

class ListEndeavorsRequest extends $pb.GeneratedMessage {
  factory ListEndeavorsRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  ListEndeavorsRequest._() : super();
  factory ListEndeavorsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEndeavorsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEndeavorsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEndeavorsRequest clone() => ListEndeavorsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEndeavorsRequest copyWith(void Function(ListEndeavorsRequest) updates) => super.copyWith((message) => updates(message as ListEndeavorsRequest)) as ListEndeavorsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEndeavorsRequest create() => ListEndeavorsRequest._();
  ListEndeavorsRequest createEmptyInstance() => create();
  static $pb.PbList<ListEndeavorsRequest> createRepeated() => $pb.PbList<ListEndeavorsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListEndeavorsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEndeavorsRequest>(create);
  static ListEndeavorsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class CreateEndeavorRequest extends $pb.GeneratedMessage {
  factory CreateEndeavorRequest({
    $core.String? userId,
    $core.String? endeavorTitle,
    $core.int? parentEndeavorId,
    $core.int? color,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (endeavorTitle != null) {
      $result.endeavorTitle = endeavorTitle;
    }
    if (parentEndeavorId != null) {
      $result.parentEndeavorId = parentEndeavorId;
    }
    if (color != null) {
      $result.color = color;
    }
    return $result;
  }
  CreateEndeavorRequest._() : super();
  factory CreateEndeavorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEndeavorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEndeavorRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'endeavorTitle', protoName: 'endeavorTitle')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'parentEndeavorId', $pb.PbFieldType.O3, protoName: 'parentEndeavorId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'color', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEndeavorRequest clone() => CreateEndeavorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEndeavorRequest copyWith(void Function(CreateEndeavorRequest) updates) => super.copyWith((message) => updates(message as CreateEndeavorRequest)) as CreateEndeavorRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEndeavorRequest create() => CreateEndeavorRequest._();
  CreateEndeavorRequest createEmptyInstance() => create();
  static $pb.PbList<CreateEndeavorRequest> createRepeated() => $pb.PbList<CreateEndeavorRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateEndeavorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEndeavorRequest>(create);
  static CreateEndeavorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get endeavorTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set endeavorTitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndeavorTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndeavorTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get parentEndeavorId => $_getIZ(2);
  @$pb.TagNumber(3)
  set parentEndeavorId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasParentEndeavorId() => $_has(2);
  @$pb.TagNumber(3)
  void clearParentEndeavorId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get color => $_getIZ(3);
  @$pb.TagNumber(4)
  set color($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasColor() => $_has(3);
  @$pb.TagNumber(4)
  void clearColor() => clearField(4);
}

class UpdateEndeavorRequest extends $pb.GeneratedMessage {
  factory UpdateEndeavorRequest({
    $6.Endeavor? endeavor,
  }) {
    final $result = create();
    if (endeavor != null) {
      $result.endeavor = endeavor;
    }
    return $result;
  }
  UpdateEndeavorRequest._() : super();
  factory UpdateEndeavorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEndeavorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEndeavorRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$6.Endeavor>(1, _omitFieldNames ? '' : 'endeavor', subBuilder: $6.Endeavor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEndeavorRequest clone() => UpdateEndeavorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEndeavorRequest copyWith(void Function(UpdateEndeavorRequest) updates) => super.copyWith((message) => updates(message as UpdateEndeavorRequest)) as UpdateEndeavorRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEndeavorRequest create() => UpdateEndeavorRequest._();
  UpdateEndeavorRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateEndeavorRequest> createRepeated() => $pb.PbList<UpdateEndeavorRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateEndeavorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEndeavorRequest>(create);
  static UpdateEndeavorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Endeavor get endeavor => $_getN(0);
  @$pb.TagNumber(1)
  set endeavor($6.Endeavor v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEndeavor() => $_has(0);
  @$pb.TagNumber(1)
  void clearEndeavor() => clearField(1);
  @$pb.TagNumber(1)
  $6.Endeavor ensureEndeavor() => $_ensure(0);
}

class DeleteEndeavorRequest extends $pb.GeneratedMessage {
  factory DeleteEndeavorRequest({
    $core.String? userId,
    $core.int? endeavorId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (endeavorId != null) {
      $result.endeavorId = endeavorId;
    }
    return $result;
  }
  DeleteEndeavorRequest._() : super();
  factory DeleteEndeavorRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteEndeavorRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteEndeavorRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'endeavorId', $pb.PbFieldType.O3, protoName: 'endeavorId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteEndeavorRequest clone() => DeleteEndeavorRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteEndeavorRequest copyWith(void Function(DeleteEndeavorRequest) updates) => super.copyWith((message) => updates(message as DeleteEndeavorRequest)) as DeleteEndeavorRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteEndeavorRequest create() => DeleteEndeavorRequest._();
  DeleteEndeavorRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteEndeavorRequest> createRepeated() => $pb.PbList<DeleteEndeavorRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteEndeavorRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteEndeavorRequest>(create);
  static DeleteEndeavorRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get endeavorId => $_getIZ(1);
  @$pb.TagNumber(2)
  set endeavorId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndeavorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndeavorId() => clearField(2);
}

class CreateTaskRequest extends $pb.GeneratedMessage {
  factory CreateTaskRequest({
    $core.String? userId,
    $5.Task? task,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (task != null) {
      $result.task = task;
    }
    return $result;
  }
  CreateTaskRequest._() : super();
  factory CreateTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<$5.Task>(2, _omitFieldNames ? '' : 'task', subBuilder: $5.Task.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskRequest clone() => CreateTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskRequest copyWith(void Function(CreateTaskRequest) updates) => super.copyWith((message) => updates(message as CreateTaskRequest)) as CreateTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest create() => CreateTaskRequest._();
  CreateTaskRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskRequest> createRepeated() => $pb.PbList<CreateTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskRequest>(create);
  static CreateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $5.Task get task => $_getN(1);
  @$pb.TagNumber(2)
  set task($5.Task v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);
  @$pb.TagNumber(2)
  $5.Task ensureTask() => $_ensure(1);
}

class UpdateTaskRequest extends $pb.GeneratedMessage {
  factory UpdateTaskRequest({
    $core.String? userId,
    $5.Task? task,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (task != null) {
      $result.task = task;
    }
    return $result;
  }
  UpdateTaskRequest._() : super();
  factory UpdateTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOM<$5.Task>(2, _omitFieldNames ? '' : 'task', subBuilder: $5.Task.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTaskRequest clone() => UpdateTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTaskRequest copyWith(void Function(UpdateTaskRequest) updates) => super.copyWith((message) => updates(message as UpdateTaskRequest)) as UpdateTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTaskRequest create() => UpdateTaskRequest._();
  UpdateTaskRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTaskRequest> createRepeated() => $pb.PbList<UpdateTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTaskRequest>(create);
  static UpdateTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $5.Task get task => $_getN(1);
  @$pb.TagNumber(2)
  set task($5.Task v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);
  @$pb.TagNumber(2)
  $5.Task ensureTask() => $_ensure(1);
}

class DeleteTaskRequest extends $pb.GeneratedMessage {
  factory DeleteTaskRequest({
    $core.String? userId,
    $core.int? taskId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (taskId != null) {
      $result.taskId = taskId;
    }
    return $result;
  }
  DeleteTaskRequest._() : super();
  factory DeleteTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'taskId', $pb.PbFieldType.O3, protoName: 'taskId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskRequest clone() => DeleteTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskRequest copyWith(void Function(DeleteTaskRequest) updates) => super.copyWith((message) => updates(message as DeleteTaskRequest)) as DeleteTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskRequest create() => DeleteTaskRequest._();
  DeleteTaskRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskRequest> createRepeated() => $pb.PbList<DeleteTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskRequest>(create);
  static DeleteTaskRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get taskId => $_getIZ(1);
  @$pb.TagNumber(2)
  set taskId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTaskId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTaskId() => clearField(2);
}

class DeleteThisAndFollowingCalendarEventsRequest extends $pb.GeneratedMessage {
  factory DeleteThisAndFollowingCalendarEventsRequest({
    $core.String? userId,
    $core.String? eventId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (eventId != null) {
      $result.eventId = eventId;
    }
    return $result;
  }
  DeleteThisAndFollowingCalendarEventsRequest._() : super();
  factory DeleteThisAndFollowingCalendarEventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteThisAndFollowingCalendarEventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteThisAndFollowingCalendarEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'eventId', protoName: 'eventId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteThisAndFollowingCalendarEventsRequest clone() => DeleteThisAndFollowingCalendarEventsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteThisAndFollowingCalendarEventsRequest copyWith(void Function(DeleteThisAndFollowingCalendarEventsRequest) updates) => super.copyWith((message) => updates(message as DeleteThisAndFollowingCalendarEventsRequest)) as DeleteThisAndFollowingCalendarEventsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteThisAndFollowingCalendarEventsRequest create() => DeleteThisAndFollowingCalendarEventsRequest._();
  DeleteThisAndFollowingCalendarEventsRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteThisAndFollowingCalendarEventsRequest> createRepeated() => $pb.PbList<DeleteThisAndFollowingCalendarEventsRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteThisAndFollowingCalendarEventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteThisAndFollowingCalendarEventsRequest>(create);
  static DeleteThisAndFollowingCalendarEventsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get eventId => $_getSZ(1);
  @$pb.TagNumber(2)
  set eventId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventId() => clearField(2);
}

class DeleteRepeatingCalendarEventRequest extends $pb.GeneratedMessage {
  factory DeleteRepeatingCalendarEventRequest({
    $core.String? repeatingCalendarEventId,
  }) {
    final $result = create();
    if (repeatingCalendarEventId != null) {
      $result.repeatingCalendarEventId = repeatingCalendarEventId;
    }
    return $result;
  }
  DeleteRepeatingCalendarEventRequest._() : super();
  factory DeleteRepeatingCalendarEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRepeatingCalendarEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRepeatingCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'repeatingCalendarEventId', protoName: 'repeatingCalendarEventId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRepeatingCalendarEventRequest clone() => DeleteRepeatingCalendarEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRepeatingCalendarEventRequest copyWith(void Function(DeleteRepeatingCalendarEventRequest) updates) => super.copyWith((message) => updates(message as DeleteRepeatingCalendarEventRequest)) as DeleteRepeatingCalendarEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRepeatingCalendarEventRequest create() => DeleteRepeatingCalendarEventRequest._();
  DeleteRepeatingCalendarEventRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRepeatingCalendarEventRequest> createRepeated() => $pb.PbList<DeleteRepeatingCalendarEventRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRepeatingCalendarEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRepeatingCalendarEventRequest>(create);
  static DeleteRepeatingCalendarEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get repeatingCalendarEventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set repeatingCalendarEventId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRepeatingCalendarEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepeatingCalendarEventId() => clearField(1);
}

class EditThisAndFollowingCalendarEventsRequest extends $pb.GeneratedMessage {
  factory EditThisAndFollowingCalendarEventsRequest({
    $4.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  EditThisAndFollowingCalendarEventsRequest._() : super();
  factory EditThisAndFollowingCalendarEventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditThisAndFollowingCalendarEventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditThisAndFollowingCalendarEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditThisAndFollowingCalendarEventsRequest clone() => EditThisAndFollowingCalendarEventsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditThisAndFollowingCalendarEventsRequest copyWith(void Function(EditThisAndFollowingCalendarEventsRequest) updates) => super.copyWith((message) => updates(message as EditThisAndFollowingCalendarEventsRequest)) as EditThisAndFollowingCalendarEventsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditThisAndFollowingCalendarEventsRequest create() => EditThisAndFollowingCalendarEventsRequest._();
  EditThisAndFollowingCalendarEventsRequest createEmptyInstance() => create();
  static $pb.PbList<EditThisAndFollowingCalendarEventsRequest> createRepeated() => $pb.PbList<EditThisAndFollowingCalendarEventsRequest>();
  @$core.pragma('dart2js:noInline')
  static EditThisAndFollowingCalendarEventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditThisAndFollowingCalendarEventsRequest>(create);
  static EditThisAndFollowingCalendarEventsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $4.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($4.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $4.Event ensureEvent() => $_ensure(0);
}

class EditRepeatingCalendarEventRequest extends $pb.GeneratedMessage {
  factory EditRepeatingCalendarEventRequest({
    $7.RepeatingEvent? repeatingEvent,
  }) {
    final $result = create();
    if (repeatingEvent != null) {
      $result.repeatingEvent = repeatingEvent;
    }
    return $result;
  }
  EditRepeatingCalendarEventRequest._() : super();
  factory EditRepeatingCalendarEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditRepeatingCalendarEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditRepeatingCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$7.RepeatingEvent>(1, _omitFieldNames ? '' : 'repeatingEvent', protoName: 'repeatingEvent', subBuilder: $7.RepeatingEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditRepeatingCalendarEventRequest clone() => EditRepeatingCalendarEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditRepeatingCalendarEventRequest copyWith(void Function(EditRepeatingCalendarEventRequest) updates) => super.copyWith((message) => updates(message as EditRepeatingCalendarEventRequest)) as EditRepeatingCalendarEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditRepeatingCalendarEventRequest create() => EditRepeatingCalendarEventRequest._();
  EditRepeatingCalendarEventRequest createEmptyInstance() => create();
  static $pb.PbList<EditRepeatingCalendarEventRequest> createRepeated() => $pb.PbList<EditRepeatingCalendarEventRequest>();
  @$core.pragma('dart2js:noInline')
  static EditRepeatingCalendarEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditRepeatingCalendarEventRequest>(create);
  static EditRepeatingCalendarEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $7.RepeatingEvent get repeatingEvent => $_getN(0);
  @$pb.TagNumber(1)
  set repeatingEvent($7.RepeatingEvent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRepeatingEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepeatingEvent() => clearField(1);
  @$pb.TagNumber(1)
  $7.RepeatingEvent ensureRepeatingEvent() => $_ensure(0);
}

class CreateCalendarEventRequest extends $pb.GeneratedMessage {
  factory CreateCalendarEventRequest({
    $4.Event? event,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
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
  $4.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($4.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $4.Event ensureEvent() => $_ensure(0);
}

class CreateCalendarEventResponse extends $pb.GeneratedMessage {
  factory CreateCalendarEventResponse({
    $4.Event? event,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCalendarEventResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
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
  $4.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($4.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $4.Event ensureEvent() => $_ensure(0);
}

class CreateRepeatingCalendarEventRequest extends $pb.GeneratedMessage {
  factory CreateRepeatingCalendarEventRequest({
    $7.RepeatingEvent? repeatingEvent,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRepeatingCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$7.RepeatingEvent>(1, _omitFieldNames ? '' : 'repeatingEvent', protoName: 'repeatingEvent', subBuilder: $7.RepeatingEvent.create)
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
  $7.RepeatingEvent get repeatingEvent => $_getN(0);
  @$pb.TagNumber(1)
  set repeatingEvent($7.RepeatingEvent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRepeatingEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepeatingEvent() => clearField(1);
  @$pb.TagNumber(1)
  $7.RepeatingEvent ensureRepeatingEvent() => $_ensure(0);
}

class UpdateCalendarEventRequest extends $pb.GeneratedMessage {
  factory UpdateCalendarEventRequest({
    $4.Event? event,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
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
  $4.Event get event => $_getN(0);
  @$pb.TagNumber(1)
  set event($4.Event v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);
  @$pb.TagNumber(1)
  $4.Event ensureEvent() => $_ensure(0);
}

class DeleteCalendarEventRequest extends $pb.GeneratedMessage {
  factory DeleteCalendarEventRequest({
    $core.String? userId,
    $core.int? id,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCalendarEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
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
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCalendarEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
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
    $core.Iterable<$4.Event>? events,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCalendarEventsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..pc<$4.Event>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: $4.Event.create)
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
  $core.List<$4.Event> get events => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
