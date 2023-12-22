import 'package:data_models/data_models.dart';
import 'package:endeavor/endeavor_block_screen/view/this_and_following_dialogue.dart';
import 'package:flutter/material.dart';

import 'package:endeavor/widgets/one_time_event_picker_flutter_bloc/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker/repeating_event_picker.dart';
import 'package:endeavor/widgets/endeavor_picker_row_flutter_form.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../bloc/endeavor_block_screen_bloc.dart';

class EndeavorBlockScreenView extends StatelessWidget {
  const EndeavorBlockScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EndeavorBlockScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: _TitleText(bloc),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBlocListener<EndeavorBlockScreenBloc, String, String>(
            onSubmitting: (context, state) {
              debugPrint("Submitting EndeavorBlock");
            },
            onSuccess: (context, state) {
              Navigator.of(context).pop();
            },
            onDeleteSuccessful: (_, __) => Navigator.of(context).pop(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _EndeavorPickerRow(bloc),

                _RepeatingCheckbox(bloc),

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
    );
  }
}

class _TitleText extends StatelessWidget {
  final EndeavorBlockScreenBloc bloc;
  const _TitleText(this.bloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputFieldBloc<EndeavorReference?, dynamic>,
        InputFieldBlocState<EndeavorReference?, dynamic>>(
      bloc: bloc.endeavorReference,
      buildWhen: (previous, current) {
        return previous.value != current.value;
      },
      builder: (context, state) {
        return Text(
          state.value?.title ?? "Create Endeavor Block",
        );
      },
    );
  }
}

class _EndeavorPickerRow extends StatelessWidget {
  final EndeavorBlockScreenBloc bloc;
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
        nullable: false,
      ),
    );
  }
}

class _RepeatingCheckbox extends StatelessWidget {
  final EndeavorBlockScreenBloc bloc;
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
  final EndeavorBlockScreenBloc bloc;
  const _OneTimeEventPicker(this.bloc);
  @override
  Widget build(BuildContext context) {
    return CanShowFieldBlocBuilder(
      fieldBloc: bloc.event,
      builder: (context, show) => show
          ? OneTimeEventPicker(
              initialValue: context.read<EndeavorBlockScreenBloc>().event.value,
              onEvent: (newEvent) {
                bloc.event.updateValue(newEvent);
              },
            )
          : Container(),
    );
  }
}

class _RepeatingEventPicker extends StatelessWidget {
  final EndeavorBlockScreenBloc bloc;
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
                    .read<EndeavorBlockScreenBloc>()
                    .repeatingEvent
                    .value,
                onChanged: (repeatingEvent) => context
                    .read<EndeavorBlockScreenBloc>()
                    .repeatingEvent
                    .updateValue(repeatingEvent),
              )
            : Container();
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  final EndeavorBlockScreenBloc bloc;
  const _SaveButton(this.bloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, FormBlocState<String, String>>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (!state.isValid()) {
              return null;
            }
            if (bloc.editing && bloc.repeatingEndeavorBlockId != null) {
              return () => showDialog(
                    context: context,
                    builder: (ctx) => ThisAndFollowingDialogue(
                      onThisOnly: bloc.submit,
                      onThisAndFollowing: bloc.onThisAndFollowing,
                      action: "edit",
                      type: "Endeavor Block",
                    ),
                  );
            } else {
              return bloc.submit;
            }
          }(),
          child: const Text("Save"),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  final EndeavorBlockScreenBloc bloc;
  const _DeleteButton(this.bloc);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red),
      ),
      onPressed: bloc.delete,
      child: const Text("Delete"),
    );
  }
}
