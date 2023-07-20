import 'dart:ui';

import 'package:data_repository/data_repository.dart';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class EndeavorForm extends Equatable with FormzMixin {
  const EndeavorForm({
    required this.titleInput,
    required this.subEndeavorsInput,
    required this.tasksInput,
    this.color,
  });

  final EndeavorTitleInput titleInput;
  final SubEndeavorsInput subEndeavorsInput;
  final EndeavorTasksInput tasksInput;
  final Color? color;

  @override
  List<FormzInput> get inputs => [
        titleInput,
        subEndeavorsInput,
        tasksInput,
      ];
}
