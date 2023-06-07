part of 'app_bloc.dart';

enum AppAuthenticationStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppAuthenticationStatus authenticationStatus;
  final User user;

  const AppState.authenticated({
    required this.user,
  }) : authenticationStatus = AppAuthenticationStatus.authenticated;

  const AppState.unauthenticated()
      : authenticationStatus = AppAuthenticationStatus.unauthenticated,
        user = User.empty;

  @override
  List<Object?> get props => [authenticationStatus];
}
