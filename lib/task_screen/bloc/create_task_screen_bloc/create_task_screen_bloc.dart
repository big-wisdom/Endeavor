import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_service/data_service.dart';

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
      (event, emit) => emit(
        state.copyWith(durationField: DurationField.dirty(event.newDuration)),
      ),
    );

    on<DivisibilityChanged>(
      (event, emit) => emit(
        state.copyWith(
          divisibilityBox: DivisibilityBox.dirty(
            value: event.newDivisibility,
            duration: state.duration.value,
          ),
        ),
      ),
    );

    on<MinnimumSchedulingDurationChanged>(
      (event, emit) => emit(
        state.copyWith(
          minnimumSchedulingDuration: state.minnimumSchedulingDuration.copyWith(
              newMinnimumSchedulingDuration: event.newMinnimumDuration),
        ),
      ),
    );

    on<EventCreated>(
      (event, emit) => emit(state.copyWith(newEvent: event.event)),
    );

    on<EventDeleted>(
      (event, emit) => throw UnimplementedError(),
    );

    on<SaveButtonTapped>((event, emit) {
      if (state.createTask == null) throw Exception("Task shouldn't be null");

      ServerTaskDataServiceExtension.createTask(state.createTask!);
    });
  }
}
