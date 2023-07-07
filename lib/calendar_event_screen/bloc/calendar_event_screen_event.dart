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
  List<Object?> get props => [endeavor];
}

class TypeChanged extends CalendarEventScreenEvent {
  const TypeChanged(this.type);

  final CalendarEventType type;

  @override
  List<Object?> get props => [type];
}

class EventChanged extends CalendarEventScreenEvent {
  const EventChanged(this.newEvent);

  final Event newEvent;

  @override
  List<Object?> get props => [newEvent];
}

class RepeatingEventChanged extends CalendarEventScreenEvent {
  const RepeatingEventChanged(this.newRepeatingEvent);

  final RepeatingEvent newRepeatingEvent;

  @override
  List<Object?> get props => [newRepeatingEvent];
}

class CreateButtonPressed extends CalendarEventScreenEvent {
  const CreateButtonPressed();
  @override
  List<Object?> get props => [];
}

class DeleteThisCalendarEvent extends CalendarEventScreenEvent {
  const DeleteThisCalendarEvent();
  @override
  List<Object?> get props => [];
}
