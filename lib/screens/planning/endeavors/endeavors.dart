import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/screens/planning/endeavors/endeavor_view/endeavor_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

class Endeavors extends StatelessWidget {
  const Endeavors({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot<Map<String, dynamic>>> primaryEndeavorsStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots();

    Stream<QuerySnapshot<Map<String, dynamic>>> endeavorsStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('endeavors')
            .snapshots();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: StreamBuilder2(
          streams: StreamTuple2(primaryEndeavorsStream, endeavorsStream),
          builder: (context, snapshots) {
            // if either is waiting say loading
            if (snapshots.snapshot1.connectionState ==
                    ConnectionState.waiting ||
                snapshots.snapshot2.connectionState ==
                    ConnectionState.waiting) {
              return const Text("Loading...");
            }

            // if either has an error, or they don't have data tell them to contact me
            if (snapshots.snapshot1.hasError ||
                snapshots.snapshot2.hasError ||
                !snapshots.snapshot1.hasData ||
                !snapshots.snapshot2.hasData) {
              return const Text("Something went wrong, you better text Eli");
            }

            // Get primary endeavorId's from the user doc
            var primaryEndeavorIds =
                snapshots.snapshot1.data!.data()!["primaryEndeavorIds"];
            if (primaryEndeavorIds != null) {
              primaryEndeavorIds = (primaryEndeavorIds as List)
                  .map((id) => id as String)
                  .toList();
            } else {
              return const Text("No Endeavors yet. Dream big!");
            }

            return ListView.separated(
              itemCount: primaryEndeavorIds.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Map<String, dynamic>>? item;
                for (var doc in snapshots.snapshot2.data!.docs) {
                  if (doc.id == primaryEndeavorIds[index]) {
                    item = doc;
                    break;
                  }
                }
                if (item == null) {
                  return const ListTile(
                    title: Text("Deleting..."),
                  );
                }

                final itemData = item.data();

                return Dismissible(
                  key: Key(itemData['text']),
                  onDismissed: (direction) {
                    // delete the endeavor
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .collection('endeavors')
                        .doc(item!.id)
                        .delete();
                  },
                  child: ListTile(
                    title: Text(item['text']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            // could I just pass the document snapshot here and let this stream handle updates?
                            // as opposed to getting a stream from the id in the endeavorView widget
                            return EndeavorView(
                                uid: user.uid, endeavorId: item!.id);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
