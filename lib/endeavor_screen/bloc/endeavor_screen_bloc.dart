import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'endeavor_screen_event.dart';
part 'endeavor_screen_state.dart';

class EndeavorScreenBloc
    extends Bloc<EndeavorScreenEvent, EndeavorScreenState> {
  final DataRepository _dataRepository;
  // This Endeavor
  late final StreamSubscription<Endeavor> _endeavorStreamSubscription;

  // Sub endeavors
  late final Stream<List<Endeavor>> subEndeavorStream;
  late final StreamController<List<Endeavor>> _subEndeavorStreamController =
      StreamController();

  EndeavorScreenBloc(
      {required DataRepository dataRepository, required Endeavor endeavor})
      : _dataRepository = dataRepository,
        super(
          EndeavorScreenState(endeavor: endeavor, isEditing: endeavor.isEmpty),
        ) {
    on<EndeavorChangedByUI>((event, emit) {
      // if isEditing, should update on firebase also this should be debounced
      if (state.isEditing) {
        _dataRepository.updateEndeavor(endeavor);
      } else {
        emit(
          EndeavorScreenState(
            endeavor: event.newEndeavor,
            isEditing: false,
          ),
        );
      }
    });

    on<EndeavorChangedByServer>((event, emit) async {
      List<Task>? newTasks;
      if (event.newEndeavor.taskIds != state.endeavor.taskIds) {
        // get task objects for state
        newTasks = await _dataRepository.getEndeavorTasks(endeavor);
      }
      emit(
        EndeavorScreenState(
          endeavor: event.newEndeavor,
          isEditing: state.isEditing,
          tasks: newTasks ?? [],
        ),
      );
    });

    on<DeleteEndeavorRequested>((event, emit) {
      _dataRepository.deleteEndeavor(event.endeavor);
    });

    on<CreateEndeavorRequested>(
      (event, emit) {
        _dataRepository.createPrimaryEndeavor(state.endeavor);
      },
    );

    on<ReorderTasks>(
      (event, emit) => _dataRepository.reorderEndeavorTasks(
        endeavor,
        event.oldIndex,
        event.newIndex,
      ),
    );

    on<DeleteTask>(
      (event, emit) {
        _dataRepository.deleteTask(event.task);
      },
    );

    _endeavorStreamSubscription =
        _dataRepository.endeavorStream(endeavor).listen(
      (newEndeavor) {
        add(EndeavorChangedByServer(newEndeavor));
      },
    );

    subEndeavorStream = _subEndeavorStreamController.stream;
    _dataRepository.subEndeavorStream(endeavor).listen((event) {
      _subEndeavorStreamController.sink.add(event);
    });
  }

  @override
  Future<void> close() {
    _endeavorStreamSubscription.cancel();
    _subEndeavorStreamController.close();
    return super.close();
  }
}
