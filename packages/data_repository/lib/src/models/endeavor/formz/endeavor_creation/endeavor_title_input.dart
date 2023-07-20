import 'package:formz/formz.dart';

enum EndeavorTitleInputError { empty }

class EndeavorTitleInput extends FormzInput<String, EndeavorTitleInputError> {
  const EndeavorTitleInput.pure(super.value) : super.pure();
  const EndeavorTitleInput.dirty(super.dirty) : super.dirty();

  @override
  EndeavorTitleInputError? validator(String value) {
    if (value.isEmpty) {
      return EndeavorTitleInputError.empty;
    }
    return null;
  }
}

extension EndeavorTitleInputErrorText on EndeavorTitleInputError {
  static text() {
    return "You've gotta name the endeavor something";
  }
}
