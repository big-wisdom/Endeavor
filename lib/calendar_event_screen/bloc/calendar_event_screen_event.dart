part of 'calendar_event_screen_bloc.dart';

abstract class CalendarEventScreenEvent extends Equatable {
  const CalendarEventScreenEvent();
}

class TitleChanged extends CalendarEventScreenEvent {
  const TitleChanged(this.newTitle);

  final String newTitle;

  @override
  List<Object?> get props => [newTitle];
}

class EndeavorChanged extends CalendarEventScreenEvent {
  const EndeavorChanged(this.endeavor);

  final Endeavor endeavor;

  @override
  // TODO: implement props
  List<Object?> get props => [endeavor];
}

class EndeavorTitleReturned extends CalendarEventScreenEvent {
  const EndeavorTitleReturned(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}

class TypeChanged extends CalendarEventScreenEvent {
  const TypeChanged(this.type);

  final CalendarEventType type;

  @override
  List<Object?> get props => [type];
}
