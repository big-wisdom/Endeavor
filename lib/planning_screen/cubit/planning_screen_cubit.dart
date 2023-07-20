import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

import '../view/calendar_view_dropdown.dart';

part 'planning_screen_state.dart';

class PlanningScreenCubit extends Cubit<PlanningScreenState> {
  final DataRepository _dataRepository;

  PlanningScreenCubit(this._dataRepository)
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
    _dataRepository.createPrimaryEndeavor(title);
  }
}
