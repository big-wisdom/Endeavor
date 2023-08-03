part of "task_screen_bloc.dart";

class TaskScreenState extends TaskForm {
  const TaskScreenState({
    required super.title,
    required super.divisible,
    required super.duration,
    required super.endeavor,
    required super.minnimumSchedulingDuration,
    required super.scheduledEvents,
  });

  TaskScreenState copyWith({
    String? title,
    EndeavorPickerRowInput? endeavorPickerRowInput,
    DurationField? durationField,
    DivisibilityBox? divisibilityBox,
    MinnimumSchedulingDuration? minnimumSchedulingDuration,
    Event? newEvent,
  }) {
    List<Event> newScheduledEvents;
    newScheduledEvents = [...scheduledEvents.value];
    if (newEvent != null) {
      newScheduledEvents.add(newEvent);
    }

    return TaskScreenState(
      title: title != null ? TaskTitle.dirty(title) : this.title,
      divisible: divisibilityBox ?? divisible,
      duration: durationField ?? duration,
      endeavor: endeavorPickerRowInput ?? endeavor,
      minnimumSchedulingDuration:
          minnimumSchedulingDuration ?? this.minnimumSchedulingDuration,
      scheduledEvents: ScheduledEvents.dirty(newScheduledEvents),
    );
  }

  Duration get scheduledDuration {
    var duration = Duration.zero;
    for (final e in scheduledEvents.value) {
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
        scheduledEvents,
      ];

  @override
  List<FormzInput> get inputs => [
        title,
        endeavor,
        duration,
        divisible,
        minnimumSchedulingDuration,
        scheduledEvents,
      ];
}

class TaskScreenInitial extends TaskScreenState {
  TaskScreenInitial(TreeOfLife? treeOfLife)
      : super(
          title: const TaskTitle.pure(),
          endeavor: EndeavorPickerRowInput.pure(null),
          divisible: DivisibilityBox.pure(const DurationField.pure().value),
          duration: const DurationField.pure(),
          minnimumSchedulingDuration:
              MinnimumSchedulingDuration.pure(const DurationField.pure().value),
          scheduledEvents: const ScheduledEvents.pure([]),
        );
}
