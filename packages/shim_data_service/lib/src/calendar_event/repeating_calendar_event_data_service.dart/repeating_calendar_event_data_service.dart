import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class RepeatingCalendarEventDataService {
  createRepeatingCalendarEvent(UnidentifiedRepeatingCalendarEvent urce) {
    GRPCDataService.instance.calendarEvents.createRepeatingCalendarEvent(urce);
  }

  editThisAndFollowingCalendarEvent({
    required CalendarEvent calendarEvent,
  }) async {
    RepeatingCalendarEventDataServiceExtension
        .editThisAndFollowingCalendarEvent(calendarEvent: calendarEvent);
  }

  deleteThisAndFollowingCalendarEvents({
    required String repeatingCalendarEventId,
    required String selectedCalendarEventId,
  }) async {
    RepeatingCalendarEventDataServiceExtension
        .deleteThisAndFollowingCalendarEvents(
            repeatingCalendarEventId: repeatingCalendarEventId,
            selectedCalendarEventId: selectedCalendarEventId);
  }
}
