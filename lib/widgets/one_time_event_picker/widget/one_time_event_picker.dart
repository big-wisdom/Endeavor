import 'package:data_repository/data_repository.dart';
import 'package:endeavor/widgets/time_picker_row/time_picker_row.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../cubit/one_time_event_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneTimeEventPicker extends StatelessWidget {
  const OneTimeEventPicker(
      {this.startingEvent, required this.onEvent, super.key});

  final Event? startingEvent;
  final void Function(Event newEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneTimeEventPickerCubit(
        initialEvent: startingEvent,
        onChanged: onEvent,
      ),
      child: _OneTimeEventPickerWidget(),
    );
  }
}

class _OneTimeEventPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _DatePicker(),
        TimePickerRow(
          type: TimePickerRowType.start,
          onTimeSelected: (time) =>
              context.read<OneTimeEventPickerCubit>().newStartTimePicked(time),
        ),
        TimePickerRow(
          type: TimePickerRowType.end,
          onTimeSelected: (time) =>
              context.read<OneTimeEventPickerCubit>().newEndTimePicked(time),
        ),
      ],
    );
  }
}

class _DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneTimeEventPickerCubit, OneTimeEventPickerState>(
      buildWhen: (previous, current) => previous.dateInput != current.dateInput,
      builder: (context, state) {
        return SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: state.dateInput.value,
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
            DateTime selection =
                (dateRangePickerSelectionChangedArgs.value as DateTime);
            context.read<OneTimeEventPickerCubit>().newDatePicked(selection);
          },
          monthViewSettings:
              const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
        );
      },
    );
  }
}
