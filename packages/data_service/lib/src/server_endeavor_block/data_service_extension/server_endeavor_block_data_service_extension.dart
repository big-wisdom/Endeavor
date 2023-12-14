import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_endeavor_block/model_extension/server_repeating_endeavor_block_database_fields.dart';
import 'package:server_data_models/server_data_models.dart';

extension ServerEndeavorBlockDataServiceExtension on DataService {
  static Stream<List<ServerEndeavorBlock>> get serverEndeavorBlockStream =>
      DataService.userDataDoc
          .collection('endeavorBlocks')
          .snapshots()
          .transform(_querySnapToServerEndeavorBlockListTransformer);

  static final _querySnapToServerEndeavorBlockListTransformer =
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<ServerEndeavorBlock>>.fromHandlers(
    handleData: (querySnap, sink) => sink.add(
      querySnap.docs
          .map((docSnap) =>
              FirestoreServerEndeavorBlockExtension.fromDocSnap(docSnap))
          .toList(),
    ),
  );

  static void createEndeavorBlock(UnidentifiedEndeavorBlock endeavorBlock) {
    DataService.userDataDoc
        .collection('endeavorBlocks')
        .add(endeavorBlock.toDocData());
  }

  static void deleteEndeavorBlock(String id) async {
    final endeavorBlockDocRef =
        DataService.userDataDoc.collection('endeavorBlocks').doc(id);
    final endeavorBlockDocSnap = await endeavorBlockDocRef.get();
    if (endeavorBlockDocSnap.exists && endeavorBlockDocSnap.data() != null) {
      final seb = FirestoreServerEndeavorBlockExtension.fromDocSnap(
        endeavorBlockDocSnap,
      );
      if (seb.repeatingEndeavorBlockId != null) {
        final rebRef = DataService.userDataDoc
            .collection('repeatingEndeavorBlocks')
            .doc(seb.repeatingEndeavorBlockId);
        await rebRef.update({
          ServerRepeatingEndeavorBlockDataFields.endeavorBlockIds.text():
              FieldValue.arrayRemove([id])
        });
        final rebSnap = await rebRef.get();
        if ((rebSnap.data()![ServerRepeatingEndeavorBlockDataFields
                .endeavorBlockIds
                .text()] as List)
            .isEmpty) {
          rebRef.delete();
        }
      }
      endeavorBlockDocRef.delete();
    } else {
      throw Exception("Endeavor Block doesn't exist!? WUh?");
    }
  }
}
