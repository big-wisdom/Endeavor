import 'package:collection/collection.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/calendar_event_screen/view/calendar_event_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shim_data_service/shim_data_service.dart';

class CalendarEventScreen extends StatelessWidget {
  final int? calendarEventId;

  const CalendarEventScreen.edit({
    required int this.calendarEventId,
    super.key,
  });

  const CalendarEventScreen.create({super.key}) : calendarEventId = null;

  @override
  Widget build(BuildContext context) {
    final calendarEvent = ShimDataService.calendarEvents.calendarEventsSnapshot
        .firstWhereOrNull((e) => e.id == calendarEventId);

    return BlocProvider(
      create: (context) => CalendarEventScreenBloc(initialEvent: calendarEvent),
      child: const CalendarEventScreenView(),
    );
  }
}
