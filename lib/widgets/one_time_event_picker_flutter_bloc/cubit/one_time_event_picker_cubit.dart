import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter/material.dart' show TimeOfDay, debugPrint;
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

part 'one_time_event_picker_state.dart';

class OneTimeEventPickerBloc extends FormBloc<String, String> {
  final InputFieldBloc<TimeOfDay, dynamic> start;
  final InputFieldBloc<TimeOfDay, dynamic> end;
  final InputFieldBloc<DateTime, dynamic> date;
  final void Function(Event) onChanged;

  Validator<TimeOfDay> _startTimeValidator(
      InputFieldBloc<TimeOfDay, dynamic> endTime) {
    return (TimeOfDay start) {
      // submit();
      if (start.compareTo(endTime.value) >= 0) {
        return "Start time must be before end time";
      }
      return null;
    };
  }

  Validator<TimeOfDay> _endTimeValidator(
      InputFieldBloc<TimeOfDay, dynamic> startTime) {
    return (TimeOfDay end) {
      // submit();
      if (end.compareTo(startTime.value) <= 0) {
        return "End time must be after start time";
      }
      return null;
    };
  }

  OneTimeEventPickerBloc({Event? initialEvent, required this.onChanged})
      : start = InputFieldBloc(
          initialValue: initialEvent != null
              ? TimeOfDay.fromDateTime(initialEvent.start)
              : TimeOfDay.now(),
        ),
        end = InputFieldBloc(
          initialValue: initialEvent != null
              ? TimeOfDay.fromDateTime(initialEvent.end)
              : TimeOfDay.now().add(
                  const Duration(hours: 1),
                ),
        ),
        date = InputFieldBloc(
          initialValue: initialEvent?.start ?? DateTime.now(),
        ) {
    start
      ..addValidators([_startTimeValidator(end)])
      ..subscribeToFieldBlocs([end, date]);
    end
      ..addValidators([_endTimeValidator(start)])
      ..subscribeToFieldBlocs([start, date]);
    addFieldBlocs(fieldBlocs: [start, end, date]);
  }

  @override
  FutureOr<void> onSubmitting() {
    onChanged(
      Event(
        start: date.value.copyWith(
          hour: start.value.hour,
          minute: start.value.minute,
        ),
        end: date.value.copyWith(
          hour: end.value.hour,
          minute: end.value.minute,
        ),
      ),
    );
  }
}
