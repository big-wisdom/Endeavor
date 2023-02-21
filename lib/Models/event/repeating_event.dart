import 'package:endeavor/Models/event/event.dart';
import 'package:flutter/material.dart';

class RepeatingEvent {
  DateTime? startDate;
  DateTime? endDate;
  Set<int>? daysOfWeek; // monday == 1 , ... , sunday == 7
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  RepeatingEvent({
    this.startDate,
    this.endDate,
    this.daysOfWeek,
    this.startTime,
    this.endTime,
  });

  List<Event>? _events;
  List<Event>? get events {
    if (_validate()) {
      // return the calculated list if already calculated
      if (_events != null) return _events;

      // otherwise, calculate it now
      List<Event> theseEvents = [];
      // from start day to end day
      DateTime currentDay = startDate!;
      while (_compareDateOnly(currentDay, endDate!) < 1) {
        // if currentDay is one of the days of week, add it
        if (daysOfWeek!.contains(currentDay.weekday)) {
          theseEvents.add(
            Event(
              start: currentDay.copyWith(
                hour: startTime!.hashCode,
                minute: startTime!.minute,
                second: 0,
              ),
            ),
          );
        }
        currentDay = currentDay.add(const Duration(days: 1));
      }

      return theseEvents.isNotEmpty ? theseEvents : null;
    } else {
      return null;
    }
  }

  int _compareDateOnly(DateTime d1, DateTime d2) {
    if (d1.year > d2.year) return 1;
    if (d1.year < d2.year) return -1;
    if (d1.month > d2.month) return 1;
    if (d1.month < d2.month) return -1;
    if (d1.day > d2.day) return 1;
    if (d1.day < d2.day) return -1;
    return 0;
  }

  bool _validate() {
    return startDate != null &&
        endDate != null &&
        daysOfWeek != null &&
        startTime != null &&
        endTime != null;
  }
}
