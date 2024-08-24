import '../cubit/schedules_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulesScreenView extends StatelessWidget {
  const SchedulesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchedulesCubit, SchedulesState>(
      builder: (BuildContext context, SchedulesState state) {
        return ListView(
          children: state.schedules.map(
            (schedule) {
              return ListTile(
                title: Text(schedule.title),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
