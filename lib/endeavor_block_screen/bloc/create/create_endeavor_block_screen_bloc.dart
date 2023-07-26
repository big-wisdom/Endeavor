import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';

import '../endeavor_block_screen_bloc.dart';

class CreateEndeavorBlockScreenBloc extends EndeavorBlockScreenBloc {
  CreateEndeavorBlockScreenBloc()
      : super(
          SingleEndeavorBlockScreenState(
            endeavorReference: EndeavorPickerRowInput.pure(null),
            event: EventInput.pure(null),
            isEdit: false,
          ),
        ) {
    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<TypeChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<RepeatingEventChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<CreateRequested>(
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
    );
  }
}
