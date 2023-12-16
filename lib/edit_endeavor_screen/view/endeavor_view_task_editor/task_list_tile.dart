import 'package:data_models/data_models.dart';
import 'package:endeavor/edit_endeavor_screen/edit_endeavor_screen.dart';
import 'package:endeavor/task_screen/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({required this.taskReference, super.key});

  final TaskReference taskReference;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.taskReference.id),
      onDismissed: (direction) {
        context
            .read<EditEndeavorScreenBloc>()
            .add(DeleteTask(widget.taskReference));
      },
      child: ListTile(
        key: Key(widget.taskReference.id),
        title: Text(widget.taskReference.title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return TaskScreen.edit(widget.taskReference);
              },
            ),
          );
        },
        trailing: IconButton(
          icon: Icon(checked
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked),
          onPressed: () {
            setState(() {
              checked = !checked;
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                context
                    .read<EditEndeavorScreenBloc>()
                    .add(DeleteTask(widget.taskReference));
              });
            });
          },
        ),
      ),
    );
  }
}
