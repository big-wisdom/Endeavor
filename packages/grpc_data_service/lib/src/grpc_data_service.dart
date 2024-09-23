import 'package:authentication_repository/authentication_repository.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_data_service/src/endeavor/endeavors_data_service.dart';
import 'package:grpc_data_service/src/endeavor_blocks/endeavor_blocks_data_service.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';
import 'package:grpc_data_service/src/auth_interceptor.dart';
import 'package:grpc_data_service/src/tasks/tasks_data_service.dart';
import './calendar_event/calendar_event_data_service.dart';

// this is a singleton class that is meant to be initialized before it is ever
// used as it has a late calendarEvents field.
class GRPCDataService {
  // singleton stuff
  GRPCDataService._internal();
  factory GRPCDataService() => instance;
  static GRPCDataService instance = GRPCDataService._internal(); // init once

  late CalendarEventDataService calendarEvents;
  late EndeavorBlocksDataService endeavorBlocks;
  late EndeavorsDataService endeavors;
  late TasksDataService tasks;

  // String _baseUrl = "localhost";
  // int _port = 8080;
  String _baseUrl = "endeavor-go-wtqda5pveq-uc.a.run.app";
  int _port = 443;

  init(User user) async {
    print("Initializing GRPC client to port: $_port");
    final client = EndeavorClient(
      ClientChannel(
        _baseUrl,
        port: _port,
        options: ChannelOptions(credentials: ChannelCredentials.secure()),
      ),
      interceptors: [AuthInterceptor(user.accessToken)],
    );
    calendarEvents = CalendarEventDataService(client, user.id);
    endeavorBlocks = EndeavorBlocksDataService(client, user.id);
    endeavors = EndeavorsDataService(client, user.id);
    tasks = TasksDataService(client, user.id);
  }
}
