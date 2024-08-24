import 'package:grpc_data_service/grpc_data_service.dart';

class ScheduleDataService {
  void createSchedule(String title) {
    GRPCDataService.instance.schedules.create(title);
  }
}
