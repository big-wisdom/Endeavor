import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/tasks/endeavor_task_list.dart';
import 'package:endeavor/screens/planning/tasks/task_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  final User user;
  const Tasks({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> tasksStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .snapshots();

    return Center(
      child: StreamBuilder(
        stream: tasksStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (snapshot.hasData) {
            // get list of tasks
            List<Task> tasks = snapshot.data!.docs
                .map((docSnap) => Task.fromDocSnap(docSnap))
                .toList();

            // get list of endeavors and their tasks
            List<Task> tasksWithNoEndeavor = [];
            Map<String, List<Task>> endeavorTasks = {};
            for (Task task in tasks) {
              if (task.endeavorId != null) {
                if (endeavorTasks.containsKey(task.endeavorId)) {
                  endeavorTasks[task.endeavorId!]!.add(task);
                } else {
                  endeavorTasks[task.endeavorId!] = [task];
                }
              } else {
                tasksWithNoEndeavor.add(task);
              }
            }

            // return a listview with a collapsable tile for each endeavor that has tasks
            // then a list tile fore each task without an endeavor
            return ListView.separated(
              itemCount: endeavorTasks.length + tasksWithNoEndeavor.length,
              itemBuilder: (context, index) {
                if (index < endeavorTasks.length) {
                  String endeavorId = endeavorTasks.keys.toList()[index];
                  return EndeavorTaskList(
                    uid: user.uid,
                    endeavorId: endeavorId,
                    tasks: endeavorTasks[endeavorId]!,
                  );
                } else {
                  return TaskListTile(
                    task: tasksWithNoEndeavor[index - endeavorTasks.length],
                    uid: user.uid,
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
          } else {
            return const Text("No tasks! Go out and play!");
          }
        },
      ),
    );
  }
}
