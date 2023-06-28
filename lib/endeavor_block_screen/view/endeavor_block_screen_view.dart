import '../bloc/endeavor_block_screen_bloc.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndeavorBlockScreenView extends StatelessWidget {
  const EndeavorBlockScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _TitleText(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _EndeavorPickerRow(),
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
                      return RepeatingEventPicker(
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
}

class _TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      buildWhen: (previous, current) => previous.isEdit != current.isEdit,
      builder: (context, state) {
        return Text("${state.isEdit ? "Edit" : "Create"} Endeavor Block");
      },
    );
  }
}

class _EndeavorPickerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      builder: (context, state) {
        return EndeavorPickerRow(
          endeavorInput: state.endeavor,
          onChanged: (endeavor) => context
              .read<EndeavorBlockScreenBloc>()
              .add(EndeavorChanged(endeavor)),
        );
      },
    );
  }
}
