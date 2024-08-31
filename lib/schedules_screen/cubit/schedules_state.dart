part of 'schedules_cubit.dart';

abstract class SchedulesState extends Equatable {
  const SchedulesState();
}

class LoadedSchedulesState extends SchedulesState {
  const LoadedSchedulesState(this.schedules);

  final List<Schedule> schedules;

  @override
  List<Object?> get props => [schedules];
}

class LoadingSchedulesState extends SchedulesState {
  @override
  List<Object?> get props => [];
}

class ErrorSchedulesState extends SchedulesState {
  const ErrorSchedulesState(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
