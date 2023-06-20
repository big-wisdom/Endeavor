import 'package:formz/formz.dart';

enum CalendarEventTitleError {
  empty,
}

class CalendarEventTitle extends FormzInput<String, CalendarEventTitleError> {
  const CalendarEventTitle.pure() : super.pure('');

  const CalendarEventTitle.dirty(super.value) : super.dirty();

  @override
  CalendarEventTitleError? validator(String value) {
    if (value.isEmpty) {
      return CalendarEventTitleError.empty;
    }

    return null;
  }
}

extension ErrorText on CalendarEventTitleError {
  String text() {
    switch (this) {
      case CalendarEventTitleError.empty:
        return "You gotta name the event";
    }
  }
}
