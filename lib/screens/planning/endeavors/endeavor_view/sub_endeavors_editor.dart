import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/Endeavor/endeavor.dart';
import 'package:endeavor/screens/planning/endeavors/add_endeavor.dart';
import 'package:endeavor/screens/planning/endeavors/endeavor_view/endeavor_view.dart';
import 'package:flutter/material.dart';

class SubEndeavorsEditor extends StatefulWidget {
  const SubEndeavorsEditor(
      {required this.uid,
      required this.endeavorId,
      required this.subEndeavorIds,
      super.key});

  final String uid;
  final String endeavorId;
  final List<String>? subEndeavorIds;

  @override
  State<SubEndeavorsEditor> createState() => _SubEndeavorsEditorState();
}

class _SubEndeavorsEditorState extends State<SubEndeavorsEditor> {
  @override
  Widget build(BuildContext context) {
    if (widget.subEndeavorIds == null || widget.subEndeavorIds!.isEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("No sub endeavors"),
          TextButton(
            onPressed: _addSubEndeavor,
            child: const Text("Add one"),
          ),
        ],
      );
    } else {
      final subEndeavorStream = FirebaseFirestore.instance
          .collection("users")
          .doc(widget.uid)
          .collection("endeavors")
          .where(FieldPath.documentId, whereIn: widget.subEndeavorIds)
          .snapshots();

      return StreamBuilder(
        stream: subEndeavorStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (snapshot.hasError) {
            return const Text("Some error loading sub-endeavors, call Eli :)");
          }

          // get list of sub endeavors
          List<Endeavor> subEndeavors = snapshot.data!.docs.map((docSnap) {
            return Endeavor.fromDocSnap(docSnap);
          }).toList();

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Sub-Endeavors"),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(subEndeavors[index].id!),
                    child: ListTile(
                      title: Text(subEndeavors[index].text!),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EndeavorView(
                              uid: widget.uid,
                              endeavorId: subEndeavors[index].id!);
                        }));
                      },
                    ),
                    onDismissed: (direction) {
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(widget.uid)
                          .collection("endeavors")
                          .doc(subEndeavors[index].id)
                          .delete();
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
                itemCount: subEndeavors.length,
              ),
              TextButton(
                  onPressed: _addSubEndeavor,
                  child: const Text("Add Sub-Endeavor")),
            ],
          );
        },
      );
    }
  }

  void _addSubEndeavor() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddEndeavor(
          uid: widget.uid,
          onAdd: (text) async {
            // create endeavor document with this endeavor as a parent
            final childDocRef = await FirebaseFirestore.instance
                .collection("users")
                .doc(widget.uid)
                .collection("endeavors")
                .add({"text": text, "parentEndeavorId": widget.endeavorId});
            // add the new one as a child to this one
            final endeavorDocSnap = await FirebaseFirestore.instance
                .collection("users")
                .doc(widget.uid)
                .collection("endeavors")
                .doc(widget.endeavorId)
                .get();

            // get current list
            final docData = endeavorDocSnap.data()!;
            var subEndeavorIds = docData['subEndeavorIds'];
            Map<String, dynamic> newData;
            if (subEndeavorIds == null) {
              // if no list create one with one entry
              newData = {
                "subEndeavorIds": [childDocRef.id]
              };
            } else {
              // if there is a list update it locally then on firebase
              subEndeavorIds =
                  (subEndeavorIds as List).map((id) => id as String).toList();
              subEndeavorIds.add(childDocRef.id);
              newData = {
                "subEndeavorIds": subEndeavorIds,
              };
            }
            FirebaseFirestore.instance
                .doc(endeavorDocSnap.reference.path)
                .update(newData);
          },
        );
      },
    );
  }
}
