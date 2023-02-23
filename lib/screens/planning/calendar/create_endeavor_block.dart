import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/endeavor_block/repeating_endeavor_block.dart';
import 'package:endeavor/Models/event/repeating_event.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:endeavor/widgets/change_for_this_or_all_dialogue.dart';
import 'package:endeavor/widgets/endeavor_dropdown_button.dart';
import 'package:endeavor/widgets/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker.dart';
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
    // This implys creating
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
    // TODO: Possible scenarios
    //      Creating a new endeavor block, repeating or single
    //      editing a single
    //      editing a repeating

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
                  EndeavorsDropdownButton(
                    uid: widget.uid,
                    onChanged: (value) {
                      setState(() {
                        if (value != endeavorBlock.endeavorId) {
                          // if creating, or editing single just change it
                          if ((editing &&
                                  endeavorBlock.type ==
                                      EndeavorBlockType.single) ||
                              !editing) {
                            endeavorBlock.endeavorId = value;
                            if (editing) {
                              // if editing a single, just change it on the server too
                              updateDataOnServer('endeavorId', value);
                            }
                          } else {
                            // If editing a repeating, we need to ask if we
                            // are changing them all or just this one
                            showDialog(
                                context: context,
                                builder: (context) {
                                  // TODO: Implement this
                                  return const ChangeForThisOrAllDialogue();
                                });
                          }
                        }
                      });
                    },
                    firstValue: (value) {
                      if (!editing) {
                        // sets the initial value when creating
                        endeavorBlock.endeavorId = value;
                        repeatingEndeavorBlock
                            .then((reb) => reb.endeavorId = value);
                      }
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
              if (endeavorBlock.type == EndeavorBlockType.single)
                OneTimeEventPicker(
                  event: endeavorBlock.event!,
                  onChanged: editing ? updateDataOnServer : null,
                ),

              // repeating endeavor block picker
              if (endeavorBlock.type == EndeavorBlockType.repeating)
                FutureBuilder<RepeatingEndeavorBlock>(
                  future: repeatingEndeavorBlock,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RepeatingEventPicker(
                        repeatingEvent: snapshot.data!.repeatingEvent!,
                        onChanged: editing ? updateDataOnServer : null,
                      );
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
                            for (EndeavorBlock block in blocks) {
                              final docRef = FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.uid)
                                  .collection('endeavorBlocks')
                                  .doc();
                              batch.set(docRef, {
                                'endeavorId': block.endeavorId,
                                'type': block.type.toString(),
                                'start': block.event!.start!,
                                'end': block.event!.end!,
                              });
                            }
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
                      // delete repeating
                      // TODO: implement
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Delete"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void updateDataOnServer(String dataField, dynamic value) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .collection('endeavorBlocks')
        .doc(endeavorBlock.id)
        .update({dataField: value});
  }
}
