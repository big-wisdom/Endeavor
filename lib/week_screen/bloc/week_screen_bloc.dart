import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shim_data_service/shim_data_service.dart';

part 'week_screen_event.dart';
part 'week_screen_state.dart';

class WeekScreenBloc extends Bloc<WeekScreenEvent, WeekScreenState> {
  DateTime selectedDay;
  late final StreamSubscription<List<WeekViewEvent>> _weekEventSubscription;

  WeekScreenBloc({required this.selectedDay})
      : super(const WeekScreenInitial([])) {
    on<NewEvents>(
      (event, emit) {
        emit(
          WeekScreenState(event.newEvents),
        );
      },
    );

    _weekEventSubscription = ShimDataService.calendarEvents.calendarEventStream
        .map((events) => events
            .map(
              (event) => WeekViewEvent(
                title: event.title,
                backgroundColor: Colors.blue,
                start: event.event.start,
                end: event.event.end,
                calendarEventId: event.id,
                endeavorBlockId: null,
                taskId: null,
              ),
            )
            .toList())
        .listen((weekViewEvents) {
      add(NewEvents(weekViewEvents));
    });
  }

  List<DateTime> get monthRange {
    List<DateTime> dates = [];

    // Start at 30 days ago
    DateTime date = selectedDay.subtract(const Duration(days: 30));

    // Loop until 30 days from now
    while (date.isBefore(selectedDay.add(const Duration(days: 30)))) {
      dates.add(DateTime.utc(date.year, date.month, date.day));
      date = date.add(const Duration(days: 1));
    }

    return dates;
  }

  @override
  Future<void> close() async {
    _weekEventSubscription.cancel();
    await super.close();
  }
}
