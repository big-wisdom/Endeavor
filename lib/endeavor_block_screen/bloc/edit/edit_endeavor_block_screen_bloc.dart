import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';

import '../endeavor_block_screen_bloc.dart';

class EditEndeavorBlockScreenBloc extends EndeavorBlockScreenBloc {
  EditEndeavorBlockScreenBloc({
    required DataRepository dataRepository,
    required EndeavorBlock endeavorBlock,
  }) : super(
          SingleEndeavorBlockScreenState(
            endeavorReference:
                EndeavorPickerRowInput.pure(endeavorBlock.endeavorReference),
            event: EventInput.pure(endeavorBlock.event),
            isEdit: true,
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
      (_, __) => throw Exception("Cannot create when editing"),
    );

    on<DeleteRequested>(
      (event, emit) => throw UnimplementedError(),
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
