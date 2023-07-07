import 'abstract_single_calendar_event.dart';

class UnidentifiedCalendarEvent extends AbstractSingleCalendarEvent {
  UnidentifiedCalendarEvent({
    required super.title,
    required super.event,
    super.endeavorReference,
    super.repeatingCalendarEventId,
  });

  @override
  List<Object?> get props => [
        title,
        event,
        endeavorReference,
        repeatingCalendarEventId,
      ];
}
