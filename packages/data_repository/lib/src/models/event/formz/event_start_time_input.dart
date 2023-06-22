import 'package:formz/formz.dart';
import 'package:flutter/material.dart' show TimeOfDay;

enum EventStartTimeInputError {
  startAfterEnd,
}

class EventStartTimeInput
    extends FormzInput<TimeOfDay, EventStartTimeInputError> {
  const EventStartTimeInput.pure(this.endTime, super.value) : super.pure();
  const EventStartTimeInput.dirty(this.endTime, super.value) : super.dirty();

  final TimeOfDay endTime;

  EventStartTimeInput copyWith(TimeOfDay endTime) {
    return this.pure
        ? EventStartTimeInput.pure(endTime, value)
        : EventStartTimeInput.dirty(endTime, value);
  }

  @override
  EventStartTimeInputError? validator(TimeOfDay value) {
    if (value.compareTo(endTime) >= 0) {
      return EventStartTimeInputError.startAfterEnd;
    }

    return null;
  }
}
