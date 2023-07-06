part of 'repeating_event_picker_cubit.dart';

class RepeatingEventPickerState extends RepeatingEventForm {
  RepeatingEventPickerState({
    required super.daysOfWeekInput,
    required super.endDateInput,
    required super.startDateInput,
    required super.startTimeInput,
    required super.endTimeInput,
  });

  @override
  List<Object> get props => [
        daysOfWeekInput,
        endDateInput,
        startDateInput,
        startTimeInput,
        endTimeInput,
      ];
}

class RepeatingEventPickerInitial extends RepeatingEventPickerState {
  RepeatingEventPickerInitial._({
    required super.daysOfWeekInput,
    required super.endDateInput,
    required super.startDateInput,
    required super.startTimeInput,
    required super.endTimeInput,
  });

  factory RepeatingEventPickerInitial(RepeatingEvent? initialEvent) {
    if (initialEvent == null) {
      return RepeatingEventPickerInitial._(
        daysOfWeekInput: RepeatingEventDaysOfWeekInput.pure(
          [false, false, false, false, false, false, false],
        ),
        endDateInput: RepeatingEventEndDateInput.pure(
          DateTime.now(),
          DateTime.now().add(const Duration(days: 7)),
        ),
        startDateInput: RepeatingEventStartDateInput.pure(
          DateTime.now(),
          DateTime.now().add(const Duration(days: 7)),
        ),
        startTimeInput: RepeatingEventStartTimeInput.pure(
          TimeOfDay.now(),
          TimeOfDay.now().add(const Duration(hours: 1)),
        ),
        endTimeInput: RepeatingEventEndTimeInput.pure(
          TimeOfDay.now(),
          TimeOfDay.now().add(const Duration(hours: 1)),
        ),
      );
    }

    return RepeatingEventPickerInitial._(
      daysOfWeekInput:
          RepeatingEventDaysOfWeekInput.pure(initialEvent.daysOfWeek),
      endDateInput: RepeatingEventEndDateInput.pure(
        initialEvent.startDate,
        initialEvent.endDate,
      ),
      startDateInput: RepeatingEventStartDateInput.pure(
        initialEvent.startDate,
        initialEvent.endDate,
      ),
      startTimeInput: RepeatingEventStartTimeInput.pure(
        initialEvent.startTime,
        initialEvent.endTime,
      ),
      endTimeInput: RepeatingEventEndTimeInput.pure(
        initialEvent.startTime,
        initialEvent.endTime,
      ),
    );
  }
}
