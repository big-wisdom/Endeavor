import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';
// import 'package:server_data_models/server_data_models.dart';
import './repeating_calendar_event_data_service.dart/repeating_calendar_event_data_service.dart';

class CalendarEventDataService {
  RepeatingCalendarEventDataService repeating =
      RepeatingCalendarEventDataService();

  Stream<QueryState<List<CalendarEvent>>> get calendarEventStream =>
      GRPCDataService.instance.calendarEvents.stream;

  CalendarEventDataService() {
    calendarEventStream.listen(
        (calendarEvents) => calendarEventsSnapshot = calendarEvents.data ?? []);
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
