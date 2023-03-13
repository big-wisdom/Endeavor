import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/tasks/create_or_edit_task.dart';
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
        deleteTask();
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
                deleteTask();
              });
            });
          },
        ),
      ),
    );
  }

  void deleteTask() {
    // Delete task document
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('tasks')
        .doc(widget.task.id)
        .delete();

    // Delete task from endeavor list if necessary
    if (widget.task.endeavorId != null) {
      FirebaseFirestore.instance.runTransaction(
        (t) async {
          // get endeavor document
          final endeavorDoc = await t.get(FirebaseFirestore.instance
              .collection('users')
              .doc(widget.uid)
              .collection('endeavors')
              .doc(widget.task.endeavorId));
          // get current list
          final currentList = (endeavorDoc.data()!['taskIds'] as List)
              .map((taskId) => taskId as String)
              .toList(); // doc should have data

          // remove this tasks id from the list
          currentList.remove(widget.task.id);

          // update the list
          t.update(endeavorDoc.reference, {"taskIds": currentList});
        },
      );
    }
  }
}
