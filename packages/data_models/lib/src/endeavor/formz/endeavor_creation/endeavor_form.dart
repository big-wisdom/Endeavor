// import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'endeavor_subendeavors_input.dart';
import 'endeavor_title_input.dart';
import 'endeavor_tasks_input.dart';

abstract class EndeavorForm extends Equatable with FormzMixin {
  const EndeavorForm({
    required this.titleInput,
    required this.subEndeavorsInput,
    required this.tasksInput,
    // this.color,
  });

  final EndeavorTitleInput titleInput;
  final SubEndeavorsInput subEndeavorsInput;
  final EndeavorTasksInput tasksInput;
  // final Color? color;

  @override
  List<FormzInput> get inputs => [
        titleInput,
        subEndeavorsInput,
        tasksInput,
      ];
}
