part of 'one_time_event_picker_screen_cubit.dart';

class OneTimeEventPickerScreenState extends Equatable {
  const OneTimeEventPickerScreenState(this.event);
  final Event? event;

  @override
  List<Object?> get props => [event];
}

class OneTimeEventPickerInitial extends OneTimeEventPickerScreenState {
  const OneTimeEventPickerInitial(super.event);
}
