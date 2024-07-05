import 'dart:async';
import 'dart:ui';
import 'package:endeavor/util.dart';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:equatable/equatable.dart';

part 'edit_endeavor_screen_event.dart';
part 'edit_endeavor_screen_state.dart';

class EditEndeavorScreenBloc
    extends Bloc<EditEndeavorScreenEvent, EditEndeavorScreenState> {
  late final StreamSubscription _streamSubscription;
  late Endeavor currentEndeavor;

  factory EditEndeavorScreenBloc.fromEndeavor({
    required Endeavor endeavor,
  }) {
    return EditEndeavorScreenBloc._(
      endeavor: endeavor,
    );
  }

  factory EditEndeavorScreenBloc.fromEndeavorReference({
    required EndeavorReference endeavorReference,
  }) {
    return EditEndeavorScreenBloc._(
      endeavorReference: endeavorReference,
    );
  }

  EditEndeavorScreenBloc._({
    EndeavorReference? endeavorReference,
    Endeavor? endeavor,
  }) : super(endeavor == null
            ? LoadingEditEndeavorScreenState(endeavorReference!)
            : LoadedEditEndeavorScreenState.fromEndeavor(endeavor)) {
    // Load endeavor if it's not already
    _streamSubscription =
        ShimDataService.endeavors.primaryEndeavorsStream.listen(
      (newEndeavors) {
        var newEndeavor = newEndeavors.data!
            .firstWhere((e) => e.id == (endeavorReference?.id ?? endeavor!.id));
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
      ShimDataService.endeavors.updateEndeavor(event.newEndeavor);
    });

    on<DeleteEndeavorRequested>((event, emit) {
      ShimDataService.endeavors.deleteSubEndeavor(event.endeavorReference);
    });

    on<CreateSubEndeavorRequested>(
      (event, emit) => ShimDataService.endeavors.addSubEndeavor(
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
      // TODO: make sub endeavors reorderable
      // ShimDataService.endeavors.reorderSubEndeavors(
      //   currentEndeavor.id,
      //   newSubEndeavorIdsList.map((e) => e.id).toList(),
      // );
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
        // TODO: Make tasks reorderable
        // ShimDataService.endeavors.reorderEndeavorTasks(
        //   currentEndeavor.id,
        //   newTaskReferenceList.map((e) => e.id).toList(),
        // );
      },
    );

    on<DeleteTask>(
      (event, emit) {
        ShimDataService.tasks.deleteTask(event.taskReference);
      },
    );

    on<ColorChanged>((event, emit) {
      // TODO: Make color changeable
      // ShimDataService.endeavors.updateEndeavorColor(
      //   endeavorId: currentEndeavor.id,
      //   color: event.newColor,
      // );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
