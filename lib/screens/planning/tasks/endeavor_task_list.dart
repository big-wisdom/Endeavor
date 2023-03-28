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
          DocumentSnapshot docSnap = snapshot.data!;
          if (docSnap.data() == null) {
            return const Text("No doc data");
          }

          if (snapshot.data!.data()!['taskIds'] == null) {
            return const Text("Loading Tasks for this endeavor");
          }

          List<String> taskIds = (snapshot.data!['taskIds'] as List)
              .map((taskId) => taskId as String)
              .toList();

          // this is some fancy footwork
          // get the order of the ids from the endeavor doc
          // then get the task object from the list given
          // if the task isn't there, it's because it has recently been deleted
          // and the endeavor doc isn't in sync with the task stream from this
          // widgets parent yet
          List<TaskListTile> tasks = [];
          for (String taskId in taskIds) {
            var matchIdList = widget.tasks
                .where((thisTask) => thisTask.id == taskId)
                .toList();
            if (matchIdList.isNotEmpty) {
              tasks.add(
                TaskListTile(
                  // grab the task object given to the widget
                  task: matchIdList[0],
                  uid: widget.uid,
                  key: UniqueKey(),
                ),
              );
            }
          }

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
              SingleChildScrollView(
                child: ReorderableListView(
                  physics: const NeverScrollableScrollPhysics(),
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
                  children: tasks,
                ),
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
