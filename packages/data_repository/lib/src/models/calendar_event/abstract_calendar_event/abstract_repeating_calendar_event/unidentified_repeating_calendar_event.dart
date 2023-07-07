import 'abstract_repeating_calendar_event.dart';

class UnidentifiedRepeatingCalendarEvent
    extends AbstractRepeatingCalendarEvent {
  UnidentifiedRepeatingCalendarEvent({
    required super.title,
    required super.repeatingEvent,
    super.endeavorReference,
  });

  @override
  List<Object?> get props => [title, repeatingEvent];
}
