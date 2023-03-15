import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker(
      {required this.dateTime, required this.onChanged, super.key});

  final DateTime dateTime;
  final Function(DateTime) onChanged;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Date Picker
        const Text("Date"),
        SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: widget.dateTime,
          onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
            DateTime selection =
                dateRangePickerSelectionChangedArgs.value as DateTime;
            widget.onChanged(selection);
          },
        ),
      ],
    );
  }
}
