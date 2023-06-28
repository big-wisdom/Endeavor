part of 'endeavor_block_screen_bloc.dart';

class EndeavorBlockScreenState extends EndeavorBlockForm {
  const EndeavorBlockScreenState({
    required super.endeavor,
    required super.type,
    required super.event,
    required this.isEdit,
    required this.isLoading,
  });

  final bool isEdit;
  final bool isLoading;

  EndeavorBlockScreenState copyWith({
    String? endeavorTitle,
    bool? isLoading,
  }) {
    return EndeavorBlockScreenState(
      endeavor: endeavorTitle == null
          ? endeavor
          : endeavor.copyWithTitle(endeavorTitle),
      type: type,
      event: event,
      isEdit: isEdit,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        endeavor,
        type,
        event,
      ];
}
