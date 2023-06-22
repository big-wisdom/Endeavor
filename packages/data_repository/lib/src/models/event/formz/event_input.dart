import 'package:formz/formz.dart';
import '../model/event.dart';

enum EventInputError {
  endBeforeStart,
}

class EventInput extends FormzInput<Event, EventInputError> {
  EventInput.pure(Event? value)
      : super.pure(value ?? Event.generic(const Duration(hours: 1)));

  EventInput.dirty(super.value) : super.dirty();
  @override
  EventInputError? validator(Event value) {
    if (value.end.isBefore(value.start)) {
      return EventInputError.endBeforeStart;
    }
    return null;
  }
}
