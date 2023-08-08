import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:endeavor/task_screen/bloc/task_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_screen_view.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen._({
    required this.editing,
    required this.endeavorReference,
    required this.taskReference,
  });

  final EndeavorReference? endeavorReference;
  final TaskReference? taskReference;

  factory TaskScreen.create({EndeavorReference? endeavorReference}) {
    return TaskScreen._(
      editing: false,
      endeavorReference: endeavorReference,
      taskReference: null,
    );
  }

  factory TaskScreen.edit(TaskReference taskReference) {
    return TaskScreen._(
      editing: true,
      endeavorReference: null,
      taskReference: taskReference,
    );
  }

  final bool editing;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskScreenBloc(
        initialEndeavorReference: endeavorReference,
        initialTaskReference: taskReference,
        dataRepository: context.read<DataRepository>(),
      ),
      child: const TaskScreenView(),
    );
  }
}
