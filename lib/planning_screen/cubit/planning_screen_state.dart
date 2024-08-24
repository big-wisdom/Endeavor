part of 'planning_screen_cubit.dart';

enum NavbarItem {
  endeavors,
  tasks,
  calendar,
  schedules,
}

class PlanningScreenState extends Equatable {
  const PlanningScreenState({
    required this.navbarItem,
    required this.index,
    this.calendarMode = CalendarMode.week,
  });

  final NavbarItem navbarItem;
  final int index;
  final CalendarMode calendarMode;

  @override
  List<Object> get props => [navbarItem, index];
}
