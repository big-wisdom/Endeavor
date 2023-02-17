import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarMonthView extends StatelessWidget {
  const CalendarMonthView({required this.setCalendarView, super.key});
  final Function(CalendarView, [DateTime]) setCalendarView;

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      selectionMode: DateRangePickerSelectionMode.single,
      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
        setCalendarView(
            CalendarView.week, dateRangePickerSelectionChangedArgs.value);
      },
      monthViewSettings:
          const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
    );
  }
}
