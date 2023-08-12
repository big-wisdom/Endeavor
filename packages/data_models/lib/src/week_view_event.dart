import 'dart:ui';

import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:server_data_models/server_data_models.dart';

class WeekViewEvent extends Equatable {
  const WeekViewEvent({
    required this.title,
    required this.backgroundColor,
    required this.start,
    required this.end,
    required this.originalObject,
  });

  /// The event title.
  final String title;

  /// The event start date & time.
  final DateTime start;

  /// The event end date & time.
  final DateTime end;

  /// The event widget background color.
  final Color? backgroundColor;

  /// The original object that this was created from
  final Object originalObject;

  factory WeekViewEvent.fromEndeavorBlock({
    required EndeavorBlock endeavorBlock,
    required Color? backgroundColor,
    required String title,
  }) {
    return WeekViewEvent(
      title: title,
      backgroundColor: backgroundColor,
      start: endeavorBlock.event.start,
      end: endeavorBlock.event.end,
      originalObject: endeavorBlock,
    );
  }

  factory WeekViewEvent.fromCalendarEvent({
    required CalendarEvent calendarEvent,
    required Color? backgroundColor,
  }) {
    return WeekViewEvent(
      title: calendarEvent.title,
      backgroundColor: backgroundColor,
      start: calendarEvent.event.start,
      end: calendarEvent.event.end,
      originalObject: calendarEvent,
    );
  }

  static List<WeekViewEvent> listFromServerTask({
    required ServerTask serverTask,
    required Color? backgroundColor,
  }) {
    if (serverTask.events == null) return [];

    return serverTask.events!
        .map(
          (e) => WeekViewEvent(
            title: serverTask.title,
            backgroundColor: backgroundColor,
            start: e.start,
            end: e.end,
            originalObject: serverTask,
          ),
        )
        .toList();
  }

  static List<WeekViewEvent> listFromListOfServerTasks() {}

  @override
  List<Object?> get props =>
      [title, start, end, backgroundColor, originalObject];
}
