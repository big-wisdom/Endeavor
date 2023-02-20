import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EndeavorsDropdownButton extends StatefulWidget {
  const EndeavorsDropdownButton(
      {required this.uid, required this.onChanged, super.key});

  final String uid;
  final Function(String) onChanged;

  @override
  State<EndeavorsDropdownButton> createState() =>
      _EndeavorsDropdownButtonState();
}

class _EndeavorsDropdownButtonState extends State<EndeavorsDropdownButton> {
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> endeavorsStream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavors')
        .snapshots();

    return StreamBuilder(
      stream: endeavorsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Map<String, dynamic>> endeavors =
              snapshot.data!.docs.map((docSnap) {
            var data = docSnap.data()! as Map<String, dynamic>;
            data['id'] = docSnap.id;
            return data;
          }).toList();

          String value = selectedId ?? endeavors[0]['id'];
          return DropdownButton(
            value: value, // What about the scenario when there are no endeavors
            items: endeavors.map((item) {
              return DropdownMenuItem<String>(
                value: item['id'],
                child: Text(
                  (item['text']),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                selectedId = value;
                widget.onChanged(value);
              }
            },
          );
        } else {
          return const Text("Loading...");
        }
      },
    );
  }
}
