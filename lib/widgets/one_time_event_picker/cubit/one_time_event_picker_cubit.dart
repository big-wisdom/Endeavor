import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter/material.dart' show TimeOfDay;

part 'one_time_event_picker_state.dart';

class OneTimeEventPickerCubit extends Cubit<OneTimeEventPickerState> {
  final void Function(Event) onChanged;

  OneTimeEventPickerCubit({Event? initialEvent, required this.onChanged})
      : super(OneTimeEventPickerInitial(initialEvent));

  void newDatePicked(DateTime date) {
    emit(state.copyWith(dateInput: EventDateInput.dirty(date)));
    _onChangedIfValid();
  }

  void newStartTimePicked(TimeOfDay time) {
    emit(state.copyWith(
      startTimeInput: EventStartTimeInput.dirty(state.endTimeInput.value, time),
    ));

    _onChangedIfValid();
  }

  void newEndTimePicked(TimeOfDay time) {
    emit(
      state.copyWith(
        endTimeInput: EventEndTimeInput.dirty(state.startTimeInput.value, time),
      ),
    );

    _onChangedIfValid();
  }

  void _onChangedIfValid() {
    final potentialEvent = state.createEvent();
    if (potentialEvent != null) {
      onChanged(potentialEvent);
    }
  }
}
