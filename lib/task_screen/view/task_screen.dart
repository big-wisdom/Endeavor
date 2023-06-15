import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_screen_view.dart';
import 'package:endeavor/task_screen/task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen._({required this.editing});

  factory TaskScreen.create() {
    return const TaskScreen._(editing: false);
  }

  factory TaskScreen.edit() {
    return const TaskScreen._(editing: true);
  }

  final bool editing;

  @override
  Widget build(BuildContext context) {
    final dataRepository = context.read<DataRepository>();
    return BlocProvider(
      create: (context) => editing
          ? EditTaskScreenBloc(dataRepository: dataRepository)
          : CreateTaskScreenBloc(dataRepository: dataRepository),
      child: const TaskScreenView(),
    );
  }
}
