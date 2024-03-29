import 'dart:async';
import 'dart:ui';
import 'package:endeavor/util.dart';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_service/data_service.dart';
import 'package:equatable/equatable.dart';

part 'edit_endeavor_screen_event.dart';
part 'edit_endeavor_screen_state.dart';

class EditEndeavorScreenBloc
    extends Bloc<EditEndeavorScreenEvent, EditEndeavorScreenState> {
  late final StreamSubscription _streamSubscription;
  late Endeavor currentEndeavor;

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
        .listen(
      (newEndeavor) {
        currentEndeavor = newEndeavor;
        add(EndeavorChangedByServer(newEndeavor));
      },
    );

    on<EndeavorChangedByServer>(
      (event, emit) => emit(
        LoadedEditEndeavorScreenState.fromEndeavor(event.newEndeavor),
      ),
    );

    on<EndeavorChangedByUI>((event, emit) {
      ServerEndeavorDataServiceExtension.updateEndeavor(event.newEndeavor);
    });

    on<DeleteEndeavorRequested>((event, emit) {
      ServerEndeavorDataServiceExtension.deleteSubEndeavor(
          event.endeavorReference);
    });

    on<CreateSubEndeavorRequested>(
      (event, emit) => ServerEndeavorDataServiceExtension.addSubEndeavor(
        parentEndeavorId: currentEndeavor.id,
        endeavorTitle: event.newEndeavorTitle,
      ),
    );

    on<ReorderSubEndeavors>((event, emit) {
      final thisState = state as LoadedEditEndeavorScreenState;
      final newSubEndeavorIdsList =
          thisState.subEndeavorsInput.value.reorderedCopy(
        event.oldIndex,
        event.newIndex,
      );
      emit(thisState.copyWith(
          newSubEndeavorReferencesList: newSubEndeavorIdsList));
      ServerEndeavorDataServiceExtension.reorderSubEndeavors(
        currentEndeavor.id,
        newSubEndeavorIdsList.map((e) => e.id).toList(),
      );
    });

    on<ReorderTasks>(
      (event, emit) {
        final thisState = state as LoadedEditEndeavorScreenState;
        final newTaskReferenceList = thisState.tasksInput.value
            .reorderedCopy(event.oldIndex, event.newIndex);
        emit(
          thisState.copyWith(
            newTaskList: newTaskReferenceList,
          ),
        );
        ServerEndeavorDataServiceExtension.reorderEndeavorTasks(
          currentEndeavor.id,
          newTaskReferenceList.map((e) => e.id).toList(),
        );
      },
    );

    on<DeleteTask>(
      (event, emit) {
        TasksDataServiceExtension.deleteTask(event.taskReference);
      },
    );

    on<ColorChanged>((event, emit) {
      ServerEndeavorDataServiceExtension.updateEndeavorColor(
        endeavorId: currentEndeavor.id,
        color: event.newColor,
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
