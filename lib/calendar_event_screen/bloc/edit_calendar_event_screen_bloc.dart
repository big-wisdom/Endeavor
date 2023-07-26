import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class EditCalendarEventScreenBloc extends CalendarEventScreenBloc {
  EditCalendarEventScreenBloc(
      CalendarEvent calendarEvent, DataRepository dataRepository)
      : super(
          SingleCalendarEventScreenState(
            isEdit: true,
            event: EventInput.pure(calendarEvent.event),
            title: CalendarEventTitleInput.pure(calendarEvent.title),
            endeavorInput:
                EndeavorPickerRowInput.pure(calendarEvent.endeavorReference),
          ),
          dataRepository: dataRepository,
        ) {
    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
