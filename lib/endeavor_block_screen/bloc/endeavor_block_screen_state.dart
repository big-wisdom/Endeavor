part of 'endeavor_block_screen_bloc.dart';

abstract class EndeavorBlockScreenState {
  final EndeavorPickerRowInput endeavorReference;

  EndeavorBlockScreenState({required this.endeavorReference});
}

class SingleEndeavorBlockScreenState extends EndeavorBlockForm
    implements EndeavorBlockScreenState {
  const SingleEndeavorBlockScreenState({
    required super.endeavorReference,
    required super.event,
    required this.isEdit,
  });

  final bool isEdit;

  EndeavorBlockScreenState copyWith({
    EndeavorReference? endeavorReference,
    EventInput? event,
  }) {
    return SingleEndeavorBlockScreenState(
      endeavorReference: endeavorReference != null
          ? EndeavorPickerRowInput.dirty(false, endeavorReference)
          : this.endeavorReference,
      event: event ?? this.event,
      isEdit: isEdit,
    );
  }

  @override
  List<Object> get props => [endeavorReference, event, isEdit];
}

class RepeatingEndeavorBlockScreenState extends RepeatingEndeavorBlockForm
    implements EndeavorBlockScreenState {
  const RepeatingEndeavorBlockScreenState({
    required super.endeavorReference,
    required super.repeatingEventInput,
  });

  RepeatingEndeavorBlockScreenState copyWith({
    EndeavorReference? endeavorReference,
    RepeatingEventInput? repeatingEventInput,
  }) {
    return RepeatingEndeavorBlockScreenState(
      endeavorReference: endeavorReference != null
          ? EndeavorPickerRowInput.dirty(false, endeavorReference)
          : this.endeavorReference,
      repeatingEventInput: repeatingEventInput ?? this.repeatingEventInput,
    );
  }

  @override
  List<Object?> get props => [endeavorReference, repeatingEventInput];
}
