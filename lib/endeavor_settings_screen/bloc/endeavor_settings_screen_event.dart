part of 'endeavor_settings_screen_bloc.dart';

abstract class EndeavorSettingsScreenEvent extends Equatable {
  const EndeavorSettingsScreenEvent();

  @override
  List<Object> get props => [];
}

class NewSettingsFromDatabase extends EndeavorSettingsScreenEvent {
  const NewSettingsFromDatabase(this.newSettings);

  final EndeavorSettings newSettings;
}
