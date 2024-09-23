import 'package:authentication_repository/authentication_repository.dart';
import 'package:endeavor/planning_screen/planning_screen.dart';
import 'package:flutter/material.dart';
import 'package:shim_data_service/shim_data_service.dart';

// This widget is the highest authenticated parent widget. You can't get here
// without having a userID from the authentication service, as such, it's the
// place to initialize/provide services/repositories that require
// authentication, like the data service.
class Home extends StatefulWidget {
  final User user;

  const Home({required this.user, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    ShimDataService.initialize(user: widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const PlanningScreen();
  }
}
