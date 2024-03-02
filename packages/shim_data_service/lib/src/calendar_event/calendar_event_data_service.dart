import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';
import './repeating_calendar_event_data_service.dart/repeating_calendar_event_data_service.dart';

class CalendarEventDataService {
  static RepeatingCalendarEventDataService repeating =
      RepeatingCalendarEventDataService();

  static Stream<List<ServerCalendarEvent>> get calendarEventStream =>
      ServerCalendarEventDataServiceExtension.calendarEventStream;

  static void createCalendarEvent(UnidentifiedCalendarEvent calendarEvent) {
    ServerCalendarEventDataServiceExtension.createCalendarEvent(calendarEvent);
  }

  static deleteCalendarEvent(String id, String? repeatingCalendarEventId) {
    ServerCalendarEventDataServiceExtension.deleteCalendarEvent(
        id, repeatingCalendarEventId);
  }

  static updateCalendarEvent(CalendarEvent calendarEvent) {
    ServerCalendarEventDataServiceExtension.updateCalendarEvent(calendarEvent);
  }
}
