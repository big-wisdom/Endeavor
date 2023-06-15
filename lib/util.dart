import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:data_repository/data_repository.dart' show Event;

extension CustomDateTimeToString on DateTime {
  String toCustomString() {
    final dayOfWeek = DateFormat('EEEE').format(this);
    final month = DateFormat('MMMM').format(this);
    final date = DateFormat('d').format(this);
    return '$dayOfWeek $month, $date';
  }
}

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  TimeOfDay add(Duration duration) {
    DateTime now = DateTime.now();
    DateTime temp = DateTime(now.year, now.month, now.day, hour, minute);
    temp.add(duration);
    return TimeOfDay(hour: temp.hour, minute: temp.minute);
  }
}

String getEventDescription(Event event) {
  final buffer = StringBuffer();
  final now = DateTime.now();
  final days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];

  // Write start time
  // Write today if today
  if (now.year == event.start!.year &&
      now.month == event.start!.month &&
      now.day == event.start!.day) {
    buffer.write("Today ");
  } else {
    // write the day
    buffer.write("${days[event.start!.weekday - 1]} ");

    if (!_thisWeek(event.start!)) {
      // if not this week, write the date too
      buffer.write("${event.start!.day} ");
    }
  }
  // Write start time
  _writeTime(event.start!, buffer);

  buffer.write("- ");

  // if different day, write the day out
  if (event.end!.year != event.start!.year ||
      event.end!.month != event.start!.month ||
      event.end!.day != event.start!.day) {
    // write the day
    buffer.write("${days[event.end!.weekday - 1]} ");

    if (!_thisWeek(event.end!)) {
      // if not this week, write the date too
      buffer.write("${event.end!.day} ");
    }
  }
  // Write end time
  _writeTime(event.end!, buffer);

  return buffer.toString();
}

void _writeTime(DateTime dateTime, StringBuffer buffer) {
  buffer.write("${dateTime.hour}:");
  if (dateTime.minute < 10) {
    buffer.write("0${dateTime.minute}");
  } else {
    buffer.write(dateTime.minute);
  }
  buffer.write(" ");
}

bool _thisWeek(DateTime dateTime) {
  final now = DateTime.now();
  final daysLeft = 8 - now.weekday;
  final diff = dateTime.day - now.day;
  return diff > 0 && diff < daysLeft;
}
