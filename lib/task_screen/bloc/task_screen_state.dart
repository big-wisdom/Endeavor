part of "task_screen_bloc.dart";

class TaskScreenState extends TaskForm {
  const TaskScreenState({
    required super.title,
    required super.divisible,
    required super.duration,
    required super.endeavor,
    required super.minnimumSchedulingDuration,
    this.scheduledEvents = const [],
    this.treeOfLife,
  });

  final List<Event> scheduledEvents;
  // treeOfLife is on state as a pass through from TasksScreen to EndeavorPickerRow
  // so that the query and calculation doesn't have to be run twice if TasksScreen
  // is the parent of the task screen
  final List<Endeavor>? treeOfLife;

  Duration get scheduledDuration {
    var duration = Duration.zero;
    for (final e in scheduledEvents) {
      duration = Duration(minutes: e.duration.inMinutes + duration.inMinutes);
    }
    return duration;
  }

  Duration? get unscheduledDuration {
    if (duration.value != null) {
      return Duration(
        minutes: duration.value!.inMinutes - scheduledDuration.inMinutes,
      );
    }
    return null;
  }

  @override
  List<Object?> get props => [
        title,
        endeavor,
        duration,
        divisible,
        minnimumSchedulingDuration,
        treeOfLife,
      ];

  @override
  List<FormzInput> get inputs => [
        title,
        endeavor,
        duration,
        divisible,
        minnimumSchedulingDuration,
      ];
}

class TaskScreenInitial extends TaskScreenState {
  TaskScreenInitial(List<Endeavor>? treeOfLife)
      : super(
          title: const TaskTitle.pure(),
          endeavor: EndeavorPickerRowInput.pure(null, null),
          divisible: DivisibilityBox.pure(const DurationField.pure().value),
          duration: const DurationField.pure(),
          minnimumSchedulingDuration:
              MinnimumSchedulingDuration.pure(const DurationField.pure().value),
          treeOfLife: treeOfLife,
        );
}
