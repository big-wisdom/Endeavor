import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../abstract_event.dart';
import 'package:flutter/material.dart' show TimeOfDay;

import '../event/event.dart';

class RepeatingEvent extends AbstractEvent {
  final DateTime startDate;
  final DateTime endDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<bool> daysOfWeek;

  RepeatingEvent({
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    this.daysOfWeek = const [false, false, false, false, false, false, false],
  });

  @override
  List<Event> get events {
    List<Event> theseEvents = [];
    // from start day to end day
    DateTime currentDay = startDate;
    while (_compareDateOnly(currentDay, endDate) < 1) {
      // if currentDay is one of the days of week, add it
      if (daysOfWeek[currentDay.weekday - 1]) {
        theseEvents.add(
          Event(
            start: currentDay.copyWith(
              hour: startTime.hour,
              minute: startTime.minute,
              second: 0,
            ),
            end: currentDay.copyWith(
              hour: endTime.hour,
              minute: endTime.minute,
              second: 0,
            ),
          ),
        );
      }
      currentDay = currentDay.add(const Duration(days: 1));
    }
    return theseEvents;
  }

  @override
  List<Object?> get props => [
        startDate,
        endDate,
        startTime,
        endTime,
        daysOfWeek,
      ];

  int _compareDateOnly(DateTime d1, DateTime d2) {
    if (d1.year > d2.year) return 1;
    if (d1.year < d2.year) return -1;
    if (d1.month > d2.month) return 1;
    if (d1.month < d2.month) return -1;
    if (d1.day > d2.day) return 1;
    if (d1.day < d2.day) return -1;
    return 0;
  }
}

Validator<RepeatingEvent?> repeatingEventValidator() {
  return (RepeatingEvent? repeatingEvent) {
    if (repeatingEvent == null) {
      return "Repeating Event must not be null";
    } else if (repeatingEvent.startTime.compareTo(repeatingEvent.endTime) >=
        0) {
      return "Event must start before it can end";
    } else if (repeatingEvent.startDate
            .compareToDateOnly(repeatingEvent.endDate) >=
        0) {
      return "Date range must start before it ends";
    } else if (repeatingEvent.daysOfWeek.every((daySelected) => !daySelected)) {
      return "Must select days of the week";
    }
    return null;
  };
}
