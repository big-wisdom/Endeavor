import 'package:flutter/material.dart';

class ChangeForThisOrAllDialogue extends StatefulWidget {
  const ChangeForThisOrAllDialogue({super.key});

  @override
  State<ChangeForThisOrAllDialogue> createState() =>
      _ChangeForThisOrAllDialogueState();
}

class _ChangeForThisOrAllDialogueState
    extends State<ChangeForThisOrAllDialogue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text("Here's the dialogue"),
      ],
    );
  }
}
