import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/Endeavor/endeavor.dart';
import 'package:endeavor/widgets/old_endeavor_selector/endeavor_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

class EndeavorSelectionView extends StatefulWidget {
  const EndeavorSelectionView(
      {required this.uid,
      required this.initialSelectedId,
      required this.onChanged,
      super.key});

  final String uid;
  final String? initialSelectedId;
  final void Function(String?) onChanged;

  @override
  State<EndeavorSelectionView> createState() => _EndeavorSelectionViewState();
}

class _EndeavorSelectionViewState extends State<EndeavorSelectionView> {
  late String? selectedEndeavorId;
  Set<String> expandedIds = {};

  @override
  void initState() {
    selectedEndeavorId = widget.initialSelectedId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userDocStream = FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .snapshots();
    final endeavorsStream = FirebaseFirestore.instance
        .collection("users")
        .doc(widget.uid)
        .collection("endeavors")
        .snapshots();

    return WillPopScope(
      onWillPop: () async {
        widget.onChanged(selectedEndeavorId);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Select Endeavor")),
        body: SafeArea(
          child: StreamBuilder2(
              streams: StreamTuple2(userDocStream, endeavorsStream),
              builder: (context, snapshots) {
                // if either is waiting say loading
                if (snapshots.snapshot1.connectionState ==
                        ConnectionState.waiting ||
                    snapshots.snapshot2.connectionState ==
                        ConnectionState.waiting) {
                  return const Text("Loading...");
                }

                // if either has an error, or they don't have data tell them to contact me
                if (snapshots.snapshot1.hasError ||
                    snapshots.snapshot2.hasError ||
                    !snapshots.snapshot1.hasData ||
                    !snapshots.snapshot2.hasData) {
                  return const Text(
                      "Something went wrong, you better text Eli");
                }

                // Get primary endeavorId's from the user doc
                var primaryEndeavorIds =
                    snapshots.snapshot1.data!.data()!["primaryEndeavorIds"];
                if (primaryEndeavorIds != null) {
                  primaryEndeavorIds = (primaryEndeavorIds as List)
                      .map((id) => id as String)
                      .toList();
                } else {
                  return const Text("No Endeavors yet. Dream big!");
                }

                // get all endeavors from the endeavors stream
                var endeavors =
                    snapshots.snapshot2.data!.docs.map((endeavorDocSnap) {
                  return Endeavor.fromDocSnap(endeavorDocSnap);
                }).toList();

                // construct the tree
                List<Endeavor> treeOfLife = [];
                for (String id in primaryEndeavorIds) {
                  // find primary endeavor in endeavors list
                  Endeavor? endeavor;
                  for (var e in endeavors) {
                    if (e.id == id) {
                      endeavor = e;
                    }
                  }

                  // if you found it construct it's tree and add it to the full tree
                  if (endeavor != null) {
                    endeavor.constructTree(endeavors);
                    treeOfLife.add(endeavor);
                  }
                }

                return SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Endeavor primaryEndeavor = treeOfLife[index];
                      return EndeavorSelectionTile(
                        endeavor: primaryEndeavor,
                        selectedEndeavorId: selectedEndeavorId,
                        onSelected: (newId) {
                          setState(() {
                            selectedEndeavorId = newId;
                          });
                        },
                        expandedIds: expandedIds,
                        onExpansionChanged: (endeavorId, expanded) {
                          setState(() {
                            if (expanded) {
                              expandedIds.add(endeavorId);
                            } else {
                              expandedIds.remove(endeavorId);
                            }
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: treeOfLife.length,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
