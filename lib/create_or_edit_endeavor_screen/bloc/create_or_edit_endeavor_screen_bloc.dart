import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_or_edit_endeavor_screen_event.dart';
part 'create_or_edit_endeavor_screen_state.dart';

class CreateOrEditEndeavorScreenBloc extends Bloc<
    CreateOrEditEndeavorScreenEvent, CreateOrEditEndeavorScreenState> {
  final DataRepository _dataRepository;
  late final StreamSubscription<Endeavor> _endeavorStreamSubscription;
  late final Stream<EndeavorSettings> settingsStream;
  late final StreamController<EndeavorSettings>? _settingsStreamController;

  CreateOrEditEndeavorScreenBloc(
      {required DataRepository dataRepository, required Endeavor endeavor})
      : _dataRepository = dataRepository,
        super(
          CreateOrEditEndeavorScreenState(
              endeavor: endeavor, isEditing: endeavor.isEmpty),
        ) {
    on<EndeavorChangedByUI>((event, emit) {
      // if isEditing, should update on firebase also this should be debounced
      if (state.isEditing) {
        _dataRepository.updateEndeavor(endeavor);
      } else {
        emit(
          CreateOrEditEndeavorScreenState(
            endeavor: event.newEndeavor,
            isEditing: false,
          ),
        );
      }
    });

    on<CreateEndeavorRequested>(
      (event, emit) {
        _dataRepository.createPrimaryEndeavor(state.endeavor);
      },
    );

    on<SettingsViewRequested>((_, emit) => onSettingsViewRequested(_, emit));

    on<SettingsChangedByServer>(
      (event, emit) {
        CreateOrEditEndeavorScreenState(
          endeavor: state.endeavor.copyWith(settings: event.newSettings),
          isEditing: state.isEditing,
        );
      },
    );

    on<SettingsChangedByClient>(((event, emit) {
      if (state.isEditing) {
        // change settings through the data service
        dataRepository.changeSettings(event.newSettings, endeavor.id);
      } else {
        // change new settings in the local endeavor object
        emit(
          CreateOrEditEndeavorScreenState(
            endeavor: endeavor.copyWith(settings: event.newSettings),
            isEditing: state.isEditing,
          ),
        );
        // add new settings to the settings stream exposed by this object
        _settingsStreamController!.sink.add(event.newSettings);
      }
    }));

    _endeavorStreamSubscription =
        _dataRepository.endeavorStream(endeavor).listen(
      (newEndeavor) {
        add(EndeavorChangedByServer(newEndeavor));
      },
    );

    if (state.isEditing) {
      settingsStream = _dataRepository.endeavorSettingsStream(state.endeavor);
    } else {
      // there is no settings document, so I will have to make my own stream here
      // Basically I need to stream whatever the settings attached to the endeavor are
      _settingsStreamController = StreamController();
      _settingsStreamController!.sink
          .add(endeavor.settings ?? EndeavorSettings.empty);
      settingsStream = _settingsStreamController!.stream;
    }
  }

  void onSettingsViewRequested(
    SettingsViewRequested _,
    Emitter<CreateOrEditEndeavorScreenState> emit,
  ) async {
    // if editing and endeavor doesn't have settings
    // Load them
    // show screen (the default endeavor should have default settings)

    // if settings is null
    if (state.endeavor.settings == null) {
      // if creating, fill it with empty
      if (!state.isEditing) {
        emit(CreateOrEditEndeavorScreenState(
          endeavor: state.endeavor.copyWith(settings: EndeavorSettings.empty),
          isEditing: state.isEditing,
          settingsScreenState: SettingsScreenState.loaded,
        ));
      } else {
        // if editing, populate it

        // emit a loading state
        emit(
          CreateOrEditEndeavorScreenState(
            endeavor: state.endeavor,
            isEditing: state.isEditing,
            settingsScreenState: SettingsScreenState.loading,
          ),
        );

        // get endeavor settings and populate them
        final endeavorSettings =
            await _dataRepository.endeavorSettingsStream(state.endeavor).last;

        // emit loading done
        emit(
          CreateOrEditEndeavorScreenState(
            endeavor: state.endeavor.copyWith(settings: endeavorSettings),
            isEditing: state.isEditing,
            settingsScreenState: SettingsScreenState.loaded,
          ),
        );
      }
    } else {
      emit(
        CreateOrEditEndeavorScreenState(
          endeavor: state.endeavor,
          isEditing: state.isEditing,
          settingsScreenState: SettingsScreenState.loaded,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _endeavorStreamSubscription.cancel();
    _settingsStreamSubscription?.cancel();
    return super.close();
  }
}
