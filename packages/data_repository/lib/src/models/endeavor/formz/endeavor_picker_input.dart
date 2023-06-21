import 'package:formz/formz.dart';

class EndeavorPickerRowInputError {}

// the value is supposed to be the endeavorId
class EndeavorPickerRowInput
    extends FormzInput<String?, EndeavorPickerRowInputError> {
  EndeavorPickerRowInput.pure() : super.pure(null);
  EndeavorPickerRowInput.dirty(super.value, String endeavorTitle)
      : title = endeavorTitle,
        super.dirty();

  String? title;

  @override
  EndeavorPickerRowInputError? validator(String? value) {
    return null;
  }
}
