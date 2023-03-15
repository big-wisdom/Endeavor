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
              debugPrint(snapshot.error!.toString());
              return const Text("Something went wrong, you better text Eli");
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
