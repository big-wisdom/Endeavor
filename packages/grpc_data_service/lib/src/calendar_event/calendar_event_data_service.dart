import 'dart:async';
import 'dart:ui';

import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:grpc_data_service/src/generated_protos/endeavor/service/endeavor_service.pbgrpc.dart';

import '../generated_protos/common_models/event.pb.dart' as event_proto;
import '../generated_protos/common_models/repeating_event.pb.dart'
    as repeating_event_proto;
import 'package:data_models/data_models.dart';

import '../generated_protos/google/protobuf/timestamp.pb.dart';
import '../generated_protos/common_models/endeavorReference.pb.dart' as ProtoER;
import '../generated_protos/common_models/event.pb.dart' as ProtoEvent;

class CalendarEventDataService {
  String _userId;
  Query<List<ProtoEvent.Event>> _query;
  // Event Mutations
  Mutation<bool, CreateEventRequest> _createMutation;
  Mutation<bool, UpdateEventRequest> _updateMutation;
  Mutation<bool, DeleteEventRequest> _deleteMutation;

  // Repeating Event Mutations
  Mutation<bool, CreateRepeatingEventRequest> _createRepeationMutation;
  Mutation<bool, EditThisAndFollowingEventsRequest>
      _editThisAndFollowingMutation;
  Mutation<bool, DeleteThisAndFollowingEventsRequest>
      _deleteThisAndFollowingMutation;

  static const eventsQueryId = 'events';

  CalendarEventDataService(EndeavorClient client, String userId)
      : _userId = userId,
        _query = Query(
          key: eventsQueryId,
          queryFn: () {
            return client.listEvents(ListEventsRequest(userId: userId)).then(
              (listCalendarEventResponse) {
                return listCalendarEventResponse.events.toList();
              },
            );
          },
        ),
        _createMutation = Mutation(
          refetchQueries: [eventsQueryId],
          queryFn: (createEventRequest) =>
              client.createEvent(createEventRequest).then((v) => true),
        ),
        _updateMutation = Mutation(
          refetchQueries: [eventsQueryId],
          queryFn: (updateEventRequest) {
            return client.updateEvent(updateEventRequest).then((v) {
              return true;
            });
          },
        ),
        _deleteMutation = Mutation(
          refetchQueries: [eventsQueryId],
          queryFn: (deleteEventRequest) =>
              client.deleteEvent(deleteEventRequest).then((v) => true),
        ),
        _createRepeationMutation = Mutation(
          refetchQueries: [eventsQueryId],
          queryFn: (createRepeatingRequest) => client
              .createRepeatingEvent(createRepeatingRequest)
              .then((v) => true),
        ),
        _editThisAndFollowingMutation = Mutation(
          refetchQueries: [eventsQueryId],
          queryFn: (editThisAndFollowingRequest) => client
              .editThisAndFollowingEvents(editThisAndFollowingRequest)
              .then((v) => true),
        ),
        _deleteThisAndFollowingMutation = Mutation(
          refetchQueries: [eventsQueryId],
          queryFn: (deleteThisAndFollowingRequest) => client
              .deleteThisAndFollowingEvents(deleteThisAndFollowingRequest)
              .then((v) => true),
        );

  Stream<QueryState<List<CalendarEvent>>> get stream => _query.stream.map(
        (qs) => QueryState(
            timeCreated: DateTime.now(),
            data: qs.data
                ?.map(
                  (e) => CalendarEvent(
                    id: e.id,
                    title: e.title,
                    endeavorReference: e.hasEndeavorReference()
                        ? EndeavorReference(
                            title: e.endeavorReference.title,
                            id: e.endeavorReference.id,
                          )
                        : null,
                    event: Event(
                      start: e.startTime.toDateTime(toLocal: true),
                      end: e.endTime.toDateTime(toLocal: true),
                    ),
                    repeatingCalendarEventId:
                        e.repeatingEventId == 0 ? null : e.repeatingEventId,
                  ),
                )
                .toList()),
      );

  Stream<QueryState<List<WeekViewEvent>>> get weekViewEvents =>
      _query.stream.map(
        (resp) => QueryState(
          timeCreated: DateTime.now(),
          data: resp.data
              ?.map(
                (e) => WeekViewEvent(
                  id: e.id,
                  title: e.title,
                  endeavorReference: e.hasEndeavorReference()
                      ? EndeavorReference(
                          title: e.endeavorReference.title,
                          id: e.endeavorReference.id,
                        )
                      : null,
                  repeatingEventId:
                      e.repeatingEventId == 0 ? null : e.repeatingEventId,
                  backgroundColor: e.color == 0 ? null : Color(e.color),
                  start: e.startTime.toDateTime(toLocal: true),
                  end: e.endTime.toDateTime(toLocal: true),
                  isEndeavorBlock: e.isEndeavorBlock,
                  taskId: e.taskId == 0 ? null : e.taskId,
                ),
              )
              .toList(),
        ),
      );

  void createCalendarEvent(
    UnidentifiedCalendarEvent calendarEvent,
  ) {
    _createMutation.mutate(
      CreateEventRequest(
        event: event_proto.Event(
          userId: _userId,
          title: calendarEvent.title,
          endeavorReference: calendarEvent.endeavorReference != null
              ? ProtoER.EndeavorReference(
                  id: calendarEvent.endeavorReference!.id,
                  title: calendarEvent.endeavorReference!.title,
                )
              : null,
          startTime: Timestamp.fromDateTime(calendarEvent.event.start),
          endTime: Timestamp.fromDateTime(calendarEvent.event.end),
        ),
      ),
    );
  }

  void updateCalendarEvent(CalendarEvent calendarEvent) {
    _updateMutation.mutate(
      UpdateEventRequest(
        event: event_proto.Event(
          userId: _userId,
          id: calendarEvent.id,
          title: calendarEvent.title,
          endeavorReference: calendarEvent.endeavorReference != null
              ? ProtoER.EndeavorReference(
                  title: calendarEvent.endeavorReference!.title,
                  id: calendarEvent.endeavorReference!.id,
                )
              : null,
          repeatingEventId: calendarEvent.repeatingCalendarEventId,
          startTime: Timestamp.fromDateTime(calendarEvent.event.start),
          endTime: Timestamp.fromDateTime(calendarEvent.event.end),
        ),
      ),
    );
  }

  void deleteCalendarEvent(int id) {
    _deleteMutation.mutate(DeleteEventRequest(
      userId: _userId,
      id: id,
    ));
  }

  void createRepeatingCalendarEvent(UnidentifiedRepeatingCalendarEvent urce,
      {bool isEndeavorBlock = false}) {
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
    final req = CreateRepeatingEventRequest(
      repeatingEvent: repeating_event_proto.RepeatingEvent(
        userId: _userId,
        title: urce.title,
        isEndeavorBlock: isEndeavorBlock,
        endeavorId: urce.endeavorReference?.id,
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
    );
    _createRepeationMutation.mutate(
      req,
    );
  }

  void editThisAndFollowingCalendarEvents(CalendarEvent event,
      {bool isEndeavorBlock = false}) {
    _editThisAndFollowingMutation.mutate(
      EditThisAndFollowingEventsRequest(
        event: event_proto.Event(
          userId: _userId,
          id: event.id,
          title: event.title,
          isEndeavorBlock: isEndeavorBlock,
          repeatingEventId: event.repeatingCalendarEventId,
          startTime: Timestamp.fromDateTime(event.event.start),
          endTime: Timestamp.fromDateTime(event.event.end),
        ),
      ),
    );
  }

  void deleteThisAndFollowingCalendarEvents(int selectedEventId) {
    _deleteThisAndFollowingMutation.mutate(DeleteThisAndFollowingEventsRequest(
      userId: _userId,
      eventId: selectedEventId,
    ));
  }
}
