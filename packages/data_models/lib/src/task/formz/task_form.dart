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
  });

  final DivisibilityBox divisible;
  final DurationField duration;
  final EndeavorPickerRowInput endeavor;
  final MinnimumSchedulingDuration minnimumSchedulingDuration;
  final TaskTitle title;

  @override
  List<FormzInput> get inputs =>
      [divisible, duration, endeavor, minnimumSchedulingDuration, title];

  Task? get createTask {
    if (status.isValid) {
      return Task(
        title: title.value,
        divisible: divisible.value,
        duration: duration.value,
        endeavorId: endeavor.value?.id,
        minnimumSchedulingDuration: minnimumSchedulingDuration.value,
      );
    }

    return null;
  }
}
