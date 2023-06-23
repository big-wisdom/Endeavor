part of 'calendar_event_screen_bloc.dart';

enum CalendarEventScreenLoadingState {
  loading,
  loaded,
}

class CalendarEventScreenState extends CalendarEventForm {
  const CalendarEventScreenState({
    required this.isEdit,
    required super.event,
    required super.title,
    required super.endeavorInput,
    super.repeatingCalendarEventId,
    required this.loadingState,
  });

  final bool isEdit;
  final CalendarEventScreenLoadingState loadingState;

  CalendarEventScreenState copyWith({
    CalendarEventTitleInput? title,
    EventInput? event,
    EndeavorPickerRowInput? endeavorInput,
    CalendarEventScreenLoadingState? loadingState,
  }) {
    return CalendarEventScreenState(
      isEdit: isEdit,
      event: event ?? this.event,
      title: title ?? this.title,
      endeavorInput: endeavorInput ?? this.endeavorInput,
      loadingState: loadingState ?? this.loadingState,
      repeatingCalendarEventId: repeatingCalendarEventId,
    );
  }

  @override
  List<Object?> get props => [
        isEdit,
        event,
        title,
        endeavorInput,
        repeatingCalendarEventId,
      ];
}

class CalendarEventScreenInitial extends CalendarEventScreenState {
  CalendarEventScreenInitial.create()
      : super(
          isEdit: false,
          title: const CalendarEventTitleInput.pure(null),
          event: EventInput.pure(null),
          endeavorInput: EndeavorPickerRowInput.pure(null, null),
          loadingState: CalendarEventScreenLoadingState.loaded,
        );

  CalendarEventScreenInitial.edit(CalendarEvent calendarEvent)
      : super(
          isEdit: true,
          title: CalendarEventTitleInput.pure(calendarEvent.title),
          endeavorInput:
              EndeavorPickerRowInput.pure(null, calendarEvent.endeavorId),
          event: EventInput.pure(calendarEvent.event),
          repeatingCalendarEventId: calendarEvent.repeatingCalendarEventId,
          loadingState: CalendarEventScreenLoadingState.loading,
        );
}
