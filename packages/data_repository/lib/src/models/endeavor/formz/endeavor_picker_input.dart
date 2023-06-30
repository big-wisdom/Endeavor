import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';

class EndeavorPickerRowInputError {}

class EndeavorPickerRowInput
    extends FormzInput<EndeavorReference?, EndeavorPickerRowInputError> {
  EndeavorPickerRowInput.pure(super.value) : super.pure();
  EndeavorPickerRowInput.dirty(super.value) : super.dirty();

  @override
  EndeavorPickerRowInputError? validator(EndeavorReference? value) {
    return null;
  }
}
