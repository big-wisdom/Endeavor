import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter/material.dart';

part 'repeating_event_picker_state.dart';

class RepeatingEventPickerCubit extends Cubit<RepeatingEventPickerState> {
  final void Function(RepeatingEventInput repeatingEvent) onChanged;
  final RepeatingEvent? initialRepeatingEvent;

  RepeatingEventPickerCubit({
    this.initialRepeatingEvent,
    required this.onChanged,
  }) : super(RepeatingEventPickerInitial(initialRepeatingEvent));

  void onDateRangeChanged(DateTime? startDate, DateTime? endDate) {
    emit(state.copyWith(startDate: startDate, endDate: endDate));
    _onChangedIfValid();
  }

  void dayOfWeekTapped(int index) {
    emit(state.copyWith(dayTapped: index));
    _onChangedIfValid();
  }

  void onStartTimeChanged(TimeOfDay time) {
    emit(state.copyWith(startTime: time));
    _onChangedIfValid();
  }

  void onEndTimeChanged(TimeOfDay time) {
    emit(state.copyWith(endTime: time));
    _onChangedIfValid();
  }

  void _onChangedIfValid() {
    onChanged(state.createRepeatingEventInput());
  }
}
