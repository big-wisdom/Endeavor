import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/create_calendar_event_screen_bloc.dart';
import 'package:endeavor/calendar_event_screen/bloc/edit_calendar_event_screen_bloc.dart';
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
    DataRepository dataRepository = context.read<DataRepository>();
    return BlocProvider(
      create: (context) => calendarEvent == null
          ? CreateCalendarEventScreenBloc(dataRepository)
          : EditCalendarEventScreenBloc(calendarEvent!, dataRepository),
      child: const CalendarEventScreenView(),
    );
  }
}
