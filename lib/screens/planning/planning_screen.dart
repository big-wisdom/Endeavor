import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/screens/planning/calendar/create_or_edit_event.dart';
import 'package:endeavor/screens/planning/endeavors/add_endeavor.dart';
import 'package:endeavor/screens/planning/calendar/calendar.dart';
import 'package:endeavor/screens/planning/calendar/create_endeavor_block.dart';
import 'package:endeavor/screens/planning/endeavors/endeavors.dart';
import 'package:endeavor/screens/planning/tasks/create_or_edit_task.dart';
import 'package:endeavor/screens/planning/tasks/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:endeavor/app/app.dart';

class PlanningScreen extends StatefulWidget {
  const PlanningScreen({super.key});

  static Page<void> page() => const MaterialPage<void>(child: PlanningScreen());

  @override
  State<PlanningScreen> createState() => _PlanningScreenState();
}

class _PlanningScreenState extends State<PlanningScreen> {
  var currentPageIndex = 0;
  var calendarView = CalendarView.month;
  DateTime selectedDate = DateTime.now();
  String? uid;

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
          return AddEndeavor(
            uid: uid!,
            onAdd: _addPrimaryEndeavor,
          );
        });
  }

  void addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CreateOrEditTask.create(uid: uid!);
        },
      ),
    );
  }

  void calendarViewAdd() {
    showDialog(
      context: context,
      builder: (context) {
        return Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Select what to add"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateOrEditEndeavorBlock.create(
                            uid: uid!,
                            setCalendarView: setCalendarView,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text("Endeavor Block"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CreateOrEditCalendarEvent.create(
                          uid: uid!,
                        );
                      }),
                    );
                  },
                  child: const Text("Event"),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (uid == null) {
      setState(() {
        uid = context.read<AppBloc>().state.user.id;
      });
    }

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
                context.read<AppBloc>().add(const AppLogoutRequested());
              }
            },
          )
        ],
      ),
      body: [
        Endeavors(uid: uid!),
        Tasks(uid: uid!),
        Calendar(
            mode: calendarView,
            selectedDate: selectedDate,
            setCalendarView: setCalendarView,
            uid: uid!),
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
            calendarViewAdd();
          }
        },
      ),
    );
  }

  void _addPrimaryEndeavor(String text) async {
    // Create endeavor document
    final endeavorDocRef = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('endeavors')
        .add({"text": text});
    // Create reference to it as a primary endeavor on the user doc
    // get user doc
    final userDocSnap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    // get current list
    final docData = userDocSnap.data()!;
    var primaryEndeavorIds = docData['primaryEndeavorIds'];
    Map<String, dynamic> newData;
    if (primaryEndeavorIds == null) {
      // if no list create one with one entry
      newData = {
        "primaryEndeavorIds": [endeavorDocRef.id]
      };
    } else {
      // if there is a list update it locally then on firebase
      primaryEndeavorIds =
          (primaryEndeavorIds as List).map((id) => id as String).toList();
      primaryEndeavorIds.add(endeavorDocRef.id);
      newData = {
        "primaryEndeavorIds": primaryEndeavorIds,
      };
    }
    FirebaseFirestore.instance.collection("users").doc(uid).update(newData);
  }
}

enum CalendarView { month, week }
