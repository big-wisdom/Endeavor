part of 'endeavor_selection_screen_cubit.dart';

class EndeavorSelectionScreenState extends Equatable {
  const EndeavorSelectionScreenState({
    required this.treeOfLife,
    required this.status,
    required this.selectedEndeavorInput,
  });

  final TreeOfLife? treeOfLife;
  final QueryStatus status;
  final EndeavorPickerRowInput selectedEndeavorInput;

  @override
  List<Object?> get props => [treeOfLife, selectedEndeavorInput];
}

class EndeavorSelectionScreenInitial extends EndeavorSelectionScreenState {
  const EndeavorSelectionScreenInitial({
    required super.treeOfLife,
    required super.status,
    required super.selectedEndeavorInput,
  });
}
