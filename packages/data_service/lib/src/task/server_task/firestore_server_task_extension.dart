import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:server_data_models/server_data_models.dart';

import '../../server_event/model_extension/firestore_server_event_extension.dart';
import 'server_task_database_fields.dart';

extension FirestoreServerTaskExtension on ServerTask {
  static ServerTask fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    final docSnapData = docSnap.data();
    if (docSnapData != null) {
      final durationData =
          docSnapData[ServerTaskDatabaseFields.duration.string()];
      final minnimumDurationData = docSnapData[
          ServerTaskDatabaseFields.minnimumSchedulingDuration.string()];
      return ServerTask(
        id: docSnap.id,
        title: docSnapData[ServerTaskDatabaseFields.title.string()],
        endeavorId: docSnapData[ServerTaskDatabaseFields.endeavorId.string()],
        duration: durationData != null ? Duration(minutes: durationData) : null,
        dueDate: docSnapData[ServerTaskDatabaseFields.dueDate.string()],
        divisible: docSnapData[ServerTaskDatabaseFields.divisible.string()],
        events: docSnapData[ServerTaskDatabaseFields.events.string()] != null
            ? FirestoreServerEventExtension.listFromDocSnapData(
                docSnapData[ServerTaskDatabaseFields.events.string()])
            : [],
        minnimumSchedulingDuration: minnimumDurationData != null
            ? Duration(minutes: minnimumDurationData)
            : null,
      );
    } else {
      throw Exception("No doc data yo");
    }
  }

  static final querySnapToServerTasksTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>,
      List<ServerTask>>.fromHandlers(handleData: (snap, sink) {
    sink.add(
      snap.docs.map((docSnap) => fromDocSnap(docSnap)).toList(),
    );
  });
}
