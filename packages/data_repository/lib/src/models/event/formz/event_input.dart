import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';

enum EventError {
  endBeforeStart,
}

class EventInput extends FormzInput<Event, EventError> {
  EventInput.pure(Event? initialValue)
      : super.pure(initialValue ?? Event.generic(const Duration(hours: 1)));

  EventInput.dirty(super.value) : super.dirty();

  @override
  EventError? validator(Event value) {
    if (value.end.isBefore(value.start)) {
      return EventError.endBeforeStart;
    }
    return null;
  }
}
