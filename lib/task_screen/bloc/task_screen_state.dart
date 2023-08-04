part of "task_screen_bloc.dart";

abstract class TaskScreenState extends TaskForm {
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
    // add new event if there is one
    List<Event> newScheduledEvents;
    newScheduledEvents = [...scheduledEvents.value];
    if (newEvent != null) {
      newScheduledEvents.add(newEvent);
    }

    // if duration or divisibility is updated, update minnimumSchedulingDuration input
    MinnimumSchedulingDuration newMinSchedDuration =
        minnimumSchedulingDuration ?? this.minnimumSchedulingDuration;
    if (durationField != null) {
      newMinSchedDuration =
          newMinSchedDuration.copyWith(newDuration: durationField.value);
    }
    if (divisibilityBox != null) {
      newMinSchedDuration =
          newMinSchedDuration.copyWith(newDivisibility: divisibilityBox.value);
    }

    // if duration is updated, update divisibility input
    DivisibilityBox newDivisibility = divisibilityBox ?? divisible;
    if (durationField != null) {
      newDivisibility =
          newDivisibility.copyWith(newDuration: durationField.value);
    }

    if (this is CreateTaskScreenState) {
      return CreateTaskScreenState(
        title: title != null ? TaskTitle.dirty(title) : this.title,
        divisible: divisibilityBox ?? divisible,
        duration: durationField ?? duration,
        endeavor: endeavorPickerRowInput ?? endeavor,
        minnimumSchedulingDuration: newMinSchedDuration,
        scheduledEvents: ScheduledEvents.dirty(newScheduledEvents),
      );
    } else {
      return EditTaskScreenState(
        title: title != null ? TaskTitle.dirty(title) : this.title,
        divisible: divisibilityBox ?? divisible,
        duration: durationField ?? duration,
        endeavor: endeavorPickerRowInput ?? endeavor,
        minnimumSchedulingDuration: newMinSchedDuration,
        scheduledEvents: ScheduledEvents.dirty(newScheduledEvents),
      );
    }
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

class EditTaskScreenState extends TaskScreenState {
  const EditTaskScreenState({
    required super.title,
    required super.divisible,
    required super.duration,
    required super.endeavor,
    required super.minnimumSchedulingDuration,
    required super.scheduledEvents,
  });
}

class CreateTaskScreenState extends TaskScreenState {
  const CreateTaskScreenState({
    required super.title,
    required super.divisible,
    required super.duration,
    required super.endeavor,
    required super.minnimumSchedulingDuration,
    required super.scheduledEvents,
  });
}

class TaskScreenInitial extends TaskScreenState {
  TaskScreenInitial(TreeOfLife? treeOfLife)
      : super(
          title: const TaskTitle.pure(),
          endeavor: EndeavorPickerRowInput.pure(null),
          divisible: DivisibilityBox.pure(const DurationField.pure().value),
          duration: const DurationField.pure(),
          minnimumSchedulingDuration: MinnimumSchedulingDuration.pure(
            duration: const DurationField.pure().value,
            divisible: null,
          ),
          scheduledEvents: const ScheduledEvents.pure([]),
        );
}
