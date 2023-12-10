import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CalendarEventScreenBloc extends FormBloc<String, String> {
  final TextFieldBloc title;
  final InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  final BooleanFieldBloc repeating;
  final InputFieldBloc<Event?, String> event;
  final InputFieldBloc<RepeatingEvent?, String> repeatingEvent;
  final bool editing;

  CalendarEventScreenBloc({CalendarEvent? initialEvent})
      : title = TextFieldBloc(initialValue: initialEvent?.title ?? ''),
        endeavorReference = InputFieldBloc<EndeavorReference?, dynamic>(
            initialValue: initialEvent?.endeavorReference),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: false),
        event = InputFieldBloc<Event, String>(
            initialValue: initialEvent?.event ?? Event.generic(null)),
        repeatingEvent =
            InputFieldBloc<RepeatingEvent?, String>(initialValue: null),
        editing = initialEvent != null {
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
  }

  @override
  FutureOr<void> onSubmitting() {
    throw UnimplementedError();
  }
}
