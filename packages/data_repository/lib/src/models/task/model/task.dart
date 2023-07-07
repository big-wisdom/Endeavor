import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    this.id,
    this.title,
    this.endeavorId,
    this.duration,
    this.minnimumSchedulingDuration,
    this.dueDate,
    this.divisible,
    this.events,
  });

  final String? id;
  final String? endeavorId;
  final String? title;
  final List<Event>? events;
  final Duration? duration;
  final Duration? minnimumSchedulingDuration;
  final DateTime? dueDate;
  final bool? divisible;

  Duration? get scheduledDuration {
    if (duration != null && events != null) {
      Duration d = Duration.zero;
      for (Event e in events!) {
        d += e.end.difference(e.start);
      }
      return d;
    } else {
      return null;
    }
  }

  Duration? get unscheduledDuration {
    if (duration != null && events != null) {
      Duration diff = duration! - scheduledDuration!;
      return diff;
    } else {
      return null;
    }
  }

  static const empty = Task(id: '');
  bool get isEmpty => this == Task.empty;
  bool get isNotEmpty => this != Task.empty;

  @override
  List<Object?> get props => [
        id,
        endeavorId,
        title,
        events,
        duration,
        minnimumSchedulingDuration,
        dueDate,
        divisible,
      ];
}
