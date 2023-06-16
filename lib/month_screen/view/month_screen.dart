import 'package:endeavor/calendar_screen/calendar_screen.dart';
import 'package:endeavor/planning_screen/cubit/planning_screen_cubit.dart';
import 'package:endeavor/planning_screen/view/calendar_view_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MonthScreen extends StatelessWidget {
  const MonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      selectionMode: DateRangePickerSelectionMode.single,
      onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
        // update root calendar screen of selected date change
        context
            .read<CalendarScreenCubit>()
            .selectNewDate(dateRangePickerSelectionChangedArgs.value);

        // update planning screen to switch over to week view
        context
            .read<PlanningScreenCubit>()
            .selectCalendarMode(CalendarMode.week);
      },
      monthViewSettings:
          const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
    );
  }
}
