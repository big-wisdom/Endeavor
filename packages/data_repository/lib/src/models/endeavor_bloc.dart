import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class EndeavorBlock extends Equatable {
  final String? id;
  final String? endeavorId;
  final EndeavorBlockType? type;
  final String? repeatingEndeavorBlockId;
  final Event? event;

  EndeavorBlock(
      {this.id,
      this.endeavorId,
      this.type,
      this.event,
      this.repeatingEndeavorBlockId});

  EndeavorBlock.fromDocData({
    required String this.id,
    required Map<String, dynamic> docSnapData,
  })  : endeavorId = docSnapData['endeavorId'],
        type = EndeavorBlockType.values
            .firstWhere((t) => t.toString() == docSnapData['type']),
        repeatingEndeavorBlockId = EndeavorBlockType.values
                    .firstWhere((t) => t.toString() == docSnapData['type']) ==
                EndeavorBlockType.repeating
            ? docSnapData['repeatingEndeavorBlockId']
            : null,
        event = Event(
          start: DateTime.fromMicrosecondsSinceEpoch(
            (docSnapData['start'] as Timestamp).microsecondsSinceEpoch,
          ),
          end: DateTime.fromMicrosecondsSinceEpoch(
            (docSnapData['end'] as Timestamp).microsecondsSinceEpoch,
          ),
        );

  static final endeavorBlockListTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<EndeavorBlock>>.fromHandlers(
    handleData: (querySnap, sink) {
      sink.add(querySnap.docs
          .map(
            (queryDocSnap) => EndeavorBlock.fromDocData(
              id: queryDocSnap.id,
              docSnapData: queryDocSnap.data(),
            ),
          )
          .toList());
    },
  );

  @override
  List<Object?> get props =>
      [id, endeavorId, type, repeatingEndeavorBlockId, event];
}

enum EndeavorBlockType { single, repeating }
