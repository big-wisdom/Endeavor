part of 'app_bloc.dart';

enum AppAuthenticationStatus {
  authenticated,
  unauthenticated,
}

enum AppFlowState {
  planning,
  createOrEditTask,
  addCalendarItem,
  createOrEditEvent,
  createOrEditEndeavorBlock,
}

class AppState extends Equatable {
  final AppAuthenticationStatus authenticationStatus;
  final AppFlowState flowState;
  final User user;

  const AppState.authenticated({
    required this.user,
    this.flowState = AppFlowState.planning,
  }) : authenticationStatus = AppAuthenticationStatus.authenticated;

  const AppState.unauthenticated({this.flowState = AppFlowState.planning})
      : authenticationStatus = AppAuthenticationStatus.unauthenticated,
        user = User.empty;

  AppState copyWithNewFlowState({
    required AppFlowState newFlowState,
  }) {
    if (user.isNotEmpty) {
      return AppState.authenticated(user: user, flowState: newFlowState);
    } else {
      throw Exception("Cannot change flow state when unauthenticated");
    }
  }

  @override
  List<Object?> get props => [authenticationStatus, flowState, user];
}
