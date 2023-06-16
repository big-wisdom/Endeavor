import 'package:endeavor/planning_screen/cubit/planning_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CalendarMode {
  month,
  week,
}

class CalendarViewDropdown extends StatelessWidget {
  const CalendarViewDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final planningCubit = context.read<PlanningScreenCubit>();

    return DropdownButton(
      value: planningCubit.state.calendarMode,
      items: const [
        DropdownMenuItem(value: CalendarMode.month, child: Text("Month")),
        DropdownMenuItem(value: CalendarMode.week, child: Text("Week")),
      ],
      onChanged: (value) {
        if (value != null) {
          planningCubit.selectCalendarMode(value);
        }
      },
    );
  }
}
