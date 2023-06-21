import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension CalendarEventFirestoreExtension on CalendarEvent {
  static CalendarEvent fromDocData(String id, Map<String, dynamic> docData) {
    final String title = docData['title'];
    final String? endeavorId = docData['endeavorId'];
    final DateTime start = DateTime.fromMicrosecondsSinceEpoch(
      (docData['start'] as Timestamp).microsecondsSinceEpoch,
    );
    final DateTime end = DateTime.fromMicrosecondsSinceEpoch(
      (docData['end'] as Timestamp).microsecondsSinceEpoch,
    );
    final Event event = Event(start: start, end: end);
    final String repeatingCalendarEventId = docData['repeatingCalendarEventId'];
    final type = CalendarEventType.values
        .firstWhere((type) => type.toString() == docData['type']);

    return CalendarEvent(
      title: title,
      event: event,
      repeatingCalendarEventId: repeatingCalendarEventId,
      type: type,
      endeavorId: endeavorId,
      id: id,
    );
  }

  Map<String, dynamic> toDocData() {
    return {
      "title": title,
      "endeavorId": endeavorId,
      "repeatingCalendarEventId": repeatingCalendarEventId,
      "type": type.toString(),
      "start": event.start,
      "end": event.end,
    };
  }

  static final calendarEventListTransformer = StreamTransformer<
          QuerySnapshot<Map<String, dynamic>>,
          List<CalendarEvent>>.fromHandlers(
      handleData: (QuerySnapshot, sink) =>
          QuerySnapshot.docs.map((e) => fromDocData(e.id, e.data())).toList());
}
