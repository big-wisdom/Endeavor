import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../endeavor_reference.dart';
import '../../task_reference.dart';

class Endeavor extends Equatable {
  const Endeavor({
    required this.id,
    required this.title,
    this.parentEndeavorId,
    required this.subEndeavorReferences,
    this.color,
    required this.taskReferences,
  });

  final int id;
  final String title;
  final int? parentEndeavorId;
  final List<EndeavorReference> subEndeavorReferences;
  final List<TaskReference> taskReferences;

  // settings
  final Color? color;

  Endeavor copyWith({
    String? title,
    List<EndeavorReference>? subEndeavors,
    Color? color,
    List<TaskReference>? tasks,
  }) {
    return Endeavor(
      id: id,
      title: title ?? this.title,
      subEndeavorReferences: subEndeavors ?? this.subEndeavorReferences,
      color: color ?? this.color,
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
        color,
      ];
}
