import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/widgets/old_endeavor_selector/endeavor_selection_view.dart';
import 'package:flutter/material.dart';

class EndeavorPickerRow extends StatelessWidget {
  const EndeavorPickerRow(
      {required this.uid,
      required this.initialId,
      required this.onChanged,
      super.key});

  final String uid;
  final String? initialId;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    if (initialId != null) {
      final futureEndeavorDocSnap = FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("endeavors")
          .doc(initialId!)
          .get();

      return FutureBuilder(
        future: futureEndeavorDocSnap,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Text("Some error, call Eli");
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Endeavor"),
              TextButton(
                onPressed: () => _launchEndeavorSelectionView(context),
                child: Text(snapshot.data!.data()!['text']),
              )
            ],
          );
        },
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Endeavor"),
          TextButton(
            onPressed: () => _launchEndeavorSelectionView(context),
            child: const Text("Add Endeavor"),
          )
        ],
      );
    }
  }

  void _launchEndeavorSelectionView(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EndeavorSelectionView(
        uid: uid,
        initialSelectedId: initialId,
        onChanged: onChanged,
      );
    }));
  }
}
