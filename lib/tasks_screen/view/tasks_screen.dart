import 'package:flutter/material.dart';
import 'package:endeavor/tasks_screen/tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tasks_screen_view.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksScreenBloc(),
      child: const TasksScreenView(),
    );
  }
}
