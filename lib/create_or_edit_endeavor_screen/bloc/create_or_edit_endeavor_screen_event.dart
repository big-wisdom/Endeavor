part of 'create_or_edit_endeavor_screen_bloc.dart';

abstract class CreateOrEditEndeavorScreenEvent extends Equatable {
  const CreateOrEditEndeavorScreenEvent();

  @override
  List<Object> get props => [];
}

class EndeavorChangedByUI extends CreateOrEditEndeavorScreenEvent {
  const EndeavorChangedByUI(this.newEndeavor);

  final Endeavor newEndeavor;
}

class EndeavorChangedByServer extends CreateOrEditEndeavorScreenEvent {
  const EndeavorChangedByServer(this.newEndeavor);

  final Endeavor newEndeavor;
}

class CreateEndeavorRequested extends CreateOrEditEndeavorScreenEvent {
  const CreateEndeavorRequested();
}

class SettingsViewRequested extends CreateOrEditEndeavorScreenEvent {
  const SettingsViewRequested();
}

class SettingsChangedByServer extends CreateOrEditEndeavorScreenEvent {
  const SettingsChangedByServer(this.newSettings);

  final EndeavorSettings newSettings;
}

class SettingsChangedByClient extends CreateOrEditEndeavorScreenEvent {
  const SettingsChangedByClient(this.newSettings);

  final EndeavorSettings newSettings;
}
