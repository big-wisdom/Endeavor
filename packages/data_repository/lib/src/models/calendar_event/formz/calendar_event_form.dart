import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class CalendarEventForm extends Equatable with FormzMixin {
  const CalendarEventForm({
    this.event,
    required this.title,
    required this.endeavorInput,
    this.repeatingCalendarEventId,
  }) : type = repeatingCalendarEventId == null
            ? CalendarEventType.single
            : CalendarEventType.repeating;

  final CalendarEventTitleInput title;
  final Event? event;
  final EndeavorPickerRowInput endeavorInput;
  final String? repeatingCalendarEventId;
  final CalendarEventType type;

  @override
  List<FormzInput> get inputs => [title, event, endeavorInput];

  CalendarEvent? get createCalendarEvent {
    if (status.isValid) {
      return CalendarEvent(
        event: event.value,
        title: title.value,
        endeavorId: endeavorInput.value,
        type: type,
      );
    }
    return null;
  }
}
