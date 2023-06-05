import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'endeavor_settings_screen_event.dart';
part 'endeavor_settings_screen_state.dart';

class EndeavorSettingsScreenBloc
    extends Bloc<EndeavorSettingsScreenEvent, EndeavorSettingsScreenState> {
  late final StreamSubscription<EndeavorSettings> _settingsStreamSubscription;

  EndeavorSettingsScreenBloc({
    required Stream<EndeavorSettings> settingsStream,
  }) : super(
          const EndeavorSettingsScreenState(
            state: SettingsScreenState.loading,
            settings: EndeavorSettings.empty,
          ),
        ) {
    on<NewSettingsFromDatabase>(
      (event, emit) => emit(
        EndeavorSettingsScreenState(
          state: SettingsScreenState.loaded,
          settings: event.newSettings,
        ),
      ),
    );

    _settingsStreamSubscription = settingsStream.listen((newSettings) {
      add(NewSettingsFromDatabase(newSettings));
    });
  }

  @override
  Future<void> close() {
    _settingsStreamSubscription.cancel();
    return super.close();
  }
}
