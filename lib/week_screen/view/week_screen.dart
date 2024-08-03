import 'package:endeavor/week_screen/bloc/week_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'week_screen_view.dart';

class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeekScreenBloc(
        selectedDay: DateTime.now(),
      ),
      child: const WeekScreenView(),
    );
  }
}
