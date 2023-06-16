import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calendar_view.dart';
import 'package:endeavor/calendar_screen/calendar_screen.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarScreenCubit(),
      child: const CalendarView(),
    );
  }
}
