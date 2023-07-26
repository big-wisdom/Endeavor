import 'package:data_models/data_models.dart';

abstract class AbstractRepeatingCalendarEvent extends AbstractCalendarEvent {
  AbstractRepeatingCalendarEvent({
    required super.title,
    required this.repeatingEvent,
    super.endeavorReference,
  }) : super(abstractEvent: repeatingEvent);

  final RepeatingEvent repeatingEvent;
}
