part of 'one_time_event_picker_cubit.dart';

class OneTimeEventPickerState extends EventForm {
  const OneTimeEventPickerState({
    required super.dateInput,
    required super.startTimeInput,
    required super.endTimeInput,
  });

  OneTimeEventPickerState copyWith({
    EventDateInput? dateInput,
    EventStartTimeInput? startTimeInput,
    EventEndTimeInput? endTimeInput,
  }) {
    // if either time is updated, we need to update it in the other form object as well
    TimeOfDay? newStartTime = startTimeInput?.value;
    TimeOfDay? newEndTime = endTimeInput?.value;
    if (newStartTime != null) {
      endTimeInput = endTimeInput?.copyWith(newStartTime) ??
          this.endTimeInput.copyWith(newStartTime);
    }
    if (newEndTime != null) {
      startTimeInput = startTimeInput?.copyWith(newEndTime) ??
          this.startTimeInput.copyWith(newEndTime);
    }

    return OneTimeEventPickerState(
      dateInput: dateInput ?? this.dateInput,
      startTimeInput: startTimeInput ?? this.startTimeInput,
      endTimeInput: endTimeInput ?? this.endTimeInput,
    );
  }

  @override
  List<Object> get props => [
        dateInput,
        startTimeInput,
        endTimeInput,
      ];
}

class OneTimeEventPickerInitial extends OneTimeEventPickerState {
  const OneTimeEventPickerInitial._({
    required super.dateInput,
    required super.startTimeInput,
    required super.endTimeInput,
  });

  factory OneTimeEventPickerInitial(
    Event? initialEvent,
  ) {
    initialEvent = initialEvent ?? Event.generic(const Duration(hours: 1));
    return OneTimeEventPickerInitial._(
      dateInput: EventDateInput.pure(initialEvent.start),
      startTimeInput: EventStartTimeInput.pure(
        initialEvent.end.toTimeOfDay(),
        initialEvent.start.toTimeOfDay(),
      ),
      endTimeInput: EventEndTimeInput.pure(
        initialEvent.start.toTimeOfDay(),
        initialEvent.end.toTimeOfDay(),
      ),
    );
  }
}
