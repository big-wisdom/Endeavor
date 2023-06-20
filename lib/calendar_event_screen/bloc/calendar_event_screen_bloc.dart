import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart' show CalendarEventTitle;
import 'package:equatable/equatable.dart';

part 'calendar_event_screen_event.dart';
part 'calendar_event_screen_state.dart';

abstract class CalendarEventScreenBloc
    extends Bloc<CalendarEventScreenEvent, CalendarEventScreenState> {
  CalendarEventScreenBloc(super.initialState);
}
