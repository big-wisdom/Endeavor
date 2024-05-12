import 'dart:async';

import '../generated_protos/common_models/event.pb.dart' as event_proto;
import '../generated_protos/common_models/repeating_event.pb.dart'
    as repeating_event_proto;
import 'package:data_models/data_models.dart';

import '../generated_protos/calendar_event/service/calendar_event_service.pbgrpc.dart';
import '../generated_protos/google/protobuf/timestamp.pb.dart';

class CalendarEventDataService {
  CalendarEventClient client;
  String _userId;
  CalendarEventDataService(this.client, String userId)
      : _userId = userId,
        calendarEventStream = client
            .subscribeToCalendarEvents(
                (StreamController<ListCalendarEventsRequest>()
                      ..add(ListCalendarEventsRequest(userId: userId)))
                    .stream)
            .map(
              (listCalendarEventResponse) => listCalendarEventResponse.events
                  .map(
                    (e) => CalendarEvent(
                      id: e.id,
                      title: e.title,
                      event: Event(
                        start: e.startTime.toDateTime(),
                        end: e.endTime.toDateTime(),
                      ),
                    ),
                  )
                  .toList(),
            )
            .asBroadcastStream();

  Stream<List<CalendarEvent>> calendarEventStream;

  void createCalendarEvent(
    UnidentifiedCalendarEvent calendarEvent,
    String uuid,
  ) {
    client.createCalendarEvent(
      CreateCalendarEventRequest(
        event: event_proto.Event(
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

  void updateCalendarEvent(CalendarEvent calendarEvent) {
    client.updateCalendarEvent(
      UpdateCalendarEventRequest(
        event: event_proto.Event(
          userId: _userId,
          id: calendarEvent.id,
          title: calendarEvent.title,
          endeavorId: calendarEvent.endeavorReference?.id,
          startTime: Timestamp.fromDateTime(calendarEvent.event.start),
          endTime: Timestamp.fromDateTime(calendarEvent.event.end),
        ),
      ),
    );
  }

  void deleteCalendarEvent(String id) {
    client.deleteCalendarEvent(
      DeleteCalendarEventRequest(
        userId: _userId,
        id: id,
      ),
    );
  }

  void createRepeatingCalendarEvent(
      UnidentifiedRepeatingCalendarEvent urce, String id) {
    client.createRepeatingCalendarEvent(
      CreateRepeatingCalendarEventRequest(
        repeatingEvent: repeating_event_proto.RepeatingEvent(
          userId: _userId,
          id: id,
          title: urce.title,
          startTime: repeating_event_proto.Time(
              hours: urce.repeatingEvent.startTime.hour,
              minutes: urce.repeatingEvent.startTime.minute),
          endTime: repeating_event_proto.Time(
              hours: urce.repeatingEvent.endTime.hour,
              minutes: urce.repeatingEvent.endTime.minute),
          startDate: Timestamp.fromDateTime(urce.repeatingEvent.startDate),
          endDate: Timestamp.fromDateTime(urce.repeatingEvent.endDate),
          m: urce.repeatingEvent.daysOfWeek[0],
          t: urce.repeatingEvent.daysOfWeek[1],
          w: urce.repeatingEvent.daysOfWeek[2],
          th: urce.repeatingEvent.daysOfWeek[3],
          f: urce.repeatingEvent.daysOfWeek[4],
          s: urce.repeatingEvent.daysOfWeek[5],
          su: urce.repeatingEvent.daysOfWeek[6],
        ),
      ),
    );
  }
}
