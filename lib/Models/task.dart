import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? title;
  Duration? duration;
  DateTime? start;
  String? endeavorId;
  DateTime? dueDate;
  bool? divisible;

  Task({
    this.title,
    this.duration,
    this.start,
    this.endeavorId,
    this.dueDate,
    this.divisible = false,
  });

  Task.fromDocSnap(QueryDocumentSnapshot docSnap) {
    id = docSnap.id;
    final data = docSnap.data() as Map<String, dynamic>;
    title = data['title'];
    endeavorId = data['endeavorId'];
    duration =
        data['duration'] != null ? Duration(minutes: data['duration']) : null;
    start = DateTime.fromMicrosecondsSinceEpoch(
      (data['start'] as Timestamp).microsecondsSinceEpoch,
    );
    dueDate = data['dueDate'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (data['dueDate'] as Timestamp).microsecondsSinceEpoch)
        : null;
    divisible = data['divisible'];
  }

  Map<String, dynamic> toDoc() {
    return {
      "title": title,
      "endeavorId": endeavorId,
      "duration": duration?.inMinutes,
      "start": start,
    };
  }

  bool validate() {
    return title != null;
  }
}
