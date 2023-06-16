part of 'week_screen_bloc.dart';

abstract class WeekScreenEvent extends Equatable {
  const WeekScreenEvent();
}

class NewEvents extends WeekScreenEvent {
  const NewEvents(this.newEvents);

  final List<WeekViewEvent> newEvents;

  @override
  List<Object?> get props => [newEvents];
}
