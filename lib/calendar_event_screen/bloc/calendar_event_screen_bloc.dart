import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CalendarEventScreenBloc extends FormBloc<String, String> {
  final TextFieldBloc title;
  final InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  final BooleanFieldBloc repeating;
  final InputFieldBloc<Event?, String> event;
  final InputFieldBloc<RepeatingEvent?, String> repeatingEvent;
  final bool editing;
  final String? calendarEventId;
  final String? initialRepeatingCalendarEventId;

  CalendarEventScreenBloc({CalendarEvent? initialEvent})
      : title = TextFieldBloc(initialValue: initialEvent?.title ?? ''),
        endeavorReference = InputFieldBloc<EndeavorReference?, dynamic>(
            initialValue: initialEvent?.endeavorReference),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: false),
        event = InputFieldBloc<Event, String>(
            initialValue: initialEvent?.event ?? Event.generic(null)),
        repeatingEvent =
            InputFieldBloc<RepeatingEvent?, String>(initialValue: null),
        editing = initialEvent != null,
        calendarEventId = initialEvent?.id,
        initialRepeatingCalendarEventId =
            initialEvent?.repeatingCalendarEventId {
    repeating.onValueChanges(onData: ((previous, current) async* {
      if (current.value) {
        addFieldBlocs(fieldBlocs: [repeatingEvent]);
        removeFieldBlocs(fieldBlocs: [event]);
      } else {
        addFieldBlocs(fieldBlocs: [event]);
        removeFieldBlocs(fieldBlocs: [repeatingEvent]);
      }
    }));
    addFieldBlocs(fieldBlocs: [
      title,
      endeavorReference,
      if (!editing) repeating,
      event,
    ]);
    title.addValidators([_titleValidator()]);
    repeatingEvent.addValidators([repeatingEventValidator()]);
    event.addValidators([eventValidator()]);
  }

  Validator<String> _titleValidator() {
    return (String? title) {
      if (title == null || title.isEmpty) {
        return "You gotta name it!";
      }
      return null;
    };
  }

  @override
  FutureOr<void> onDeleting() {
    ServerCalendarEventDataServiceExtension.deleteCalendarEvent(
      calendarEventId!,
      initialRepeatingCalendarEventId,
    );
    emitDeleteSuccessful();
  }

  @override
  FutureOr<void> onSubmitting() {
    if (state.contains(repeatingEvent)) {
      RepeatingCalendarEventDataServiceExtension.createRepeatingCalendarEvent(
          UnidentifiedRepeatingCalendarEvent(
        title: title.value,
        repeatingEvent: repeatingEvent.value!,
        endeavorReference: endeavorReference.value,
      ));
    } else {
      ServerCalendarEventDataServiceExtension.createCalendarEvent(
        UnidentifiedCalendarEvent(
          title: title.value,
          event: event.value!,
          endeavorReference: endeavorReference.value,
          repeatingCalendarEventId: null,
        ),
      );
    }
    emitSuccess();
  }
}
