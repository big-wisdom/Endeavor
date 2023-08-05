import 'package:data_models/data_models.dart';

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

  factory ServerTask.fromTask(Task task) {
    return ServerTask(
      id: task.id,
      title: task.title,
      endeavorId: task.endeavorReference?.id,
      dueDate: task.dueDate,
      duration: task.duration,
      minnimumSchedulingDuration: task.minnimumSchedulingDuration,
      divisible: task.divisible,
      events: task.events
          ?.map((e) => ServerEvent(start: e.start, end: e.end))
          .toList(),
    );
  }

  final String id;
  final String title;
  final String? endeavorId;
  final Duration? duration;
  final Duration? minnimumSchedulingDuration;
  final DateTime? dueDate;
  final bool? divisible;
  final List<ServerEvent>? events;
}
