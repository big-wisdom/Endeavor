import 'package:endeavor/widgets/one_time_event_picker/one_time_event_picker.dart';
import '../cubit/one_time_event_picker_screen_cubit.dart';
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
      body: BlocBuilder<OneTimeEventPickerScreenCubit,
          OneTimeEventPickerScreenState>(
        builder: (context, state) {
          return Column(children: [
            OneTimeEventPicker(
              onEvent: (newEvent) => context
                  .read<OneTimeEventPickerScreenCubit>()
                  .eventChanged(newEvent),
              startingEvent: state.event,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<OneTimeEventPickerScreenCubit>().done();
                Navigator.pop(context);
              },
              child: const Text("Done"),
            )
          ]);
        },
      ),
    );
  }
}
