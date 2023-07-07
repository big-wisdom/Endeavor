part of 'calendar_event_screen_bloc.dart';

abstract class CalendarEventScreenState {
  CalendarEventScreenState({
    required this.endeavorInput,
    required this.title,
  });

  final EndeavorPickerRowInput endeavorInput;
  final CalendarEventTitleInput title;
}

class SingleCalendarEventScreenState extends CalendarEventForm
    implements CalendarEventScreenState {
  const SingleCalendarEventScreenState({
    required this.isEdit,
    required super.event,
    required super.title,
    required super.endeavorInput,
    super.repeatingCalendarEventId,
  });

  final bool isEdit;

  SingleCalendarEventScreenState copyWith({
    CalendarEventTitleInput? title,
    EventInput? event,
    EndeavorPickerRowInput? endeavorInput,
  }) {
    return SingleCalendarEventScreenState(
      isEdit: isEdit,
      event: event ?? this.event,
      title: title ?? this.title,
      endeavorInput: endeavorInput ?? this.endeavorInput,
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

class RepeatingCalendarEventScreenState extends RepeatingCalendarEventForm {
  const RepeatingCalendarEventScreenState({
    required super.titleInput,
    required super.repeatingEventInput,
    required super.endeavorReference,
  });

  @override
  List<Object?> get props => [
        titleInput,
        repeatingEventInput,
        endeavorReference,
      ];
}
