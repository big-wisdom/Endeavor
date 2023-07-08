import 'package:data_repository/data_repository.dart';
import 'package:endeavor/calendar_screen/calendar_screen.dart';
import 'package:endeavor/planning_screen/view/calendar_view_dropdown.dart';
import 'package:endeavor/planning_screen/view/calendar_view_plus_dialogue.dart';
import 'package:endeavor/task_screen/view/task_screen.dart';
import 'package:endeavor/tasks_screen/tasks_screen.dart';
import 'package:endeavor/widgets/create_endeavor_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endeavor/planning_screen/planning_screen.dart';
import 'package:endeavor/endeavors_screen/endeavors_screen.dart';

class PlanningScreen extends StatelessWidget {
  const PlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanningScreenCubit(context.read<DataRepository>()),
      child: const PlanningScreenView(),
    );
  }
}

class PlanningScreenView extends StatelessWidget {
  const PlanningScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlanningScreenCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Planning"),
        actions: cubit.state.navbarItem == NavbarItem.calendar
            ? [const CalendarViewDropdown()]
            : null,
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
        buildWhen: (previous, current) =>
            previous.navbarItem != current.navbarItem,
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.endeavors) {
            return const EndeavorsScreen();
          } else if (state.navbarItem == NavbarItem.tasks) {
            return const TasksScreen();
          } else if (state.navbarItem == NavbarItem.calendar) {
            return const CalendarScreen();
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final navBarItem =
              context.read<PlanningScreenCubit>().state.navbarItem;
          switch (navBarItem) {
            case NavbarItem.endeavors:
              showModalBottomSheet(
                context: context,
                builder: (context) => CreateEndeavorModal(
                  onAdd: (title) => context
                      .read<PlanningScreenCubit>()
                      .addPrimaryEndeavor(title),
                ),
              );
              break;
            case NavbarItem.tasks:
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => TaskScreen.create())),
              );
              break;
            case NavbarItem.calendar:
              showDialog(
                context: context,
                builder: (context) {
                  return const CalendarViewPlusDialogue();
                },
              );
              break;
          }
        },
      ),
    );
  }
}
