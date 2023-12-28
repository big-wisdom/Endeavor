import 'package:data_models/data_models.dart';

extension CalendarEventFirestoreExtension on AbstractSingleCalendarEvent {
  Map<String, dynamic> toDocData() {
    return {
      "title": title,
      "endeavorId": endeavorReference?.id,
      "repeatingCalendarEventId": repeatingCalendarEventId,
      "start": event.start,
      "end": event.end,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "endeavorId": endeavorReference?.id,
      "repeatingCalendarEventId": repeatingCalendarEventId,
      "start": event.start.millisecondsSinceEpoch,
      "end": event.end.millisecondsSinceEpoch,
    };
  }
}
