import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';

class SubEndeavorIdsInputError {}

class SubEndeavorsInput
    extends FormzInput<List<EndeavorReference>, SubEndeavorIdsInputError> {
  const SubEndeavorsInput.pure(super.value) : super.pure();
  const SubEndeavorsInput.dirty(super.value) : super.dirty();

  @override
  SubEndeavorIdsInputError? validator(List<EndeavorReference> value) {
    return null;
  }
}
