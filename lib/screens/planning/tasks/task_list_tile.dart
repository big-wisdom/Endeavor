import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/task.dart';
import 'package:flutter/material.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile(
      {required this.task, required this.uid, required super.key});

  final Task task;
  final String uid;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.key!,
      onDismissed: (direction) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .collection('tasks')
            .doc(widget.task.id)
            .delete();
      },
      child: ListTile(
        key: widget.key!,
        title: Text(widget.task.title!),
        trailing: IconButton(
          icon: Icon(checked
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked),
          onPressed: () {
            debugPrint("Delete task");
            setState(() {
              checked = !checked;
              Future.delayed(const Duration(milliseconds: 500)).then((value) {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.uid)
                    .collection('tasks')
                    .doc(widget.task.id)
                    .delete();
              });
            });
          },
        ),
      ),
    );
  }
}
