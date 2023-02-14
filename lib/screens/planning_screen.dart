import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlanningScreen extends StatelessWidget {
  const PlanningScreen({super.key});

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
      body: const Center(
        child: Text(
          "Hello from the planning screen",
        ),
      ),
    );
  }
}
