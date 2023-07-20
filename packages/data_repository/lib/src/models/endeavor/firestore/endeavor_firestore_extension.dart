import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension EndeavorFirestoreExtension on Endeavor {
  Map<String, dynamic> toData() {
    return {
      'text': title,
      'subEndeavorReferences': subEndeavorReferences
          .map((e) => {
                "id": e.id,
                "title": e.title,
              })
          .toList(),
      'parentEndeavorId': parentEndeavorId,
      'taskReferences': taskReferences
          .map((t) => {
                'id': t.id,
                'title': t.title,
              })
          .toList(),
      'color': color?.value.toRadixString(16),
    };
  }

  static Endeavor fromDocSnap(String id, Map<String, dynamic> data) {
    List<EndeavorReference> subEndeavorReferences = [];
    if (data['subEndeavorReferences'] != null) {
      subEndeavorReferences = (data['subEndeavorIds'] as List)
          .map((e) => e as Map<String, dynamic>)
          .map(
            (e) => EndeavorReference(
              title: e['title']!,
              id: e['id']!,
            ),
          )
          .toList();
    }

    List<TaskReference> taskReferences = [];
    if (data['taskReferences'] != null) {
      taskReferences = (data['taskReferences'] as List)
          .map((e) => e as Map<String, String>)
          .map(
            (e) => TaskReference(
              id: e['id']!,
              title: e['title']!,
            ),
          )
          .toList();
    }

    final color = data['color'] == null
        ? null
        : Color(int.parse(data['color'], radix: 16));

    return Endeavor(
      id: id,
      title: data['title'],
      subEndeavorReferences: subEndeavorReferences,
      taskReferences: taskReferences,
      color: color,
    );
  }

  static final docSnapToEndeavorTransformer = StreamTransformer<
      DocumentSnapshot<Map<String, dynamic>>, Endeavor>.fromHandlers(
    handleData: (data, sink) => sink.add(fromDocSnap(data.id, data.data()!)),
  );

  static final querySnapToEndeavorTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<Endeavor>>.fromHandlers(
    handleData: (data, sink) =>
        data.docs.map((e) => fromDocSnap(e.id, e.data())).toList(),
  );

  static final querySnapToPrimaryEndeavorsTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<Endeavor>>.fromHandlers(
    handleData: (data, sink) {
      final List<Endeavor> primaryEndeavors = [];
      for (final doc in data.docs) {
        if (doc.data()['parentEndeavorId'] == null) {
          primaryEndeavors.add(fromDocSnap(doc.id, doc.data()));
        }
      }
      sink.add(primaryEndeavors);
    },
  );
}
