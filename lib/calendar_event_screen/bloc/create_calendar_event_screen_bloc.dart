import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class CreateCalendarEventScreenBloc extends CalendarEventScreenBloc {
  CreateCalendarEventScreenBloc()
      : super(const CalendarEventScreenInitial(
            isEdit: false, title: CalendarEventTitle.pure())) {
    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
