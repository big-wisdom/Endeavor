import 'package:endeavor/screens/planning/endeavors/add_endeavor.dart';
import 'package:endeavor/screens/planning/calendar/calendar.dart';
import 'package:endeavor/screens/planning/calendar/create_endeavor_block.dart';
import 'package:endeavor/screens/planning/endeavors/endeavors.dart';
import 'package:endeavor/screens/planning/tasks/create_or_edit_task.dart';
import 'package:endeavor/screens/planning/tasks/tasks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({required this.user, super.key});

  final User user;

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  var currentPageIndex = 0;
  var calendarView = CalendarView.month;
  DateTime selectedDate = DateTime.now();
  void setCalendarView(CalendarView view, [DateTime? date]) {
    setState(() {
      calendarView = view;
      if (date != null) {
        selectedDate = date;
      }
    });
  }

  void addEndeavor() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return AddEndeavor(user: widget.user);
        });
  }

  void addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CreateOrEditTask.create(uid: widget.user.uid);
        },
      ),
    );
  }

  void createEndeavorBlock() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CreateOrEditEndeavorBlock.create(
            uid: widget.user.uid,
            setCalendarView: setCalendarView,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planning"),
        actions: [
          if (currentPageIndex == 2)
            DropdownButton(
              value: calendarView,
              items: const [
                DropdownMenuItem(
                    value: CalendarView.month, child: Text("Month")),
                DropdownMenuItem(value: CalendarView.week, child: Text("Week")),
              ],
              onChanged: (value) {
                if (value != null) {
                  setCalendarView(value);
                }
              },
            ),
          DropdownButton(
            icon: const Icon(Icons.more_vert),
            items: const [
              DropdownMenuItem(
                value: 'logout',
                child: Row(children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 8),
                  Text("Logout")
                ]),
              )
            ],
            onChanged: (value) {
              if (value == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: [
        Endeavors(user: widget.user),
        Tasks(user: widget.user),
        Calendar(
            mode: calendarView,
            selectedDate: selectedDate,
            setCalendarView: setCalendarView,
            uid: widget.user.uid),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore), label: "Endeavors"),
          NavigationDestination(icon: Icon(Icons.task_alt), label: "Tasks"),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (currentPageIndex == 0) {
            addEndeavor();
          } else if (currentPageIndex == 1) {
            addTask();
          } else if (currentPageIndex == 2) {
            createEndeavorBlock();
          }
        },
      ),
    );
  }
}

enum CalendarView { month, week }
