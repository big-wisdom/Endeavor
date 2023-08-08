import 'package:formz/formz.dart';

class DurationError {}

class DurationField extends FormzInput<Duration?, DurationError> {
  const DurationField.pure(super.value) : super.pure();

  const DurationField.dirty(super.value) : super.dirty();

  @override
  DurationError? validator(Duration? value) {
    return null;
  }
}
