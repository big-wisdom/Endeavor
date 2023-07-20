part of 'tasks_screen_bloc.dart';

abstract class TasksScreenState {
  const TasksScreenState();
}

class LoadingTasksScreenState extends Equatable implements TasksScreenState {
  @override
  List<Object?> get props => [];
}

class LoadedTasksScreenState extends Equatable implements TasksScreenState {
  const LoadedTasksScreenState({
    required this.treeOfLife,
    required this.tasksWithNoEndeavor,
  });
  final TreeOfLife treeOfLife;
  final List<Task> tasksWithNoEndeavor;

  @override
  List<Object> get props => [treeOfLife, tasksWithNoEndeavor];
}
