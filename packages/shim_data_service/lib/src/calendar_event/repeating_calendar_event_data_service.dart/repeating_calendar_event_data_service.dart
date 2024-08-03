import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class RepeatingCalendarEventDataService {
  createRepeatingCalendarEvent(UnidentifiedRepeatingCalendarEvent urce) {
    GRPCDataService.instance.calendarEvents.createRepeatingCalendarEvent(urce);
  }

  editThisAndFollowingCalendarEvent({
    required CalendarEvent calendarEvent,
  }) async {
    GRPCDataService.instance.calendarEvents
        .editThisAndFollowingCalendarEvents(calendarEvent);
  }

  deleteThisAndFollowingCalendarEvents({
    required int selectedCalendarEventId,
  }) async {
    GRPCDataService.instance.calendarEvents
        .deleteThisAndFollowingCalendarEvents(selectedCalendarEventId);
  }
}
