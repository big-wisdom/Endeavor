part of 'endeavor_selection_screen_cubit.dart';

class EndeavorSelectionScreenState extends Equatable {
  const EndeavorSelectionScreenState({
    required this.treeOfLife,
    required this.selectedEndeavorReference,
  });

  final TreeOfLife? treeOfLife;
  final EndeavorReference? selectedEndeavorReference;

  @override
  List<Object?> get props => [treeOfLife, selectedEndeavorReference];
}

class EndeavorSelectionScreenInitial extends EndeavorSelectionScreenState {
  const EndeavorSelectionScreenInitial(
      {required super.treeOfLife, required super.selectedEndeavorReference});
}
