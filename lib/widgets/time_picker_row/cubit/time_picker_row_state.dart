part of 'time_picker_row_cubit.dart';

abstract class TimePickerRowState extends Equatable {
  const TimePickerRowState(this.time);

  final TimeOfDay? time;

  TimePickerRowState copyWithNewTime(TimeOfDay newTime);

  @override
  List<Object?> get props => [time];
}

class StartTimePickerRowState extends TimePickerRowState {
  const StartTimePickerRowState(super.time);

  @override
  TimePickerRowState copyWithNewTime(TimeOfDay newTime) {
    return StartTimePickerRowState(newTime);
  }
}

class EndTimePickerRowState extends TimePickerRowState {
  const EndTimePickerRowState(super.time);

  @override
  TimePickerRowState copyWithNewTime(TimeOfDay newTime) {
    return EndTimePickerRowState(newTime);
  }
}
