import 'package:endeavor/schedules_screen/cubit/schedules_cubit.dart';
import './schedules_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulesScreen extends StatelessWidget {
  const SchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SchedulesCubit(),
      child: const SchedulesScreenView(),
    );
  }
}
