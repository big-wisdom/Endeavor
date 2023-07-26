import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/bloc/calendar_event_screen_bloc.dart';

class CreateCalendarEventScreenBloc extends CalendarEventScreenBloc {
  CreateCalendarEventScreenBloc(DataRepository dataRepository)
      : super(
          SingleCalendarEventScreenState(
            isEdit: false,
            event: EventInput.pure(null),
            title: const CalendarEventTitleInput.pure(null),
            endeavorInput: EndeavorPickerRowInput.pure(null),
          ),
          dataRepository: dataRepository,
        ) {
    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<TypeChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
