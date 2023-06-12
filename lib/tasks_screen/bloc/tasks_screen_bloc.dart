import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'tasks_screen_event.dart';
part 'tasks_screen_state.dart';

class TasksScreenBloc extends Bloc<TasksScreenEvent, TasksScreenState> {
  final DataRepository _dataRepository;
  TasksScreenBloc(this._dataRepository) : super(const TasksScreenInitial()) {
    on<TreeOfLifeUpdatedByServer>((event, emit) {
      emit(
        TasksScreenState(
          treeOfLife: event.newTreeOfLife,
          tasksWithNoEndeavor: state.tasksWithNoEndeavor,
        ),
      );
    });

    on<EndeavorlessTasksUpdatedByServer>((event, emit) {
      emit(
        TasksScreenState(
          treeOfLife: state.treeOfLife,
          tasksWithNoEndeavor: event.newTasks,
        ),
      );
    });

    on<DeleteTask>(
      (event, emit) => _dataRepository.deleteTask(event.task),
    );

    _dataRepository.tasksWithNoEndeavor.listen((newTasks) {
      add(EndeavorlessTasksUpdatedByServer(newTasks));
    });

    _dataRepository.activeTreeOfLife().listen((newTree) {
      add(TreeOfLifeUpdatedByServer(newTree));
    });
  }
}
