import 'package:flutter/material.dart';

class EndeavorTaskList extends StatefulWidget {
  const EndeavorTaskList({super.key});

  @override
  State<EndeavorTaskList> createState() => _EndeavorTaskListState();
}

class _EndeavorTaskListState extends State<EndeavorTaskList> {
  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      title: Text("Some Endeavor"),
      controlAffinity: ListTileControlAffinity.leading,
      children: [
        ListTile(title: Text("Some Task")),
      ],
    );
  }
}
