import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  String toCustomString() {
    final dayOfWeek = DateFormat('EEEE').format(this);
    final month = DateFormat('MMMM').format(this);
    final date = DateFormat('d').format(this);
    return '$dayOfWeek $month, $date';
  }

  String toSqlString() {
    final utc = this.toUtc();
    String yearString = utc.year.toString().padLeft(4, '0');
    String monthString = utc.month.toString().padLeft(2, '0');
    String dayString = utc.day.toString().padLeft(2, '0');
    String hourString = utc.hour.toString().padLeft(2, '0');
    String minuteString = utc.minute.toString().padLeft(2, '0');
    String secondString = utc.second.toString().padLeft(2, '0');

    return "$yearString-$monthString-$dayString $hourString:$minuteString:$secondString";
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
