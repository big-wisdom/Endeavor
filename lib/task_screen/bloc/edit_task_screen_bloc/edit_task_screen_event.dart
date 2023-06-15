part of 'edit_task_screen_bloc.dart';

abstract class EditTaskScreenEvent extends TaskScreenEvent {
  const EditTaskScreenEvent();
}

class TaskChangedByServer extends EditTaskScreenEvent {
  const TaskChangedByServer({required this.newTask});

  final Task newTask;

  @override
  List<Object?> get props => [newTask];
}
