import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'endeavor_selection_screen_state.dart';

class EndeavorSelectionScreenCubit extends Cubit<EndeavorSelectionScreenState> {
  final void Function(Endeavor) _onChanged;

  EndeavorSelectionScreenCubit({
    required DataRepository dataRepository,
    List<Endeavor>? endeavorTreeOfLife,
    required EndeavorPickerRowInput endeavorInput,
    required void Function(Endeavor) onChanged,
  })  : _onChanged = onChanged,
        super(EndeavorSelectionScreenInitial(
          endeavorTreeOfLife: endeavorTreeOfLife,
          endeavorInput: endeavorInput,
        )) {
    // get tree of life if it's not passed in
    if (endeavorTreeOfLife == null) {
      dataRepository.getEndeavorsTreeOfLife().then(
            (value) => emit(
              EndeavorSelectionScreenState(
                endeavorTreeOfLife: value,
                endeavorInput: state.endeavorInput,
              ),
            ),
          );
    }
  }

  void endeavorSelected(Endeavor endeavor) {
    _onChanged(endeavor);
    emit(
      EndeavorSelectionScreenState(
        endeavorTreeOfLife: state.endeavorTreeOfLife,
        endeavorInput: EndeavorPickerRowInput.dirty(
          endeavor.id,
          endeavor.title!,
        ),
      ),
    );
  }
}
