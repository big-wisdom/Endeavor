import 'package:formz/formz.dart';

enum CalendarEventTitleInputError {
  empty,
}

class CalendarEventTitleInput
    extends FormzInput<String, CalendarEventTitleInputError> {
  const CalendarEventTitleInput.pure(String? initialValue)
      : super.pure(initialValue ?? '');

  const CalendarEventTitleInput.dirty(super.value) : super.dirty();

  @override
  CalendarEventTitleInputError? validator(String value) {
    if (value.isEmpty) {
      return CalendarEventTitleInputError.empty;
    }

    return null;
  }
}

extension CalendarEventTitleErrorText on CalendarEventTitleInputError {
  String text() {
    switch (this) {
      case CalendarEventTitleInputError.empty:
        return "You gotta name the event";
    }
  }
}
