import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class TaskForm extends Equatable with FormzMixin {
  const TaskForm({
    required this.divisible,
    required this.duration,
    required this.endeavor,
    required this.minnimumSchedulingDuration,
    required this.title,
    required this.scheduledEvents,
  });

  final TaskTitle title;
  final EndeavorPickerRowInput endeavor;
  final DurationField duration;
  final DivisibilityBox divisible;
  final MinnimumSchedulingDuration minnimumSchedulingDuration;
  final ScheduledEvents scheduledEvents;

  @override
  List<FormzInput> get inputs => [
        divisible,
        duration,
        endeavor,
        minnimumSchedulingDuration,
        title,
        scheduledEvents
      ];

  Task? get createTask {
    if (status.isValid) {
      return Task(
        title: title.value,
        divisible: divisible.value,
        duration: duration.value,
        endeavorId: endeavor.value?.id,
        minnimumSchedulingDuration: minnimumSchedulingDuration.value,
        events: scheduledEvents.value,
      );
    }

    return null;
  }
}
