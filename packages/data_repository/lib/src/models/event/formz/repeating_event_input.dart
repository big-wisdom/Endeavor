import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';

enum RepeatingEventInputError {
  endDateBeforeStartDate,
  endTimeBeforeStartTime,
  noDaysSelected
}

class RepeatingEventInput
    extends FormzInput<RepeatingEvent, RepeatingEventInputError> {
  RepeatingEventInput.pure(super.value) : super.pure();
  RepeatingEventInput.dirty(super.value) : super.dirty();

  @override
  RepeatingEventInputError? validator(RepeatingEvent value) {
    if (value.endDate.compareToDateOnly(value.startDate) < 0) {
      return RepeatingEventInputError.endDateBeforeStartDate;
    } else if (value.endTime.compareTo(value.endTime) < 0) {
      return RepeatingEventInputError.endTimeBeforeStartTime;
    }

    bool daysOfWeekValid = false;
    value.daysOfWeek.forEach((day) {
      if (day) daysOfWeekValid = true;
    });
    if (!daysOfWeekValid) {
      return RepeatingEventInputError.noDaysSelected;
    }
    return null;
  }
}
