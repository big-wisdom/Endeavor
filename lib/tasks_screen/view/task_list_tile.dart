import 'package:data_models/data_models.dart';
import 'package:endeavor/task_screen/task_screen.dart';
import 'package:endeavor/tasks_screen/bloc/tasks_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({required this.taskReference, required super.key});

  final TaskReference taskReference;

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
        bloc.add(DeleteTask(widget.taskReference));
      },
      child: ListTile(
        key: widget.key!,
        title: Text(widget.taskReference.title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TaskScreen.edit();
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
                bloc.add(DeleteTask(widget.taskReference));
              });
            });
          },
        ),
      ),
    );
  }
}
