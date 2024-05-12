import 'package:grpc/grpc.dart';
import './generated_protos/calendar_event/service/calendar_event_service.pbgrpc.dart';
import './calendar_event/calendar_event_data_service.dart';

// this is a singleton class that is meant to be initialized before it is ever
// used as it has a late calendarEvents field.
class GRPCDataService {
  // singleton stuff
  GRPCDataService._internal();
  factory GRPCDataService() => instance;
  static GRPCDataService instance = GRPCDataService._internal(); // init once

  late CalendarEventDataService calendarEvents;

  String _baseUrl = "localhost";
  int _port = 8080;

  init(String userId) async {
    calendarEvents = CalendarEventDataService(
      CalendarEventClient(ClientChannel(
        _baseUrl,
        port: _port,

        ///use credentials: ChannelCredentials.insecure() if you want to connect without Tls
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure()),

        ///use this if you are connecting with Tls
        // options: const ChannelOptions(),
      )),
      userId,
    );
  }
}
