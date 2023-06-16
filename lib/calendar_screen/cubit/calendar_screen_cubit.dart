import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_screen_state.dart';

class CalendarScreenCubit extends Cubit<CalendarScreenState> {
  CalendarScreenCubit()
      : super(CalendarScreenInitial(selectedDate: DateTime.now()));

  void selectNewDate(DateTime newDate) {
    emit(CalendarScreenState(selectedDate: newDate));
  }
}
