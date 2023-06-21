part of 'calendar_event_screen_bloc.dart';

class CalendarEventScreenState extends CalendarEventForm {
  const CalendarEventScreenState({
    required this.isEdit,
    required super.event,
    required super.title,
    required super.endeavorInput,
    super.repeatingCalendarEventId,
  });

  final bool isEdit;

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
          endeavorInput: EndeavorPickerRowInput.pure(),
          event: EventInput.pure(null),
        );

  CalendarEventScreenInitial.edit(
      CalendarEvent calendarEvent, EndeavorPickerRowInput endeavorInput)
      : super(
          isEdit: true,
          title: CalendarEventTitleInput.pure(calendarEvent.title),
          endeavorInput: endeavorInput,
          event: EventInput.pure(calendarEvent.event),
          repeatingCalendarEventId: calendarEvent.repeatingCalendarEventId,
        );
}
