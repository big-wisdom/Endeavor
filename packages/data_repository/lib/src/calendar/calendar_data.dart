import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/models/endeavor_block/firestore/endeavor_block_firestore_extension.dart';
import 'package:rxdart/rxdart.dart';

extension CalendarData on DataRepository {
  Stream<List<WeekViewEvent>> weekViewEventStream() {
    if (firestore == null) throw Exception("No user?! How dare you?!");

    // Endeavor blocks stream
    final endeavorBlocksStream =
        firestore!.collection('endeavorBlocks').snapshots();

    // Tasks stream
    final taskStream = firestore!.collection('tasks').snapshots();

    // Calendar Events stream
    final calendarEventStream =
        firestore!.collection('calendarEvents').snapshots();

    // merge streams
    return CombineLatestStream.combine4(
      allEndeavorsStream().transform(EndeavorDatabaseDocumentFirestoreExtension
          .listOfDatabaseDocToMapTransformer),
      endeavorBlocksStream.transform(
          EndeavorBlockFirestoreExtension.endeavorBlockListTransformer),
      taskStream.transform(TaskFirestoreExtension.taskListTransformer),
      calendarEventStream.transform(
          CalendarEventFirestoreExtension.calendarEventListTransformer),
      (a, b, c, d) => _listWeekViewEvents(a, b, c, d),
    );
  }

  List<WeekViewEvent> _listWeekViewEvents(
    Map<String, EndeavorDatabaseDocument> endeavorDatabaseDocuments,
    List<EndeavorBlock> endeavorBlocks,
    List<Task> tasks,
    List<CalendarEvent> calendarEvents,
  ) {
    List<WeekViewEvent> weekViewEvents = [];
    weekViewEvents.addAll(
      endeavorBlocks
          .map(
            (e) => WeekViewEvent.fromEndeavorBlock(
              endeavorBlock: e,
              backgroundColor:
                  endeavorDatabaseDocuments[e.endeavorReference.id]?.color,
              title: endeavorDatabaseDocuments[e.endeavorReference.id]!.title,
            ),
          )
          .toList(),
    );

    for (final task in tasks) {
      weekViewEvents.addAll(
        WeekViewEvent.listFromTask(
          task: task,
          backgroundColor: endeavorDatabaseDocuments[task.endeavorId]?.color,
        ),
      );
    }

    weekViewEvents.addAll(
      calendarEvents
          .map((calendarEvent) => WeekViewEvent.fromCalendarEvent(
                calendarEvent: calendarEvent,
                backgroundColor: endeavorDatabaseDocuments[
                        calendarEvent.endeavorReference?.id]
                    ?.color,
              ))
          .toList(),
    );

    return weekViewEvents;
  }
}
