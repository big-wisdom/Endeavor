import 'dart:async';

import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

import '../generated_protos/common_models/event.pb.dart' as event_proto;
import '../generated_protos/common_models/repeating_event.pb.dart'
    as repeating_event_proto;
import 'package:data_models/data_models.dart';

import '../generated_protos/google/protobuf/timestamp.pb.dart';

class CalendarEventDataService {
  EndeavorClient client;
  String _userId;
  CalendarEventDataService(this.client, String userId)
      : _userId = userId,
        calendarEventStream = client
            .subscribeToCalendarEvents(
              (StreamController<ListCalendarEventsRequest>()
                    ..add(ListCalendarEventsRequest(userId: userId)))
                  .stream,
            )
            .map(
              (listCalendarEventResponse) => listCalendarEventResponse.events
                  .map(
                    (e) => CalendarEvent(
                      id: e.id,
                      title: e.title,
                      event: Event(
                        start: e.startTime.toDateTime(toLocal: true),
                        end: e.endTime.toDateTime(toLocal: true),
                      ),
                      repeatingCalendarEventId: e.repeatingEventId,
                    ),
                  )
                  .toList(),
            )
            .asBroadcastStream();

  Stream<List<CalendarEvent>> calendarEventStream;

  void createCalendarEvent(
    UnidentifiedCalendarEvent calendarEvent,
  ) {
    client.createCalendarEvent(
      CreateCalendarEventRequest(
        event: event_proto.Event(
          userId: _userId,
          title: calendarEvent.title,
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
          repeatingEventId: calendarEvent.repeatingCalendarEventId,
          startTime: Timestamp.fromDateTime(calendarEvent.event.start),
          endTime: Timestamp.fromDateTime(calendarEvent.event.end),
        ),
      ),
    );
  }

  void deleteCalendarEvent(int id) {
    client.deleteCalendarEvent(DeleteCalendarEventRequest(
      userId: _userId,
      id: id,
    ));
  }

  void createRepeatingCalendarEvent(
    UnidentifiedRepeatingCalendarEvent urce,
  ) {
    // Convert TimeOfDay to DateTime using the current date
    final now = DateTime.now();
    final startDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      urce.repeatingEvent.startTime.hour,
      urce.repeatingEvent.endTime.minute,
    );
    final endDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      urce.repeatingEvent.endTime.hour,
      urce.repeatingEvent.endTime.minute,
    );

    // Convert local DateTime to UTC
    final utcStartDateTime = startDateTime.toUtc();
    final utcEndDateTime = endDateTime.toUtc();

    client.createRepeatingCalendarEvent(
      CreateRepeatingCalendarEventRequest(
        repeatingEvent: repeating_event_proto.RepeatingEvent(
          userId: _userId,
          title: urce.title,
          endeavorId: null, // TODO: actually add endeavorId
          startTime: repeating_event_proto.Time(
            hours: utcStartDateTime.hour,
            minutes: utcStartDateTime.minute,
          ),
          endTime: repeating_event_proto.Time(
              hours: utcEndDateTime.hour, minutes: utcEndDateTime.minute),
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

  void editThisAndFollowingCalendarEvents(CalendarEvent event) {
    client.editThisAndFollowingCalendarEvents(
      EditThisAndFollowingCalendarEventsRequest(
        event: event_proto.Event(
          userId: _userId,
          id: event.id,
          title: event.title,
          repeatingEventId: event.repeatingCalendarEventId,
          startTime: Timestamp.fromDateTime(event.event.start),
          endTime: Timestamp.fromDateTime(event.event.end),
        ),
      ),
    );
  }

  void deleteThisAndFollowingCalendarEvents(int selectedEventId) {
    client.deleteThisAndFollowingCalendarEvents(
        DeleteThisAndFollowingCalendarEventsRequest(
      userId: _userId,
      eventId: selectedEventId,
    ));
  }
}
