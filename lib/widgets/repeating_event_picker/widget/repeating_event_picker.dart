import 'package:data_models/data_models.dart';
import 'package:endeavor/widgets/repeating_event_picker/cubit/repeating_event_picker_cubit.dart';
import 'package:endeavor/widgets/time_picker_row/time_picker_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RepeatingEventPicker extends StatelessWidget {
  const RepeatingEventPicker({
    required this.initialRepeatingEvent,
    required this.onChanged,
    super.key,
  });

  final void Function(RepeatingEventInput repeatingEvent) onChanged;
  final RepeatingEvent? initialRepeatingEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepeatingEventPickerCubit(
        initialRepeatingEvent: initialRepeatingEvent,
        onChanged: onChanged,
      ),
      child: _RepeatingEventPickerWidget(),
    );
  }
}

class _RepeatingEventPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatingEventPickerCubit, RepeatingEventPickerState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SfDateRangePicker(
              onSelectionChanged: (args) =>
                  context.read<RepeatingEventPickerCubit>().onDateRangeChanged(
                        (args.value as PickerDateRange).startDate,
                        (args.value as PickerDateRange).endDate,
                      ),
              selectionMode: DateRangePickerSelectionMode.range,
              initialSelectedRange: PickerDateRange(
                state.startDateInput.value,
                state.endDateInput.value,
              ),
            ),
            // Start Time
            TimePickerRow.repeatingEventStartTime(
              repeatingEventStartTimeInput: state.startTimeInput,
              onTimeSelected: (time) => context
                  .read<RepeatingEventPickerCubit>()
                  .onStartTimeChanged(time),
            ),
            // End Time
            TimePickerRow.repeatingEventEndTime(
              repeatingEventEndTimeInput: state.endTimeInput,
              onTimeSelected: (time) => context
                  .read<RepeatingEventPickerCubit>()
                  .onEndTimeChanged(time),
            ),
            _DaysOfWeekPicker(),
          ],
        );
      },
    );
  }
}

class _DaysOfWeekPicker extends StatelessWidget {
  final List<Text> dayOfWeekWidgets = const [
    Text('M'),
    Text('T'),
    Text('W'),
    Text('Th'),
    Text('F'),
    Text('S'),
    Text('S'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<RepeatingEventPickerCubit, RepeatingEventPickerState>(
          builder: (context, state) {
            return Column(
              children: [
                const Text("Days of the Week"),
                ToggleButtons(
                  isSelected: state.daysOfWeekInput.value,
                  children: dayOfWeekWidgets,
                  onPressed: (index) {
                    context
                        .read<RepeatingEventPickerCubit>()
                        .dayOfWeekTapped(index);
                  },
                ),
                if (state.daysOfWeekInput.error != null)
                  Text(
                    state.daysOfWeekInput.error!.errorText(),
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
