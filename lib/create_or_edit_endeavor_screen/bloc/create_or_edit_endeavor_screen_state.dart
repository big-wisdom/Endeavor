part of 'create_or_edit_endeavor_screen_bloc.dart';

enum SettingsScreenState { hidden, loading, loaded }

class CreateOrEditEndeavorScreenState extends Equatable {
  const CreateOrEditEndeavorScreenState({
    required this.endeavor,
    required this.isEditing,
    this.settingsScreenState = SettingsScreenState.hidden,
  });

  final Endeavor endeavor;
  final bool isEditing;
  final SettingsScreenState settingsScreenState;

  CreateOrEditEndeavorScreenState copyWith({SettingsScreenState? state}) {
    return CreateOrEditEndeavorScreenState(
      endeavor: endeavor,
      isEditing: isEditing,
      settingsScreenState: state ?? settingsScreenState,
    );
  }

  @override
  List<Object> get props => [endeavor, isEditing, settingsScreenState];
}
