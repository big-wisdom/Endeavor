import 'package:endeavor/widgets/one_time_event_picker/one_time_event_picker.dart';
import '../cubit/one_time_event_picker_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneTimeEventPickerView extends StatelessWidget {
  const OneTimeEventPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    final oneTimeEventPickerScreencubit =
        context.read<OneTimeEventPickerScreenCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Work Block"),
      ),
      body: Column(
        children: [
          OneTimeEventPicker(
            onEvent: (newEvent) =>
                oneTimeEventPickerScreencubit.setEvent(newEvent),
            startingEvent: oneTimeEventPickerScreencubit.state.event,
          ),
          BlocBuilder<OneTimeEventPickerScreenCubit,
              OneTimeEventPickerScreenState>(
            buildWhen: (previous, current) => previous.event != current.event,
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.event == null
                    ? null
                    : () {
                        context.read<OneTimeEventPickerScreenCubit>().done();
                        Navigator.pop(context);
                      },
                child: const Text("Done"),
              );
            },
          )
        ],
      ),
    );
  }
}
