import 'package:endeavor/Models/event/event.dart';
import 'package:flutter/material.dart';

class RepeatingEvent {
  DateTime? startDate;
  DateTime? endDate;
  List<bool>? daysOfWeek; // monday == 1 , ... , sunday == 7
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  RepeatingEvent({
    this.startDate,
    this.endDate,
    this.daysOfWeek,
    this.startTime,
    this.endTime,
  });

  RepeatingEvent.fromDocData(Map<String, dynamic> data) {
    startDate = data['startDate'];
    endDate = data['endDate'];
    daysOfWeek = data['daysOfWeek'];
    startTime = data['startTime'];
    endTime = data['endTime'];
  }

  Map<String, dynamic>? toDocData() {
    if (validate()) {
      return {
        'startDate': startDate,
        'endDate': endDate,
        'daysOfWeek': daysOfWeek,
        'startTime': startTime,
        'endTime': endTime,
      };
    } else {
      return null;
    }
  }

  List<Event>? _events;
  List<Event>? get events {
    if (validate()) {
      // return the calculated list if already calculated
      if (_events != null) return _events;

      // otherwise, calculate it now
      List<Event> theseEvents = [];
      // from start day to end day
      DateTime currentDay = startDate!;
      while (_compareDateOnly(currentDay, endDate!) < 1) {
        // if currentDay is one of the days of week, add it
        if (daysOfWeek![currentDay.weekday - 1]) {
          theseEvents.add(
            Event(
              start: currentDay.copyWith(
                hour: startTime!.hour,
                minute: startTime!.minute,
                second: 0,
              ),
              end: currentDay.copyWith(
                hour: endTime!.hour,
                minute: endTime!.minute,
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

  bool validate() {
    return startDate != null &&
        endDate != null &&
        _compareDateOnly(startDate!, endDate!) < 1 &&
        daysOfWeek != null &&
        startTime != null &&
        endTime != null &&
        (endTime!.hour * 60) + (endTime!.minute) >
            (startTime!.hour * 60) + (startTime!.minute);
  }
}
