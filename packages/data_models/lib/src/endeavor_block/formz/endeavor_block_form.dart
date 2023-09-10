import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class EndeavorBlockForm extends Equatable with FormzMixin {
  const EndeavorBlockForm({
    required this.endeavorReference,
    required this.event,
  });

  final EndeavorPickerRowInput endeavorReference;
  final EventInput event;

  @override
  List<FormzInput> get inputs => [
        endeavorReference,
        event,
      ];

  UnidentifiedEndeavorBlock createUnidentifiedEndeavorBlock() {
    return UnidentifiedEndeavorBlock(
      repeatingEndeavorBlockId: null,
      endeavorReference: endeavorReference.value!,
      event: event.value,
    );
  }
}
