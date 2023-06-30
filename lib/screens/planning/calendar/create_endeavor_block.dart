import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/endeavor_block/repeating_endeavor_block.dart';
import 'package:endeavor/Models/event/repeating_event.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:endeavor/widgets/change_for_this_or_all_dialogue.dart';
import 'package:endeavor/widgets/old_endeavor_selector/endeavor_picker_row.dart';
import 'package:endeavor/widgets/old_one_time_event_picker.dart';
import 'package:endeavor/widgets/old_repeating_event_picker.dart';
import 'package:flutter/material.dart';

import '../../../Models/event/event.dart';

class CreateOrEditEndeavorBlock extends StatefulWidget {
  // I use multiple facorty constructors here to help clarify what the page is
  // currently being used for

  // The user has no way of accessing a repeating endeavor block except through
  // one of it's child endeavor blocks, so I will never pass in a
  // RepeatingEndeavorBlock
  const CreateOrEditEndeavorBlock._(
      {this.endeavorBlock,
      required this.uid,
      required this.setCalendarView,
      super.key});

  factory CreateOrEditEndeavorBlock.edit(
      {required endeavorBlock, required uid, required setCalendarView, key}) {
    return CreateOrEditEndeavorBlock._(
      uid: uid,
      setCalendarView: setCalendarView,
      endeavorBlock: endeavorBlock,
      key: key,
    );
  }

  factory CreateOrEditEndeavorBlock.create(
      {required uid, required setCalendarView}) {
    return CreateOrEditEndeavorBlock._(
      uid: uid,
      setCalendarView: setCalendarView,
    );
  }

  final EndeavorBlock? endeavorBlock;
  final String uid;
  final Function(CalendarView, DateTime) setCalendarView;

  @override
  State<CreateOrEditEndeavorBlock> createState() =>
      _CreateOrEditEndeavorBlockState();
}

class _CreateOrEditEndeavorBlockState extends State<CreateOrEditEndeavorBlock> {
  late EndeavorBlock endeavorBlock;
  late Future<RepeatingEndeavorBlock> repeatingEndeavorBlock;
  late bool editing;

  @override
  void initState() {
    // This implies creating
    if (widget.endeavorBlock == null) {
      editing = false;
      // Start the user in single mode
      endeavorBlock = EndeavorBlock(
        type: EndeavorBlockType.single,
        event: Event(
          start: DateTime.now(),
          end: DateTime.now().add(const Duration(hours: 1)),
        ),
      );
      // Create a repeating in case the user switches to repeating
      repeatingEndeavorBlock = Future.value(
        RepeatingEndeavorBlock(
          repeatingEvent: RepeatingEvent(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            startTime: TimeOfDay.now(),
            endTime: TimeOfDay.fromDateTime(
              DateTime.now().add(
                const Duration(hours: 1),
              ),
            ),
            daysOfWeek: [false, false, false, false, false, false, false],
          ),
        ),
      );
    } else {
      editing = true;
      endeavorBlock = widget.endeavorBlock!;
      if (endeavorBlock.type == EndeavorBlockType.repeating) {
        repeatingEndeavorBlock = FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .collection('repeatingEndeavorBlocks')
            .doc(endeavorBlock.repeatingEndeavorBlockId)
            .get()
            .then((docSnap) => RepeatingEndeavorBlock.fromDocSnap(docSnap));
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${editing ? "Edit" : "Create"} Endeavor Block",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Endeavor picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Endeavor:"),
                  EndeavorPickerRow(
                    initialId: endeavorBlock.endeavorId,
                    uid: widget.uid,
                    onChanged: (value) {
                      setState(() {
                        // if editing
                        if (editing) {
                          // if single change it and update server
                          if (value != endeavorBlock.endeavorId) {
                            if (endeavorBlock.type ==
                                EndeavorBlockType.single) {
                              endeavorBlock.endeavorId = value;
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ChangeForThisOrAllDialogue(
                                      onThis: () {
                                        endeavorBlock.endeavorId = value;
                                      },
                                      onFollowing: () {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(widget.uid)
                                            .collection("endeavorBlocks")
                                            .where("repeatingEndeavorBlockId",
                                                isEqualTo: endeavorBlock
                                                    .repeatingEndeavorBlockId)
                                            .where("start",
                                                isGreaterThanOrEqualTo:
                                                    endeavorBlock.event!.start!)
                                            .get()
                                            .then((result) {
                                          final batch = FirebaseFirestore
                                              .instance
                                              .batch();
                                          for (var doc in result.docs) {
                                            if (doc.exists) {
                                              batch.update(
                                                doc.reference,
                                                {'endeavorId': value},
                                              );
                                            }
                                          }
                                          batch.commit();
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  });
                            }
                          }
                          // if repeating, show dialogue to change one or all
                        } else {
                          // if creating just change it
                          if (value != endeavorBlock.endeavorId) {
                            endeavorBlock.endeavorId = value;
                            repeatingEndeavorBlock
                                .then((reb) => reb.endeavorId = value);
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
              // Type picker, I could make this show to convert single to repeating
              if (!editing)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Type:'),
                    DropdownButton(
                      value: endeavorBlock.type,
                      items: const [
                        DropdownMenuItem(
                          value: EndeavorBlockType.single,
                          child: Text("One Time"),
                        ),
                        DropdownMenuItem(
                          value: EndeavorBlockType.repeating,
                          child: Text("Repeated"),
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          if (value != endeavorBlock.type) {
                            // we are creating so we just need to switch the value
                            endeavorBlock.type = value;
                          }
                        });
                      },
                    )
                  ],
                ),

              // One time endeavor block picker
              if (endeavorBlock.type == EndeavorBlockType.single || editing)
                OneTimeEventPicker(
                  event: endeavorBlock.event!,
                  onChanged: editing
                      ? (newEvent) => newEvent == null
                          ? null
                          : updateDataOnServer(newEvent.toDocData())
                      : null,
                ),

              // repeating endeavor block picker
              if (endeavorBlock.type == EndeavorBlockType.repeating && !editing)
                FutureBuilder<RepeatingEndeavorBlock>(
                  future: repeatingEndeavorBlock,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return OldRepeatingEventPicker(
                        repeatingEvent: snapshot.data!.repeatingEvent!,
                        onChanged: editing
                            ? (repeatingEvent) =>
                                updateDataOnServer(repeatingEvent.toDocData()!)
                            : (repeatingEvent) {
                                repeatingEndeavorBlock.then((reb) {
                                  repeatingEndeavorBlock = Future.value(
                                    RepeatingEndeavorBlock(
                                      repeatingEvent: repeatingEvent,
                                      endeavorId: reb.endeavorId,
                                    ),
                                  );
                                });
                              },
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return const Text("Loading...");
                    }
                  },
                ),
              // Create button
              if (!editing)
                ElevatedButton(
                  onPressed: () {
                    // Single
                    if (endeavorBlock.type == EndeavorBlockType.single &&
                        endeavorBlock.validate()) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.uid)
                          .collection('endeavorBlocks')
                          .add(
                        {
                          'endeavorId': endeavorBlock.endeavorId,
                          'type': endeavorBlock.type.toString(),
                          'start': endeavorBlock.event!.start!,
                          'end': endeavorBlock.event!.end!,
                        },
                      );
                    } else {
                      // Repeating
                      repeatingEndeavorBlock.then((reb) {
                        if (reb.validate()) {
                          List<EndeavorBlock>? blocks = reb.endeavorBlocks;
                          if (blocks != null) {
                            final batch = FirebaseFirestore.instance.batch();

                            // Create a doc to connect all the repeated blocks
                            final repeatingDocRef = FirebaseFirestore.instance
                                .collection('users')
                                .doc(widget.uid)
                                .collection('repeatingEndeavorBlocks')
                                .doc(); // no specific doc because we're creating
                            reb.endeavorBlockIds = [];

                            // Create a doc for each block
                            for (EndeavorBlock block in blocks) {
                              final docRef = FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.uid)
                                  .collection('endeavorBlocks')
                                  .doc();
                              reb.endeavorBlockIds!.add(docRef.id);
                              batch.set(docRef, {
                                'endeavorId': block.endeavorId,
                                'type': block.type.toString(),
                                'start': block.event!.start!,
                                'end': block.event!.end!,
                                // this connects each repeated block back to the
                                // RepeatingEndeavorBlock
                                'repeatingEndeavorBlockId': repeatingDocRef.id,
                              });
                            }

                            batch.set(repeatingDocRef, reb.toDocData());

                            batch.commit();
                          }
                        }
                      });
                    }
                    // widget.setCalendarView(
                    //    CalendarView.week, endeavorBlock.event!.start!);
                    Navigator.pop(context);
                  },
                  child: const Text("Add Block"),
                ),
              // delete button
              if (editing)
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () {
                    if (endeavorBlock.type == EndeavorBlockType.single) {
                      // delete single
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.uid)
                          .collection('endeavorBlocks')
                          .doc(endeavorBlock.id)
                          .delete();
                    } else {
                      debugPrint("delete repeating");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ChangeForThisOrAllDialogue(
                            onThis: () {
                              // delete single
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.uid)
                                  .collection('endeavorBlocks')
                                  .doc(endeavorBlock.id)
                                  .delete();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            onFollowing: () {
                              // delete repeating
                              repeatingEndeavorBlock.then((reb) async {
                                HttpsCallable callable =
                                    FirebaseFunctions.instance.httpsCallable(
                                        'deleteThisAndFollowingEndeavorBlocks');
                                final resp =
                                    await callable.call(<String, dynamic>{
                                  'userId': widget.uid,
                                  'repeatingEndeavorBlockId': reb.id,
                                  'selectedEndeavorBlockId': endeavorBlock.id,
                                });
                                debugPrint("Result: ${resp.data}");
                              });
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    }
                  },
                  child: const Text("Delete"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void updateDataOnServer(Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavorBlocks')
        .doc(endeavorBlock.id)
        .update(data);
  }
}
