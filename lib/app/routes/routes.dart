import 'package:data_repository/data_repository.dart';
import 'package:endeavor/app/app.dart';
import 'package:endeavor/create_or_edit_endeavor_screen/create_or_edit_endeavor_screen.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:endeavor/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppState state,
  List<Page<dynamic>> pages,
) {
  switch (state.authenticationStatus) {
    case AppAuthenticationStatus.authenticated:
      switch (state.flowState) {
        case AppFlowState.planning:
          return [PlanningScreen.page()];
        case AppFlowState.createOrEditTask:
          return [PlanningScreen.page(), CreateOrEditTask.page()];
        case AppFlowState.addCalendarItem:
          // let planning screen recieve change and show dialogue to
          // clarify which kind of calendar item
          return [PlanningScreen.page()];
        case AppFlowState.createOrEditEvent:
          return [PlanningScreen.page(), CreateOrEditEvent.page()];
        case AppFlowState.createOrEditEndeavorBlock:
          return [PlanningScreen.page(), CreateOrEditEndeavorBlock.page()];
      }
    case AppAuthenticationStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
