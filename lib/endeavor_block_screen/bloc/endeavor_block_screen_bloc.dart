import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class EndeavorBlockScreenBloc extends FormBloc<String, String> {
  InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  BooleanFieldBloc repeating;
  InputFieldBloc<Event?, String> event;
  InputFieldBloc<RepeatingEvent?, String> repeatingEvent;
  final bool editing;
  final String? endeavorBlockId;

  EndeavorBlockScreenBloc.create()
      : endeavorReference =
            InputFieldBloc<EndeavorReference?, dynamic>(initialValue: null),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: false),
        event =
            InputFieldBloc<Event, String>(initialValue: Event.generic(null)),
        repeatingEvent =
            InputFieldBloc<RepeatingEvent?, String>(initialValue: null),
        editing = false,
        endeavorBlockId = null {
    repeating.onValueChanges(onData: ((previous, current) async* {
      if (current.value) {
        addFieldBlocs(fieldBlocs: [repeatingEvent]);
        removeFieldBlocs(fieldBlocs: [event]);
      } else {
        addFieldBlocs(fieldBlocs: [event]);
        removeFieldBlocs(fieldBlocs: [repeatingEvent]);
      }
    }));
    endeavorReference.addValidators([_endeavorReferenceValidator()]);
    event.addValidators([_eventValidator()]);
    repeatingEvent.addValidators([_repeatingEventValidator()]);
    addFieldBlocs(fieldBlocs: [
      endeavorReference,
      repeating,
      event,
    ]);
  }

  EndeavorBlockScreenBloc.edit(EndeavorBlock endeavorBlock)
      : endeavorReference =
            InputFieldBloc(initialValue: endeavorBlock.endeavorReference),
        event = InputFieldBloc(initialValue: endeavorBlock.event),
        repeating = BooleanFieldBloc(initialValue: false),
        repeatingEvent = InputFieldBloc(initialValue: null),
        editing = true,
        endeavorBlockId = endeavorBlock.id {
    endeavorReference.addValidators([_endeavorReferenceValidator()]);
    event.addValidators([_eventValidator()]);
    repeatingEvent.addValidators([_repeatingEventValidator()]);
    addFieldBlocs(fieldBlocs: [
      endeavorReference,
      event,
    ]);
  }

  Validator<EndeavorReference?> _endeavorReferenceValidator() {
    return (EndeavorReference? er) {
      if (er == null) {
        return "Endeavor must be selected";
      }
      return null;
    };
  }

  Validator<Event?> _eventValidator() {
    return (Event? event) {
      if (event == null) {
        return "There must be an event";
      } else if (event.start.compareTo(event.end) >= 0) {
        return "Event must start before it ends";
      }
      return null;
    };
  }

  Validator<RepeatingEvent?> _repeatingEventValidator() {
    return (RepeatingEvent? repeatingEvent) {
      if (repeatingEvent == null) {
        return "Repeating Event must not be null";
      } else if (repeatingEvent.startTime.compareTo(repeatingEvent.endTime) >=
          0) {
        return "Event must start before it can end";
      } else if (repeatingEvent.startDate
              .compareToDateOnly(repeatingEvent.endDate) >=
          0) {
        return "Date range must start before it ends";
      } else if (repeatingEvent.daysOfWeek
          .every((daySelected) => !daySelected)) {
        return "Must select days of the week";
      }
      return null;
    };
  }

  @override
  void onDeleting() {
    ServerEndeavorBlockDataServiceExtension.deleteEndeavorBlock(
      endeavorBlockId!,
    );
    emitDeleteSuccessful();
  }

  @override
  Future<void> close() {
    repeatingEvent.close();
    event.close();
    return super.close();
  }

  @override
  FutureOr<void> onSubmitting() {
    if (state.isValid()) {
      if (state.contains(repeatingEvent)) {
        AbstractRepeatingEndeavorBlockDataServiceExtension
            .createRepeatingEndeavorBlock(
          UnidentifiedRepeatingEndeavorBlock(
            endeavorReference: endeavorReference.value!,
            repeatingEvent: repeatingEvent.value!,
          ),
        );
      } else {
        if (editing) {
          ServerEndeavorBlockDataServiceExtension.updateEndeavorBlock(
            EndeavorBlock(
              id: endeavorBlockId!,
              event: event.value!,
              endeavorReference: endeavorReference.value!,
            ),
          );
        } else {
          ServerEndeavorBlockDataServiceExtension.createEndeavorBlock(
            UnidentifiedEndeavorBlock(
              repeatingEndeavorBlockId: null,
              endeavorReference: endeavorReference.value!,
              event: event.value!,
            ),
          );
        }
      }
      emitSuccess();
    }
  }
}
