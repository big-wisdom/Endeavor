import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';
// import 'package:server_data_models/server_data_models.dart';
import './repeating_calendar_event_data_service.dart/repeating_calendar_event_data_service.dart';

class CalendarEventDataService {
  RepeatingCalendarEventDataService repeating =
      RepeatingCalendarEventDataService();

  Stream<List<CalendarEvent>> get calendarEventStream =>
      GRPCDataService.instance.calendarEvents.calendarEventStream;

  CalendarEventDataService() {
    calendarEventStream
        .listen((calendarEvents) => calendarEventsSnapshot = calendarEvents);
  }

  List<CalendarEvent> calendarEventsSnapshot = [];

  createCalendarEvent(UnidentifiedCalendarEvent calendarEvent) {
    GRPCDataService.instance.calendarEvents.createCalendarEvent(calendarEvent);
  }

  deleteCalendarEvent(int id) {
    GRPCDataService.instance.calendarEvents.deleteCalendarEvent(id);
  }

  updateCalendarEvent(CalendarEvent calendarEvent) {
    GRPCDataService.instance.calendarEvents.updateCalendarEvent(calendarEvent);
  }
}
