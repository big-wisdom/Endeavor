import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'edit_endeavor_screen_event.dart';
part 'edit_endeavor_screen_state.dart';

class EditEndeavorScreenBloc
    extends Bloc<EditEndeavorScreenEvent, EditEndeavorScreenState> {
  late final StreamSubscription _streamSubscription;
  late Endeavor _currentEndeavor;

  factory EditEndeavorScreenBloc.fromEndeavor({
    required DataRepository dataRepository,
    required Endeavor endeavor,
  }) {
    return EditEndeavorScreenBloc._(
      dataRepository: dataRepository,
      endeavor: endeavor,
    );
  }

  factory EditEndeavorScreenBloc.fromEndeavorReference({
    required DataRepository dataRepository,
    required EndeavorReference endeavorReference,
  }) {
    return EditEndeavorScreenBloc._(
      dataRepository: dataRepository,
      endeavorReference: endeavorReference,
    );
  }

  EditEndeavorScreenBloc._({
    required DataRepository dataRepository,
    EndeavorReference? endeavorReference,
    Endeavor? endeavor,
  }) : super(endeavor == null
            ? LoadingEditEndeavorScreenState(endeavorReference!)
            : LoadedEditEndeavorScreenState.fromEndeavor(endeavor)) {
    // Load endeavor if it's not already
    _streamSubscription = dataRepository
        .getEndeavorStream(
      endeavorReference?.id ?? endeavor!.id,
    )
        .listen((newEndeavor) {
      _currentEndeavor = newEndeavor;
      add(EndeavorChangedByServer(newEndeavor));
    });

    on<EndeavorChangedByServer>(
      (event, emit) => emit(
        LoadedEditEndeavorScreenState.fromEndeavor(event.newEndeavor),
      ),
    );

    on<EndeavorChangedByUI>((event, emit) {
      dataRepository.updateEndeavor(event.newEndeavor);
    });

    on<DeleteEndeavorRequested>((event, emit) {
      dataRepository.deleteSubEndeavorFromReference(event.endeavorReference);
    });

    on<CreateSubEndeavorRequested>(
      (event, emit) => dataRepository.addSubEndeavor(
        parentEndeavor: _currentEndeavor,
        endeavorTitle: event.newEndeavorTitle,
      ),
    );

    on<ReorderTasks>(
      (event, emit) => dataRepository.reorderEndeavorTasks(
        _currentEndeavor,
        event.oldIndex,
        event.newIndex,
      ),
    );

    on<DeleteTask>(
      (event, emit) {
        dataRepository.deleteTask(event.taskReference);
      },
    );

    on<ColorChanged>((event, emit) => throw UnimplementedError());
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
