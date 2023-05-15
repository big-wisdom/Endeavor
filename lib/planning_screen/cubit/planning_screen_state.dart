part of 'planning_screen_cubit.dart';

enum NavbarItem {
  endeavors,
  tasks,
  calendar,
}

class PlanningScreenState extends Equatable {
  const PlanningScreenState({
    required this.navbarItem,
    required this.index,
  });

  final NavbarItem navbarItem;
  final int index;

  @override
  List<Object> get props => [navbarItem, index];
}
