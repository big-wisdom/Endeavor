part of 'endeavor_screen_bloc.dart';

enum SettingsScreenState { hidden, loading, loaded }

class EndeavorScreenState extends Equatable {
  const EndeavorScreenState({
    required this.endeavor,
    required this.isEditing,
    this.settingsScreenState = SettingsScreenState.hidden,
    this.subEndeavors = const [],
    this.tasks = const [],
  });

  final Endeavor endeavor;
  final List<Endeavor> subEndeavors;
  final bool isEditing;
  final SettingsScreenState settingsScreenState;
  final List<Task> tasks;

  EndeavorScreenState copyWith({
    SettingsScreenState? state,
    List<Endeavor>? subEndeavors,
    List<Task>? tasks,
  }) {
    return EndeavorScreenState(
      endeavor: endeavor,
      isEditing: isEditing,
      settingsScreenState: state ?? settingsScreenState,
      subEndeavors: subEndeavors ?? this.subEndeavors,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object> get props =>
      [endeavor, isEditing, settingsScreenState, subEndeavors, tasks];
}
