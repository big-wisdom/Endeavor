import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/screens/planning/calendar.dart';
import 'package:endeavor/screens/planning/endeavors.dart';
import 'package:endeavor/screens/planning/tasks.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planning"),
        actions: [
          DropdownButton(
            icon: const Icon(Icons.more_vert),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Row(children: const [
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
        const Tasks(),
        const Calendar(),
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
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (ctx) {
                var text = '';
                final formKey = GlobalKey<FormState>();

                return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(ctx).viewInsets.bottom),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(labelText: 'Text:'),
                          validator: (value) {
                            if (value == null || value == "") {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            if (value != null) text = value;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final isValid = formKey.currentState?.validate();
                            FocusScope.of(context).unfocus();
                            if (isValid != null && isValid) {
                              formKey.currentState?.save();
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(widget.user.uid)
                                  .collection('endeavors')
                                  .add({"text": text});
                            }
                          },
                          child: const Text("Add"),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
