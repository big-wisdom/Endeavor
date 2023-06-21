import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'calendar_event_screen_event.dart';
part 'calendar_event_screen_state.dart';

abstract class CalendarEventScreenBloc
    extends Bloc<CalendarEventScreenEvent, CalendarEventScreenState> {
  CalendarEventScreenBloc(super.initialState, {required this.dataRepository});
  DataRepository dataRepository;
}
