import 'package:data_models/data_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:endeavor/widgets/one_time_event_picker/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker/repeating_event_picker.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';
import 'package:formz/formz.dart';

import '../bloc/endeavor_block_screen_bloc.dart';

class EndeavorBlockScreenView extends StatelessWidget {
  const EndeavorBlockScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<EndeavorBlockScreenBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: _TitleText(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _EndeavorPickerRow(),

              if (state is SingleEndeavorBlockScreenState && !state.isEdit)
                _TypePicker(),

              _OneTimeEventPicker(),

              _RepeatingEventPicker(),

              _SaveButton(),

              // delete button
              if (state is SingleEndeavorBlockScreenState && state.isEdit)
                _DeleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return Text(
          "${state is SingleEndeavorBlockScreenState && state.isEdit ? "Edit" : "Create"} Endeavor Block",
        );
      },
    );
  }
}

class _EndeavorPickerRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      builder: (context, state) {
        return EndeavorPickerRow(
          endeavorInput: state.endeavorReference,
          onChanged: (endeavor) => context
              .read<EndeavorBlockScreenBloc>()
              .add(EndeavorChanged(endeavor)),
        );
      },
    );
  }
}

class _TypePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Type:'),
            DropdownButton(
              value: state is SingleEndeavorBlockScreenState
                  ? EndeavorBlockType.single
                  : EndeavorBlockType.repeating,
              items: const [
                DropdownMenuItem(
                  value: EndeavorBlockType.single,
                  child: Text("One Time"),
                ),
                DropdownMenuItem(
                  value: EndeavorBlockType.repeating,
                  child: Text("Repeated"),
                )
              ],
              onChanged: (value) {
                if (value != null) {
                  context.read<EndeavorBlockScreenBloc>().add(
                        TypeChanged(value),
                      );
                }
              },
            )
          ],
        );
      },
    );
  }
}

class _OneTimeEventPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      buildWhen: (previous, current) {
        return previous is! SingleEndeavorBlockScreenState ||
            current is! SingleEndeavorBlockScreenState ||
            (previous.isEdit != current.isEdit);
      },
      builder: (context, state) {
        if (state is RepeatingEndeavorBlockScreenState) return Container();
        state as SingleEndeavorBlockScreenState;
        return OneTimeEventPicker(
          startingEvent: state.event,
          onEvent: (newEvent) => context
              .read<EndeavorBlockScreenBloc>()
              .add(EventChanged(newEvent)),
        );
      },
    );
  }
}

class _RepeatingEventPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      buildWhen: (previous, current) {
        return previous is! RepeatingEndeavorBlockScreenState ||
            current is! RepeatingEndeavorBlockScreenState ||
            (previous.repeatingEventInput != current.repeatingEventInput);
      },
      builder: (context, state) {
        if (state is SingleEndeavorBlockScreenState) return Container();
        state as RepeatingEndeavorBlockScreenState;
        return RepeatingEventPicker(
          initialRepeatingEvent: state.repeatingEventInput.value,
          onChanged: (repeatingEvent) =>
              context.read<EndeavorBlockScreenBloc>().add(
                    RepeatingEventChanged(repeatingEvent),
                  ),
        );
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EndeavorBlockScreenBloc, EndeavorBlockScreenState>(
      builder: (context, state) {
        void Function()? onPressed;
        if ((state is SingleEndeavorBlockScreenState && state.status.isValid) ||
            (state is RepeatingEndeavorBlockScreenState &&
                state.status.isValid)) {
          onPressed = () {
            context.read<EndeavorBlockScreenBloc>().add(const Save());
            Navigator.pop(context);
          };
        } else {
          onPressed = null;
        }
        return ElevatedButton(
          onPressed: onPressed,
          child: const Text("Save"),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.red),
      ),
      onPressed: () {
        context.read<EndeavorBlockScreenBloc>().add(const DeleteRequested());
      },
      child: const Text("Delete"),
    );
  }
}
