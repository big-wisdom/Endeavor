import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class ScheduleDataService {
  Stream<QueryState<List<Schedule>>> stream =
      GRPCDataService.instance.schedules.stream;

  void createSchedule(String title) {
    GRPCDataService.instance.schedules.create(title);
  }

  void delete(int scheduleId) {
    GRPCDataService.instance.schedules.delete(scheduleId);
  }
}
