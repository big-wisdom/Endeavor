import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:equatable/equatable.dart';

part 'tasks_screen_event.dart';
part 'tasks_screen_state.dart';

class TasksScreenBloc extends Bloc<TasksScreenEvent, TasksScreenState> {
  late final StreamSubscription _activeTreeSubscription;
  late final StreamSubscription _endeavorlessSubscription;

  TasksScreenBloc() : super(LoadingTasksScreenState()) {
    on<ServerUpdate>(
      (event, emit) => emit(LoadedTasksScreenState(
        treeOfLife: event.treeOfLife,
        tasksWithNoEndeavor: event.endeavorlessTasks,
      )),
    );

    on<ServerLoading>((event, emit) => emit(LoadingTasksScreenState()));

    on<DeleteTask>(
      (event, emit) => ShimDataService.tasks.deleteTask(event.taskReference),
    );

    on<PlanRequested>(
      (event, emit) {
        ShimDataService.endeavors.planEndeavor(event.endeavor);
      },
    );

    _activeTreeSubscription =
        ShimDataService.endeavors.endeavorsTreeOfLife.listen((queryState) {
      if (queryState.status == QueryStatus.success && queryState.data != null) {
        add(
          ServerUpdate(
            treeOfLife: queryState.data!,
            endeavorlessTasks: state is LoadedTasksScreenState
                ? (state as LoadedTasksScreenState).tasksWithNoEndeavor
                : const [],
          ),
        );
      }
    });

    _endeavorlessSubscription =
        ShimDataService.tasks.tasksStream.listen((event) {
      if (state is LoadedTasksScreenState &&
          (event.status == QueryStatus.success ||
              event.status == QueryStatus.initial)) {
        add(
          ServerUpdate(
            treeOfLife: (state as LoadedTasksScreenState).treeOfLife,
            endeavorlessTasks:
                event.data!.where((t) => t.endeavorReference == null).toList(),
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    _activeTreeSubscription.cancel();
    _endeavorlessSubscription.cancel();
    return super.close();
  }
}
