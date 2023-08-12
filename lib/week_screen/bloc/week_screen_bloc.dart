import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'week_screen_event.dart';
part 'week_screen_state.dart';

class WeekScreenBloc extends Bloc<WeekScreenEvent, WeekScreenState> {
  DateTime selectedDay;
  late final StreamSubscription<List<WeekViewEvent>> _weekEventSubscription;

  WeekScreenBloc(
      {required DataRepository dataRepository, required this.selectedDay})
      : super(const WeekScreenInitial([])) {
    on<NewEvents>(
      (event, emit) {
        emit(
          WeekScreenState(event.newEvents),
        );
      },
    );

    _weekEventSubscription =
        dataRepository.weekViewEventStream.listen((weekViewEvents) {
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
  Future<void> close() {
    _weekEventSubscription.cancel();
    return super.close();
  }
}
