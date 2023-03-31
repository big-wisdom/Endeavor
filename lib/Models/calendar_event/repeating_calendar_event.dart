import 'package:endeavor/Models/calendar_event/calendar_event.dart';
import 'package:endeavor/Models/event/repeating_event.dart';

class RepeatingCalendarEvent {
  String? id;
  RepeatingEvent? repeatingEvent;
  List<String>? calendarEventIds;
  String? title;
  String? endeavorId;

  RepeatingCalendarEvent({
    this.title,
    this.repeatingEvent,
    this.calendarEventIds,
    this.endeavorId,
  });

  Map<String, dynamic>? toDocData() {
    if (calendarEventIds != null) {
      return {
        "calendarEventIds": calendarEventIds,
      };
    } else {
      return null;
    }
  }

  List<CalendarEvent>? _calendarEvents;
  List<CalendarEvent>? get calendarEvents {
    if (_calendarEvents != null) return _calendarEvents;

    if (title != null &&
        title!.isNotEmpty &&
        repeatingEvent != null &&
        repeatingEvent!.validate() &&
        repeatingEvent!.events != null) {
      _calendarEvents = repeatingEvent!.events!
          .map((e) => CalendarEvent(
              title: title,
              type: CalendarEventType.repeating,
              event: e,
              endeavorId: endeavorId))
          .toList();
      return _calendarEvents;
    } else {
      return null;
    }
  }
}
