part of 'task_screen_bloc.dart';

abstract class TaskScreenEvent extends Equatable {
  const TaskScreenEvent();
}

class TaskChangedByServer extends TaskScreenEvent {
  const TaskChangedByServer(this.newTask);

  final Task newTask;
  @override
  List<Object?> get props => [newTask];
}

class TitleChanged extends TaskScreenEvent {
  const TitleChanged(this.newTitle);

  final String newTitle;

  @override
  List<Object?> get props => [newTitle];
}

class EndeavorSelected extends TaskScreenEvent {
  const EndeavorSelected(this.newEndeavor);

  final Endeavor? newEndeavor;

  @override
  List<Object?> get props => [newEndeavor];
}

class DurationChanged extends TaskScreenEvent {
  const DurationChanged(this.newDuration);

  final Duration newDuration;

  @override
  List<Object?> get props => [newDuration];
}

class DivisibilityChanged extends TaskScreenEvent {
  const DivisibilityChanged(this.newDivisibility);

  final bool newDivisibility;

  @override
  List<Object?> get props => [newDivisibility];
}

class MinnimumSchedulingDurationChanged extends TaskScreenEvent {
  const MinnimumSchedulingDurationChanged(this.newMinnimumDuration);

  final Duration newMinnimumDuration;

  @override
  List<Object?> get props => [newMinnimumDuration];
}

class EventCreated extends TaskScreenEvent {
  const EventCreated(this.event);

  final Event event;

  @override
  List<Object?> get props => [event];
}

class EventDeleted extends TaskScreenEvent {
  const EventDeleted(this.event);

  final Event event;

  @override
  List<Object?> get props => [event];
}

class SaveButtonTapped extends TaskScreenEvent {
  const SaveButtonTapped();

  @override
  List<Object?> get props => [];
}
