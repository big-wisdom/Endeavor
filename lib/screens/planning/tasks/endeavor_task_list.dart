import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/tasks/task_list_tile.dart';
import 'package:flutter/material.dart';

class EndeavorTaskList extends StatefulWidget {
  const EndeavorTaskList({
    required this.uid,
    required this.endeavorId,
    required this.tasks,
    super.key,
  });

  final String uid;
  final String endeavorId;
  final List<Task> tasks;

  @override
  State<EndeavorTaskList> createState() => _EndeavorTaskListState();
}

class _EndeavorTaskListState extends State<EndeavorTaskList> {
  @override
  Widget build(BuildContext context) {
    final docFuture = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavors')
        .doc(widget.endeavorId)
        .get();

    return FutureBuilder(
      future: docFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            title: Text("Loading..."),
          );
        }

        if (snapshot.hasData) {
          return ExpansionTile(
            title: Text(snapshot.data!['text']),
            controlAffinity: ListTileControlAffinity.leading,
            children: widget.tasks.map(
              (task) {
                return TaskListTile(
                    key: UniqueKey(), task: task, uid: widget.uid);
              },
            ).toList(),
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
