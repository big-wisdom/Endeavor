part of 'endeavor_settings_screen_bloc.dart';

abstract class EndeavorSettingsScreenEvent extends Equatable {
  const EndeavorSettingsScreenEvent();

  @override
  List<Object> get props => [];
}

class SettingsChangedByServer extends EndeavorSettingsScreenEvent {
  const SettingsChangedByServer(this.newSettings);

  final EndeavorSettings newSettings;
}

class SettingsChangedByClient extends EndeavorSettingsScreenEvent {
  const SettingsChangedByClient(this.newSettings);

  final EndeavorSettings newSettings;
}
