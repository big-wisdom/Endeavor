import 'abstract_task.dart';

class UnidentifiedTask extends AbstractTask {
  UnidentifiedTask({
    required super.title,
    required super.endeavorReference,
    required super.events,
    required super.duration,
    required super.minnimumSchedulingDuration,
    required super.dueDate,
    required super.divisible,
  });
}
