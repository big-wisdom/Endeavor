part of 'edit_endeavor_screen_bloc.dart';

enum SettingsScreenState { hidden, loading, loaded }

abstract class EditEndeavorScreenState {
  const EditEndeavorScreenState(this.title);
  final String title;
}

class LoadingEditEndeavorScreenState implements EditEndeavorScreenState {
  LoadingEditEndeavorScreenState(EndeavorReference endeavorReference)
      : title = endeavorReference.title;

  @override
  final String title;
}

class LoadedEditEndeavorScreenState extends EndeavorForm
    implements EditEndeavorScreenState {
  const LoadedEditEndeavorScreenState({
    this.settingsScreenState = SettingsScreenState.hidden,
    required super.titleInput,
    required super.subEndeavorsInput,
    required super.tasksInput,
    required super.color,
  });

  factory LoadedEditEndeavorScreenState.fromEndeavor(Endeavor endeavor) {
    return LoadedEditEndeavorScreenState(
      titleInput: EndeavorTitleInput.pure(endeavor.title),
      subEndeavorsInput: SubEndeavorsInput.pure(endeavor.subEndeavorReferences),
      tasksInput: EndeavorTasksInput.pure(endeavor.taskReferences),
      color: endeavor.color,
    );
  }

  final SettingsScreenState settingsScreenState;

  LoadedEditEndeavorScreenState copyWith({
    List<TaskReference>? newTaskList,
    List<EndeavorReference>? newSubEndeavorReferencesList,
  }) {
    return LoadedEditEndeavorScreenState(
      titleInput: titleInput,
      subEndeavorsInput: newSubEndeavorReferencesList != null
          ? SubEndeavorsInput.dirty(newSubEndeavorReferencesList)
          : subEndeavorsInput,
      tasksInput: newTaskList != null
          ? EndeavorTasksInput.dirty(newTaskList)
          : tasksInput,
      color: color,
    );
  }

  @override
  List<Object> get props =>
      [titleInput, settingsScreenState, subEndeavorsInput, tasksInput];

  @override
  String get title => titleInput.value;
}
