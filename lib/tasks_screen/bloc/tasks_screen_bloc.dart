import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_service/data_service.dart';
import 'package:equatable/equatable.dart';

part 'tasks_screen_event.dart';
part 'tasks_screen_state.dart';

class TasksScreenBloc extends Bloc<TasksScreenEvent, TasksScreenState> {
  TasksScreenBloc(DataRepository dataRepository)
      : super(LoadingTasksScreenState()) {
    on<ServerUpdate>(
      (event, emit) => emit(LoadedTasksScreenState(
        treeOfLife: event.treeOfLife,
        tasksWithNoEndeavor: event.endeavorlessTasks,
      )),
    );
    on<DeleteTask>(
      (event, emit) => dataRepository.deleteTask(event.taskReference),
    );

    on<PlanRequested>(
      (event, emit) {
        ServerEndeavorDataServiceExtension.planEndeavor(event.endeavor);
      },
    );

    dataRepository.activeTreeOfLifeStream.listen((event) {
      add(ServerUpdate(
        treeOfLife: event,
        endeavorlessTasks: state is LoadedTasksScreenState
            ? (state as LoadedTasksScreenState).tasksWithNoEndeavor
            : [],
      ));
    });

    dataRepository.endeavorlessTasksStream.listen((event) {
      if (state is LoadedTasksScreenState) {
        add(
          ServerUpdate(
            treeOfLife: (state as LoadedTasksScreenState).treeOfLife,
            endeavorlessTasks: event,
          ),
        );
      }
    });
  }
}
