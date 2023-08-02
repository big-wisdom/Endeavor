import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';

import '../task_screen_bloc.dart';

part 'create_task_screen_event.dart';

class CreateTaskScreenBloc extends TaskScreenBloc {
  CreateTaskScreenBloc({required DataRepository dataRepository})
      : super(dataRepository: dataRepository) {
    on<CreateTaskRequested>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EndeavorSelected>(
      (event, emit) => emit(
        state.copyWith(
          endeavorPickerRowInput: EndeavorPickerRowInput.dirty(
            event.newEndeavor == null
                ? null
                : EndeavorReference(
                    title: event.newEndeavor!.title,
                    id: event.newEndeavor!.id,
                  ),
          ),
        ),
      ),
    );

    on<TitleChanged>(
      (event, emit) => emit(
        state.copyWith(title: event.newTitle),
      ),
    );

    on<DurationChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<DivisibilityChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<MinnimumSchedulingDurationChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventCreated>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventDeleted>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
