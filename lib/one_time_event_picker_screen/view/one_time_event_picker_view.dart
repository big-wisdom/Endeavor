import 'package:endeavor/one_time_event_picker_screen/one_time_event_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

class _DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneTimeEventPickerCubit, OneTimeEventPickerState>(
      buildWhen: (previous, current) => previous.date != current.date,
      builder: (context, state) {
        return SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: state.date.value,
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

enum _TimePickerType { start, end }

class _TimePicker extends StatelessWidget {
  const _TimePicker(this.type);
  final _TimePickerType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OneTimeEventPickerCubit, OneTimeEventPickerState>(
      buildWhen: (previous, current) =>
          (type == _TimePickerType.start && previous.start != current.start) ||
          (type == _TimePickerType.end && previous.end != current.end),
      builder: (context, state) {
        final cubit = context.read<OneTimeEventPickerCubit>();
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(type == _TimePickerType.start ? "Start Time: " : "End Time:"),
            TextButton(
              onPressed: () async {
                TimeOfDay? selection = await showTimePicker(
                  context: context,
                  initialTime: type == _TimePickerType.start
                      ? state.start.value
                      : state.end.value,
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
                  if (type == _TimePickerType.start) {
                    cubit.newStartTimePicked(selection);
                  } else {
                    cubit.newEndTimePicked(selection);
                  }
                }
              },
              child: Text(state.start.value.toString()),
            ),
          ],
        );
      },
    );
  }
}
