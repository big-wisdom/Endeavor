part of 'endeavor_settings_screen_bloc.dart';

enum SettingsScreenState { loading, loaded }

class EndeavorSettingsScreenState extends Equatable {
  const EndeavorSettingsScreenState({
    required this.state,
    required this.settings,
  });

  final SettingsScreenState state;
  final EndeavorSettings settings;

  @override
  List<Object> get props => [state, settings];
}
