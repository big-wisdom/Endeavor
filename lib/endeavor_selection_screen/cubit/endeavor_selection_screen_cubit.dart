import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'endeavor_selection_screen_state.dart';

class EndeavorSelectionScreenCubit extends Cubit<EndeavorSelectionScreenState> {
  final void Function(Endeavor) _onChanged;

  EndeavorSelectionScreenCubit({
    required DataRepository dataRepository,
    TreeOfLife? treeOfLife,
    required EndeavorPickerRowInput initiallySelectedEndeavorInput,
    required void Function(Endeavor) onChanged,
  })  : _onChanged = onChanged,
        super(EndeavorSelectionScreenInitial(
          treeOfLife: treeOfLife,
          selectedEndeavorInput: initiallySelectedEndeavorInput,
        )) {
    // get tree of life if it's not passed in
    if (treeOfLife == null) {
      dataRepository.getEndeavorsTreeOfLife().then(
            (value) => emit(
              EndeavorSelectionScreenState(
                treeOfLife: value,
                selectedEndeavorInput: state.selectedEndeavorInput,
              ),
            ),
          );
    }
  }

  void endeavorSelected(Endeavor endeavor) {
    _onChanged(endeavor);
    emit(
      EndeavorSelectionScreenState(
        treeOfLife: state.treeOfLife,
        selectedEndeavorInput: EndeavorPickerRowInput.dirty(
          EndeavorReference(
            id: endeavor.id,
            title: endeavor.title,
          ),
        ),
      ),
    );
  }
}
