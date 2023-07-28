import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_service/src/server_event/model_extension/firestore_server_event_extension.dart';
import 'package:data_service/src/server_task/model_extension/server_task_database_fields.dart';
import 'package:server_data_models/server_data_models.dart';

extension FirestoreServerTaskExtension on ServerTask {
  static ServerTask fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    final docSnapData = docSnap.data();
    if (docSnapData != null) {
      return ServerTask(
        id: docSnap.id,
        title: docSnapData[ServerTaskDatabaseFields.title],
        endeavorId: docSnapData[ServerTaskDatabaseFields.endeavorId],
        duration: docSnapData[ServerTaskDatabaseFields.duration],
        dueDate: docSnapData[ServerTaskDatabaseFields.dueDate],
        divisible: docSnapData[ServerTaskDatabaseFields.divisible],
        events: FirestoreServerEventExtension.listFromDocSnapData(
            docSnapData[ServerTaskDatabaseFields.events]),
        minnimumSchedulingDuration:
            docSnapData[ServerTaskDatabaseFields.minnimumSchedulingDuration],
      );
    } else {
      throw Exception("No doc data yo");
    }
  }

  Map<String, dynamic> toData() {
    return {
      ServerTaskDatabaseFields.title.string(): title,
      ServerTaskDatabaseFields.endeavorId.string(): endeavorId,
      ServerTaskDatabaseFields.duration.string(): duration,
      ServerTaskDatabaseFields.dueDate.string(): dueDate,
      ServerTaskDatabaseFields.divisible.string(): divisible,
      ServerTaskDatabaseFields.events.string():
          events?.map((e) => e.toData()).toList() ?? null,
      ServerTaskDatabaseFields.minnimumSchedulingDuration.string():
          minnimumSchedulingDuration,
    };
  }

  static final querySnapToServerTasksTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>,
      List<ServerTask>>.fromHandlers(handleData: (snap, sink) {
    sink.add(
      snap.docs.map((docSnap) => fromDocSnap(docSnap)).toList(),
    );
  });
}
