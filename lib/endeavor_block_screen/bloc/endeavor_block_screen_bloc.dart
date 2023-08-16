import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'endeavor_block_screen_event.dart';
part 'endeavor_block_screen_state.dart';

class EndeavorBlockScreenBloc
    extends Bloc<EndeavorBlockScreenEvent, EndeavorBlockScreenState> {
  factory EndeavorBlockScreenBloc.create() {
    return EndeavorBlockScreenBloc._(
      initialState: SingleEndeavorBlockScreenState(
        endeavorReference: EndeavorPickerRowInput.pure(null),
        event: EventInput.pure(null),
        isEdit: false,
      ),
    );
  }

  factory EndeavorBlockScreenBloc.edit(EndeavorBlock endeavorBlock) {
    return EndeavorBlockScreenBloc._(
      initialState: SingleEndeavorBlockScreenState(
        endeavorReference:
            EndeavorPickerRowInput.pure(endeavorBlock.endeavorReference),
        event: EventInput.pure(endeavorBlock.event),
        isEdit: true,
      ),
    );
  }

  EndeavorBlockScreenBloc._({
    required EndeavorBlockScreenState initialState,
  }) : super(initialState) {
    on<EndeavorChanged>(
      (event, emit) => emit(
        (() {
          if (state is SingleEndeavorBlockScreenState) {
            return (state as SingleEndeavorBlockScreenState).copyWith(
              endeavorReference: EndeavorReference.fromEndeavor(
                event.endeavor!,
              ),
            );
          } else {
            return (state as RepeatingEndeavorBlockScreenState).copyWith(
                endeavorReference:
                    EndeavorReference.fromEndeavor(event.endeavor!));
          }
        })(),
      ),
    );

    on<TypeChanged>(
      (event, emit) => emit(
        (() {
          if (event.newType == EndeavorBlockType.single) {
            return SingleEndeavorBlockScreenState(
              endeavorReference: state.endeavorReference,
              event: EventInput.dirty(
                (() {
                  final repeatingEvent =
                      (state as RepeatingEndeavorBlockScreenState)
                          .repeatingEventInput
                          .value;
                  return Event(
                    start: repeatingEvent.startDate.copyWith(
                      hour: repeatingEvent.startTime.hour,
                      minute: repeatingEvent.startTime.minute,
                    ),
                    end: repeatingEvent.startDate.copyWith(
                      hour: repeatingEvent.endTime.hour,
                      minute: repeatingEvent.endTime.minute,
                    ),
                  );
                })(),
              ),
              isEdit: false,
            );
          } else {
            return RepeatingEndeavorBlockScreenState(
              endeavorReference: state.endeavorReference,
              repeatingEventInput: RepeatingEventInput.dirty(
                (() {
                  final event =
                      (state as SingleEndeavorBlockScreenState).event.value;
                  return RepeatingEvent(
                    startDate: event.start,
                    endDate: event.start,
                    startTime: TimeOfDay.fromDateTime(event.start),
                    endTime: TimeOfDay.fromDateTime(event.end),
                  );
                })(),
              ),
            );
          }
        })() as EndeavorBlockScreenState,
      ),
    );

    on<EventChanged>(
      (event, emit) {
        if (state is! SingleEndeavorBlockScreenState) {
          throw Exception("state should be single");
        }
        emit((state as SingleEndeavorBlockScreenState)
            .copyWith(event: event.newEvent));
      },
    );

    on<RepeatingEventChanged>(
      (event, emit) {
        if (state is! RepeatingEndeavorBlockScreenState) {
          throw Exception("State should be repeating state");
        }
        emit(
          (state as RepeatingEndeavorBlockScreenState).copyWith(
            repeatingEvent: event.newRepeatingEvent,
          ),
        );
      },
    );

    on<Save>(
      (_, emit) => throw UnimplementedError(),

      /// code for creating
      // Single
      // if (endeavorBlock.type == EndeavorBlockType.single &&
      //     endeavorBlock.validate()) {
      //   FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(widget.uid)
      //       .collection('endeavorBlocks')
      //       .add(
      //     {
      //       'endeavorId': endeavorBlock.endeavorId,
      //       'type': endeavorBlock.type.toString(),
      //       'start': endeavorBlock.event!.start!,
      //       'end': endeavorBlock.event!.end!,
      //     },
      //   );
      // } else {
      //   // Repeating
      //   repeatingEndeavorBlock.then((reb) {
      //     if (reb.validate()) {
      //       List<EndeavorBlock>? blocks = reb.endeavorBlocks;
      //       if (blocks != null) {
      //         final batch = FirebaseFirestore.instance.batch();

      //         // Create a doc to connect all the repeated blocks
      //         final repeatingDocRef = FirebaseFirestore.instance
      //             .collection('users')
      //             .doc(widget.uid)
      //             .collection('repeatingEndeavorBlocks')
      //             .doc(); // no specific doc because we're creating
      //         reb.endeavorBlockIds = [];

      //         // Create a doc for each block
      //         for (EndeavorBlock block in blocks) {
      //           final docRef = FirebaseFirestore.instance
      //               .collection('users')
      //               .doc(widget.uid)
      //               .collection('endeavorBlocks')
      //               .doc();
      //           reb.endeavorBlockIds!.add(docRef.id);
      //           batch.set(docRef, {
      //             'endeavorId': block.endeavorId,
      //             'type': block.type.toString(),
      //             'start': block.event!.start!,
      //             'end': block.event!.end!,
      //             // this connects each repeated block back to the
      //             // RepeatingEndeavorBlock
      //             'repeatingEndeavorBlockId': repeatingDocRef.id,
      //           });
      //         }

      //         batch.set(repeatingDocRef, reb.toDocData());

      //         batch.commit();
      //       }
      //     }
      //   });
      // }
    );

    on<DeleteRequested>(
      (_, __) => throw Exception("Cannot delete when creating"),
      // if (endeavorBlock.type == EndeavorBlockType.single) {
      //   // delete single
      //   FirebaseFirestore.instance
      //       .collection('users')
      //       .doc(widget.uid)
      //       .collection('endeavorBlocks')
      //       .doc(endeavorBlock.id)
      //       .delete();
      // } else {
      //   debugPrint("delete repeating");
      //   showDialog(
      //     context: context,
      //     builder: (context) {
      //       return ChangeForThisOrAllDialogue(
      //         onThis: () {
      //           // delete single
      //           FirebaseFirestore.instance
      //               .collection('users')
      //               .doc(widget.uid)
      //               .collection('endeavorBlocks')
      //               .doc(endeavorBlock.id)
      //               .delete();
      //           Navigator.pop(context);
      //           Navigator.pop(context);
      //         },
      //         onFollowing: () {
      //           // delete repeating
      //           repeatingEndeavorBlock.then((reb) async {
      //             HttpsCallable callable = FirebaseFunctions.instance
      //                 .httpsCallable('deleteThisAndFollowingEndeavorBlocks');
      //             final resp = await callable.call(<String, dynamic>{
      //               'userId': widget.uid,
      //               'repeatingEndeavorBlockId': reb.id,
      //               'selectedEndeavorBlockId': endeavorBlock.id,
      //             });
      //             debugPrint("Result: ${resp.data}");
      //           });
      //           Navigator.pop(context);
      //           Navigator.pop(context);
      //         },
      //       );
      //     },
      //   );
      // }
    );
  }
}
