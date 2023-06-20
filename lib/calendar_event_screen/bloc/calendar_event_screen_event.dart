part of 'calendar_event_screen_bloc.dart';

abstract class CalendarEventScreenEvent extends Equatable {
  const CalendarEventScreenEvent();
}

class TitleChanged extends CalendarEventScreenEvent {
  const TitleChanged(this.newTitle);

  final String newTitle;

  @override
  List<Object?> get props => [];
}
