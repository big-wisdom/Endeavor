import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/event/event.dart';

class Task {
  String? id;
  String? title;
  List<Event>? events;
  Duration? duration;
  String? endeavorId;
  DateTime? dueDate;
  bool? divisible;
  Duration? minnimumSchedulingDuration;

  Task({
    this.title,
    this.duration,
    this.endeavorId,
    this.dueDate,
    this.divisible,
    this.minnimumSchedulingDuration,
  });

  Task.fromDocSnap(QueryDocumentSnapshot docSnap) {
    id = docSnap.id;
    final data = docSnap.data() as Map<String, dynamic>;
    title = data['title'];
    endeavorId = data['endeavorId'];
    duration =
        data['duration'] != null ? Duration(minutes: data['duration']) : null;
    events = data['events'] == null
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
    dueDate = data['dueDate'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (data['dueDate'] as Timestamp).microsecondsSinceEpoch)
        : null;
    divisible = data['divisible'];
    minnimumSchedulingDuration = data['minnimumSchedulingDuration'] != null
        ? Duration(minutes: data['minnimumSchedulingDuration'])
        : null;
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

  Duration? get scheduledDuration {
    if (duration != null && events != null) {
      Duration d = Duration.zero;
      for (Event e in events!) {
        d += e.end!.difference(e.start!);
      }
      return d;
    } else {
      return null;
    }
  }

  Duration? get unscheduledDuration {
    if (duration != null && events != null) {
      Duration diff = duration! - scheduledDuration!;
      return diff;
    } else {
      return null;
    }
  }

  bool validate() {
    return title != null;
    // TODO: if divisible, should have minnimumSchedulingDuration
    // and minnimumSchedulingDuration should be less than total time
  }
}
