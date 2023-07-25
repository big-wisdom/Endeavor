import '../../../task_reference.dart';
import 'package:formz/formz.dart';

class EndeavorTaskIdsInputError {}

class EndeavorTasksInput
    extends FormzInput<List<TaskReference>, EndeavorTaskIdsInputError> {
  const EndeavorTasksInput.pure(super.value) : super.pure();
  const EndeavorTasksInput.dirty(super.value) : super.dirty();

  @override
  EndeavorTaskIdsInputError? validator(List<TaskReference> value) {
    return null;
  }
}
