part of 'time_picker_row_cubit.dart';

abstract class TimePickerRowState extends Equatable {
  const TimePickerRowState(this.time);

  final TimeOfDay? time;

  String? get errorText;

  TimePickerRowState copyWithNewTime(TimeOfDay newTime);

  @override
  List<Object?> get props => [time];
}

class EventStartTimePickerRowState extends TimePickerRowState {
  EventStartTimePickerRowState(EventStartTimeInput eventStartTimeInput)
      : _eventStartTimeInput = eventStartTimeInput,
        super(eventStartTimeInput.value);

  final EventStartTimeInput _eventStartTimeInput;

  @override
  String? get errorText => _eventStartTimeInput.error?.errorText();

  @override
  TimePickerRowState copyWithNewTime(TimeOfDay newTime) {
    return EventStartTimePickerRowState(
      EventStartTimeInput.dirty(
        _eventStartTimeInput.endTime,
        newTime,
      ),
    );
  }
}

class EventEndTimePickerRowState extends TimePickerRowState {
  EventEndTimePickerRowState(EventEndTimeInput eventEndTimeInput)
      : _eventEndTimeInput = eventEndTimeInput,
        super(eventEndTimeInput.value);

  final EventEndTimeInput _eventEndTimeInput;

  @override
  String? get errorText => _eventEndTimeInput.error?.errorText();

  @override
  TimePickerRowState copyWithNewTime(TimeOfDay newTime) {
    return EventEndTimePickerRowState(
      EventEndTimeInput.dirty(
        _eventEndTimeInput.startTime,
        newTime,
      ),
    );
  }
}

class RepeatingEventEndTimePickerRowState extends TimePickerRowState {
  RepeatingEventEndTimePickerRowState(
      RepeatingEventEndTimeInput repeatingEventEndTimeInput)
      : _eventEndTimeInput = repeatingEventEndTimeInput,
        super(repeatingEventEndTimeInput.value);

  final RepeatingEventEndTimeInput _eventEndTimeInput;

  @override
  String? get errorText => _eventEndTimeInput.error?.errorText();

  @override
  TimePickerRowState copyWithNewTime(TimeOfDay newTime) {
    return RepeatingEventEndTimePickerRowState(
      RepeatingEventEndTimeInput.dirty(
        _eventEndTimeInput.startTime,
        newTime,
      ),
    );
  }
}

class RepeatingEventStartTimePickerRowState extends TimePickerRowState {
  RepeatingEventStartTimePickerRowState(
      RepeatingEventStartTimeInput eventStartTimeInput)
      : _eventStartTimeInput = eventStartTimeInput,
        super(eventStartTimeInput.value);

  final RepeatingEventStartTimeInput _eventStartTimeInput;

  @override
  String? get errorText => _eventStartTimeInput.error?.errorText();

  @override
  TimePickerRowState copyWithNewTime(TimeOfDay newTime) {
    return RepeatingEventStartTimePickerRowState(
      RepeatingEventStartTimeInput.dirty(
        newTime,
        _eventStartTimeInput.endTime,
      ),
    );
  }
}
