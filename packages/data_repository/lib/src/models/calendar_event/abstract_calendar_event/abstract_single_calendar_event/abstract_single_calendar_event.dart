import 'package:data_repository/data_repository.dart';

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
