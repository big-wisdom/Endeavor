import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class RepeatingEndeavorBlockForm extends Equatable with FormzMixin {
  const RepeatingEndeavorBlockForm({
    required this.endeavorReference,
    required this.repeatingEventInput,
  });

  final EndeavorPickerRowInput endeavorReference;
  final RepeatingEventInput repeatingEventInput;
}
