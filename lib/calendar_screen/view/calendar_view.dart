import 'package:endeavor/month_screen/view/month_screen.dart';
import 'package:endeavor/week_screen/week_screen.dart';
import 'package:endeavor/planning_screen/cubit/planning_screen_cubit.dart';
import 'package:endeavor/planning_screen/view/calendar_view_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final planningCubit = context.read<PlanningScreenCubit>();

    if (planningCubit.state.calendarMode == CalendarMode.month) {
      return const MonthScreen();
    } else {
      return const WeekScreen();
    }
  }
}
