import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension CalendarEventFirestoreExtension on CalendarEvent {
  static CalendarEvent fromDocData(String id, Map<String, dynamic> docData) {
    final String title = docData['title'];
    final String? endeavorTitle = docData['endeavorTitle'];
    final String? endeavorId = docData['endeavorId'];
    final DateTime start = DateTime.fromMicrosecondsSinceEpoch(
      (docData['start'] as Timestamp).microsecondsSinceEpoch,
    );
    final DateTime end = DateTime.fromMicrosecondsSinceEpoch(
      (docData['end'] as Timestamp).microsecondsSinceEpoch,
    );
    final Event event = Event(start: start, end: end);
    final String repeatingCalendarEventId = docData['repeatingCalendarEventId'];

    return CalendarEvent(
      title: title,
      event: event,
      repeatingCalendarEventId: repeatingCalendarEventId,
      endeavorReference: endeavorTitle != null
          ? EndeavorReference(
              endeavorTitle: endeavorTitle,
              endeavorId: endeavorId!,
            )
          : null,
      id: id,
    );
  }

  Map<String, dynamic> toDocData() {
    return {
      "title": title,
      "endeavorId": endeavorReference?.endeavorId,
      "endeavorTitle": endeavorReference?.endeavorTitle,
      "repeatingCalendarEventId": repeatingCalendarEventId,
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
