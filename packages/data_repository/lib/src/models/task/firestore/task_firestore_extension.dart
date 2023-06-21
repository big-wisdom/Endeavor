import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension TaskFirestoreExtension on Task {
  static Task fromDocData(String id, Map<String, dynamic> data) {
    String title = data['title'];
    String endeavorId = data['endeavorId'];
    Duration? duration =
        data['duration'] != null ? Duration(minutes: data['duration']) : null;
    List<Event>? events = data['events'] == null
        ? null
        : (data['events'] as List).map((e) {
            e as Map<String, dynamic>;
            return Event(
              start: DateTime.fromMicrosecondsSinceEpoch(
                  (e['start'] as Timestamp).microsecondsSinceEpoch),
              end: DateTime.fromMicrosecondsSinceEpoch(
                  (e['end'] as Timestamp).microsecondsSinceEpoch),
            );
          }).toList();
    DateTime? dueDate = data['dueDate'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (data['dueDate'] as Timestamp).microsecondsSinceEpoch)
        : null;
    bool? divisible = data['divisible'];
    Duration? minnimumSchedulingDuration =
        data['minnimumSchedulingDuration'] != null
            ? Duration(minutes: data['minnimumSchedulingDuration'])
            : null;

    return Task(
      id: id,
      title: title,
      endeavorId: endeavorId,
      duration: duration,
      events: events,
      dueDate: dueDate,
      divisible: divisible,
      minnimumSchedulingDuration: minnimumSchedulingDuration,
    );
  }

  Map<String, dynamic> toDoc() {
    return {
      "title": title,
      "endeavorId": endeavorId,
      "duration": duration?.inMinutes,
      "divisible": divisible,
      "minnimumSchedulingDuration": minnimumSchedulingDuration?.inMinutes,
      "events": events?.map((e) => e.toDocData()).toList(),
    };
  }

  static final taskListTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<Task>>.fromHandlers(
    handleData: (snapshot, sink) {
      sink.add(
        snapshot.docs
            .map(
              (queryDocSnap) => TaskFirestoreExtension.fromDocData(
                queryDocSnap.id,
                queryDocSnap.data(),
              ),
            )
            .toList(),
      );
    },
  );
}
