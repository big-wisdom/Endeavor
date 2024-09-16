import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CalendarEventScreenBloc extends FormBloc<String, String> {
  // Field blocs
  final TextFieldBloc title;
  final InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  final BooleanFieldBloc repeating;
  final InputFieldBloc<Event?, String> event;
  final InputFieldBloc<RepeatingEvent?, String> repeatingEvent;

  // handlers
  final void Function(UnidentifiedRepeatingCalendarEvent)?
      onSaveRepeatingCalendarEvent;
  final void Function(UnidentifiedCalendarEvent)? onSaveCalendarEvent;

  final void Function(UnidentifiedCalendarEvent)? _onEditThisAndFollowing;
  final void Function()? _onDeleteThisAndFollowing;

  final void Function()? onDelete;

  // variables
  final bool editing;
  final bool repeatingOnly;

  CalendarEventScreenBloc.createRepeatingOnly({
    required void Function(UnidentifiedRepeatingCalendarEvent) onSave,
  })  : repeatingOnly = true,
        title = TextFieldBloc(initialValue: ''),
        endeavorReference = InputFieldBloc(initialValue: null),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: true),
        event =
            InputFieldBloc<Event, String>(initialValue: Event.generic(null)),
        repeatingEvent = InputFieldBloc<RepeatingEvent?, String>(
          initialValue: RepeatingEvent(
            startDate: DateTime.now(),
            endDate: DateTime.now().add(const Duration(days: 7)),
            startTime: TimeOfDay.now(),
            endTime: TimeOfDay.now().add(const Duration(hours: 1)),
          ),
        ),
        editing = false,
        onSaveRepeatingCalendarEvent = onSave,
        onSaveCalendarEvent = null,
        _onEditThisAndFollowing = null,
        onDelete = null,
        _onDeleteThisAndFollowing = null {
    addFieldBlocs(fieldBlocs: [
      title,
      endeavorReference,
      repeatingEvent,
    ]);
    title.addValidators([_titleValidator()]);
    repeatingEvent.addValidators([repeatingEventValidator()]);
  }

  CalendarEventScreenBloc.editRepeatingOnly({
    required RepeatingCalendarEvent rce,
    required void Function(UnidentifiedRepeatingCalendarEvent) onSave,
    required void Function() onDeleteRepeatingEvent,
  })  : repeatingOnly = true,
        title = TextFieldBloc(initialValue: rce.title),
        endeavorReference = InputFieldBloc(initialValue: rce.endeavorReference),
        repeating = BooleanFieldBloc(initialValue: true),
        event = InputFieldBloc(initialValue: null),
        repeatingEvent = InputFieldBloc(initialValue: rce.repeatingEvent),
        editing = true,
        onSaveRepeatingCalendarEvent = onSave,
        onSaveCalendarEvent = null,
        _onEditThisAndFollowing = null,
        onDelete = onDeleteRepeatingEvent,
        _onDeleteThisAndFollowing = null {
    addFieldBlocs(fieldBlocs: [
      title,
      endeavorReference,
      repeatingEvent,
    ]);
    title.addValidators([_titleValidator()]);
    repeatingEvent.addValidators([repeatingEventValidator()]);
  }

  CalendarEventScreenBloc.create({
    required void Function(UnidentifiedCalendarEvent) onSaveEvent,
    required void Function(UnidentifiedRepeatingCalendarEvent)
        onSaveRepeatingEvent,
  })  : title = TextFieldBloc(initialValue: ''),
        endeavorReference =
            InputFieldBloc<EndeavorReference?, dynamic>(initialValue: null),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: false),
        event =
            InputFieldBloc<Event, String>(initialValue: Event.generic(null)),
        repeatingEvent =
            InputFieldBloc<RepeatingEvent?, String>(initialValue: null),
        editing = false,
        repeatingOnly = false,
        onSaveCalendarEvent = onSaveEvent,
        onSaveRepeatingCalendarEvent = onSaveRepeatingEvent,
        onDelete = null,
        _onDeleteThisAndFollowing = null,
        _onEditThisAndFollowing = null {
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

  CalendarEventScreenBloc.edit({
    required CalendarEvent initialEvent,
    required void Function(UnidentifiedCalendarEvent) onSave,
    required void Function() onDeleteCalendarEvent,
    required void Function() onDeleteThisAndFollowingEvents,
    required void Function(UnidentifiedCalendarEvent)
        onEditThisAndFollwingEvents,
  })  : title = TextFieldBloc(initialValue: initialEvent.title),
        endeavorReference =
            InputFieldBloc(initialValue: initialEvent.endeavorReference),
        repeating = BooleanFieldBloc(initialValue: false),
        event = InputFieldBloc(initialValue: initialEvent.event),
        repeatingEvent = InputFieldBloc(initialValue: null),
        editing = true,
        repeatingOnly = false,
        onSaveCalendarEvent = onSave,
        onSaveRepeatingCalendarEvent = null,
        onDelete = onDeleteCalendarEvent,
        _onDeleteThisAndFollowing = onDeleteThisAndFollowingEvents,
        _onEditThisAndFollowing = onEditThisAndFollwingEvents {
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
    if (onDelete != null) onDelete!();
    emitDeleteSuccessful();
  }

  void onDeleteThisAndFollowing() {
    if (_onDeleteThisAndFollowing != null) _onDeleteThisAndFollowing();
  }

  void onEditThisAndFollowing() {
    if (_onEditThisAndFollowing != null) {
      _onEditThisAndFollowing(
        UnidentifiedCalendarEvent(
          title: title.value,
          event: event.value!,
          endeavorReference: endeavorReference.value,
        ),
      );
    }
  }

  @override
  FutureOr<void> onSubmitting() {
    if (state.contains(repeatingEvent)) {
      onSaveRepeatingCalendarEvent!(UnidentifiedRepeatingCalendarEvent(
          title: title.value, repeatingEvent: repeatingEvent.value!));
    } else {
      onSaveCalendarEvent!(
          UnidentifiedCalendarEvent(title: title.value, event: event.value!));
    }
    emitSuccess();
  }
}
