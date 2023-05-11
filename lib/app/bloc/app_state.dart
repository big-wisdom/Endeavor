part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  final AppStatus status;
  final User user;

  const AppState.authenticated(User user)
      : this._(status: AppStatus.unauthenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
