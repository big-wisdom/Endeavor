import 'dart:async';

import 'package:data_models/data_models.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class EndeavorBlockScreenBloc extends FormBloc<String, String> {
  InputFieldBloc<EndeavorReference?, dynamic> endeavorReference;
  BooleanFieldBloc repeating;
  InputFieldBloc<Event?, String> event;
  InputFieldBloc<RepeatingEvent?, String> repeatingEvent;
  final bool editing;
  final int? endeavorBlockId;
  final int? repeatingEndeavorBlockId;

  EndeavorBlockScreenBloc.create()
      : endeavorReference =
            InputFieldBloc<EndeavorReference?, dynamic>(initialValue: null),
        repeating = BooleanFieldBloc(name: "Repeating", initialValue: false),
        event =
            InputFieldBloc<Event, String>(initialValue: Event.generic(null)),
        repeatingEvent =
            InputFieldBloc<RepeatingEvent?, String>(initialValue: null),
        editing = false,
        endeavorBlockId = null,
        repeatingEndeavorBlockId = null {
    repeating.onValueChanges(onData: ((previous, current) async* {
      if (current.value) {
        addFieldBlocs(fieldBlocs: [repeatingEvent]);
        removeFieldBlocs(fieldBlocs: [event]);
      } else {
        addFieldBlocs(fieldBlocs: [event]);
        removeFieldBlocs(fieldBlocs: [repeatingEvent]);
      }
    }));
    endeavorReference.addValidators([endeavorReferenceValidator()]);
    event.addValidators([eventValidator()]);
    repeatingEvent.addValidators([repeatingEventValidator()]);
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
        endeavorBlockId = endeavorBlock.id,
        repeatingEndeavorBlockId = endeavorBlock.repeatingEndeavorBlockId {
    endeavorReference.addValidators([endeavorReferenceValidator()]);
    event.addValidators([eventValidator()]);
    repeatingEvent.addValidators([repeatingEventValidator()]);
    addFieldBlocs(fieldBlocs: [
      endeavorReference,
      event,
    ]);
  }

  @override
  void onDeleting() {
    ShimDataService.endeavorBlocks.deleteEndeavorBlock(
      endeavorBlockId!,
    );
    emitDeleteSuccessful();
  }

  void onDeleteThisAndFollowing() {
    ShimDataService.endeavorBlocks.repeating.deleteThisAndFollowing(
      endeavorBlockId: endeavorBlockId!,
      repeatingEndeavorBlockId: repeatingEndeavorBlockId!,
    );
  }

  @override
  Future<void> close() {
    repeatingEvent.close();
    event.close();
    return super.close();
  }

  void onThisAndFollowing() {
    ShimDataService.endeavorBlocks.repeating.editThisAndFollowingEndeavorBlocks(
      endeavorBlockId: endeavorBlockId!,
      repeatingEndeavorBlockId: repeatingEndeavorBlockId!,
      unidentifiedEndeavorBlock: UnidentifiedEndeavorBlock(
        event: event.value!,
        endeavorReference: endeavorReference.value!,
        repeatingEndeavorBlockId: repeatingEndeavorBlockId,
      ),
    );
  }

  @override
  FutureOr<void> onSubmitting() {
    // if editing
    if (state.isValid()) {
      if (editing) {
        // if you've gotten here, then you don't want to update repeating
        ShimDataService.endeavorBlocks.updateEndeavorBlock(
          EndeavorBlock(
            id: endeavorBlockId!,
            event: event.value!,
            endeavorReference: endeavorReference.value!,
            repeatingEndeavorBlockId: repeatingEndeavorBlockId,
          ),
        );
      } else {
        if (state.contains(repeatingEvent)) {
          ShimDataService.endeavorBlocks.repeating.createRepeatingEndeavorBlock(
            UnidentifiedRepeatingEndeavorBlock(
              endeavorReference: endeavorReference.value!,
              repeatingEvent: repeatingEvent.value!,
            ),
          );
        } else {
          ShimDataService.endeavorBlocks.createEndeavorBlock(
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
