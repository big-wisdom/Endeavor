import 'abstract_task.dart';

class Task extends AbstractTask {
  Task({
    required this.id,
    required super.title,
    required super.endeavorReference,
    required super.events,
    required super.duration,
    required super.minnimumSchedulingDuration,
    required super.dueDate,
    required super.divisible,
  });

  final int id;

  @override
  List<Object?> get props => super.props..add(id);
}
