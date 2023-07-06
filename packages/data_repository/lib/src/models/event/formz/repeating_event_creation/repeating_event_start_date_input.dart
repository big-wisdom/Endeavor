import 'package:formz/formz.dart';

enum RepeatingEventStartDateInputError {
  startAfterEnd,
}

class RepeatingEventStartDateInput
    extends FormzInput<DateTime, RepeatingEventStartDateInputError> {
  RepeatingEventStartDateInput.pure(super.value, this.endDate) : super.pure();
  RepeatingEventStartDateInput.dirty(super.value, this.endDate) : super.dirty();
  final DateTime endDate;
  @override
  RepeatingEventStartDateInputError? validator(DateTime value) {
    if (value.compareToDateOnly(endDate) > 0) {
      return RepeatingEventStartDateInputError.startAfterEnd;
    }
    return null;
  }
}
