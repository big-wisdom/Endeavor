import 'package:endeavor/screens/planning/calendar/calendar_month_view.dart';
import 'package:endeavor/screens/planning/calendar/calendar_week_view.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar(
      {required this.mode,
      required this.selectedDate,
      required this.setCalendarView,
      required this.uid,
      super.key});

  final CalendarView mode;
  final DateTime selectedDate;
  final Function(CalendarView, [DateTime?]) setCalendarView;
  final String uid;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    if (widget.mode == CalendarView.week) {
      return CalendarWeekView(
        selectedDate: widget.selectedDate,
        uid: widget.uid,
      );
    } else {
      return CalendarMonthView(setCalendarView: widget.setCalendarView);
    }
  }
}
