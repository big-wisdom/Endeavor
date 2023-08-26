import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart' show TimeOfDay;

enum EventEndTimeInputError {
  endBeforeStart,
}

extension EventEndTimeInputErrorText on EventEndTimeInputError {
  String errorText() {
    return "end time cannot be before start time";
  }
}

class EventEndTimeInput extends FormzInput<TimeOfDay, EventEndTimeInputError> {
  const EventEndTimeInput.pure(this.startTime, super.value) : super.pure();
  const EventEndTimeInput.dirty(this.startTime, super.value) : super.dirty();

  final TimeOfDay startTime;

  EventEndTimeInput copyWith(TimeOfDay startTime) {
    return this.pure
        ? EventEndTimeInput.pure(startTime, value)
        : EventEndTimeInput.dirty(startTime, value);
  }

  @override
  EventEndTimeInputError? validator(TimeOfDay value) {
    if (startTime.compareTo(value) >= 0) {
      return EventEndTimeInputError.endBeforeStart;
    }

    return null;
  }
}
