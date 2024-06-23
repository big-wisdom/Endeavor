import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class WeekViewEventDataService {
  Stream<List<WeekViewEvent>> eventStream =
      GRPCDataService.instance.weekViewEvents.eventsStream;
}
