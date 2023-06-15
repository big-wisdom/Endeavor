import 'package:endeavor/one_time_event_picker_screen/cubit/one_time_event_picker_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'one_time_event_picker_view.dart';
import 'package:flutter/material.dart';

class OneTimeEventPickerScreen extends StatelessWidget {
  const OneTimeEventPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneTimeEventPickerCubit(),
      child: const OneTimeEventPickerView(),
    );
  }
}
