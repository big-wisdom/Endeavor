part of 'calendar_screen_cubit.dart';

class CalendarScreenState extends Equatable {
  const CalendarScreenState({required this.selectedDate});

  final DateTime selectedDate;

  @override
  List<Object> get props => [selectedDate];
}

class CalendarScreenInitial extends CalendarScreenState {
  const CalendarScreenInitial({required super.selectedDate});
}
