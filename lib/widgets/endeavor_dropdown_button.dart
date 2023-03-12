import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EndeavorsDropdownButton extends StatefulWidget {
  const EndeavorsDropdownButton(
      {this.firstValue,
      required this.uid,
      required this.onChanged,
      this.returnFirstValue,
      required this.nullOption,
      super.key});

  final String uid;
  final Function(String?) onChanged;
  final Function(String)? returnFirstValue;
  final String? firstValue;
  final bool nullOption;

  @override
  State<EndeavorsDropdownButton> createState() =>
      _EndeavorsDropdownButtonState();
}

class _EndeavorsDropdownButtonState extends State<EndeavorsDropdownButton> {
  String? selectedId;

  @override
  void initState() {
    selectedId = widget.firstValue;

    super.initState();
  }

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

          // options
          var options = endeavors.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(
                (item['text']),
              ),
            );
          }).toList();
          if (widget.nullOption) {
            options.insert(
              0,
              const DropdownMenuItem<String>(
                value: "none",
                child: Text("None"),
              ),
            );
          }

          // TODO: figure out what to do when there are no endeavors
          // Initialize first value
          String currentValue;
          if (selectedId == null) {
            currentValue = options[0].value!;
            if (widget.returnFirstValue != null) {
              widget.returnFirstValue!(endeavors[0]['id']);
            }
          } else {
            currentValue = selectedId!;
          }

          return DropdownButton(
            value: currentValue,
            items: options,
            onChanged: (value) {
              if (value == "none") value = null;
              setState(() {
                selectedId = value;
                widget.onChanged(value);
              });
            },
          );
        } else {
          return const Text("Loading...");
        }
      },
    );
  }
}
