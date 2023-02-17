import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:flutter/material.dart';

class CalendarWeekView extends StatelessWidget {
  const CalendarWeekView({required this.selectedDate, super.key});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    // Let's get two dates :
    DateTime date = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    // And here's our widget!
    return WeekView(
        dates: List<DateTime>.generate(
      7,
      (index) {
        return date.add(Duration(days: (index + 1) - date.weekday));
      },
      growable: false,
    ));
  }
}
