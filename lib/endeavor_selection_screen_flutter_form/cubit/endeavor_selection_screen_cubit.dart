import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:shim_data_service/shim_data_service.dart';

part 'endeavor_selection_screen_state.dart';

class EndeavorSelectionScreenCubit extends Cubit<EndeavorSelectionScreenState> {
  final void Function(EndeavorReference?) _onChanged;

  EndeavorSelectionScreenCubit({
    required EndeavorReference? initialValue,
    required void Function(EndeavorReference?) onChanged,
    required bool nullable,
  })  : _onChanged = onChanged,
        super(EndeavorSelectionScreenInitial(
          treeOfLife: null,
          selectedEndeavorReference: initialValue,
        )) {
    ShimDataService.endeavors.endeavorsTreeOfLife.first.then(
      (tree) => emit(
        EndeavorSelectionScreenState(
          treeOfLife: tree.data,
          selectedEndeavorReference: state.selectedEndeavorReference,
        ),
      ),
    );
  }

  void endeavorSelected(Endeavor endeavor) {
    EndeavorReference? newInput;
    if (state.selectedEndeavorReference == null ||
        state.selectedEndeavorReference!.id != endeavor.id) {
      newInput = EndeavorReference(id: endeavor.id, title: endeavor.title);
    } else {
      // the selected endeavor has been tapped again
      newInput = null;
    }
    emit(
      EndeavorSelectionScreenState(
        treeOfLife: state.treeOfLife,
        selectedEndeavorReference: newInput,
      ),
    );

    _onChanged(
        newInput != null ? EndeavorReference.fromEndeavor(endeavor) : null);
  }
}
