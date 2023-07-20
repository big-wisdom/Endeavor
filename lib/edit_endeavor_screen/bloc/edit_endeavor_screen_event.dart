part of 'edit_endeavor_screen_bloc.dart';

abstract class EditEndeavorScreenEvent extends Equatable {
  const EditEndeavorScreenEvent();
}

class EndeavorChangedByServer extends EditEndeavorScreenEvent {
  const EndeavorChangedByServer(this.newEndeavor);

  final Endeavor newEndeavor;

  @override
  List<Object?> get props => [newEndeavor];
}

class EndeavorChangedByUI extends EditEndeavorScreenEvent {
  const EndeavorChangedByUI(this.newEndeavor);

  final Endeavor newEndeavor;

  @override
  List<Object?> get props => [newEndeavor];
}

class DeleteEndeavorRequested extends EditEndeavorScreenEvent {
  const DeleteEndeavorRequested(this.endeavorReference);

  final EndeavorReference endeavorReference;

  @override
  List<Object?> get props => [endeavorReference];
}

class CreateSubEndeavorRequested extends EditEndeavorScreenEvent {
  const CreateSubEndeavorRequested(this.newEndeavorTitle);

  final String newEndeavorTitle;

  @override
  List<Object?> get props => [newEndeavorTitle];
}

class ReorderTasks extends EditEndeavorScreenEvent {
  const ReorderTasks(this.oldIndex, this.newIndex);

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [oldIndex, newIndex];
}

class DeleteTask extends EditEndeavorScreenEvent {
  const DeleteTask(this.taskReference);

  final TaskReference taskReference;

  @override
  List<Object?> get props => [taskReference];
}

class ColorChanged extends EditEndeavorScreenEvent {
  const ColorChanged(this.newColor);

  final Color newColor;

  @override
  List<Object?> get props => [newColor];
}
