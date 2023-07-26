import 'package:data_models/data_models.dart';

abstract class AbstractSingleCalendarEvent extends AbstractCalendarEvent {
  AbstractSingleCalendarEvent({
    required super.title,
    required this.event,
    super.endeavorReference,
    this.repeatingCalendarEventId,
  }) : super(abstractEvent: event);

  final Event event;
  final String? repeatingCalendarEventId;
}
