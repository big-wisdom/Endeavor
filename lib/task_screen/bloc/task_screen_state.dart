part of "task_screen_bloc.dart";

class TaskScreenState extends Equatable with FormzMixin {
  const TaskScreenState({
    this.title = const Title.pure(),
    this.endeavorId = const EndeavorId.pure(null),
    this.durationField = const DurationField.pure(),
    this.divisible = const DivisibilityBox.pure(null),
    this.minnimumSchedulingDuration =
        const MinnimumSchedulingDuration.pure(null),
    this.scheduledEvents = const [],
  });

  final Title title;
  final EndeavorId endeavorId;
  final DurationField durationField;
  final DivisibilityBox divisible;
  final MinnimumSchedulingDuration minnimumSchedulingDuration;
  final List<Event> scheduledEvents;

  Duration get scheduledDuration {
    var duration = Duration.zero;
    for (final e in scheduledEvents) {
      if (e.duration != null) {
        duration =
            Duration(minutes: e.duration!.inMinutes + duration.inMinutes);
      }
    }
    return duration;
  }

  Duration? get unscheduledDuration {
    if (durationField.value != null) {
      return Duration(
        minutes: durationField.value!.inMinutes - scheduledDuration.inMinutes,
      );
    }
    return null;
  }

  @override
  List<Object?> get props => [
        title,
        endeavorId,
        durationField,
        divisible,
        minnimumSchedulingDuration,
      ];

  @override
  List<FormzInput> get inputs => [
        title,
        endeavorId,
        durationField,
        divisible,
        minnimumSchedulingDuration,
      ];
}

class TaskScreenInitial extends TaskScreenState {
  const TaskScreenInitial() : super();
}
