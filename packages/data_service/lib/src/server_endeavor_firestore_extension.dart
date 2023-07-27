import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:server_data_models/server_data_models.dart';

extension ServerEndeavorFirestoreExtension on ServerEndeavor {
  Map<String, dynamic> toData() {
    return {
      'text': title,
      'subEndeavorIds': subEndeavorIds,
      'parentEndeavorId': parentEndeavorId,
      'taskReferences': taskIds,
      // 'color': color?.value.toRadixString(16),
    };
  }

  static ServerEndeavor fromDocSnap(String id, Map<String, dynamic> data) {
    List<String> subEndeavorIds = [];
    if (data['subEndeavorIds'] != null) {
      subEndeavorIds =
          (data['subEndeavorIds'] as List).map((e) => e as String).toList();
    }

    List<String> taskIds = [];
    if (data['taskIds'] != null) {
      taskIds = (data['taskIds'] as List).map((e) => e as String).toList();
    }

    // final color = data['color'] == null
    //     ? null
    //     : Color(int.parse(data['color'], radix: 16));

    return ServerEndeavor(
      id: id,
      title: data['title'],
      subEndeavorIds: subEndeavorIds,
      taskIds: taskIds,
      // color: color,
    );
  }

  static final docSnapToServerEndeavorTransformer = StreamTransformer<
      DocumentSnapshot<Map<String, dynamic>>, ServerEndeavor>.fromHandlers(
    handleData: (data, sink) => sink.add(fromDocSnap(data.id, data.data()!)),
  );

  static final querySnapToEndeavorTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<ServerEndeavor>>.fromHandlers(
    handleData: (data, sink) =>
        data.docs.map((e) => fromDocSnap(e.id, e.data())).toList(),
  );

  static final querySnapToPrimaryEndeavorsTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<ServerEndeavor>>.fromHandlers(
    handleData: (data, sink) {
      final List<ServerEndeavor> primaryEndeavors = [];
      for (final doc in data.docs) {
        if (doc.data()['parentEndeavorId'] == null) {
          primaryEndeavors.add(fromDocSnap(doc.id, doc.data()));
        }
      }
      sink.add(primaryEndeavors);
    },
  );
}
