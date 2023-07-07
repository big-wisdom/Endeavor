import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:formz/formz.dart';

enum RepeatingEventEndDateInputError {
  endBeforeStart,
}

class RepeatingEventEndDateInput
    extends FormzInput<DateTime, RepeatingEventEndDateInputError> {
  RepeatingEventEndDateInput.pure(this.startDate, super.value) : super.pure();
  RepeatingEventEndDateInput.dirty(this.startDate, super.value) : super.dirty();
  final DateTime startDate;
  @override
  RepeatingEventEndDateInputError? validator(DateTime value) {
    if (value.compareToDateOnly(startDate) < 0) {
      return RepeatingEventEndDateInputError.endBeforeStart;
    }
    return null;
  }
}
