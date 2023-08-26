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

  final Endeavor? endeavor;

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
  const EventChanged(this.newEventInput);

  final EventInput newEventInput;

  @override
  List<Object?> get props => [newEventInput];
}

class RepeatingEventChanged extends CalendarEventScreenEvent {
  const RepeatingEventChanged(this.newRepeatingEventInput);

  final RepeatingEventInput newRepeatingEventInput;

  @override
  List<Object?> get props => [newRepeatingEventInput];
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
