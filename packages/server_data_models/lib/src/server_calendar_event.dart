import 'server_event.dart';

class ServerCalendarEvent {
  const ServerCalendarEvent({
    required this.id,
    required this.title,
    required this.serverEvent,
    this.endeavorId,
    this.repeatingCalendarEventId,
  });

  final String id;
  final String title;
  final ServerEvent serverEvent;
  final String? endeavorId;
  final String? repeatingCalendarEventId;
}
