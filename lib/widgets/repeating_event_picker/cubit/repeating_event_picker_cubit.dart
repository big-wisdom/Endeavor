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
      ..subscribeToFieldBlocs([endTime]);
    endTime
      ..addValidators([_endTimeValidator(startTime)])
      ..subscribeToFieldBlocs([startTime]);
    daysOfWeek.addValidators([_daysOfWeekValidator(daysOfWeek)]);
    addFieldBlocs(
      fieldBlocs: [startDate, endDate, startTime, endTime, daysOfWeek],
    );
  }

  Validator<TimeOfDay> _startTimeValidator(
      InputFieldBloc<TimeOfDay, dynamic> endTime) {
    return (TimeOfDay start) {
      submit();
      if (start.compareTo(endTime.value) >= 0) {
        return "Start time must be before end time";
      }
      return null;
    };
  }

  Validator<TimeOfDay> _endTimeValidator(
      InputFieldBloc<TimeOfDay, dynamic> startTime) {
    return (TimeOfDay end) {
      submit();
      if (end.compareTo(startTime.value) <= 0) {
        return "Start time must be before end time";
      }
      return null;
    };
  }

  Validator<List<String>> _daysOfWeekValidator(
      MultiSelectFieldBloc<String, dynamic> daysOfWeek) {
    return (List<String> daysOfWeek) {
      submit();
      if (daysOfWeek.isEmpty) {
        return "Must select at least one day";
      }
      return null;
    };
  }

  @override
  FutureOr<void> onSubmitting() {
    onChanged(
      RepeatingEvent(
        startDate: startDate.value,
        endDate: endDate.value,
        startTime: startTime.value,
        endTime: endTime.value,
      ),
    );
  }
}
