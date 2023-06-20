import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class EditCalendarEventScreenBloc extends CalendarEventScreenBloc {
  EditCalendarEventScreenBloc()
      : super(const CalendarEventScreenState(
            isEdit: true, title: CalendarEventTitle.pure())) {
    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
