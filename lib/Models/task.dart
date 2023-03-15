import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/event/event.dart';

class Task {
  String? id;
  String? title;
  // represent as start and duration rather than start and end
  // the user will only need to put in duration, then the auto-planner
  // can set the start
  DateTime? start;
  Duration? duration;
  String? endeavorId;
  DateTime? dueDate;
  bool? divisible;

  Task({
    this.title,
    this.duration,
    this.endeavorId,
    this.dueDate,
    this.divisible = false,
  });

  Event? get event {
    if (start != null && duration != null) {
      return Event(start: start, end: start!.add(duration!));
    } else {
      return null;
    }
  }

  set event(Event? inputEvent) {
    if (inputEvent != null) {
      start = inputEvent.start;
      duration = inputEvent.end!.difference(inputEvent.start!);
    } else {
      start = null;
    }
  }

  Task.fromDocSnap(QueryDocumentSnapshot docSnap) {
    id = docSnap.id;
    final data = docSnap.data() as Map<String, dynamic>;
    title = data['title'];
    endeavorId = data['endeavorId'];
    duration =
        data['duration'] != null ? Duration(minutes: data['duration']) : null;
    start = data['start'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (data['start'] as Timestamp).microsecondsSinceEpoch,
          )
        : null;
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
