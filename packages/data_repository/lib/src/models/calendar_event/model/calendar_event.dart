import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class CalendarEvent extends Equatable {
  final Event? event;
  final String? title;
  final String? id;
  final String? endeavorId;
  final String? repeatingCalendarEventId;
  final CalendarEventType type;

  CalendarEvent({
    this.repeatingCalendarEventId,
    this.event,
    this.title,
    this.endeavorId,
    required this.type,
    this.id,
  });

  @override
  List<Object?> get props => [
        title,
        endeavorId,
        repeatingCalendarEventId,
        type,
        event,
      ];
}

enum CalendarEventType {
  single,
  repeating,
}
