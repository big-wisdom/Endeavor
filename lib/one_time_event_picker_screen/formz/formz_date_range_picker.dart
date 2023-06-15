import 'package:formz/formz.dart';

class FormzDatePickerError {}

class FormzDatePicker extends FormzInput<DateTime, FormzDatePickerError> {
  const FormzDatePicker.pure(super.value) : super.pure();

  const FormzDatePicker.dirty(super.value) : super.dirty();

  @override
  FormzDatePickerError? validator(DateTime value) {
    return null;
  }
}
