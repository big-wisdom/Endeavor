import 'package:bloc/bloc.dart';
import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:shim_data_service/shim_data_service.dart';

part 'endeavor_selection_screen_state.dart';

class EndeavorSelectionScreenCubit extends Cubit<EndeavorSelectionScreenState> {
  final void Function(Endeavor?) _onChanged;
  final bool _nullable;

  EndeavorSelectionScreenCubit({
    required EndeavorPickerRowInput initiallySelectedEndeavorInput,
    required void Function(Endeavor?) onChanged,
  })  : _nullable = initiallySelectedEndeavorInput.nullable,
        _onChanged = onChanged,
        super(EndeavorSelectionScreenInitial(
          treeOfLife: null,
          status: QueryStatus.initial,
          selectedEndeavorInput: initiallySelectedEndeavorInput,
        )) {
    // get tree of life
    ShimDataService.endeavors.endeavorsTreeOfLife.first.then(
      (treeOfLifeQueryState) => emit(
        EndeavorSelectionScreenState(
          treeOfLife: treeOfLifeQueryState.data,
          status: QueryStatus.success,
          selectedEndeavorInput: state.selectedEndeavorInput,
        ),
      ),
    );
  }

  void endeavorSelected(Endeavor endeavor) {
    EndeavorPickerRowInput newInput;
    if (state.selectedEndeavorInput.value == null ||
        state.selectedEndeavorInput.value!.id != endeavor.id) {
      newInput = EndeavorPickerRowInput.dirty(
        _nullable,
        EndeavorReference(id: endeavor.id, title: endeavor.title),
      );
    } else {
      newInput = EndeavorPickerRowInput.dirty(_nullable, null);
    }
    emit(
      EndeavorSelectionScreenState(
        treeOfLife: state.treeOfLife,
        status: QueryStatus.success,
        selectedEndeavorInput: newInput,
      ),
    );

    _onChanged(newInput.value != null ? endeavor : null);
  }
}
