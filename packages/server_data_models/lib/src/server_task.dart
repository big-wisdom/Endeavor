import 'server_event.dart';

class ServerTask {
  const ServerTask({
    required this.id,
    required this.title,
    this.endeavorId,
    this.duration,
    this.minnimumSchedulingDuration,
    this.dueDate,
    this.divisible,
    this.events,
  });

  final String id;
  final String title;
  final String? endeavorId;
  final Duration? duration;
  final Duration? minnimumSchedulingDuration;
  final DateTime? dueDate;
  final bool? divisible;
  final List<ServerEvent>? events;
}
