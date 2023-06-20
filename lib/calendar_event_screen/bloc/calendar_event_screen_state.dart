part of 'calendar_event_screen_bloc.dart';

class CalendarEventScreenState extends Equatable {
  const CalendarEventScreenState({
    required this.isEdit,
    required this.title,
  });

  final bool isEdit;
  final CalendarEventTitle title;

  @override
  List<Object> get props => [
        isEdit,
        title,
      ];
}

class CalendarEventScreenInitial extends CalendarEventScreenState {
  const CalendarEventScreenInitial({
    required super.isEdit,
    required super.title,
  });
}
