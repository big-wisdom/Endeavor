import 'dart:async';

import 'package:bloc/bloc.dart';
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
    on<DeleteTask>(
      (event, emit) => ShimDataService.tasks.deleteTask(event.taskReference),
    );

    on<PlanRequested>(
      (event, emit) {
        ShimDataService.endeavors.planEndeavor(event.endeavor);
      },
    );

    // TODO: Get tree of life stream back
    // _activeTreeSubscription =
    //     dataRepository.activeTreeOfLifeStream.listen((event) {
    //   add(ServerUpdate(
    //     treeOfLife: event,
    //     endeavorlessTasks: state is LoadedTasksScreenState
    //         ? (state as LoadedTasksScreenState).tasksWithNoEndeavor
    //         : [],
    //   ));
    // });

    // TODO: Get endeavorless task stream back
    // _endeavorlessSubscription =
    //     dataRepository.endeavorlessTasksStream.listen((event) {
    //   if (state is LoadedTasksScreenState) {
    //     add(
    //       ServerUpdate(
    //         treeOfLife: (state as LoadedTasksScreenState).treeOfLife,
    //         endeavorlessTasks: event,
    //       ),
    //     );
    //   }
    // });
  }

  @override
  Future<void> close() {
    _activeTreeSubscription.cancel();
    _endeavorlessSubscription.cancel();
    return super.close();
  }
}
