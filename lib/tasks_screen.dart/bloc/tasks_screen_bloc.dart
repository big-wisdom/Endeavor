import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasks_screen_event.dart';
part 'tasks_screen_state.dart';

class TasksScreenBloc extends Bloc<TasksScreenEvent, TasksScreenState> {
  TasksScreenBloc() : super(TasksScreenInitial()) {
    on<TasksScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
