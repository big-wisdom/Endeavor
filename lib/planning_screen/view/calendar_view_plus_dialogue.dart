import 'package:endeavor/endeavor_block_screen/endeavor_block_screen.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:flutter/material.dart';

class CalendarViewPlusDialogue extends StatelessWidget {
  const CalendarViewPlusDialogue({super.key});

  @override
  Widget build(BuildContext context) {
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
                      return EndeavorBlockScreen.create();
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
                    return const CalendarEventScreen.create();
                  }),
                );
              },
              child: const Text("Event"),
            )
          ],
        ),
      ),
    );
  }
}
