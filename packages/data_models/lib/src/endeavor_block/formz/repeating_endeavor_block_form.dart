import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class RepeatingEndeavorBlockForm extends Equatable with FormzMixin {
  const RepeatingEndeavorBlockForm({
    required this.endeavorReference,
    required this.repeatingEventInput,
  });

  final EndeavorPickerRowInput endeavorReference;
  final RepeatingEventInput repeatingEventInput;

  @override
  List<FormzInput> get inputs => [endeavorReference, repeatingEventInput];
}
