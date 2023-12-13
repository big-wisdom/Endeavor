import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

part 'repeating_event_picker_state.dart';

final daysOfWeekStrings = [
  'M',
  'T',
  'W',
  'Th',
  'F',
  'S',
  'Su',
];

class RepeatingEventPickerCubit extends FormBloc<String, String> {
  final InputFieldBloc<DateTime, dynamic> startDate;
  final InputFieldBloc<DateTime, dynamic> endDate;
  final InputFieldBloc<TimeOfDay, dynamic> startTime;
  final InputFieldBloc<TimeOfDay, dynamic> endTime;
  final MultiSelectFieldBloc<String, dynamic> daysOfWeek;

  final void Function(RepeatingEvent repeatingEvent) onChanged;
  final RepeatingEvent? initialRepeatingEvent;

  RepeatingEventPickerCubit({
    this.initialRepeatingEvent,
    required this.onChanged,
  })  : startDate = InputFieldBloc(
            initialValue: initialRepeatingEvent?.startDate ?? DateTime.now()),
        endDate = InputFieldBloc(
            initialValue: initialRepeatingEvent?.endDate ??
                DateTime.now().add(const Duration(days: 7))),
        startTime = InputFieldBloc(
            initialValue: initialRepeatingEvent?.startTime ?? TimeOfDay.now()),
        endTime = InputFieldBloc(
            initialValue: initialRepeatingEvent?.endTime ??
                TimeOfDay.now().add(const Duration(hours: 1))),
        daysOfWeek = MultiSelectFieldBloc(
          name: "Days of the Week",
          initialValue: initialRepeatingEvent?.daysOfWeek
                  .asMap()
                  .entries
                  .where((entry) => entry.value)
                  .map((e) => daysOfWeekStrings[e.key])
                  .toList() ??
              [],
        ) {
    startTime
      ..addValidators([_startTimeValidator(endTime)])
      ..subscribeToFieldBlocs([endTime])
      ..onValueChanges(onData: (_, __) async* {
        _change();
      });
    endTime
      ..addValidators([_endTimeValidator(startTime)])
      ..subscribeToFieldBlocs([startTime])
      ..onValueChanges(onData: (_, __) async* {
        _change();
      });
    daysOfWeek
      ..addValidators([_daysOfWeekValidator(daysOfWeek)])
      ..onValueChanges(onData: (_, __) async* {
        _change();
      });
    addFieldBlocs(
      fieldBlocs: [startDate, endDate, startTime, endTime, daysOfWeek],
    );
  }

  Validator<TimeOfDay> _startTimeValidator(
      InputFieldBloc<TimeOfDay, dynamic> endTime) {
    return (TimeOfDay start) {
      if (start.compareTo(endTime.value) >= 0) {
        return "Start time must be before end time";
      }
      return null;
    };
  }

  Validator<TimeOfDay> _endTimeValidator(
      InputFieldBloc<TimeOfDay, dynamic> startTime) {
    return (TimeOfDay end) {
      if (end.compareTo(startTime.value) <= 0) {
        return "Start time must be before end time";
      }
      return null;
    };
  }

  Validator<List<String>> _daysOfWeekValidator(
      MultiSelectFieldBloc<String, dynamic> daysOfWeek) {
    return (List<String> daysOfWeek) {
      if (daysOfWeek.isEmpty) {
        return "Must select at least one day";
      }
      return null;
    };
  }

  // this way I can emit a value on every change whether it's valid or not
  void _change() {
    onChanged(
      RepeatingEvent(
        startDate: startDate.value,
        endDate: endDate.value,
        startTime: startTime.value,
        endTime: endTime.value,
        daysOfWeek: daysOfWeekStrings
            .map((day) => daysOfWeek.value.contains(day))
            .toList(),
      ),
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    onChanged(
      RepeatingEvent(
        startDate: startDate.value,
        endDate: endDate.value,
        startTime: startTime.value,
        endTime: endTime.value,
        daysOfWeek: daysOfWeekStrings
            .map((day) => daysOfWeek.value.contains(day))
            .toList(),
      ),
    );
  }
}
