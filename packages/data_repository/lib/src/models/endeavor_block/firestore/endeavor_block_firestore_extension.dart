import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart'
    show EndeavorReference, Event;

import '../abstract_endeavor_block/abstract_single_endeavor_block/endeavor_block.dart';

extension EndeavorBlockFirestoreExtension on EndeavorBlock {
  static EndeavorBlock fromDocData({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return EndeavorBlock(
      id: id,
      endeavorReference: EndeavorReference(
        endeavorTitle: data['endeavorTitle'],
        endeavorId: data['endeavorId'],
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
            (queryDocSnap) => EndeavorBlockFirestoreExtension.fromDocData(
              id: queryDocSnap.id,
              data: queryDocSnap.data(),
            ),
          )
          .toList());
    },
  );
}
