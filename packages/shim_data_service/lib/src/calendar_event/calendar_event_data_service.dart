import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';
import './repeating_calendar_event_data_service.dart/repeating_calendar_event_data_service.dart';

class CalendarEventDataService {
  RepeatingCalendarEventDataService repeating =
      RepeatingCalendarEventDataService();

  Stream<List<ServerCalendarEvent>> get calendarEventStream =>
      ServerCalendarEventDataServiceExtension.calendarEventStream;

  createCalendarEvent(UnidentifiedCalendarEvent calendarEvent) {
    ServerCalendarEventDataServiceExtension.createCalendarEvent(calendarEvent);
  }

  deleteCalendarEvent(String id, String? repeatingCalendarEventId) {
    ServerCalendarEventDataServiceExtension.deleteCalendarEvent(
        id, repeatingCalendarEventId);
  }

  updateCalendarEvent(CalendarEvent calendarEvent) {
    ServerCalendarEventDataServiceExtension.updateCalendarEvent(calendarEvent);
  }
}
