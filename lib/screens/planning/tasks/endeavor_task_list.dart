import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
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
    final docStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavors')
        .doc(widget.endeavorId)
        .snapshots();

    return StreamBuilder(
      stream: docStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ListTile(
            title: Text("Loading..."),
          );
        }

        if (snapshot.hasData) {
          if (snapshot.data!.data()!['taskIds'] == null) {
            return const Text("Loading Tasks for this endeavor");
          }

          List<String> taskIds = (snapshot.data!['taskIds'] as List)
              .map((taskId) => taskId as String)
              .toList();

          return ExpansionTile(
            initiallyExpanded: true,
            title: Text(snapshot.data!['text']),
            trailing: TextButton(
              onPressed: () async {
                // call firebase plan cloud function on this endeavor
                HttpsCallable callable =
                    FirebaseFunctions.instance.httpsCallable('planEndeavor');
                final resp = await callable.call(<String, dynamic>{
                  'userId': widget.uid,
                  'endeavorId': widget.endeavorId,
                });
                debugPrint("Result: ${resp.data}");
              },
              child: const Text("Plan"),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            children: [
              ReorderableListView(
                shrinkWrap: true,
                onReorder: ((oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  // remove the item from its present index
                  final String itemToMove = taskIds.removeAt(oldIndex);

                  // insert it at the new index
                  taskIds.insert(newIndex, itemToMove);

                  // make change to document
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(widget.uid)
                      .collection('endeavors')
                      .doc(widget.endeavorId)
                      .update({'taskIds': taskIds});
                }),
                // this is some fancy footwork
                // get the order of the ids from the endeavor doc
                // then get the task object from the list given
                children: taskIds.map((taskId) {
                  return TaskListTile(
                    task: widget.tasks.firstWhere((task) => task.id == taskId),
                    uid: widget.uid,
                    key: UniqueKey(),
                  );
                }).toList(),
              )
            ],
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
