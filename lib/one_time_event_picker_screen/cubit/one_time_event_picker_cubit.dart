import 'package:bloc/bloc.dart';
import 'package:endeavor/util.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import '../formz/formz_date_range_picker.dart';
import '../formz/formz_end_time_picker.dart';
import '../formz/formz_start_time_picker.dart';

part 'one_time_event_picker_state.dart';

class OneTimeEventPickerCubit extends Cubit<OneTimeEventPickerState> {
  OneTimeEventPickerCubit()
      : super(
          OneTimeEventPickerInitial(
            date: FormzDatePicker.pure(DateTime.now()),
            start: FormzStartTimePicker.pure(
              endTime: TimeOfDay.now().add(const Duration(hours: 1)),
              value: TimeOfDay.now(),
            ),
            end: FormzEndTimePicker.pure(
              value: TimeOfDay.now().add(const Duration(hours: 1)),
              start: TimeOfDay.now(),
            ),
          ),
        );

  void newDatePicked(DateTime newDate) {}

  void newStartTimePicked(TimeOfDay newStart) {}

  void newEndTimePicked(TimeOfDay newEnd) {}

  void done() {}
}
