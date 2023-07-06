import 'package:data_repository/data_repository.dart';
import 'package:endeavor/widgets/repeating_event_picker/cubit/repeating_event_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RepeatingEventPicker extends StatelessWidget {
  const RepeatingEventPicker({
    required this.initialRepeatingEvent,
    required this.onChanged,
    super.key,
  });

  final void Function(RepeatingEvent repeatingEvent) onChanged;
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DateRangePicker(),
        _DaysOfWeekPicker(),
        // Start Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Start Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await _selectTime(context, startTime);
                if (selection != null) {
                  setState(() {
                    startTime = selection;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(getRepeatingEvent());
                  }
                }
              },
              child: Text(startTime.toString()),
            ),
          ],
        ),
        // End Time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("End Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await _selectTime(context, endTime);
                if (selection != null) {
                  setState(() {
                    endTime = selection;
                  });
                  if (widget.onChanged != null) {
                    widget.onChanged!(getRepeatingEvent());
                  }
                }
              },
              child: Text(endTime.toString()),
            ),
          ],
        )
      ],
    );
  }
}

class _DateRangePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepeatingEventPickerCubit, RepeatingEventPickerState>(
      buildWhen: (previous, current) =>
          previous.startDateInput != current.startDateInput ||
          previous.endDateInput != current.endDateInput,
      builder: (context, state) {
        return SfDateRangePicker(
          onSelectionChanged: (args) =>
              context.read<RepeatingEventPickerCubit>().onDateRangeChanged(
                    (args as PickerDateRange).startDate,
                    (args as PickerDateRange).endDate,
                  ),
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedRange: PickerDateRange(
            state.startDateInput.value,
            state.endDateInput.value,
          ),
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
        const Text("Days of the Week"),
        BlocBuilder<RepeatingEventPickerCubit, RepeatingEventPickerState>(
          builder: (context, state) {
            return ToggleButtons(
              isSelected: state.daysOfWeekInput.value,
              children: dayOfWeekWidgets,
              onPressed: (index) {
                context
                    .read<RepeatingEventPickerCubit>()
                    .dayOfWeekTapped(index);
              },
            );
          },
        ),
      ],
    );
  }
}
