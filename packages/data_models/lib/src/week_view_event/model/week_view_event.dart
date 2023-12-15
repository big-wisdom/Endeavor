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
    required ServerEndeavorBlock serverEndeavorBlock,
    required EndeavorReference endeavorReference,
    required Color? backgroundColor,
    required String title,
  }) {
    return WeekViewEvent(
      title: title,
      backgroundColor: backgroundColor,
      start: serverEndeavorBlock.serverEvent.start,
      end: serverEndeavorBlock.serverEvent.end,
      originalObject: EndeavorBlock(
        id: serverEndeavorBlock.id,
        endeavorReference: endeavorReference,
        event: Event.fromServerEvent(serverEndeavorBlock.serverEvent),
        repeatingEndeavorBlockId: serverEndeavorBlock.repeatingEndeavorBlockId,
      ),
    );
  }

  factory WeekViewEvent.fromCalendarEvent({
    required ServerCalendarEvent serverCalendarEvent,
    required Color? backgroundColor,
    required EndeavorReference? endeavorReference,
    required String? repeatingCalendarEventId,
  }) {
    return WeekViewEvent(
      title: serverCalendarEvent.title,
      backgroundColor: backgroundColor,
      start: serverCalendarEvent.serverEvent.start,
      end: serverCalendarEvent.serverEvent.end,
      originalObject: CalendarEvent(
        id: serverCalendarEvent.id,
        title: serverCalendarEvent.title,
        endeavorReference: endeavorReference,
        event: Event.fromServerEvent(
          serverCalendarEvent.serverEvent,
        ),
        repeatingCalendarEventId: repeatingCalendarEventId,
      ),
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
            originalObject: TaskReference(
              id: serverTask.id,
              endeavorId: serverTask.endeavorId,
              title: serverTask.title,
            ),
          ),
        )
        .toList();
  }

  @override
  List<Object?> get props =>
      [title, start, end, backgroundColor, originalObject];
}
