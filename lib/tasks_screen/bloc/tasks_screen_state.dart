part of 'tasks_screen_bloc.dart';

class TasksScreenState extends Equatable {
  const TasksScreenState({
    required this.treeOfLife,
    required this.tasksWithNoEndeavor,
  });
  final List<Endeavor> treeOfLife;
  final List<Task> tasksWithNoEndeavor;

  @override
  List<Object> get props => [treeOfLife, tasksWithNoEndeavor];
}

class TasksScreenInitial extends TasksScreenState {
  const TasksScreenInitial()
      : super(treeOfLife: const [], tasksWithNoEndeavor: const []);
}
