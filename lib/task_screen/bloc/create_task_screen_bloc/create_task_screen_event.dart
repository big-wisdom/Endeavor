part of 'create_task_screen_bloc.dart';

abstract class CreateTaskScreenEvent extends TaskScreenEvent {
  const CreateTaskScreenEvent();
}

class CreateTaskRequested extends CreateTaskScreenEvent {
  const CreateTaskRequested({required this.task});
  final Task task;

  @override
  List<Object?> get props => [task];
}
