import 'package:data_models/data_models.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/calendar_event_screen/view/calendar_event_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarEventScreen extends StatelessWidget {
  final CalendarEvent? calendarEvent;

  final bool repeatingOnly;
  final RepeatingCalendarEvent? repeatingCalendarEvent;

  const CalendarEventScreen.edit({
    required CalendarEvent this.calendarEvent,
    super.key,
  })  : repeatingCalendarEvent = null,
        repeatingOnly = false;

  const CalendarEventScreen.create({super.key})
      : calendarEvent = null,
        repeatingCalendarEvent = null,
        repeatingOnly = false;

  const CalendarEventScreen.repeatingOnly({
    required this.repeatingCalendarEvent,
    super.key,
  })  : calendarEvent = null,
        repeatingOnly = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => repeatingOnly
          ? CalendarEventScreenBloc.repeatingOnly(
              repeatingCalendarEvent,
            )
          : CalendarEventScreenBloc(initialEvent: calendarEvent),
      child: const CalendarEventScreenView(),
    );
  }
}
