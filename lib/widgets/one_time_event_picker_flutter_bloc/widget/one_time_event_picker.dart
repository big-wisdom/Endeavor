import 'package:data_models/data_models.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../cubit/one_time_event_picker_cubit.dart';
import 'package:flutter/material.dart';

class OneTimeEventPicker extends StatelessWidget {
  const OneTimeEventPicker({
    this.initialValue,
    required this.onEvent,
    super.key,
  });

  final Event? initialValue;
  final void Function(Event newEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OneTimeEventPickerBloc(
        initialEvent: initialValue,
        onChanged: onEvent,
      ),
      child: _OneTimeEventPickerWidget(),
    );
  }
}

class _OneTimeEventPickerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OneTimeEventPickerBloc>();
    return Column(
      children: [
        _DatePicker(bloc),
        TimeFieldBlocBuilder(
          timeFieldBloc: bloc.start,
          format: DateFormat("hh:mm"),
          initialTime: bloc.start.value,
          showClearIcon: false,
          decoration: const InputDecoration(
            labelText: 'Start',
            prefixIcon: Icon(Icons.access_time),
          ),
        ),
        TimeFieldBlocBuilder(
          timeFieldBloc: bloc.end,
          format: DateFormat("hh:mm"),
          initialTime: bloc.end.value,
          showClearIcon: false,
          decoration: const InputDecoration(
            labelText: 'End',
            prefixIcon: Icon(Icons.access_time),
          ),
        ),
      ],
    );
  }
}

class _DatePicker extends StatelessWidget {
  final OneTimeEventPickerBloc bloc;
  const _DatePicker(this.bloc);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InputFieldBloc<DateTime, dynamic>,
        InputFieldBlocState<DateTime, dynamic>>(
      bloc: bloc.date,
      buildWhen: (previous, current) => previous.value != current.value,
      builder: (context, state) {
        return SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: state.value,
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
            DateTime selection =
                (dateRangePickerSelectionChangedArgs.value as DateTime);
            bloc.date.updateValue(selection);
            bloc.submit();
          },
        );
      },
    );
  }
}
