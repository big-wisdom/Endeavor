import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/screens/planning/calendar/create_endeavor_block.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:flutter/material.dart';

class CalendarWeekView extends StatelessWidget {
  const CalendarWeekView(
      {required this.selectedDate,
      required this.uid,
      required this.setCalendarView,
      super.key});

  final String uid;
  final DateTime selectedDate;
  final Function(CalendarView, DateTime) setCalendarView;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    // get stream of endeavor block doc snaps
    Stream<QuerySnapshot<Map<String, dynamic>>> endeavorBlocksStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('endeavorBlocks')
            .snapshots();

    // Stream builder off that stream
    return StreamBuilder(
      stream: endeavorBlocksStream,
      builder: (context, snapshot) {
        List<Future<FlutterWeekViewEvent>>? endeavorBlocks;

        // convert the docs into a list of FlutterWeekView futures
        if (snapshot.hasData) {
          endeavorBlocks = snapshot.data!.docs
              .map((docSnap) => EndeavorBlock.fromDocSnap(
                  docSnapData: docSnap.data(), id: docSnap.id))
              .map((block) async {
            String title = (await FirebaseFirestore.instance
                    .collection('users')
                    .doc(uid)
                    .collection('endeavors')
                    .doc(block.endeavorId)
                    .get())
                .data()!['text'];
            String description = "";
            return FlutterWeekViewEvent(
              title: title,
              description: description,
              start: block.event!.start!,
              end: block.event!.end!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CreateEndeavorBlock(
                        endeavorBlock: block,
                        uid: uid,
                        setCalendarView: setCalendarView,
                      );
                    },
                  ),
                );
              },
            );
          }).toList();
        } else {
          return const Text("Loading...");
        }

        // wrap the list of futures in one future that waits for them all
        return FutureBuilder(
          future: Future<List<FlutterWeekViewEvent>?>(() async {
            if (endeavorBlocks == null) {
              return null;
            } else {
              List<FlutterWeekViewEvent> events = [];
              for (Future<FlutterWeekViewEvent> item in endeavorBlocks) {
                events.add(await item);
              }
              return events;
            }
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return LayoutBuilder(builder: (context, constraints) {
                return WeekView(
                  // generate a list of the days of the week for the selected date
                  dates: List<DateTime>.generate(
                    7,
                    (index) {
                      return date
                          .add(Duration(days: (index + 1) - date.weekday));
                    },
                    growable: false,
                  ),
                  events: snapshot.data,
                  style: WeekViewStyle(dayViewWidth: constraints.maxWidth),
                );
              });
            } else {
              return const Text("Loading...");
            }
          },
        );
      },
    );
  }
}
