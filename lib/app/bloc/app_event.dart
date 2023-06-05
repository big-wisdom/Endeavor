part of 'app_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

class _AppUserChanged extends AppEvent {
  const _AppUserChanged(this.user);

  final User user;
}

class AddEndeavorRequested extends AppEvent {
  const AddEndeavorRequested();
}

class AddTaskRequested extends AppEvent {
  const AddTaskRequested();
}

class AddCalendarItemRequested extends AppEvent {
  const AddCalendarItemRequested();
}
