import 'abstract_single_calendar_event.dart';

class CalendarEvent extends AbstractSingleCalendarEvent {
  CalendarEvent({
    required this.id,
    required super.title,
    required super.event,
    super.endeavorReference,
    super.repeatingCalendarEventId,
  });

  final String id;

  @override
  List<Object?> get props => [
        id,
        title,
        event,
        endeavorReference,
        repeatingCalendarEventId,
      ];
}
