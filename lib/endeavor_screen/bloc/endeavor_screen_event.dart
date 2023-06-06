part of 'endeavor_screen_bloc.dart';

abstract class EndeavorScreenEvent extends Equatable {
  const EndeavorScreenEvent();

  @override
  List<Object> get props => [];
}

class EndeavorChangedByUI extends EndeavorScreenEvent {
  const EndeavorChangedByUI(this.newEndeavor);

  final Endeavor newEndeavor;
}

class EndeavorChangedByServer extends EndeavorScreenEvent {
  const EndeavorChangedByServer(this.newEndeavor);

  final Endeavor newEndeavor;
}

class CreateEndeavorRequested extends EndeavorScreenEvent {
  const CreateEndeavorRequested();
}

class DeleteEndeavorRequested extends EndeavorScreenEvent {
  const DeleteEndeavorRequested(this.endeavor);

  final Endeavor endeavor;
}

class ReorderTasks extends EndeavorScreenEvent {
  const ReorderTasks(this.oldIndex, this.newIndex);

  final int oldIndex;
  final int newIndex;
}

class DeleteTask extends EndeavorScreenEvent {
  const DeleteTask(this.task);

  final Task task;
}
