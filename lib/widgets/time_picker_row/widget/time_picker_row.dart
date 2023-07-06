import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/time_picker_row_cubit.dart';

enum TimePickerRowType { start, end }

class TimePickerRow extends StatelessWidget {
  const TimePickerRow(this.type, {super.key});
  final TimePickerRowType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimePickerRowCubit(type),
      child: _TimePickerRowWidget(),
    );
  }
}

class _TimePickerRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimePickerRowCubit, TimePickerRowState>(
      buildWhen: (previous, current) =>
          (type == TimePickerRowType.start &&
              previous.startTimeInput != current.startTimeInput) ||
          (type == TimePickerRowType.end &&
              previous.endTimeInput != current.endTimeInput),
      builder: (context, state) {
        final cubit = context.read<OneTimeEventPickerCubit>();
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(type == _TimePickerRowType.start
                ? "Start Time: "
                : "End Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await showTimePicker(
                  context: context,
                  initialTime: type == TimePickerRowType.start
                      ? state.startTimeInput.value
                      : state.endTimeInput.value,
                  builder: (context, child) {
                    if (child != null) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: false),
                        child: child,
                      );
                    } else {
                      return const Text("loading...");
                    }
                  },
                );
                if (selection != null) {
                  if (type == TimePickerRowType.start) {
                    cubit.newStartTimePicked(selection);
                  } else {
                    cubit.newEndTimePicked(selection);
                  }
                }
              },
              child: Text(state.startTimeInput.value.toString()),
            ),
          ],
        );
      },
    );
  }
}
