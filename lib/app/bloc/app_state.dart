part of 'app_bloc.dart';

enum AppAuthenticationStatus {
  authenticated,
  unauthenticated,
}

abstract class AppState extends Equatable {
  const AppState({
    required this.authenticationStatus,
  });

  final AppAuthenticationStatus authenticationStatus;
}

class AuthenticatedAppState extends AppState {
  final User user;

  const AuthenticatedAppState({
    required this.user,
  }) : super(authenticationStatus: AppAuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [user, authenticationStatus];
}

class UnauthenticatedAppState extends AppState {
  const UnauthenticatedAppState()
      : super(authenticationStatus: AppAuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [authenticationStatus];
}
