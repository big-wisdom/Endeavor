import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';

extension RepeatingCalendarEventDataServiceExtension on DataService {
  static createRepeatingCalendarEvent(UnidentifiedRepeatingCalendarEvent urce) {
    final batch = FirebaseFirestore.instance.batch();
    List<String> calendarEventIds = [];

    // create a doc to connect all the repeating events
    final repeatingDocRef =
        DataService.userDataDoc.collection('repeatingCalendarEvents').doc();

    for (Event event in urce.repeatingEvent.events) {
      final calendarEvent = UnidentifiedCalendarEvent(
        title: urce.title,
        event: event,
        endeavorReference: urce.endeavorReference,
        repeatingCalendarEventId: repeatingDocRef.id,
      );

      // create a doc for this endeavorBlock
      final docRef = DataService.userDataDoc.collection('calendarEvents').doc();

      calendarEventIds.add(docRef.id);

      batch.set(docRef, calendarEvent.toDocData());
    }

    batch.set(repeatingDocRef, {
      'calendarEventIds': calendarEventIds,
    });

    batch.commit();
  }

  static editThisAndFollowingCalendarEvent({
    required CalendarEvent calendarEvent,
  }) async {
    HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
      'editThisAndFollowingCalendarEvents',
    );
    await callable.call({
      'userId': DataService.userDataDoc.id,
      'selectedCalendarEventId': calendarEvent.id,
      'data': calendarEvent.toJson(),
    });
  }

  static deleteThisAndFollowingCalendarEvents({
    required String repeatingCalendarEventId,
    required String selectedCalendarEventId,
  }) async {
    HttpsCallable callable = FirebaseFunctions.instance
        .httpsCallable('deleteThisAndFollowingCalendarEvents');
    await callable.call({
      'userId': DataService.userDataDoc.id,
      'repeatingCalendarEventId': repeatingCalendarEventId,
      'selectedCalendarEventId': selectedCalendarEventId,
    });
  }
}
