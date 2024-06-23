import 'package:grpc/grpc.dart';
import 'package:grpc_data_service/src/endeavor/endeavors_data_service.dart';
import 'package:grpc_data_service/src/endeavor_blocks/endeavor_blocks_data_service.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';
import 'package:grpc_data_service/src/week_view_event/week_view_event_data_service.dart';
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
  late WeekViewEventDataService weekViewEvents;

  String _baseUrl = "localhost";
  int _port = 8080;

  init(String userId) async {
    final client = EndeavorClient(ClientChannel(
      _baseUrl,
      port: _port,

      ///use credentials: ChannelCredentials.insecure() if you want to connect without Tls
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),

      ///use this if you are connecting with Tls
      // options: const ChannelOptions(),
    ));
    calendarEvents = CalendarEventDataService(client, userId);
    endeavorBlocks = EndeavorBlocksDataService(client, userId);
    endeavors = EndeavorsDataService(client, userId);
    weekViewEvents = WeekViewEventDataService(client, userId);
  }
}
