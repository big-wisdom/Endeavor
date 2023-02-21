import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EndeavorsDropdownButton extends StatefulWidget {
  const EndeavorsDropdownButton(
      {required this.uid,
      required this.onChanged,
      required this.firstValue,
      super.key});

  final String uid;
  final Function(String) onChanged;
  final Function(String) firstValue;

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

          String currentValue;
          if (selectedId == null) {
            currentValue = endeavors[0]['id'];
            widget.firstValue(endeavors[0]['id']);
          } else {
            currentValue = selectedId!;
          }
          return DropdownButton(
            value: currentValue,
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
