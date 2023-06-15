import 'package:endeavor/util.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum FormzEndTimePickerError {
  startAfterEnd,
}

class FormzEndTimePicker
    extends FormzInput<TimeOfDay, FormzEndTimePickerError> {
  const FormzEndTimePicker.pure({required TimeOfDay value, required this.start})
      : super.pure(value);

  FormzEndTimePicker.dirty({required TimeOfDay value, required this.start})
      : super.dirty(value);

  final TimeOfDay start;

  @override
  FormzEndTimePickerError? validator(TimeOfDay value) {
    if (start.compareTo(value) >= 0) {
      return FormzEndTimePickerError.startAfterEnd;
    }
    return null;
  }
}
