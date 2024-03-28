import 'package:authentication_repository/authentication_repository.dart';

import './calendar_event/calendar_event_data_service.dart';

class CachedQueryDataService {
  static String? _userId;
  static String get userId {
    _checkId();
    return _userId!;
  }

  static void _checkId() {
    if (_userId == null) throw Exception("Yo, no userId found");
  }

  CachedQueryDataService(Stream<User> userStream) {
    userStream.listen((user) => _userId = user.id);
  }

  static CalendarEventDataService calendarEvents = CalendarEventDataService();
}
