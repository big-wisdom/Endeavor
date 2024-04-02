import 'package:authentication_repository/authentication_repository.dart';
import 'package:grpc/grpc.dart';
import './generated_protos/calendar_event/service/calendar_event_service.pbgrpc.dart';
import './calendar_event/calendar_event_data_service.dart';

class GRPCDataService {
  // singleton stuff
  GRPCDataService._internal();
  factory GRPCDataService() => instance;
  static GRPCDataService instance = GRPCDataService._internal(); // init once

  String _baseUrl = "localhost";
  int _port = 8080;
  Future<void> init(Stream<User> userStream) async {
    userStream.listen((user) async {
      // reset channel if there is one already
      if (_channel != null) {
        await _channel!.shutdown();
        _channel = null;
      }

      _initializeSubServices(user.id);
    });
  }

  static ClientChannel? _channel;
  late CalendarEventDataService calendarEvents;

  _initializeSubServices(String userId) {
    final channel = ClientChannel(
      _baseUrl,

      port: _port,

      ///use credentials: ChannelCredentials.insecure() if you want to connect without Tls
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),

      ///use this if you are connecting with Tls
      // options: const ChannelOptions(),
    );

    _channel = channel;
    calendarEvents =
        CalendarEventDataService(CalendarEventClient(channel), userId);
  }
}
