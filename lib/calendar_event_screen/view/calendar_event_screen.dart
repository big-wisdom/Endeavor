import 'package:data_models/data_models.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/calendar_event_screen/view/calendar_event_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarEventScreen extends StatelessWidget {
  final CalendarEvent? calendarEvent;

  const CalendarEventScreen.edit({
    required CalendarEvent this.calendarEvent,
    super.key,
  });

  const CalendarEventScreen.create({super.key}) : calendarEvent = null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarEventScreenBloc(initialEvent: calendarEvent),
      child: const CalendarEventScreenView(),
    );
  }
}
