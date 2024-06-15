import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

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
          selectedEndeavorInput: initiallySelectedEndeavorInput,
        )) {
    // get tree of life if it's not passed in
    // TODO: Need to get a tree of life stream back
    // ShimDataService.endeavors.endeavorsStream.first.then(
    //   (endeavors) => emit(
    //     EndeavorSelectionScreenState(
    //       treeOfLife: TreeOfLife.fromEndeavorsList(endeavors),
    //       selectedEndeavorInput: state.selectedEndeavorInput,
    //     ),
    //   ),
    // );
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
        selectedEndeavorInput: newInput,
      ),
    );

    _onChanged(newInput.value != null ? endeavor : null);
  }
}
