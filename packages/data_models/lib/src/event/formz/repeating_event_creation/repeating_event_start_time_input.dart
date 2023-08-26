import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart' show TimeOfDay;

enum RepeatingEventStartTimeInputError {
  startAfterEnd,
}

extension RepeatingEventStartTimeInputErrorText
    on RepeatingEventStartTimeInputError {
  String errorText() {
    return "Start time cannot be after end time";
  }
}

class RepeatingEventStartTimeInput
    extends FormzInput<TimeOfDay, RepeatingEventStartTimeInputError> {
  RepeatingEventStartTimeInput.pure(super.value, this.endTime) : super.pure();
  RepeatingEventStartTimeInput.dirty(super.value, this.endTime) : super.dirty();

  final TimeOfDay endTime;
  @override
  RepeatingEventStartTimeInputError? validator(TimeOfDay value) {
    if (value.compareTo(endTime) >= 0) {
      return RepeatingEventStartTimeInputError.startAfterEnd;
    }
    return null;
  }
}
