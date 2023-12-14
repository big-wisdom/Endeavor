import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

extension ServerCalendarEventDataServiceExtension on DataService {
  static Stream<List<ServerCalendarEvent>> get calendarEventStream =>
      DataService.userDataDoc
          .collection('calendarEvents')
          .snapshots()
          .transform(_querySnapToServerCalendarEventListStream);

  static final _querySnapToServerCalendarEventListStream = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>,
      List<ServerCalendarEvent>>.fromHandlers(
    handleData: (querySnap, sink) => sink.add(querySnap.docs
        .map((docSnap) => fromDocData(docSnap.id, docSnap.data()))
        .toList()),
  );

  static ServerCalendarEvent fromDocData(
      String id, Map<String, dynamic> docData) {
    final String title = docData['title'];
    final String? endeavorId = docData['endeavorId'];
    final DateTime start = DateTime.fromMicrosecondsSinceEpoch(
      (docData['start'] as Timestamp).microsecondsSinceEpoch,
    );
    final DateTime end = DateTime.fromMicrosecondsSinceEpoch(
      (docData['end'] as Timestamp).microsecondsSinceEpoch,
    );
    final ServerEvent event = ServerEvent(start: start, end: end);
    final String? repeatingCalendarEventId =
        docData['repeatingCalendarEventId'];

    return ServerCalendarEvent(
      title: title,
      serverEvent: event,
      repeatingCalendarEventId: repeatingCalendarEventId,
      endeavorId: endeavorId,
      id: id,
    );
  }

  static void createCalendarEvent(UnidentifiedCalendarEvent calendarEvent) {
    DataService.userDataDoc
        .collection('calendarEvents')
        .add(calendarEvent.toDocData());
  }
}
