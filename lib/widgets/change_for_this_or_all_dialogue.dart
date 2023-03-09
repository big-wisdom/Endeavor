import 'package:flutter/material.dart';

class ChangeForThisOrAllDialogue extends StatefulWidget {
  const ChangeForThisOrAllDialogue(
      {required this.onThis, required this.onFollowing, super.key});

  final Function() onThis;
  final Function() onFollowing;

  @override
  State<ChangeForThisOrAllDialogue> createState() =>
      _ChangeForThisOrAllDialogueState();
}

class _ChangeForThisOrAllDialogueState
    extends State<ChangeForThisOrAllDialogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              "Would you like to change this event or all following repeated events?"),
          ElevatedButton(
              onPressed: widget.onThis,
              child: const Text("Change Only this event")),
          ElevatedButton(
              onPressed: widget.onFollowing,
              child: const Text("Change all following repeated events")),
        ],
      ),
    );
  }
}
