import '../generated_protos/common_models/event.pb.dart' as common_models;
import 'package:data_models/data_models.dart';

import '../generated_protos/calendar_event/service/calendar_event_service.pbgrpc.dart';
import '../generated_protos/google/protobuf/timestamp.pb.dart';

class CalendarEventDataService {
  CalendarEventClient client;
  String _userId;
  CalendarEventDataService(this.client, String userId) : _userId = userId;

  void createCalendarEvent(
    UnidentifiedCalendarEvent calendarEvent,
    String uuid,
  ) {
    client.createCalendarEvent(
      CreateCalendarEventRequest(
        event: common_models.Event(
          userId: _userId,
          id: uuid,
          title: calendarEvent.title,
          endeavorId: calendarEvent.endeavorReference?.id,
          startTime: Timestamp.fromDateTime(calendarEvent.event.start),
          endTime: Timestamp.fromDateTime(calendarEvent.event.end),
        ),
      ),
    );
  }
}
