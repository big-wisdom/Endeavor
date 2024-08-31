import 'package:data_models/data_models.dart';

import '../cubit/schedules_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulesScreenView extends StatelessWidget {
  const SchedulesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchedulesCubit, SchedulesState>(
      builder: (BuildContext context, SchedulesState state) {
        switch (state) {
          case LoadedSchedulesState _:
            return _SchedulesList(state.schedules);
          case LoadingSchedulesState _:
            return const Center(child: CircularProgressIndicator());
          case ErrorSchedulesState _:
            return Center(
              child: Text(state.message),
            );
          default:
            throw Error.safeToString("Unrecognized scheduling screen state");
        }
      },
    );
  }
}

class _SchedulesList extends StatelessWidget {
  final List<Schedule> schedules;
  const _SchedulesList(this.schedules);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: schedules.map(
        (schedule) {
          return ListTile(
            title: Text(schedule.title),
          );
        },
      ).toList(),
    );
  }
}
