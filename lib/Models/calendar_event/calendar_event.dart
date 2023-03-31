import 'package:endeavor/Models/event/event.dart';

class CalendarEvent {
  Event? event;
  String? title;
  String? endeavorId;
  String? repeatingCalendarEventId;
  CalendarEventType type;

  CalendarEvent({this.event, this.title, this.endeavorId, required this.type});

  Map<String, dynamic>? toDocData() {
    if (validate()) {
      return {
        "title": title,
        "endeavorId": endeavorId,
        "repeatingCalendarEventId": repeatingCalendarEventId,
        "type": type.toString(),
        "start": event!.start!,
        "end": event!.end!,
      };
    } else {
      return null;
    }
  }

  // endeavorId not included in validation
  bool validate() {
    return event != null &&
        event!.validate() &&
        title != null &&
        title!.trim().isNotEmpty;
  }
}

enum CalendarEventType {
  single,
  repeating,
}
