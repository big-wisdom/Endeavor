import 'package:flutter/material.dart';

class ThisAndFollowingDialogue extends StatelessWidget {
  final void Function() onThisOnly;
  final void Function() onThisAndFollowing;
  final String action;
  final String type;

  const ThisAndFollowingDialogue({
    required this.onThisOnly,
    required this.onThisAndFollowing,
    required this.action,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "This is part of a repeating $type. Would you like to $action just this $type, this and all future repeating ${type}s",
            ),
            ElevatedButton(
              onPressed: () {
                onThisOnly();
                Navigator.pop(context);
              },
              child: const Text("Just this one"),
            ),
            ElevatedButton(
              onPressed: () {
                onThisAndFollowing();
                Navigator.pop(context);
              },
              child: const Text("This one and all following"),
            )
          ],
        ),
      ),
    );
  }
}
