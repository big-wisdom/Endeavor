import 'package:data_models/data_models.dart';
import 'package:flutter/material.dart' show Color;
import 'package:server_data_models/server_data_models.dart';

extension WeekViewEventTransformers on WeekViewEvent {
  static List<WeekViewEvent> weekViewEventsFromIngredients(
    List<ServerTask> serverTasks,
    List<ServerEndeavor> serverEndeavors,
  ) {
    // map endeavorIds to colors
    Map<String, Color?> endeavorIdToColor = {};
    for (final se in serverEndeavors) {
      endeavorIdToColor[se.id] = se.color;
    }

    List<WeekViewEvent> weekViewEvents = [];

    // WeekViewEvents from Tasks
    for (final serverTask in serverTasks) {
      weekViewEvents.addAll(
        WeekViewEvent.listFromServerTask(
          serverTask: serverTask,
          backgroundColor: endeavorIdToColor[serverTask.endeavorId],
        ),
      );
    }

    // TODO: WeekViewEvents from CalendarEvents
    // TODO: WeekViewEvents from EndeavorBlocks

    return weekViewEvents;
  }
}
