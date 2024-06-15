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
    GRPCDataService.instance.calendarEvents
        .editThisAndFollowingCalendarEvents(calendarEvent);
  }

  deleteThisAndFollowingCalendarEvents({
    required String selectedCalendarEventId,
  }) async {
    // GRPCDataService.instance.calendarEvents.del
    print("can't do that yet");
  }
}
