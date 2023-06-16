part of 'week_screen_bloc.dart';

class WeekScreenState extends Equatable {
  const WeekScreenState(this.events);

  final List<WeekViewEvent> events;

  @override
  List<Object> get props => [events];
}

class WeekScreenInitial extends WeekScreenState {
  const WeekScreenInitial(super.events);
}
