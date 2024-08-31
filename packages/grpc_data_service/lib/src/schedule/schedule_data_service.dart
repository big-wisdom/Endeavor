import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class ScheduleDataService {
  Mutation<bool, CreateScheduleRequest> _createMutation;
  Mutation<bool, DeleteScheduleRequest> _deleteMutation;
  Query<List<Schedule>> _query;
  static const String schedulesKey = "schedules";

  ScheduleDataService(EndeavorClient client, String userId)
      : _query = Query(
            key: schedulesKey,
            queryFn: () => client
                .listSchedules(ListSchedulesRequest(userId: userId))
                .then((res) => res.schedules
                    .map((s) => Schedule(id: s.id, title: s.title))
                    .toList())),
        _createMutation = Mutation(
            refetchQueries: [schedulesKey],
            queryFn: (req) => client
                .createSchedule(
                  CreateScheduleRequest(
                    userId: userId,
                    title: req.title,
                  ),
                )
                .then((s) => true)),
        _deleteMutation = Mutation(
          refetchQueries: [schedulesKey],
          queryFn: (req) => client.deleteSchedule(req).then((s) => true),
        );

  Stream<QueryState<List<Schedule>>> get stream => _query.stream;

  void create(String title) {
    _createMutation.mutate(
      CreateScheduleRequest(
        title: title,
      ),
    );
  }

  void delete(int id) {
    _deleteMutation.mutate(DeleteScheduleRequest(scheduleId: id));
  }
}
