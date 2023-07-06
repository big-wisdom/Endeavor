import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/time_picker_row_cubit.dart';

enum TimePickerRowType { start, end }

class TimePickerRow extends StatelessWidget {
  const TimePickerRow({
    required this.type,
    this.initialTime,
    required this.onTimeSelected,
    super.key,
  });
  final TimePickerRowType type;
  final TimeOfDay? initialTime;
  final Function(TimeOfDay) onTimeSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimePickerRowCubit(
        type: type,
        onTimeSelected: onTimeSelected,
      ),
      child: _TimePickerRowWidget(),
    );
  }
}

class _TimePickerRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimePickerRowCubit, TimePickerRowState>(
      buildWhen: (previous, current) => previous.time != current.time,
      builder: (context, state) {
        final cubit = context.read<TimePickerRowCubit>();
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(state is StartTimePickerRowState
                ? "Start Time: "
                : "End Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await showTimePicker(
                  context: context,
                  initialTime: state.time ?? TimeOfDay.now(),
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
                  cubit.timeSelected(selection);
                }
              },
              child: Text(state.time?.toString() ?? "Select Time"),
            ),
          ],
        );
      },
    );
  }
}
