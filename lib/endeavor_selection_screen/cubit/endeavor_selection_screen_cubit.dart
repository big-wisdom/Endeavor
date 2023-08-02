import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'endeavor_selection_screen_state.dart';

class EndeavorSelectionScreenCubit extends Cubit<EndeavorSelectionScreenState> {
  final void Function(Endeavor?) _onChanged;

  EndeavorSelectionScreenCubit({
    required DataRepository dataRepository,
    TreeOfLife? treeOfLife,
    required EndeavorPickerRowInput initiallySelectedEndeavorInput,
    required void Function(Endeavor?) onChanged,
  })  : _onChanged = onChanged,
        super(EndeavorSelectionScreenInitial(
          treeOfLife: treeOfLife,
          selectedEndeavorInput: initiallySelectedEndeavorInput,
        )) {
    // get tree of life if it's not passed in
    if (treeOfLife == null) {
      dataRepository.treeOfLifeStream.first.then(
        (tree) => emit(
          EndeavorSelectionScreenState(
            treeOfLife: tree,
            selectedEndeavorInput: state.selectedEndeavorInput,
          ),
        ),
      );
    }
  }

  void endeavorSelected(Endeavor endeavor) {
    EndeavorPickerRowInput newInput;
    if (state.selectedEndeavorInput.value == null ||
        state.selectedEndeavorInput.value!.id != endeavor.id) {
      newInput = EndeavorPickerRowInput.dirty(
        EndeavorReference(id: endeavor.id, title: endeavor.title),
      );
    } else {
      newInput = EndeavorPickerRowInput.dirty(null);
    }
    emit(
      EndeavorSelectionScreenState(
        treeOfLife: state.treeOfLife,
        selectedEndeavorInput: newInput,
      ),
    );

    _onChanged(newInput.value != null ? endeavor : null);
  }
}
