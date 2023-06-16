import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class CalendarEvent extends Equatable {
  final Event? event;
  final String? title;
  final String? id;
  final String? endeavorId;
  final String? repeatingCalendarEventId;
  final CalendarEventType type;

  CalendarEvent({
    this.repeatingCalendarEventId,
    this.event,
    this.title,
    this.endeavorId,
    required this.type,
    this.id,
  });

  factory CalendarEvent.fromDocData(String id, Map<String, dynamic> docData) {
    final String? title = docData['title'];
    final String? endeavorId = docData['endeavorId'];
    final DateTime? start = docData['start'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (docData['start'] as Timestamp).microsecondsSinceEpoch,
          )
        : null;
    final DateTime? end = docData['end'] != null
        ? DateTime.fromMicrosecondsSinceEpoch(
            (docData['end'] as Timestamp).microsecondsSinceEpoch,
          )
        : null;
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

  static final calendarEventListTransformer = StreamTransformer<
          QuerySnapshot<Map<String, dynamic>>,
          List<CalendarEvent>>.fromHandlers(
      handleData: (QuerySnapshot, sink) => QuerySnapshot.docs
          .map((e) => CalendarEvent.fromDocData(e.id, e.data()))
          .toList());

  Map<String, dynamic> toDocData() {
    return {
      "title": title,
      "endeavorId": endeavorId,
      "repeatingCalendarEventId": repeatingCalendarEventId,
      "type": type.toString(),
      "start": event!.start!,
      "end": event!.end!,
    };
  }

  @override
  List<Object?> get props => [
        title,
        endeavorId,
        repeatingCalendarEventId,
        type,
        event,
      ];
}

enum CalendarEventType {
  single,
  repeating,
}
