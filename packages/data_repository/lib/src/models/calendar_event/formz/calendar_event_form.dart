import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class CalendarEventForm extends Equatable with FormzMixin {
  const CalendarEventForm({
    required this.event,
    required this.title,
    required this.endeavorInput,
    this.repeatingCalendarEventId,
  });

  final CalendarEventTitleInput title;
  final EventInput event;
  final EndeavorPickerRowInput endeavorInput;
  final String? repeatingCalendarEventId;

  @override
  List<FormzInput> get inputs => [title, event, endeavorInput];

  UnidentifiedCalendarEvent? get createUnidentifiedCalendarEvent {
    if (status.isValid) {
      return UnidentifiedCalendarEvent(
        title: title.value,
        event: event.value,
        endeavorReference: endeavorInput.value,
        repeatingCalendarEventId: null,
      );
    }
    return null;
  }
}
