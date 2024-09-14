import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter/material.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CalendarEventScreenBloc extends FormBloc<String, String> {
  // Field blocs
  final TextFieldBloc title;
  final InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  final BooleanFieldBloc repeating;
  final InputFieldBloc<Event?, String> event;
  final InputFieldBloc<RepeatingEvent?, String> repeatingEvent;

  // variables
  final bool editing;
  final bool repeatingOnly;
  // have to save these IDs here because the data models for events don't have ID's
  final int? calendarEventId;
  final int? initialRepeatingCalendarEventId;

  CalendarEventScreenBloc.repeatingOnly(RepeatingCalendarEvent? rce)
      : repeatingOnly = true,
        title = TextFieldBloc(initialValue: rce?.title ?? ''),
        endeavorReference =
            InputFieldBloc(initialValue: rce?.endeavorReference),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: true),
        event =
            InputFieldBloc<Event, String>(initialValue: Event.generic(null)),
        repeatingEvent = InputFieldBloc<RepeatingEvent?, String>(
          initialValue: rce?.repeatingEvent ??
              RepeatingEvent(
                startDate: DateTime.now(),
                endDate: DateTime.now().add(const Duration(days: 7)),
                startTime: TimeOfDay.now(),
                endTime: TimeOfDay.now().add(const Duration(hours: 1)),
              ),
        ),
        editing = rce != null,
        calendarEventId = null,
        initialRepeatingCalendarEventId = rce?.id {
    addFieldBlocs(fieldBlocs: [
      title,
      endeavorReference,
      repeatingEvent,
    ]);
    title.addValidators([_titleValidator()]);
    repeatingEvent.addValidators([repeatingEventValidator()]);
  }

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
            initialEvent?.repeatingCalendarEventId,
        repeatingOnly = false {
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
    ShimDataService.calendarEvents.deleteCalendarEvent(
      calendarEventId!,
    );
    emitDeleteSuccessful();
  }

  void onDeleteThisAndFollowing() {
    ShimDataService.calendarEvents.repeating
        .deleteThisAndFollowingCalendarEvents(
      selectedCalendarEventId: calendarEventId!,
    );
  }

  void onEditThisAndFollowing() {
    ShimDataService.calendarEvents.repeating.editThisAndFollowingCalendarEvent(
      calendarEvent: CalendarEvent(
        id: calendarEventId!,
        title: title.value,
        event: event.value!,
        repeatingCalendarEventId: initialRepeatingCalendarEventId!,
        endeavorReference: endeavorReference.value,
      ),
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    if (editing) {
      ShimDataService.calendarEvents.updateCalendarEvent(CalendarEvent(
        id: calendarEventId!,
        title: title.value,
        event: event.value!,
        endeavorReference: endeavorReference.value,
        repeatingCalendarEventId: null,
      ));
    } else {
      if (state.contains(repeatingEvent)) {
        ShimDataService.calendarEvents.repeating
            .createRepeatingCalendarEvent(UnidentifiedRepeatingCalendarEvent(
          title: title.value,
          repeatingEvent: repeatingEvent.value!,
          endeavorReference: endeavorReference.value,
        ));
      } else {
        ShimDataService.calendarEvents.createCalendarEvent(
          UnidentifiedCalendarEvent(
            title: title.value,
            event: event.value!,
            endeavorReference: endeavorReference.value,
            repeatingCalendarEventId: null,
          ),
        );
      }
    }
    emitSuccess();
  }
}
