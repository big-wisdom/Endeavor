import 'package:formz/formz.dart';

class EventDateInputError {}

class EventDateInput extends FormzInput<DateTime, EventDateInputError> {
  const EventDateInput.pure(super.value) : super.pure();
  const EventDateInput.dirty(super.value) : super.dirty();

  @override
  EventDateInputError? validator(DateTime value) {
    return null;
  }
}
