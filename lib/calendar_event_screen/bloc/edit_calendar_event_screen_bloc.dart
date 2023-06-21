import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class EditCalendarEventScreenBloc extends CalendarEventScreenBloc {
  EditCalendarEventScreenBloc(CalendarEvent calendarEvent)
      : super(CalendarEventScreenInitial.edit(calendarEvent)) {
    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
