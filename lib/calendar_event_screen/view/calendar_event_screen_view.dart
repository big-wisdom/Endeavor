import 'package:data_models/data_models.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';
import 'package:endeavor/widgets/one_time_event_picker/widget/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker/repeating_event_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarEventScreenView extends StatelessWidget {
  const CalendarEventScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<CalendarEventScreenBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${(state is SingleCalendarEventScreenState && state.isEdit) ? "Edit" : "Create"} Event"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _TitleField(),
                EndeavorPickerRow(
                  endeavorInput: state.endeavorInput,
                  onChanged: (endeavor) => context
                      .read<CalendarEventScreenBloc>()
                      .add(EndeavorChanged(endeavor)),
                ),
                _TypePicker(),
                if (state is SingleCalendarEventScreenState)
                  _OneTimeEventPickerBuilder(),
                if (state is RepeatingCalendarEventScreenState)
                  _RepeatingEventPicker(),
                if ((state is SingleCalendarEventScreenState && state.isEdit) ||
                    state is RepeatingCalendarEventScreenState)
                  _CreateButton(),
                if (state is SingleCalendarEventScreenState && state.isEdit)
                  _DeleteButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarEventScreenBloc, CalendarEventScreenState>(
      buildWhen: (previous, current) => previous.title != current.title,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title.value,
          decoration: InputDecoration(
            labelText: "Title",
            errorText: state.title.error?.text(),
          ),
          onChanged: (value) =>
              context.read<CalendarEventScreenBloc>().add(TitleChanged(value)),
        );
      },
    );
  }
}

class _TypePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarEventScreenBloc, CalendarEventScreenState>(
      buildWhen: (previous, current) =>
          (previous is SingleCalendarEventScreenState) !=
          (current is SingleCalendarEventScreenState),
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Type:'),
            DropdownButton(
              value: state is SingleCalendarEventScreenState
                  ? CalendarEventType.single
                  : CalendarEventType.repeating,
              items: const [
                DropdownMenuItem(
                  value: CalendarEventType.single,
                  child: Text("One Time"),
                ),
                DropdownMenuItem(
                  value: CalendarEventType.repeating,
                  child: Text("Repeated"),
                )
              ],
              onChanged: (value) {
                if (((state is SingleCalendarEventScreenState) &&
                        value != CalendarEventType.single) ||
                    ((state is RepeatingCalendarEventScreenState) &&
                            value != CalendarEventType.repeating) &&
                        value != null) {
                  context
                      .read<CalendarEventScreenBloc>()
                      .add(TypeChanged(value!));
                }
              },
            )
          ],
        );
      },
    );
  }
}

class _OneTimeEventPickerBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarEventScreenBloc, CalendarEventScreenState>(
      builder: (context, state) {
        state as SingleCalendarEventScreenState;
        return OneTimeEventPicker(
          onEvent: (eventInput) => context
              .read<CalendarEventScreenBloc>()
              .add(EventChanged(eventInput)),
          startingEvent: state.event,
        );
      },
    );
  }
}

class _RepeatingEventPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarEventScreenBloc, CalendarEventScreenState>(
      buildWhen: (previous, current) {
        return (previous as RepeatingCalendarEventScreenState)
                .repeatingEventInput !=
            (current as RepeatingCalendarEventScreenState).repeatingEventInput;
      },
      builder: (context, state) {
        return RepeatingEventPicker(
          initialRepeatingEvent: (state as RepeatingCalendarEventScreenState)
              .repeatingEventInput
              .value,
          onChanged: (repeatingEvent) => context
              .read<CalendarEventScreenBloc>()
              .add(RepeatingEventChanged(repeatingEvent)),
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
        context
            .read<CalendarEventScreenBloc>()
            .add(const CreateButtonPressed());
        Navigator.pop(context);
      },
      child: const Text("Create"),
    );
  }
}

class _DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context
          .read<CalendarEventScreenBloc>()
          .add(const DeleteThisCalendarEvent()),
      child: const Text("Delete"),
    );
  }
}
