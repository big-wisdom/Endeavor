import '../../endeavor_reference.dart';
import 'package:formz/formz.dart';

enum EndeavorPickerRowInputError {
  nullWhenItShouldntBe,
}

extension EndeavorPickerRowInputErrorText on EndeavorPickerRowInputError {
  String errorText() {
    return "You must select an endeavor";
  }
}

class EndeavorPickerRowInput
    extends FormzInput<EndeavorReference?, EndeavorPickerRowInputError> {
  EndeavorPickerRowInput.pure(this.nullable, super.value) : super.pure();
  EndeavorPickerRowInput.dirty(this.nullable, super.value) : super.dirty();

  final bool nullable;

  @override
  EndeavorPickerRowInputError? validator(EndeavorReference? value) {
    if (!nullable && value == null) {
      return EndeavorPickerRowInputError.nullWhenItShouldntBe;
    }
    return null;
  }
}
