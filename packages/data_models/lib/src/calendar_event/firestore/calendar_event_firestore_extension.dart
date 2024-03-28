import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';

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

  Map<String, dynamic> toSqlJson(String userId, String uuid) {
    return {
      "id": uuid,
      "userId": userId,
      "start": event.start
          .toSqlString(), // start and end are the only ones that I've thought through
      "end": event.end.toSqlString()
    };
  }
}
