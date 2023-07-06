import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:endeavor/widgets/one_time_event_picker/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker/repeating_event_picker.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';

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

              if (state is SingleEndeavorBlockScreenState && state.isEdit)
                _TypePicker(),

              if (state is SingleEndeavorBlockScreenState)
                _OneTimeEventPicker(),

              if (state is RepeatingEndeavorBlockScreenState)
                _RepeatingEventPicker(),

              if (state is SingleEndeavorBlockScreenState && !state.isEdit)
                _CreateButton(),

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
        previous as SingleEndeavorBlockScreenState;
        current as SingleEndeavorBlockScreenState;
        return previous.isEdit != current.isEdit;
      },
      builder: (context, state) {
        state as SingleEndeavorBlockScreenState;
        return Text("${state.isEdit ? "Edit" : "Create"} Endeavor Block");
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
        previous as SingleEndeavorBlockScreenState;
        current as SingleEndeavorBlockScreenState;
        return previous.event != current.event;
      },
      builder: (context, state) {
        state as SingleEndeavorBlockScreenState;
        return OneTimeEventPicker(
          startingEvent: state.event.value,
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
        previous as RepeatingEndeavorBlockScreenState;
        current as RepeatingEndeavorBlockScreenState;
        return previous.repeatingEventInput != current.repeatingEventInput;
      },
      builder: (context, state) {
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

class _CreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<EndeavorBlockScreenBloc>().add(const CreateRequested());
        Navigator.pop(context);
      },
      child: const Text("Add Block"),
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
