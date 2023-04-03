import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/screens/planning/endeavors/endeavor_view/sub_endeavors_editor.dart';
import 'package:flutter/material.dart';

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

    return StreamBuilder(
        stream: endeavorDocStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: Text("Loading..."),
              ),
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Scaffold(
              body: Center(
                child: Text("Something went wrong here, call Eli plz"),
              ),
            );
          }

          final docData = snapshot.data!.data()!;
          var subEndeavorIds = docData["subEndeavorIds"];
          if (subEndeavorIds != null) {
            subEndeavorIds =
                (subEndeavorIds as List).map((e) => e as String).toList();
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(docData['text']),
            ),
            body: Column(
              children: [
                // Sub Endeavors
                SubEndeavorsEditor(
                  uid: widget.uid,
                  endeavorId: widget.endeavorId,
                  subEndeavorIds: subEndeavorIds,
                ),
              ],
            ),
          );
        });
  }
}
