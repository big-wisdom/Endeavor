import 'package:bloc/bloc.dart';
import 'package:endeavor/widgets/time_picker_row/widget/time_picker_row.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show TimeOfDay;

part 'time_picker_row_state.dart';

class TimePickerRowCubit extends Cubit<TimePickerRowState> {
  TimePickerRowCubit({
    required TimePickerRowType type,
    TimeOfDay? initialTime,
    required this.onTimeSelected,
  }) : super(type == TimePickerRowType.start
            ? StartTimePickerRowState(initialTime)
            : EndTimePickerRowState(initialTime));

  final Function(TimeOfDay) onTimeSelected;

  void timeSelected(TimeOfDay time) {
    onTimeSelected(time);
    emit(state.copyWithNewTime(time));
  }

  // void timeChanged(TimeOfDay time) {
  // }
}
