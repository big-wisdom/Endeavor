import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class EditCalendarEventScreenBloc extends CalendarEventScreenBloc {
  EditCalendarEventScreenBloc(
      CalendarEvent calendarEvent, DataRepository dataRepository)
      : super(
          CalendarEventScreenInitial.edit(calendarEvent),
          dataRepository: dataRepository,
        ) {
    // load the endeavor title
    dataRepository.getEndeavorTitle().then(
          (value) => add(
            EndeavorTitleReturned(value),
          ),
        );

    on<EndeavorTitleReturned>(
      (event, emit) => emit(
        state.copyWith(
            endeavorInput: state.endeavorInput.copyWithTitle(event.title),
            loadingState: CalendarEventScreenLoadingState.loaded),
      ),
    );

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
