part of 'tasks_screen_bloc.dart';

abstract class TasksScreenEvent extends Equatable {
  const TasksScreenEvent();
}

class ServerUpdate extends TasksScreenEvent {
  const ServerUpdate({
    required this.treeOfLife,
    required this.endeavorlessTasks,
  });

  final TreeOfLife treeOfLife;
  final List<Task> endeavorlessTasks;

  @override
  List<Object?> get props => [treeOfLife, endeavorlessTasks];
}

class DeleteTask extends TasksScreenEvent {
  const DeleteTask(this.taskReference);

  final TaskReference taskReference;

  @override
  List<Object?> get props => [taskReference];
}

class PlanRequested extends TasksScreenEvent {
  const PlanRequested(this.endeavor);

  final Endeavor endeavor;

  @override
  List<Object?> get props => [endeavor];
}
