part of 'endeavor_block_screen_bloc.dart';

abstract class EndeavorBlockScreenState {}

class SingleEndeavorBlockScreenState extends EndeavorBlockForm
    implements EndeavorBlockScreenState {
  const SingleEndeavorBlockScreenState({
    required super.endeavorReference,
    required super.event,
    required this.isEdit,
  });

  final bool isEdit;

  EndeavorBlockScreenState copyWith({
    String? endeavorTitle,
    bool? isLoading,
  }) {
    return SingleEndeavorBlockScreenState(
      endeavorReference: endeavorTitle == null
          ? endeavorReference
          : EndeavorPickerRowInput.dirty(endeavorReference.value!
              .copyWithNewTitle(newEndeavorTitle: endeavorTitle)),
      event: event,
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

  @override
  List<FormzInput> get inputs => throw UnimplementedError();

  @override
  List<Object?> get props => throw UnimplementedError();
}
