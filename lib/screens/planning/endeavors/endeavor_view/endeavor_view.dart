import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/endeavors/endeavor_view/endeavor_view_task_editor.dart';
import 'package:endeavor/screens/planning/endeavors/endeavor_view/sub_endeavors_editor.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

class EndeavorView extends StatefulWidget {
  const EndeavorView({required this.uid, required this.endeavorId, super.key});

  final String uid;
  final String endeavorId;

  @override
  State<EndeavorView> createState() => _EndeavorViewState();
}

class _EndeavorViewState extends State<EndeavorView> {
  @override
  Widget build(BuildContext context) {
    final endeavorDocStream = FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .collection('endeavors')
        .doc(widget.endeavorId)
        .snapshots();

    final taskStream = FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .collection('tasks')
        .where("endeavorId", isEqualTo: widget.endeavorId)
        .snapshots();

    return StreamBuilder2(
        streams: StreamTuple2(endeavorDocStream, taskStream),
        builder: (context, snapshots) {
          if (snapshots.snapshot1.connectionState == ConnectionState.waiting ||
              snapshots.snapshot2.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: Text("Loading..."),
              ),
            );
          }

          if (snapshots.snapshot1.hasError ||
              snapshots.snapshot2.hasError ||
              !snapshots.snapshot1.hasData ||
              !snapshots.snapshot2.hasData) {
            return const Scaffold(
              body: Center(
                child: Text("Something went wrong here, call Eli plz"),
              ),
            );
          }

          final endeavorDocData = snapshots.snapshot1.data!.data()!;
          var subEndeavorIds = endeavorDocData["subEndeavorIds"];
          if (subEndeavorIds != null) {
            subEndeavorIds =
                (subEndeavorIds as List).map((e) => e as String).toList();
          }

          final tasks = snapshots.snapshot2.data!.docs.map((taskDocSnap) {
            return Task.fromDocSnap(taskDocSnap);
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text(endeavorDocData['text']),
            ),
            body: Column(
              children: [
                // Sub Endeavors
                SubEndeavorsEditor(
                  uid: widget.uid,
                  endeavorId: widget.endeavorId,
                  subEndeavorIds: subEndeavorIds,
                ),
                EndeavorViewTaskEditor(
                  endeavorId: widget.endeavorId,
                  uid: widget.uid,
                  tasks: tasks,
                ),
              ],
            ),
          );
        });
  }
}
