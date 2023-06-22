import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart' show TimeOfDay;

part 'one_time_event_picker_state.dart';

class OneTimeEventPickerCubit extends Cubit<OneTimeEventPickerState> {
  OneTimeEventPickerCubit(Event? initialEvent)
      : super(OneTimeEventPickerInitial(initialEvent));

  void newDatePicked(DateTime date) {
    emit(state.copyWith(dateInput: EventDateInput.dirty(date)));
  }
}
