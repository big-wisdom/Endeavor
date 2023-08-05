import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

class AbstractTask extends Equatable {
  final String title;
  final EndeavorReference? endeavorReference;
  final List<Event>? events;
  final Duration? duration;
  final Duration? minnimumSchedulingDuration;
  final DateTime? dueDate;
  final bool? divisible;

  AbstractTask({
    required this.title,
    required this.endeavorReference,
    required this.events,
    required this.duration,
    required this.minnimumSchedulingDuration,
    required this.dueDate,
    required this.divisible,
  });

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

  @override
  List<Object?> get props => [
        duration,
        minnimumSchedulingDuration,
        dueDate,
        divisible,
        title,
        endeavorReference,
        events,
      ];
}
