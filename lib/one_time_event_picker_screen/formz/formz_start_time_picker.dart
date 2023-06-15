import 'package:endeavor/util.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum FormzStartTimePickerError {
  startAfterEnd,
}

class FormzStartTimePicker
    extends FormzInput<TimeOfDay, FormzStartTimePickerError> {
  FormzStartTimePicker.pure({required this.endTime, required TimeOfDay value})
      : super.pure(value);

  FormzStartTimePicker.dirty({required this.endTime, required TimeOfDay value})
      : super.dirty(value);

  final TimeOfDay endTime;

  @override
  FormzStartTimePickerError? validator(TimeOfDay value) {
    if (value.compareTo(endTime) >= 0) {
      return FormzStartTimePickerError.startAfterEnd;
    }
    return null;
  }
}
