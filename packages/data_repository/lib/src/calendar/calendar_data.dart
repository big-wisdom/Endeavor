import 'package:data_repository/data_repository.dart';
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
      allEndeavorSettingsStream()
          .transform(EndeavorSettings.transformListToMap),
      endeavorBlocksStream
          .transform(EndeavorBlock.endeavorBlockListTransformer),
      taskStream.transform(Task.taskListTransformer),
      calendarEventStream.transform(CalendarEvent.calendarEventListTransformer),
      (a, b, c, d) => _listWeekViewEvents(a, b, c, d),
    );
  }

  List<WeekViewEvent> _listWeekViewEvents(
    Map<String, EndeavorSettings> endeavorSettings,
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
              backgroundColor: endeavorSettings[e.endeavorId!]?.color,
              title: endeavorSettings[e.endeavorId!]!.title!,
            ),
          )
          .toList(),
    );

    for (final task in tasks) {
      weekViewEvents.addAll(
        WeekViewEvent.listFromTask(
          task: task,
          backgroundColor: endeavorSettings[task.endeavorId]?.color,
        ),
      );
    }

    weekViewEvents.addAll(
      calendarEvents
          .map((calendarEvent) => WeekViewEvent.fromCalendarEvent(
                calendarEvent: calendarEvent,
                backgroundColor:
                    endeavorSettings[calendarEvent.endeavorId]?.color,
              ))
          .toList(),
    );

    return weekViewEvents;
  }
}
