import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show TimeOfDay;

part 'time_picker_row_state.dart';

class TimePickerRowCubit extends Cubit<TimePickerRowState> {
  TimePickerRowCubit._({
    required this.onTimeSelected,
    required TimePickerRowState initialState,
  }) : super(initialState);

  factory TimePickerRowCubit.eventStartTime(
    Function(TimeOfDay) onTimeSelected,
    EventStartTimeInput eventStartTimeInput,
  ) {
    return TimePickerRowCubit._(
      onTimeSelected: onTimeSelected,
      initialState: EventStartTimePickerRowState(eventStartTimeInput),
    );
  }

  factory TimePickerRowCubit.eventEndTime(
    Function(TimeOfDay) onTimeSelected,
    EventEndTimeInput eventEndTimeInput,
  ) {
    return TimePickerRowCubit._(
      onTimeSelected: onTimeSelected,
      initialState: EventEndTimePickerRowState(eventEndTimeInput),
    );
  }

  factory TimePickerRowCubit.repeatingEventStartTime(
    Function(TimeOfDay) onTimeSelected,
    RepeatingEventStartTimeInput repeatingEventStartTimeInput,
  ) {
    return TimePickerRowCubit._(
      onTimeSelected: onTimeSelected,
      initialState:
          RepeatingEventStartTimePickerRowState(repeatingEventStartTimeInput),
    );
  }

  factory TimePickerRowCubit.repeatingEventEndTime(
    Function(TimeOfDay) onTimeSelected,
    RepeatingEventEndTimeInput repeatingEventEndTimeInput,
  ) {
    return TimePickerRowCubit._(
      onTimeSelected: onTimeSelected,
      initialState:
          RepeatingEventEndTimePickerRowState(repeatingEventEndTimeInput),
    );
  }

  final Function(TimeOfDay) onTimeSelected;

  void timeSelected(TimeOfDay time) {
    onTimeSelected(time);
    emit(state.copyWithNewTime(time));
  }
}
