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

class CreateScheduleRequest extends $pb.GeneratedMessage {
  factory CreateScheduleRequest({
    $core.String? userId,
    $core.String? title,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (title != null) {
      $result.title = title;
    }
    return $result;
  }
  CreateScheduleRequest._() : super();
  factory CreateScheduleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateScheduleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateScheduleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateScheduleRequest clone() => CreateScheduleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateScheduleRequest copyWith(void Function(CreateScheduleRequest) updates) => super.copyWith((message) => updates(message as CreateScheduleRequest)) as CreateScheduleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateScheduleRequest create() => CreateScheduleRequest._();
  CreateScheduleRequest createEmptyInstance() => create();
  static $pb.PbList<CreateScheduleRequest> createRepeated() => $pb.PbList<CreateScheduleRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateScheduleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateScheduleRequest>(create);
  static CreateScheduleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class AddEventToTaskRequest extends $pb.GeneratedMessage {
  factory AddEventToTaskRequest({
    $4.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  AddEventToTaskRequest._() : super();
  factory AddEventToTaskRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddEventToTaskRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddEventToTaskRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddEventToTaskRequest clone() => AddEventToTaskRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddEventToTaskRequest copyWith(void Function(AddEventToTaskRequest) updates) => super.copyWith((message) => updates(message as AddEventToTaskRequest)) as AddEventToTaskRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddEventToTaskRequest create() => AddEventToTaskRequest._();
  AddEventToTaskRequest createEmptyInstance() => create();
  static $pb.PbList<AddEventToTaskRequest> createRepeated() => $pb.PbList<AddEventToTaskRequest>();
  @$core.pragma('dart2js:noInline')
  static AddEventToTaskRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddEventToTaskRequest>(create);
  static AddEventToTaskRequest? _defaultInstance;

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

class ListTasksRequest extends $pb.GeneratedMessage {
  factory ListTasksRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  ListTasksRequest._() : super();
  factory ListTasksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTasksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTasksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTasksRequest clone() => ListTasksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTasksRequest copyWith(void Function(ListTasksRequest) updates) => super.copyWith((message) => updates(message as ListTasksRequest)) as ListTasksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksRequest create() => ListTasksRequest._();
  ListTasksRequest createEmptyInstance() => create();
  static $pb.PbList<ListTasksRequest> createRepeated() => $pb.PbList<ListTasksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTasksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTasksRequest>(create);
  static ListTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class ListTasksResponse extends $pb.GeneratedMessage {
  factory ListTasksResponse({
    $core.Iterable<$5.Task>? tasks,
  }) {
    final $result = create();
    if (tasks != null) {
      $result.tasks.addAll(tasks);
    }
    return $result;
  }
  ListTasksResponse._() : super();
  factory ListTasksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTasksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListTasksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..pc<$5.Task>(1, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: $5.Task.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTasksResponse clone() => ListTasksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTasksResponse copyWith(void Function(ListTasksResponse) updates) => super.copyWith((message) => updates(message as ListTasksResponse)) as ListTasksResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListTasksResponse create() => ListTasksResponse._();
  ListTasksResponse createEmptyInstance() => create();
  static $pb.PbList<ListTasksResponse> createRepeated() => $pb.PbList<ListTasksResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTasksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTasksResponse>(create);
  static ListTasksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$5.Task> get tasks => $_getList(0);
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

class DeleteThisAndFollowingEventsRequest extends $pb.GeneratedMessage {
  factory DeleteThisAndFollowingEventsRequest({
    $core.String? userId,
    $core.int? eventId,
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
  DeleteThisAndFollowingEventsRequest._() : super();
  factory DeleteThisAndFollowingEventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteThisAndFollowingEventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteThisAndFollowingEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'eventId', $pb.PbFieldType.O3, protoName: 'eventId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteThisAndFollowingEventsRequest clone() => DeleteThisAndFollowingEventsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteThisAndFollowingEventsRequest copyWith(void Function(DeleteThisAndFollowingEventsRequest) updates) => super.copyWith((message) => updates(message as DeleteThisAndFollowingEventsRequest)) as DeleteThisAndFollowingEventsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteThisAndFollowingEventsRequest create() => DeleteThisAndFollowingEventsRequest._();
  DeleteThisAndFollowingEventsRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteThisAndFollowingEventsRequest> createRepeated() => $pb.PbList<DeleteThisAndFollowingEventsRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteThisAndFollowingEventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteThisAndFollowingEventsRequest>(create);
  static DeleteThisAndFollowingEventsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get eventId => $_getIZ(1);
  @$pb.TagNumber(2)
  set eventId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEventId() => $_has(1);
  @$pb.TagNumber(2)
  void clearEventId() => clearField(2);
}

class DeleteRepeatingEventRequest extends $pb.GeneratedMessage {
  factory DeleteRepeatingEventRequest({
    $core.String? repeatingEventId,
  }) {
    final $result = create();
    if (repeatingEventId != null) {
      $result.repeatingEventId = repeatingEventId;
    }
    return $result;
  }
  DeleteRepeatingEventRequest._() : super();
  factory DeleteRepeatingEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteRepeatingEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteRepeatingEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'repeatingEventId', protoName: 'repeatingEventId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteRepeatingEventRequest clone() => DeleteRepeatingEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteRepeatingEventRequest copyWith(void Function(DeleteRepeatingEventRequest) updates) => super.copyWith((message) => updates(message as DeleteRepeatingEventRequest)) as DeleteRepeatingEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteRepeatingEventRequest create() => DeleteRepeatingEventRequest._();
  DeleteRepeatingEventRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteRepeatingEventRequest> createRepeated() => $pb.PbList<DeleteRepeatingEventRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteRepeatingEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteRepeatingEventRequest>(create);
  static DeleteRepeatingEventRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get repeatingEventId => $_getSZ(0);
  @$pb.TagNumber(1)
  set repeatingEventId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRepeatingEventId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepeatingEventId() => clearField(1);
}

class EditThisAndFollowingEventsRequest extends $pb.GeneratedMessage {
  factory EditThisAndFollowingEventsRequest({
    $4.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  EditThisAndFollowingEventsRequest._() : super();
  factory EditThisAndFollowingEventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditThisAndFollowingEventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditThisAndFollowingEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditThisAndFollowingEventsRequest clone() => EditThisAndFollowingEventsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditThisAndFollowingEventsRequest copyWith(void Function(EditThisAndFollowingEventsRequest) updates) => super.copyWith((message) => updates(message as EditThisAndFollowingEventsRequest)) as EditThisAndFollowingEventsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditThisAndFollowingEventsRequest create() => EditThisAndFollowingEventsRequest._();
  EditThisAndFollowingEventsRequest createEmptyInstance() => create();
  static $pb.PbList<EditThisAndFollowingEventsRequest> createRepeated() => $pb.PbList<EditThisAndFollowingEventsRequest>();
  @$core.pragma('dart2js:noInline')
  static EditThisAndFollowingEventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditThisAndFollowingEventsRequest>(create);
  static EditThisAndFollowingEventsRequest? _defaultInstance;

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

class EditRepeatingEventRequest extends $pb.GeneratedMessage {
  factory EditRepeatingEventRequest({
    $7.RepeatingEvent? repeatingEvent,
  }) {
    final $result = create();
    if (repeatingEvent != null) {
      $result.repeatingEvent = repeatingEvent;
    }
    return $result;
  }
  EditRepeatingEventRequest._() : super();
  factory EditRepeatingEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditRepeatingEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditRepeatingEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$7.RepeatingEvent>(1, _omitFieldNames ? '' : 'repeatingEvent', protoName: 'repeatingEvent', subBuilder: $7.RepeatingEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditRepeatingEventRequest clone() => EditRepeatingEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditRepeatingEventRequest copyWith(void Function(EditRepeatingEventRequest) updates) => super.copyWith((message) => updates(message as EditRepeatingEventRequest)) as EditRepeatingEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditRepeatingEventRequest create() => EditRepeatingEventRequest._();
  EditRepeatingEventRequest createEmptyInstance() => create();
  static $pb.PbList<EditRepeatingEventRequest> createRepeated() => $pb.PbList<EditRepeatingEventRequest>();
  @$core.pragma('dart2js:noInline')
  static EditRepeatingEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditRepeatingEventRequest>(create);
  static EditRepeatingEventRequest? _defaultInstance;

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

class CreateEventRequest extends $pb.GeneratedMessage {
  factory CreateEventRequest({
    $4.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  CreateEventRequest._() : super();
  factory CreateEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEventRequest clone() => CreateEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEventRequest copyWith(void Function(CreateEventRequest) updates) => super.copyWith((message) => updates(message as CreateEventRequest)) as CreateEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEventRequest create() => CreateEventRequest._();
  CreateEventRequest createEmptyInstance() => create();
  static $pb.PbList<CreateEventRequest> createRepeated() => $pb.PbList<CreateEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEventRequest>(create);
  static CreateEventRequest? _defaultInstance;

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

class CreateEventResponse extends $pb.GeneratedMessage {
  factory CreateEventResponse({
    $4.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  CreateEventResponse._() : super();
  factory CreateEventResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateEventResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateEventResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateEventResponse clone() => CreateEventResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateEventResponse copyWith(void Function(CreateEventResponse) updates) => super.copyWith((message) => updates(message as CreateEventResponse)) as CreateEventResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateEventResponse create() => CreateEventResponse._();
  CreateEventResponse createEmptyInstance() => create();
  static $pb.PbList<CreateEventResponse> createRepeated() => $pb.PbList<CreateEventResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateEventResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateEventResponse>(create);
  static CreateEventResponse? _defaultInstance;

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

class CreateRepeatingEventRequest extends $pb.GeneratedMessage {
  factory CreateRepeatingEventRequest({
    $7.RepeatingEvent? repeatingEvent,
  }) {
    final $result = create();
    if (repeatingEvent != null) {
      $result.repeatingEvent = repeatingEvent;
    }
    return $result;
  }
  CreateRepeatingEventRequest._() : super();
  factory CreateRepeatingEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRepeatingEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateRepeatingEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$7.RepeatingEvent>(1, _omitFieldNames ? '' : 'repeatingEvent', protoName: 'repeatingEvent', subBuilder: $7.RepeatingEvent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRepeatingEventRequest clone() => CreateRepeatingEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRepeatingEventRequest copyWith(void Function(CreateRepeatingEventRequest) updates) => super.copyWith((message) => updates(message as CreateRepeatingEventRequest)) as CreateRepeatingEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRepeatingEventRequest create() => CreateRepeatingEventRequest._();
  CreateRepeatingEventRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRepeatingEventRequest> createRepeated() => $pb.PbList<CreateRepeatingEventRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRepeatingEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRepeatingEventRequest>(create);
  static CreateRepeatingEventRequest? _defaultInstance;

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

class UpdateEventRequest extends $pb.GeneratedMessage {
  factory UpdateEventRequest({
    $4.Event? event,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    return $result;
  }
  UpdateEventRequest._() : super();
  factory UpdateEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOM<$4.Event>(1, _omitFieldNames ? '' : 'event', subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateEventRequest clone() => UpdateEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateEventRequest copyWith(void Function(UpdateEventRequest) updates) => super.copyWith((message) => updates(message as UpdateEventRequest)) as UpdateEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateEventRequest create() => UpdateEventRequest._();
  UpdateEventRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateEventRequest> createRepeated() => $pb.PbList<UpdateEventRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateEventRequest>(create);
  static UpdateEventRequest? _defaultInstance;

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

class DeleteEventRequest extends $pb.GeneratedMessage {
  factory DeleteEventRequest({
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
  DeleteEventRequest._() : super();
  factory DeleteEventRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteEventRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteEventRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteEventRequest clone() => DeleteEventRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteEventRequest copyWith(void Function(DeleteEventRequest) updates) => super.copyWith((message) => updates(message as DeleteEventRequest)) as DeleteEventRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteEventRequest create() => DeleteEventRequest._();
  DeleteEventRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteEventRequest> createRepeated() => $pb.PbList<DeleteEventRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteEventRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteEventRequest>(create);
  static DeleteEventRequest? _defaultInstance;

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

class ListEventsRequest extends $pb.GeneratedMessage {
  factory ListEventsRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  ListEventsRequest._() : super();
  factory ListEventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEventsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEventsRequest clone() => ListEventsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEventsRequest copyWith(void Function(ListEventsRequest) updates) => super.copyWith((message) => updates(message as ListEventsRequest)) as ListEventsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEventsRequest create() => ListEventsRequest._();
  ListEventsRequest createEmptyInstance() => create();
  static $pb.PbList<ListEventsRequest> createRepeated() => $pb.PbList<ListEventsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListEventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEventsRequest>(create);
  static ListEventsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class ListEventsResponse extends $pb.GeneratedMessage {
  factory ListEventsResponse({
    $core.Iterable<$4.Event>? events,
  }) {
    final $result = create();
    if (events != null) {
      $result.events.addAll(events);
    }
    return $result;
  }
  ListEventsResponse._() : super();
  factory ListEventsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEventsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListEventsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'endeavor.service'), createEmptyInstance: create)
    ..pc<$4.Event>(1, _omitFieldNames ? '' : 'events', $pb.PbFieldType.PM, subBuilder: $4.Event.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListEventsResponse clone() => ListEventsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListEventsResponse copyWith(void Function(ListEventsResponse) updates) => super.copyWith((message) => updates(message as ListEventsResponse)) as ListEventsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListEventsResponse create() => ListEventsResponse._();
  ListEventsResponse createEmptyInstance() => create();
  static $pb.PbList<ListEventsResponse> createRepeated() => $pb.PbList<ListEventsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListEventsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEventsResponse>(create);
  static ListEventsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.Event> get events => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
