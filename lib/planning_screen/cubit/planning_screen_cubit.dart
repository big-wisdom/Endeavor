import 'package:bloc/bloc.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:equatable/equatable.dart';

import '../view/calendar_view_dropdown.dart';

part 'planning_screen_state.dart';

class PlanningScreenCubit extends Cubit<PlanningScreenState> {
  PlanningScreenCubit()
      : super(
          const PlanningScreenState(
            navbarItem: NavbarItem.endeavors,
            index: 0,
          ),
        );

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.endeavors:
        emit(
          const PlanningScreenState(
            navbarItem: NavbarItem.endeavors,
            index: 0,
          ),
        );
        break;
      case NavbarItem.tasks:
        emit(
          const PlanningScreenState(
            navbarItem: NavbarItem.tasks,
            index: 1,
          ),
        );
        break;
      case NavbarItem.calendar:
        emit(
          const PlanningScreenState(
            navbarItem: NavbarItem.calendar,
            index: 2,
          ),
        );
        break;
      case NavbarItem.schedules:
        emit(
          const PlanningScreenState(
            navbarItem: NavbarItem.schedules,
            index: 3,
          ),
        );
        break;
    }
  }

  void selectCalendarMode(CalendarMode mode) {
    emit(
      PlanningScreenState(
        index: state.index,
        navbarItem: state.navbarItem,
        calendarMode: mode,
      ),
    );
  }

  void addPrimaryEndeavor(String title) {
    ShimDataService.endeavors.createPrimaryEndeavor(title);
  }

  void addSchedule(String title) {
    ShimDataService.schedules.createSchedule(title);
  }
}
