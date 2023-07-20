import 'package:data_repository/data_repository.dart';
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
        if (state is LoadingTasksScreenState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        state as LoadedTasksScreenState;
        return ListView.separated(
          itemCount: state.treeOfLife.primaryEndeavorNodes.length +
              state.tasksWithNoEndeavor.length,
          itemBuilder: (context, index) {
            if (index < state.treeOfLife.primaryEndeavorNodes.length) {
              return EndeavorTaskList(
                endeavorNode: state.treeOfLife.primaryEndeavorNodes[index],
              );
            } else {
              final task = state.tasksWithNoEndeavor[
                  index - state.treeOfLife.primaryEndeavorNodes.length];
              final ref = TaskReference(id: task.id!, title: task.title!);
              return TaskListTile(
                taskReference: ref,
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
