import 'package:data_models/data_models.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/endeavor_block_screen/view/this_and_following_dialogue.dart';
import 'package:endeavor/widgets/endeavor_picker_row_flutter_form.dart';
import 'package:endeavor/widgets/one_time_event_picker_flutter_bloc/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker/widget/repeating_event_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CalendarEventScreenView extends StatelessWidget {
  const CalendarEventScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalendarEventScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Event"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: FormBlocListener<CalendarEventScreenBloc, String, String>(
              onSuccess: (context, state) => Navigator.of(context).pop(),
              onDeleteSuccessful: (context, state) =>
                  Navigator.of(context).pop(),
              child: Column(
                children: [
                  _TitleField(bloc),
                  _EndeavorPickerRow(bloc),
                  if (!bloc.repeatingOnly) _RepeatingCheckbox(bloc),
                  _OneTimeEventPicker(bloc),

                  _RepeatingEventPicker(bloc),

                  _SaveButton(bloc),

                  // delete button
                  if (bloc.editing) _DeleteButton(bloc),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _TitleField(this.bloc);
  @override
  Widget build(BuildContext context) {
    return TextFieldBlocBuilder(
      textFieldBloc: bloc.title,
      decoration: const InputDecoration(labelText: "Title"),
    );
  }
}

class _EndeavorPickerRow extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _EndeavorPickerRow(this.bloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputFieldBloc<EndeavorReference?, dynamic>,
        InputFieldBlocState<EndeavorReference?, dynamic>>(
      bloc: bloc.endeavorReference,
      buildWhen: (previous, current) => previous.value != current.value,
      builder: (context, state) => EndeavorPickerRow(
        initialValue: state.value,
        onChanged: (endeavorReference) =>
            bloc.endeavorReference.updateValue(endeavorReference),
        nullable: true,
      ),
    );
  }
}

class _RepeatingCheckbox extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _RepeatingCheckbox(this.bloc);
  @override
  Widget build(BuildContext context) {
    return CheckboxFieldBlocBuilder(
      booleanFieldBloc: bloc.repeating,
      body: Container(
        alignment: Alignment.centerLeft,
        child: const Text('Repeating'),
      ),
    );
  }
}

class _OneTimeEventPicker extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _OneTimeEventPicker(this.bloc);
  @override
  Widget build(BuildContext context) {
    return CanShowFieldBlocBuilder(
      fieldBloc: bloc.event,
      builder: (context, show) => show
          ? OneTimeEventPicker(
              initialValue: context.read<CalendarEventScreenBloc>().event.value,
              onEvent: (newEvent) {
                bloc.event.updateValue(newEvent);
              },
            )
          : Container(),
    );
  }
}

class _RepeatingEventPicker extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _RepeatingEventPicker(this.bloc);
  @override
  Widget build(
    BuildContext context,
  ) {
    return CanShowFieldBlocBuilder(
      fieldBloc: bloc.repeatingEvent,
      builder: (context, canShow) {
        return canShow
            ? RepeatingEventPicker(
                initialRepeatingEvent: context
                    .read<CalendarEventScreenBloc>()
                    .repeatingEvent
                    .value,
                onChanged: (repeatingEvent) => context
                    .read<CalendarEventScreenBloc>()
                    .repeatingEvent
                    .updateValue(repeatingEvent),
              )
            : Container();
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _SaveButton(this.bloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarEventScreenBloc, FormBlocState<String, String>>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (!state.isValid()) {
              return null;
            } else if (bloc.initialRepeatingCalendarEventId != null) {
              return () => showDialog(
                    context: context,
                    builder: (ctx) => ThisAndFollowingDialogue(
                      onThisOnly: bloc.submit,
                      onThisAndFollowing: bloc.onEditThisAndFollowing,
                      action: "edit",
                      type: "Calendar Event",
                    ),
                  );
            }
            return bloc.submit;
          }(),
          child: const Text("Save"),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final CalendarEventScreenBloc bloc;
  const _DeleteButton(this.bloc);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red),
      ),
      onPressed: () {
        if (bloc.initialRepeatingCalendarEventId != null) {
          return () => showDialog(
                context: context,
                builder: (ctx) => ThisAndFollowingDialogue(
                  onThisOnly: bloc.delete,
                  onThisAndFollowing: bloc.onDeleteThisAndFollowing,
                  action: "delete",
                  type: "Calendar Event",
                ),
              );
        }
        return bloc.delete;
      }(),
      child: const Text("Delete"),
    );
  }
}
