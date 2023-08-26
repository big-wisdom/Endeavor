import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';

enum RepeatingEventEndTimeInputError {
  endBeforeStart,
}

extension RepeatingEventEndTimeInputErrorText
    on RepeatingEventEndTimeInputError {
  String errorText() {
    return "End time cannot be before start time";
  }
}

class RepeatingEventEndTimeInput
    extends FormzInput<TimeOfDay, RepeatingEventEndTimeInputError> {
  RepeatingEventEndTimeInput.pure(this.startTime, super.value) : super.pure();
  RepeatingEventEndTimeInput.dirty(this.startTime, super.value) : super.dirty();
  final TimeOfDay startTime;
  @override
  RepeatingEventEndTimeInputError? validator(TimeOfDay value) {
    if (value.compareTo(startTime) < 0) {
      return RepeatingEventEndTimeInputError.endBeforeStart;
    }
    return null;
  }
}
