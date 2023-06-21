import 'package:formz/formz.dart';

class EndeavorPickerRowInputError {}

// the value is supposed to be the endeavorId
class EndeavorPickerRowInput
    extends FormzInput<String?, EndeavorPickerRowInputError> {
  EndeavorPickerRowInput.pure(this.title, String? value) : super.pure(value);
  EndeavorPickerRowInput.dirty(super.value, String endeavorTitle)
      : title = endeavorTitle,
        super.dirty();

  String? title;

  EndeavorPickerRowInput copyWithTitle(String title) {
    return EndeavorPickerRowInput.pure(title, value);
  }

  @override
  EndeavorPickerRowInputError? validator(String? value) {
    return null;
  }
}
