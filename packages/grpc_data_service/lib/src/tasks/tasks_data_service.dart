import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/endeavor/endeavors_data_service.dart';
import 'package:grpc_data_service/src/generated_protos/common_models/task.pb.dart'
    as task_proto;
import 'package:grpc_data_service/src/generated_protos/common_models/endeavorReference.pb.dart'
    as endeavor_ref_proto;
import 'package:grpc_data_service/src/generated_protos/common_models/event.pb.dart'
    as event_proto;
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';
import 'package:grpc_data_service/src/generated_protos/google/protobuf/timestamp.pb.dart';

class TasksDataService {
  Query<List<task_proto.Task>> _query;
  Mutation<bool, CreateTaskRequest> _createMutation;
  Mutation<bool, DeleteTaskRequest> _deleteMutation;
  String _userId;

  static String tasksKey = "tasks";

  TasksDataService(EndeavorClient client, String userId)
      : _userId = userId,
        _query = Query(
          key: tasksKey,
          queryFn: () {
            return client.listTasks(ListTasksRequest(userId: userId)).then(
              (listTasksResponse) {
                return listTasksResponse.tasks.toList();
              },
            );
          },
        ),
        _createMutation = Mutation(
          refetchQueries: [EndeavorsDataService.endeavorsKey, tasksKey],
          queryFn: (req) => client.createTask(req).then((p0) => true),
        ),
        _deleteMutation = Mutation(
          refetchQueries: [tasksKey, EndeavorsDataService.endeavorsKey],
          queryFn: (arg) => client.deleteTask(arg).then((p) => true),
        );

  Stream<QueryState<List<Task>>> get stream => _query.stream.map(
        (qs) => QueryState(
            timeCreated: DateTime.now(),
            data: qs.data
                ?.map(
                  (t) => Task(
                    id: t.id,
                    title: t.title,
                    endeavorReference: t.hasEndeavorReference()
                        ? EndeavorReference(
                            title: t.endeavorReference.title,
                            id: t.endeavorReference.id)
                        : null,
                    events: t.events
                        .map(
                          (e) => Event(
                            start: e.startTime.toDateTime(toLocal: true),
                            end: e.endTime.toDateTime(
                              toLocal: true,
                            ),
                          ),
                        )
                        .toList(),
                    duration:
                        t.hasDuration() ? Duration(minutes: t.duration) : null,
                    minnimumSchedulingDuration:
                        t.hasMinnimumSchedulingDuration()
                            ? Duration(minutes: t.minnimumSchedulingDuration)
                            : null,
                    dueDate: t.hasDueDate()
                        ? t.dueDate.toDateTime(toLocal: true)
                        : null,
                    divisible: t.divisible,
                  ),
                )
                .toList()),
      );

  void create(UnidentifiedTask task) {
    _createMutation.mutate(
      CreateTaskRequest(
        userId: _userId,
        task: task_proto.Task(
          title: task.title,
          endeavorReference: task.endeavorReference != null
              ? endeavor_ref_proto.EndeavorReference(
                  id: task.endeavorReference!.id,
                  title: task.endeavorReference!.title,
                )
              : null,
          events: task.events
              ?.map(
                (e) => event_proto.Event(
                  userId: _userId,
                  title: task.title,
                  endeavorReference: task.endeavorReference != null
                      ? endeavor_ref_proto.EndeavorReference(
                          id: task.endeavorReference!.id,
                          title: task.endeavorReference!.title,
                        )
                      : null,
                  startTime: Timestamp.fromDateTime(e.start),
                  endTime: Timestamp.fromDateTime(e.end),
                  isEndeavorBlock: false,
                  hoursOffset: DateTime.now().timeZoneOffset.inHours,
                ),
              )
              .toList(),
          duration: task.duration?.inMinutes,
          minnimumSchedulingDuration:
              task.minnimumSchedulingDuration?.inMinutes,
          divisible: task.divisible ?? false,
        ),
      ),
    );
  }

  void delete(int taskId) {
    _deleteMutation.mutate(DeleteTaskRequest(taskId: taskId));
  }
}
