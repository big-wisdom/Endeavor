import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/tasks/task_list.dart';
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
    // This is seriously just to get the title of the endeavor
    // I can't help but wonder if there's a better way to structure this
    final endeavorDocFuture = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavors')
        .doc(widget.endeavorId)
        .get();

    return FutureBuilder(
        future: endeavorDocFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ListTile(
              title: Text("Loading..."),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const ListTile(
              title: Text("Uh oh, better call Eli. Something went wrong"),
            );
          }

          return ExpansionTile(
            initiallyExpanded: true,
            title: Text(snapshot.data!.data()!['text']),
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
              TaskList(
                endeavorId: widget.endeavorId,
                uid: widget.uid,
                tasks: widget.tasks,
              ),
            ],
          );
        });
  }
}
