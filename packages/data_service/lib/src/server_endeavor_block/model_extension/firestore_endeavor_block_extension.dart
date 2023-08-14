import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';

extension FirestoreEndeavorBlockExtension on EndeavorBlock {
  static EndeavorBlock fromDocData({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return EndeavorBlock(
      id: id,
      endeavorReference: EndeavorReference(
        title: data['endeavorTitle'],
        id: data['endeavorId'],
      ),
      repeatingEndeavorBlockId: data['repeatingEndeavorBlockId'],
      event: Event(
        start: DateTime.fromMicrosecondsSinceEpoch(
          (data['start'] as Timestamp).microsecondsSinceEpoch,
        ),
        end: DateTime.fromMicrosecondsSinceEpoch(
          (data['end'] as Timestamp).microsecondsSinceEpoch,
        ),
      ),
    );
  }

  static final endeavorBlockListTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<EndeavorBlock>>.fromHandlers(
    handleData: (querySnap, sink) {
      sink.add(querySnap.docs
          .map(
            (queryDocSnap) => FirestoreEndeavorBlockExtension.fromDocData(
              id: queryDocSnap.id,
              data: queryDocSnap.data(),
            ),
          )
          .toList());
    },
  );
}
