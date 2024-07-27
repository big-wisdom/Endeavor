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
  Mutation<bool, CreateTaskRequest> _createMutation;
  String _userId;

  TasksDataService(EndeavorClient client, String userId)
      : _userId = userId,
        _createMutation = Mutation(
          refetchQueries: [EndeavorsDataService.endeavorsKey],
          queryFn: (req) => client.createTask(req).then((p0) => true),
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
}
