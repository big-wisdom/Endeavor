part of 'one_time_event_picker_cubit.dart';

class OneTimeEventPickerState extends Equatable with FormzMixin {
  OneTimeEventPickerState({
    required this.date,
    required this.start,
    required this.end,
  });

  final FormzDatePicker date;
  final FormzStartTimePicker start;
  final FormzEndTimePicker end;

  @override
  List<Object> get props => [date, start, end];

  @override
  List<FormzInput> get inputs => [date, start, end];
}

class OneTimeEventPickerInitial extends OneTimeEventPickerState {
  OneTimeEventPickerInitial({
    required super.date,
    required super.start,
    required super.end,
  });
}
