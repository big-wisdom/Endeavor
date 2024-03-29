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
    List<Event>? newEventsList,
  }) {
    // if duration or divisibility is updated, update minnimumSchedulingDuration input
    MinnimumSchedulingDuration newMinSchedDuration =
        minnimumSchedulingDuration ?? this.minnimumSchedulingDuration;
    if (durationField != null) {
      if (durationField.value == Duration.zero) {
        newMinSchedDuration = MinnimumSchedulingDuration.clear();
      } else {
        newMinSchedDuration =
            newMinSchedDuration.copyWith(newDuration: durationField.value);
      }
    }
    if (divisibilityBox != null) {
      if (divisibilityBox.value == false) {
        newMinSchedDuration = MinnimumSchedulingDuration.clear();
      } else {
        newMinSchedDuration = newMinSchedDuration.copyWith(
            newDivisibility: divisibilityBox.value);
      }
    }

    // if duration is updated, update divisibility input
    DivisibilityBox newDivisibility = divisibilityBox ?? divisible;
    if (durationField != null) {
      if (durationField.value == Duration.zero) {
        newDivisibility = DivisibilityBox.clear();
      } else {
        newDivisibility =
            newDivisibility.copyWith(newDuration: durationField.value);
      }
    }
    if (minnimumSchedulingDuration != null) {
      newDivisibility = newDivisibility.copyWith(
          newMinnimumSchedulingDuration: minnimumSchedulingDuration.value);
    }

    // nullify duration if it has zero time
    if (durationField != null && durationField.value == Duration.zero) {
      durationField = const DurationField.pure(null);
    }

    // if this is create or its not the initial of an edit state
    if (this is CreateTaskScreenState) {
      return CreateTaskScreenState(
        title: title != null ? TaskTitle.dirty(title) : this.title,
        divisible: newDivisibility,
        duration: durationField ?? duration,
        endeavor: endeavorPickerRowInput ?? endeavor,
        minnimumSchedulingDuration: newMinSchedDuration,
        scheduledEvents: ScheduledEvents.dirty(newEventsList ?? []),
      );
    } else {
      return EditTaskScreenState(
        title: title != null ? TaskTitle.dirty(title) : this.title,
        divisible: newDivisibility,
        duration: durationField ?? duration,
        endeavor: endeavorPickerRowInput ?? endeavor,
        minnimumSchedulingDuration: newMinSchedDuration,
        scheduledEvents:
            ScheduledEvents.dirty(newEventsList ?? scheduledEvents.value),
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

class LoadingEditTaskScreenState extends TaskScreenState {
  LoadingEditTaskScreenState({
    required TaskReference taskReference,
    required EndeavorReference? endeavorReference,
  }) : super(
          title: TaskTitle.pure(taskReference.title),
          divisible: DivisibilityBox.clear(),
          duration: const DurationField.pure(null),
          endeavor: EndeavorPickerRowInput.pure(true, endeavorReference),
          minnimumSchedulingDuration: MinnimumSchedulingDuration.clear(),
          scheduledEvents: const ScheduledEvents.pure([]),
        );
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

  EditTaskScreenState.fromTask({
    required Task task,
  }) : super(
          title: TaskTitle.pure(task.title),
          divisible: DivisibilityBox.pure(
              task.duration, task.minnimumSchedulingDuration, task.divisible),
          duration: DurationField.pure(task.duration),
          endeavor: EndeavorPickerRowInput.pure(true, task.endeavorReference),
          minnimumSchedulingDuration: MinnimumSchedulingDuration.pure(
            duration: task.duration,
            divisible: task.divisible,
            minnimumSchedulingDuration: task.minnimumSchedulingDuration,
          ),
          scheduledEvents: ScheduledEvents.pure(task.events ?? []),
        );
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

  factory CreateTaskScreenState.initial(EndeavorReference? endeavorReference) {
    return CreateTaskScreenState(
      title: const TaskTitle.pure(null),
      divisible: DivisibilityBox.clear(),
      duration: const DurationField.pure(null),
      endeavor: EndeavorPickerRowInput.pure(true, endeavorReference),
      minnimumSchedulingDuration: MinnimumSchedulingDuration.clear(),
      scheduledEvents: const ScheduledEvents.pure([]),
    );
  }
}

// class TaskScreenInitial extends TaskScreenState {
//   final bool isEdit;
//   const TaskScreenInitial._({
//     required super.title,
//     required super.endeavor,
//     required super.divisible,
//     required super.duration,
//     required super.minnimumSchedulingDuration,
//     required super.scheduledEvents,
//     required this.isEdit,
//   });

//   factory TaskScreenInitial(
//     EndeavorReference? initialEndeavorReference,
//     TaskReference? initialTaskReference,
//   ) {
//     if (initialTaskReference != null) {
//       return TaskScreenInitial._(
//           title: TaskTitle.pure(initialTaskReference.title),
//           divisible: DivisibilityBox.clear(),
//           duration: const DurationField.pure(null),
//           endeavor: EndeavorPickerRowInput.pure(initialEndeavorReference),
//           minnimumSchedulingDuration: MinnimumSchedulingDuration.clear(),
//           scheduledEvents: const ScheduledEvents.pure([]),
//           isEdit: true);
//     } else {
//       return TaskScreenInitial._(
//         title: const TaskTitle.pure(null),
//         divisible: DivisibilityBox.clear(),
//         duration: const DurationField.pure(null),
//         endeavor: EndeavorPickerRowInput.pure(initialEndeavorReference),
//         minnimumSchedulingDuration: MinnimumSchedulingDuration.clear(),
//         scheduledEvents: const ScheduledEvents.pure([]),
//         isEdit: false,
//       );
//     }
//   }
//   // : super(
//   //   );
// }
