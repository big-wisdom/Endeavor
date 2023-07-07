import 'package:data_repository/data_repository.dart';

abstract class AbstractRepeatingCalendarEvent extends AbstractCalendarEvent {
  AbstractRepeatingCalendarEvent({
    required super.title,
    required this.repeatingEvent,
    super.endeavorReference,
  }) : super(abstractEvent: repeatingEvent);

  final RepeatingEvent repeatingEvent;
}
