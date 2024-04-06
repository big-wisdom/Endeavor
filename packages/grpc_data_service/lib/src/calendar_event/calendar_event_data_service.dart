import 'dart:async';

import '../generated_protos/common_models/event.pb.dart' as common_models;
import 'package:data_models/data_models.dart';

import '../generated_protos/calendar_event/service/calendar_event_service.pbgrpc.dart';
import '../generated_protos/google/protobuf/timestamp.pb.dart';

class CalendarEventDataService {
  CalendarEventClient client;
  String _userId;
  CalendarEventDataService(this.client, String userId) : _userId = userId {
    final controller = StreamController<ListCalendarEventsRequest>();
    controller.add(
      ListCalendarEventsRequest(
        userId: userId,
      ),
    );

    print("About to subscribe with user ");
    calendarEventStream =
        client.subscribeToCalendarEvents(controller.stream).map(
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
            );
  }

  late Stream<List<CalendarEvent>> calendarEventStream;

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

  void updateCalendarEvent(CalendarEvent calendarEvent) {
    client.updateCalendarEvent(
      UpdateCalendarEventRequest(
        event: common_models.Event(
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
}
