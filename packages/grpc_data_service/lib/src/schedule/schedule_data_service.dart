import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

class ScheduleDataService {
  EndeavorClient _client;
  String _userId;

  ScheduleDataService(EndeavorClient client, String userId)
      : _client = client,
        _userId = userId;

  void create(String title) {
    _client.createSchedule(
      CreateScheduleRequest(
        userId: _userId,
        title: title,
      ),
    );
  }
}
