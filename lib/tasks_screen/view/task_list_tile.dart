import 'package:endeavor/tasks_screen/bloc/tasks_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:data_repository/data_repository.dart' show Task;
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({required this.task, super.key});

  final Task task;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TasksScreenBloc>();

    return Dismissible(
      key: widget.key!,
      onDismissed: (direction) {
        bloc.add(DeleteTask(widget.task));
      },
      child: ListTile(
        key: widget.key!,
        title: Text(widget.task.title!),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CreateOrEditTask.edit(
                    task: widget.task, uid: widget.uid);
              },
            ),
          );
        },
        trailing: IconButton(
          icon: Icon(checked
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked),
          onPressed: () {
            debugPrint("Delete task");
            setState(() {
              checked = !checked;
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                bloc.add(DeleteTask(widget.task));
              });
            });
          },
        ),
      ),
    );
  }
}
