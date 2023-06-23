import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';
import 'package:endeavor/widgets/one_time_event_picker/widget/one_time_event_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarEventScreenView extends StatelessWidget {
  const CalendarEventScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalendarEventScreenBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("${bloc.state.isEdit ? "Edit" : "Create"} Event"),
      ),
      body: bloc.state.loadingState == CalendarEventScreenLoadingState.loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _TitleField(),
                      EndeavorPickerRow(
                        endeavorInput: bloc.state.endeavorInput,
                        onChanged: (endeavor) =>
                            bloc.add(EndeavorChanged(endeavor)),
                      ),
                      _OneTimeEventPickerBuilder(),

                      // Create button
                      if (bloc.state.isEdit) _CreateButton(),
                      if (bloc.state.isEdit) _DeleteButton(),
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
      buildWhen: (previous, current) => previous.type != current.type,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Type:'),
            DropdownButton(
              value: state.type,
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
                if (value != state.type && value != null) {
                  context
                      .read<CalendarEventScreenBloc>()
                      .add(TypeChanged(value));
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
        return OneTimeEventPicker(
          onEvent: (event) =>
              context.read<CalendarEventScreenBloc>().add(EventChanged(event)),
          startingEvent: state.event.value,
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
