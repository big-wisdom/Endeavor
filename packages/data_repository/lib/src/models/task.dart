import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  const Task({
    required this.id,
    this.title,
    this.endeavorId,
    this.duration,
    this.minnimumSchedulingDuration,
    this.dueDate,
    this.divisible,
    this.events,
  });

  final String id;
  final String? endeavorId;
  final String? title;
  final List? events;
  final Duration? duration;
  final Duration? minnimumSchedulingDuration;
  final DateTime? dueDate;
  final bool? divisible;

  Task.fromDocData(String id, Map<String, dynamic> data)
      : this.id = id,
        title = data['title'],
        endeavorId = data['endeavorId'],
        duration = data['duration'] != null
            ? Duration(minutes: data['duration'])
            : null,
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
              }).toList(),
        dueDate = data['dueDate'] != null
            ? DateTime.fromMicrosecondsSinceEpoch(
                (data['dueDate'] as Timestamp).microsecondsSinceEpoch)
            : null,
        divisible = data['divisible'],
        minnimumSchedulingDuration = data['minnimumSchedulingDuration'] != null
            ? Duration(minutes: data['minnimumSchedulingDuration'])
            : null;

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

  static const empty = Task(id: '');
  bool get isEmpty => this == Task.empty;
  bool get isNotEmpty => this != Task.empty;

  @override
  List<Object?> get props => [
        id,
        endeavorId,
        title,
        events,
        duration,
        minnimumSchedulingDuration,
        dueDate,
        divisible,
      ];
}
