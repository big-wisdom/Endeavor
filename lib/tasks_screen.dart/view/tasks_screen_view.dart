import 'package:flutter/material.dart';

class TasksScreenView extends StatelessWidget {
  const TasksScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: endeavorTasks.length + tasksWithNoEndeavor.length,
      itemBuilder: (context, index) {
        if (index < endeavorTasks.length) {
          String endeavorId = endeavorTasks.keys.toList()[index];
          return EndeavorTaskList(
            uid: uid,
            endeavorId: endeavorId,
            tasks: endeavorTasks[endeavorId]!,
          );
        } else {
          return TaskListTile(
            task: tasksWithNoEndeavor[index - endeavorTasks.length],
            uid: uid,
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
  }
}
