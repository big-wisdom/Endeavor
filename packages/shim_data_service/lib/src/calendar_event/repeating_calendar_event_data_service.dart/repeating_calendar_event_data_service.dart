import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';

class RepeatingCalendarEventDataService {
  static createRepeatingCalendarEvent(UnidentifiedRepeatingCalendarEvent urce) {
    RepeatingCalendarEventDataServiceExtension.createRepeatingCalendarEvent(
        urce);
  }

  static editThisAndFollowingCalendarEvent({
    required CalendarEvent calendarEvent,
  }) async {
    RepeatingCalendarEventDataServiceExtension
        .editThisAndFollowingCalendarEvent(calendarEvent: calendarEvent);
  }

  static deleteThisAndFollowingCalendarEvents({
    required String repeatingCalendarEventId,
    required String selectedCalendarEventId,
  }) async {
    RepeatingCalendarEventDataServiceExtension
        .deleteThisAndFollowingCalendarEvents(
            repeatingCalendarEventId: repeatingCalendarEventId,
            selectedCalendarEventId: selectedCalendarEventId);
  }
}
