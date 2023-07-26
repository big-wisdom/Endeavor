import 'package:data_models/data_models.dart';
import 'package:endeavor/one_time_event_picker_screen/cubit/one_time_event_picker_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'one_time_event_picker_view.dart';
import 'package:flutter/material.dart';

class OneTimeEventPickerScreen extends StatelessWidget {
  const OneTimeEventPickerScreen({
    required this.onEvent,
    this.initialEvent,
    super.key,
  });

  final void Function(Event newEvent) onEvent;
  final Event? initialEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneTimeEventPickerScreenCubit(
        onEvent: onEvent,
        initialEvent: initialEvent,
      ),
      child: const OneTimeEventPickerView(),
    );
  }
}
