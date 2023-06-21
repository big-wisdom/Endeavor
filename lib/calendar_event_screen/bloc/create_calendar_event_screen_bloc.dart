import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class CreateCalendarEventScreenBloc extends CalendarEventScreenBloc {
  CreateCalendarEventScreenBloc() : super(CalendarEventScreenInitial.create()) {
    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
