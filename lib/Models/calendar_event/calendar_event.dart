import 'package:endeavor/Models/event/event.dart';

class CalendarEvent {
  Event? event;
  String? title;
  String? id;
  String? endeavorId;
  String? repeatingCalendarEventId;
  late CalendarEventType type;

  CalendarEvent(
      {this.event, this.title, this.endeavorId, required this.type, this.id});

  CalendarEvent.fromDocSnap(QueryDocumentSnapshot docSnap) {
    id = docSnap.id;
    final data = docSnap.data() as Map<String, dynamic>;
    title = data['title'];
    endeavorId = data['endeavorId'];
    final start = data['start'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (data['start'] as Timestamp).microsecondsSinceEpoch,
          )
        : null;
    final end = data['end'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (data['end'] as Timestamp).microsecondsSinceEpoch,
          )
        : null;
    event = Event(start: start, end: end);
    repeatingCalendarEventId = data['repeatingCalendarEventId'];
    type = CalendarEventType.values
        .firstWhere((type) => type.toString() == data['type']);
  }

  Map<String, dynamic>? toDocData() {
    if (validate()) {
      return {
        "title": title,
        "endeavorId": endeavorId,
        "repeatingCalendarEventId": repeatingCalendarEventId,
        "type": type.toString(),
        "start": event!.start!,
        "end": event!.end!,
      };
    } else {
      return null;
    }
  }

  // endeavorId not included in validation
  bool validate() {
    return event != null &&
        event!.validate() &&
        title != null &&
        title!.trim().isNotEmpty;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    other as CalendarEvent;
    return other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title &&
        other.event == event &&
        other.endeavorId == endeavorId &&
        other.type == type;
  }
}

enum CalendarEventType {
  single,
  repeating,
}
