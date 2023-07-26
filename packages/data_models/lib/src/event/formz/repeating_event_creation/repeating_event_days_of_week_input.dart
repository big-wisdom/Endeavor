import 'package:formz/formz.dart';

class RepeatingEventDaysOfWeekInputError {}

class RepeatingEventDaysOfWeekInput
    extends FormzInput<List<bool>, RepeatingEventDaysOfWeekInputError> {
  RepeatingEventDaysOfWeekInput.pure(super.value) : super.pure();
  RepeatingEventDaysOfWeekInput.dirty(super.value) : super.dirty();

  @override
  RepeatingEventDaysOfWeekInputError? validator(List<bool> value) {
    if (value.length != 7) {
      throw Exception("There must be 7 days of the week ya bozo!");
    }
    return null;
  }
}
