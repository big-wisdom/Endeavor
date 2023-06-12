part of 'tasks_screen_bloc.dart';

abstract class TasksScreenEvent extends Equatable {
  const TasksScreenEvent();

  @override
  List<Object> get props => [];
}

class TreeOfLifeUpdatedByServer extends TasksScreenEvent {
  const TreeOfLifeUpdatedByServer(this.newTreeOfLife);

  final List<Endeavor> newTreeOfLife;
}

class EndeavorlessTasksUpdatedByServer extends TasksScreenEvent {
  const EndeavorlessTasksUpdatedByServer(this.newTasks);

  final List<Task> newTasks;
}

class DeleteTask extends TasksScreenEvent {
  const DeleteTask(this.task);

  final Task task;
}
