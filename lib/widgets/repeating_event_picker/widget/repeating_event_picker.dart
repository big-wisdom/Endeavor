import 'package:data_models/data_models.dart';
import 'package:endeavor/widgets/repeating_event_picker/cubit/repeating_event_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
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
    final bloc = context.read<RepeatingEventPickerCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SfDateRangePicker(
          onSelectionChanged: (args) {
            final newStart = (args.value as PickerDateRange).startDate;
            final newEnd = (args.value as PickerDateRange).endDate;
            if (newStart != null) {
              bloc.startDate.updateValue(newStart);
            }
            if (newEnd != null) {
              bloc.endDate.updateValue(newEnd);
            }
          },
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedRange: PickerDateRange(
            bloc.startDate.value,
            bloc.endDate.value,
          ),
        ),
        // Start Time
        TimeFieldBlocBuilder(
          timeFieldBloc: bloc.startTime,
          format: DateFormat("hh:mm"),
          initialTime: bloc.startTime.value,
          showClearIcon: false,
          decoration: const InputDecoration(
            labelText: 'Start',
            prefixIcon: Icon(Icons.access_time),
          ),
        ),
        // End Time
        TimeFieldBlocBuilder(
          timeFieldBloc: bloc.endTime,
          format: DateFormat("hh:mm"),
          initialTime: bloc.endTime.value,
          showClearIcon: false,
          decoration: const InputDecoration(
            labelText: 'End',
            prefixIcon: Icon(Icons.access_time),
          ),
        ),
        _DaysOfWeekPicker(bloc),
      ],
    );
  }
}

class _DaysOfWeekPicker extends StatelessWidget {
  final RepeatingEventPickerCubit bloc;
  const _DaysOfWeekPicker(this.bloc);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<MultiSelectFieldBloc<String, dynamic>,
            MultiSelectFieldBlocState<String, dynamic>>(
          bloc: bloc.daysOfWeek,
          builder: (context, state) {
            return Column(
              children: [
                Text(state.name),
                ToggleButtons(
                  isSelected: daysOfWeekStrings
                      .map((e) => state.value.contains(e))
                      .toList(),
                  children: daysOfWeekStrings.map((e) => Text(e)).toList(),
                  onPressed: (index) {
                    if (state.value.contains(daysOfWeekStrings[index])) {
                      bloc.daysOfWeek.deselect(daysOfWeekStrings[index]);
                    } else {
                      bloc.daysOfWeek.select(daysOfWeekStrings[index]);
                    }
                  },
                ),
                if (state.canShowError)
                  Text(
                    state.error.toString(),
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
