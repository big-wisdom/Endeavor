import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';

part 'repeating_event_picker_state.dart';

class RepeatingEventPickerCubit extends Cubit<RepeatingEventPickerState> {
  final void Function(RepeatingEvent repeatingEvent) onChanged;
  final RepeatingEvent? initialRepeatingEvent;

  RepeatingEventPickerCubit({
    this.initialRepeatingEvent,
    required this.onChanged,
  }) : super(RepeatingEventPickerInitial(initialRepeatingEvent));

  void onDateRangeChanged(DateTime? startDate, DateTime? endDate) {
    throw UnimplementedError();
  }

  void dayOfWeekTapped(int index) {
    throw UnimplementedError();
  }

  void onStartTimeChanged(TimeOfDay time) {
    throw UnimplementedError();
  }

  void onEndTimeChanged(TimeOfDay time) {
    throw UnimplementedError();
  }
}