import 'package:endeavor/Models/event/event.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/widgets/one_time_event_picker.dart';
import 'package:flutter/material.dart';

class OneTimeEventPickerView extends StatefulWidget {
  const OneTimeEventPickerView(
      {required this.task, required this.onDone, super.key});

  final Task task;
  final void Function(Event) onDone;

  @override
  State<OneTimeEventPickerView> createState() => _OneTimeEventPickerViewState();
}

class _OneTimeEventPickerViewState extends State<OneTimeEventPickerView> {
  late Event event;

  @override
  void initState() {
    event = Event.generic(widget.task.duration);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Work Block"),
      ),
      body: Column(children: [
        OneTimeEventPicker(
          event: event,
          onChanged: (newEvent) {
            if (newEvent != null) {
              setState(() {
                event = newEvent;
              });
            }
          },
          startOnly: false,
        ),
        ElevatedButton(
          onPressed: () {
            widget.onDone(event);
            Navigator.pop(context);
          },
          child: const Text("Done"),
        )
      ]),
    );
  }
}
