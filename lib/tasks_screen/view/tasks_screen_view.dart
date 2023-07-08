import 'package:endeavor/tasks_screen/bloc/tasks_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'endeavor_task_list.dart';
import 'task_list_tile.dart';

class TasksScreenView extends StatelessWidget {
  const TasksScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksScreenBloc, TasksScreenState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.treeOfLife.length + state.tasksWithNoEndeavor.length,
          itemBuilder: (context, index) {
            if (index < state.treeOfLife.length) {
              return EndeavorTaskList(
                endeavor: state.treeOfLife[index],
              );
            } else {
              return TaskListTile(
                task:
                    state.tasksWithNoEndeavor[index - state.treeOfLife.length],
                key: UniqueKey(),
              );
            }
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 1,
            );
          },
        );
      },
    );
  }
}
