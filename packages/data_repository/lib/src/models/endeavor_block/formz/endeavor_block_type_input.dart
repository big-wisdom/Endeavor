import 'package:formz/formz.dart';

import '../model/endeavor_block.dart';

class EndeavorBlockTypeInputError {}

class EndeavorBlockTypeInput
    extends FormzInput<EndeavorBlockType, EndeavorBlockTypeInputError> {
  EndeavorBlockTypeInput.pure(super.value) : super.pure();
  EndeavorBlockTypeInput.dirty(super.value) : super.dirty();

  @override
  EndeavorBlockTypeInputError? validator(EndeavorBlockType value) {
    return null;
  }
}
