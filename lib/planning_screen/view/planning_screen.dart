import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endeavor/planning_screen/planning_screen.dart';
import 'package:endeavor/endeavors_screen/endeavors_screen.dart';

class PlanningScreen extends StatelessWidget {
  const PlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanningScreenCubit(),
      child: const PlanningScreenView(),
    );
  }
}

class PlanningScreenView extends StatelessWidget {
  const PlanningScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planning"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: "Endeavors"),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: "Tasks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context
                  .read<PlanningScreenCubit>()
                  .getNavBarItem(NavbarItem.endeavors);
              break;
            case 1:
              context
                  .read<PlanningScreenCubit>()
                  .getNavBarItem(NavbarItem.tasks);
              break;
            case 2:
              context
                  .read<PlanningScreenCubit>()
                  .getNavBarItem(NavbarItem.calendar);
              break;
          }
        },
      ),
      body: BlocBuilder<PlanningScreenCubit, PlanningScreenState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.endeavors) {
            return const EndeavorsScreen();
          } else if (state.navbarItem == NavbarItem.tasks) {
            return Tasks();
          } else if (state.navbarItem == NavbarItem.calendar) {
            return Calendar();
          }
          return Container();
        },
      ),
    );
  }
}
