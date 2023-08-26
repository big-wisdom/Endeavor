import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart' show TimeOfDay;

import '../../event.dart';

abstract class EventForm extends Equatable with FormzMixin {
  const EventForm({
    required this.dateInput,
    required this.startTimeInput,
    required this.endTimeInput,
  });

  final EventDateInput dateInput;
  final EventStartTimeInput startTimeInput;
  final EventEndTimeInput endTimeInput;

  @override
  List<FormzInput> get inputs => [
        dateInput,
        startTimeInput,
        endTimeInput,
      ];

  EventInput createEventInput() {
    return EventInput.dirty(
      Event(
        start: _dateTimeFromTimeOfDay(startTimeInput.value),
        end: _dateTimeFromTimeOfDay(endTimeInput.value),
      ),
    );
  }

  DateTime _dateTimeFromTimeOfDay(TimeOfDay time) {
    DateTime date = dateInput.value;
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }
}
