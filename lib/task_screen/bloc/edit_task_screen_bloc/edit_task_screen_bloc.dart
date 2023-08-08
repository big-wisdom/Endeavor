import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';

import '../task_screen_bloc.dart';
part 'edit_task_screen_event.dart';

class EditTaskScreenBloc extends TaskScreenBloc {
  late final StreamSubscription taskStreamSub;
  late Task initialTask;

  EditTaskScreenBloc({
    required TaskReference taskReference,
    required DataRepository dataRepository,
  }) : super(
          initialEndeavorReference: null,
          initialTaskReference: taskReference,
        ) {
    taskStreamSub = dataRepository.getTaskStream(taskReference.id).listen(
      (updatedTask) {
        if (state is LoadingEditTaskScreenState) {
          initialTask = updatedTask;
        }
        add(TaskChangedByServer(newTask: updatedTask));
      },
    );

    on<TaskChangedByServer>(
      (event, emit) {
        emit(EditTaskScreenState.fromTask(task: event.newTask));
      },
    );

    on<EndeavorSelected>(
      (event, emit) => throw UnimplementedError(),
    );

    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
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

    on<SaveButtonTapped>(
      (event, emit) => throw UnimplementedError(),
    );
  }

  @override
  Future<void> close() {
    taskStreamSub.cancel();
    return super.close();
  }
}
