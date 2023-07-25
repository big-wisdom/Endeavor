import 'package:equatable/equatable.dart';
import '../../endeavor_reference.dart';
import '../../task_reference.dart';

class Endeavor extends Equatable {
  const Endeavor({
    required this.id,
    required this.title,
    this.parentEndeavorId,
    required this.subEndeavorReferences,
    // this.color,
    required this.taskReferences,
  });

  final String id;
  final String title;
  final String? parentEndeavorId;
  final List<EndeavorReference> subEndeavorReferences;
  final List<TaskReference> taskReferences;

  // settings
  // final Color? color;
  // TODO: this should have color but I want to run pure dart

  Endeavor copyWith({
    String? title,
    List<EndeavorReference>? subEndeavors,
    // Color? color,
    List<TaskReference>? tasks,
  }) {
    return Endeavor(
      id: id,
      title: title ?? this.title,
      subEndeavorReferences: subEndeavors ?? this.subEndeavorReferences,
      // color: color ?? this.color,
      taskReferences: tasks ?? this.taskReferences,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        parentEndeavorId,
        subEndeavorReferences,
        taskReferences,
        // color,
      ];
}
