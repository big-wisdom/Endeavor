import 'abstract_repeating_calendar_event.dart';

class RepeatingCalendarEvent extends AbstractRepeatingCalendarEvent {
  RepeatingCalendarEvent({
    required this.id,
    required super.title,
    required super.repeatingEvent,
    super.endeavorReference,
  });

  final int id;

  @override
  List<Object?> get props => [
        id,
        title,
        repeatingEvent,
      ];
}
