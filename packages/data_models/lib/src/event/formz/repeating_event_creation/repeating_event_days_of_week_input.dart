import 'package:formz/formz.dart';

enum RepeatingEventDaysOfWeekInputError {
  noneSelected,
}

extension RepeatingEventDaysOfWeekInputErrorText
    on RepeatingEventDaysOfWeekInputError {
  String errorText() {
    return "You must select at least one day";
  }
}

class RepeatingEventDaysOfWeekInput
    extends FormzInput<List<bool>, RepeatingEventDaysOfWeekInputError> {
  RepeatingEventDaysOfWeekInput.pure(super.value) : super.pure();
  RepeatingEventDaysOfWeekInput.dirty(super.value) : super.dirty();

  @override
  RepeatingEventDaysOfWeekInputError? validator(List<bool> value) {
    if (value.length != 7) {
      throw Exception("There must be 7 days of the week ya bozo!");
    }

    bool noneSelected = true;
    for (final daySelected in value) {
      if (daySelected) noneSelected = false;
    }
    if (noneSelected) {
      return RepeatingEventDaysOfWeekInputError.noneSelected;
    }

    return null;
  }
}
