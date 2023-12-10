import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class EndeavorBlockScreenBloc extends FormBloc<String, String> {
  InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  BooleanFieldBloc repeating;
  InputFieldBloc<Event?, String> event;
  InputFieldBloc<RepeatingEvent?, String> repeatingEvent;
  final bool editing;

  EndeavorBlockScreenBloc.create()
      : endeavorReference =
            InputFieldBloc<EndeavorReference?, dynamic>(initialValue: null),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: false),
        event =
            InputFieldBloc<Event, String>(initialValue: Event.generic(null)),
        repeatingEvent =
            InputFieldBloc<RepeatingEvent?, String>(initialValue: null),
        editing = false {
    repeating.onValueChanges(onData: ((previous, current) async* {
      if (current.value) {
        addFieldBlocs(fieldBlocs: [repeatingEvent]);
        removeFieldBlocs(fieldBlocs: [event]);
      } else {
        addFieldBlocs(fieldBlocs: [event]);
        removeFieldBlocs(fieldBlocs: [repeatingEvent]);
      }
    }));
    addFieldBlocs(fieldBlocs: [
      endeavorReference,
      if (!editing) repeating,
      event,
    ]);
  }

  EndeavorBlockScreenBloc.edit(EndeavorBlock endeavorBlock)
      : endeavorReference =
            InputFieldBloc(initialValue: endeavorBlock.endeavorReference),
        event = InputFieldBloc(initialValue: endeavorBlock.event),
        repeating = BooleanFieldBloc(initialValue: false),
        repeatingEvent = InputFieldBloc(initialValue: null),
        editing = true {
    addFieldBlocs(fieldBlocs: [
      endeavorReference,
      event,
    ]);
  }

  void onDelete() {
    debugPrint("delete plz");
  }

  @override
  Future<void> close() {
    repeatingEvent.close();
    event.close();
    return super.close();
  }

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

  @override
  FutureOr<void> onSubmitting() {
    if (state.contains(repeatingEvent)) {
      AbstractRepeatingEndeavorBlockDataServiceExtension
          .createRepeatingEndeavorBlock(UnidentifiedRepeatingEndeavorBlock(
        endeavorReference: endeavorReference.value!,
        repeatingEvent: repeatingEvent.value!,
      ));
    } else {
      ServerEndeavorBlockDataServiceExtension.createEndeavorBlock(
        UnidentifiedEndeavorBlock(
          repeatingEndeavorBlockId: null,
          endeavorReference: endeavorReference.value!,
          event: event.value!,
        ),
      );
    }
  }
}
