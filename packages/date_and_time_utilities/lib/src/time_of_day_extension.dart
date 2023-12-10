import 'package:flutter/material.dart';

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
    temp = temp.add(duration);
    return TimeOfDay(hour: temp.hour, minute: temp.minute);
  }
}
