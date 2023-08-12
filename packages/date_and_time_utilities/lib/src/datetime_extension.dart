import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String toCustomString() {
    final dayOfWeek = DateFormat('EEEE').format(this);
    final month = DateFormat('MMMM').format(this);
    final date = DateFormat('d').format(this);
    return '$dayOfWeek $month, $date';
  }

  int compareToDateOnly(DateTime date) {
    if (year > date.year) return 1;
    if (year < date.year) return -1;
    if (month > date.month) return 1;
    if (month < date.month) return -1;
    if (day > date.day) return 1;
    if (day < date.day) return -1;
    return 0;
  }

  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }
}
