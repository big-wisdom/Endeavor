import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Endeavors extends StatelessWidget {
  const Endeavors({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> endeavorsStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('endeavors')
        .snapshots();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: endeavorsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }

            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final item = snapshot.data!.docs[index];
                final itemData = item.data()! as Map<String, dynamic>;
                return Dismissible(
                  key: Key(itemData['text']),
                  onDismissed: (direction) {
                    // Delete all of the endeavor blocks
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .collection('endeavorBlocks')
                        .where('endeavorId', isEqualTo: item.id)
                        .get()
                        .then((querySnap) {
                      if (querySnap.docs.isNotEmpty) {
                        // remove each doc from repeating endeavor blocks
                        // if repeating endeavor block is empty, delete it.
                        // delete docs
                        final batch = FirebaseFirestore.instance.batch();
                        for (var doc in querySnap.docs) {
                          if (doc.exists) {
                            batch.delete(doc.reference);
                          }
                        }
                        batch.commit();
                      }
                    });

                    // Delete repeating endeavor blocks

                    // delete the endeavor
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(user.uid)
                        .collection('endeavors')
                        .doc(item.id)
                        .delete();
                  },
                  child: ListTile(
                    title: Text(item['text']),
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
