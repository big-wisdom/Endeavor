import 'package:data_models/data_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/schedule_screen_bloc.dart';
import './schedule_screen_view.dart';

class ScheduleScreen extends StatelessWidget {
  final Schedule schedule;
  const ScheduleScreen({super.key, required this.schedule});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleScreenCubit(schedule: schedule),
      child: const ScheduleScreenView(),
    );
  }
}
