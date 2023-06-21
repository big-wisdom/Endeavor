import 'package:data_repository/data_repository.dart';
import 'package:endeavor/endeavor_screen/endeavor_screen.dart';
import 'package:endeavor/task_screen/task_screen.dart';
import 'package:flutter/material.dart';
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
    return Dismissible(
      key: Key(widget.task.id!),
      onDismissed: (direction) {
        context.read<EndeavorScreenBloc>().add(DeleteTask(widget.task));
      },
      child: ListTile(
        key: Key(widget.task.id!),
        title: Text(widget.task.title!),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TaskScreen.create();
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
                context.read<EndeavorScreenBloc>().add(DeleteTask(widget.task));
              });
            });
          },
        ),
      ),
    );
  }
}
