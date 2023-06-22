import 'package:endeavor/one_time_event_picker_screen/one_time_event_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneTimeEventPickerView extends StatelessWidget {
  const OneTimeEventPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Work Block"),
      ),
      body: Column(children: [
        _DatePicker(),
        const _TimePicker(_TimePickerType.start),
        const _TimePicker(_TimePickerType.end),
        ElevatedButton(
          onPressed: () {
            context.read<OneTimeEventPickerCubit>().done();
            Navigator.pop(context);
          },
          child: const Text("Done"),
        )
      ]),
    );
  }
}
