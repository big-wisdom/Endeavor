import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_endeavor_block/model_extension/server_repeating_endeavor_block_database_fields.dart';

extension AbstractRepeatingEndeavorBlockDataServiceExtension on DataService {
  static void createRepeatingEndeavorBlock(
    UnidentifiedRepeatingEndeavorBlock repeatingEndeavorBlock,
  ) {
    final batch = FirebaseFirestore.instance.batch();
    List<String> endeavorBlockIds = [];

    // Create a doc to connect all the repeated blocks
    final repeatingDocRef =
        DataService.userDataDoc.collection('repeatingEndeavorBlocks').doc();

    // Create a doc for each block
    for (Event event in repeatingEndeavorBlock.repeatingEvent.events) {
      // create an endeavor block from the event
      final endeavorBlock = UnidentifiedEndeavorBlock(
        endeavorReference: repeatingEndeavorBlock.endeavorReference,
        event: event,
        repeatingEndeavorBlockId: repeatingDocRef.id,
      );
      // create a doc ref for that endeavor block
      final docRef = DataService.userDataDoc.collection('endeavorBlocks').doc();
      // add that doc id to the repeating endeavor block ids ?
      endeavorBlockIds.add(docRef.id);
      // have the batch create the doc
      batch.set(docRef, endeavorBlock.toDocData());
    }

    // set data for the repeating endeavor block document
    batch.set(repeatingDocRef, {
      ServerRepeatingEndeavorBlockDataFields.endeavorBlockIds.text():
          endeavorBlockIds,
    });

    batch.commit();
  }

  static void editThisAndFollowingEndeavorBlocks({
    required String endeavorBlockId,
    required String repeatingEndeavorBlockId,
    required UnidentifiedEndeavorBlock unidentifiedEndeavorBlock,
  }) async {
    // call firebase cloud function
    HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('editThisAndFollowingEndeavorBlocks');
    await callable.call(
      {
        'userId': DataService.userDataDoc.id,
        'selectedEndeavorBlockId': endeavorBlockId,
        'repeatingEndeavorBlockId': repeatingEndeavorBlockId,
        'unidentifiedEndeavorBlock': unidentifiedEndeavorBlock.toJson(),
      },
    );
  }

  static void deleteThisAndFollowing({
    required String endeavorBlockId,
    required String repeatingEndeavorBlockId,
  }) async {
    HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('deleteThisAndFollowingEndeavorBlocks');
    await callable.call({
      'userId': DataService.userDataDoc.id,
      'selectedEndeavorBlockId': endeavorBlockId,
      'repeatingEndeavorBlockId': repeatingEndeavorBlockId,
    });
  }
}
