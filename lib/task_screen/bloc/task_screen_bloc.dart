import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'task_screen_event.dart';
part 'task_screen_state.dart';

class TaskScreenBloc extends Bloc<TaskScreenEvent, TaskScreenState> {
  final EndeavorReference? initialEndeavorReference;
  final TaskReference? initialTaskReference;
  late final StreamSubscription? taskStreamSub;
  late Task initialTask;

  TaskScreenBloc({
    required this.initialEndeavorReference,
    required this.initialTaskReference,
  }) : super(
          initialTaskReference != null
              ? LoadingEditTaskScreenState(
                  taskReference: initialTaskReference,
                  endeavorReference: initialEndeavorReference,
                )
              : CreateTaskScreenState.initial(
                  initialEndeavorReference,
                ),
        ) {
    if (initialTaskReference != null) {
      // TODO: get task stream back
      // taskStreamSub =
      //     dataRepository.getTaskStream(initialTaskReference!.id).listen(
      //   (updatedTask) {
      //     if (state is LoadingEditTaskScreenState) {
      //       initialTask = updatedTask;
      //     }
      //     add(TaskChangedByServer(updatedTask));
      //   },
      // );
    } else {
      taskStreamSub = null;
    }

    on<TaskChangedByServer>(
      (event, emit) {
        emit(EditTaskScreenState.fromTask(task: event.newTask));
      },
    );
    on<TitleChanged>(
      (event, emit) => emit(
        state.copyWith(title: event.newTitle),
      ),
    );

    on<EndeavorSelected>(
      (event, emit) => emit(
        state.copyWith(
          endeavorPickerRowInput: EndeavorPickerRowInput.dirty(
            true,
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
            minnimumSchedulingDuration: state.minnimumSchedulingDuration.value,
          ),
        ),
      ),
    );

    on<MinnimumSchedulingDurationChanged>(
      (event, emit) => emit(
        state.copyWith(
          minnimumSchedulingDuration: event.newMinnimumDuration == Duration.zero
              ? null
              : MinnimumSchedulingDuration.dirty(
                  value: event.newMinnimumDuration,
                  duration: state.duration.value,
                  divisible: state.divisible.value,
                ),
        ),
      ),
    );

    on<EventCreated>(
      (event, emit) => emit(state.copyWith(
        newEventsList: [...state.scheduledEvents.value, event.event],
      )),
    );

    on<EventDeleted>(
      (event, emit) {
        final newEventsList = [...state.scheduledEvents.value]
          ..remove(event.event);
        emit(state.copyWith(newEventsList: newEventsList));
      },
    );

    on<SaveButtonTapped>((event, emit) {
      if (state.createUnidentifiedTask == null) {
        throw Exception("Task shouldn't be null");
      }

      if (state is CreateTaskScreenState) {
        ShimDataService.tasks.createTask(state.createUnidentifiedTask!);
      } else {
        ShimDataService.tasks.updateTask(
          state.createUnidentifiedTask!,
          initialTask.id,
        );
      }
    });
  }

  @override
  Future<void> close() {
    taskStreamSub?.cancel();
    return super.close();
  }
}
