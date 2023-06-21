import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/widgets/endeavor_picker_row.dart';
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
      body: bloc.state.loadingState == CalendarEventScreenLoadingState.loading ? const Center(child: CircularProgressIndicator()) : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Title field
                _TitleField(),
                // Endeavor Switcher
                EndeavorPickerRow(
                  endeavorInput: bloc.state.endeavorInput,
                  onChanged: (endeavor) => ,
                ),
                // Type picker
                if (!bloc.state.isEdit)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Type:'),
                      DropdownButton(
                        value: calendarEvent.type,
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
                          setState(() {
                            if (value != calendarEvent.type && value != null) {
                              // we are creating so we just need to switch the value
                              calendarEvent.type = value;
                              changesMade =
                                  initialCalendarEvent != calendarEvent;
                            }
                          });
                        },
                      )
                    ],
                  ),
                // One time event picker
                if (calendarEvent.type == CalendarEventType.single || editing)
                  OneTimeEventPicker(
                    event: calendarEvent.event!,
                    onChanged: (value) {
                      // TODO: Shouldn't offer to change following if just date is changed
                      // Right now it doesn't hurt anything if they press that, it's just
                      // Lame to leave the user hanging
                      if (editing) {
                        setState(() {
                          calendarEvent.event = value;
                          changesMade = initialCalendarEvent != calendarEvent;
                        });
                      } else {
                        calendarEvent.event = value;
                      }
                    },
                  ),

                // repeating event picker
                if (calendarEvent.type == CalendarEventType.repeating &&
                    !editing)
                  RepeatingEventPicker(
                    repeatingEvent: repeatingCalendarEvent.repeatingEvent!,
                    onChanged: (repeatingEvent) {
                      repeatingCalendarEvent.repeatingEvent = repeatingEvent;
                    },
                  ),

                // Create button
                if (!editing)
                  ElevatedButton(
                    onPressed: () {
                      if (calendarEvent.type == CalendarEventType.single) {
                        _createSingleEvent();
                      } else {
                        _createRepeatingEvent();
                      }
                      // TODO: implement something to tell the user when they messed up
                      Navigator.pop(context);
                    },
                    child: const Text("Create"),
                  ),
                if (editing)
                  ElevatedButton(
                    onPressed: changesMade ? _saveChanges : null,
                    child: const Text("Save"),
                  ),
                if (editing)
                  ElevatedButton(
                    onPressed: _delete,
                    child: const Text("Delete"),
                  ),
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
