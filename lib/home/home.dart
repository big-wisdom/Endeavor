import 'package:endeavor/planning_screen/planning_screen.dart';
import 'package:flutter/material.dart';
import 'package:shim_data_service/shim_data_service.dart';

// This widget is the highest authenticated parent widget. You can't get here
// without having a userID from the authentication service, as such, it's the
// place to initialize/provide services/repositories that require
// authentication, like the data service.
class Home extends StatelessWidget {
  final String userId;
  Home({required this.userId, super.key}) {
    ShimDataService.initialize(userId: userId);
  }

  @override
  Widget build(BuildContext context) {
    return const PlanningScreen();
  }
}
