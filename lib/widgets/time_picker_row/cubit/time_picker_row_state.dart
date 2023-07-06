part of 'time_picker_row_cubit.dart';

abstract class TimePickerRowState extends Equatable {
  const TimePickerRowState();

  @override
  List<Object> get props => [];
}

class TimePickerRowInitial extends TimePickerRowState {}

class StartTimePickerRowState extends TimePickerRowState {}
