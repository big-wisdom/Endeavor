import 'package:endeavor/app/app.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:endeavor/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [PlanningScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
