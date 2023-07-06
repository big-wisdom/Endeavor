import 'package:formz/formz.dart';
import 'package:flutter/material.dart' show TimeOfDay;

enum RepeatingEventStartTimeInputError {
  startAfterEnd,
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
