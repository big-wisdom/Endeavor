part of 'endeavor_selection_screen_cubit.dart';

class EndeavorSelectionScreenState extends Equatable {
  const EndeavorSelectionScreenState({
    required this.endeavorTreeOfLife,
    required this.endeavorInput,
  });

  final List<Endeavor>? endeavorTreeOfLife;
  final EndeavorPickerRowInput endeavorInput;

  @override
  List<Object?> get props => [endeavorTreeOfLife, endeavorInput];
}

class EndeavorSelectionScreenInitial extends EndeavorSelectionScreenState {
  const EndeavorSelectionScreenInitial(
      {required super.endeavorTreeOfLife, required super.endeavorInput});
}
