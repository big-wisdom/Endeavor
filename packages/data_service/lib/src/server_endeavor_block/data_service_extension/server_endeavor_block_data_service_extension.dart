import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
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
}
