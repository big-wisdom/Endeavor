import 'package:data_models/data_models.dart';
import 'package:server_data_models/server_data_models.dart';

extension WeekViewEventTransformers on WeekViewEvent {
  static List<WeekViewEvent> weekViewEventsFromIngredients(
      List<ServerTask> serverTasks,
      List<ServerEndeavorBlock> serverEndeavorBlocks,
      List<ServerEndeavor> serverEndeavors,
      List<ServerCalendarEvent> serverCalendarEvents) {
    // map endeavorIds to ServerEndeavor
    Map<String, ServerEndeavor> endeavorIdToServerEndeavor = {};
    for (final se in serverEndeavors) {
      endeavorIdToServerEndeavor[se.id] = se;
    }

    List<WeekViewEvent> weekViewEvents = [];

    // WeekViewEvents from ServerTasks
    for (final serverTask in serverTasks) {
      weekViewEvents.addAll(
        WeekViewEvent.listFromServerTask(
          serverTask: serverTask,
          backgroundColor:
              endeavorIdToServerEndeavor[serverTask.endeavorId]!.color,
        ),
      );
    }

    // WeekViewEvents from ServerEndeavorBlocks
    for (final seb in serverEndeavorBlocks) {
      final endeavor =
          serverEndeavors.firstWhere((se) => se.id == seb.endeavorId);
      weekViewEvents.add(
        WeekViewEvent.fromEndeavorBlock(
          serverEndeavorBlock: seb,
          endeavorReference: EndeavorReference(
            title: endeavor.title,
            id: endeavor.id,
          ),
          backgroundColor: endeavorIdToServerEndeavor[seb.endeavorId]!.color,
          title: endeavorIdToServerEndeavor[seb.endeavorId]!.title,
        ),
      );
    }

    // WeekViewEvents from CalendarEvents
    for (final sce in serverCalendarEvents) {
      weekViewEvents.add(WeekViewEvent.fromCalendarEvent(
        serverCalendarEvent: sce,
        backgroundColor: endeavorIdToServerEndeavor[sce.endeavorId]?.color,
      ));
    }

    return weekViewEvents;
  }
}
