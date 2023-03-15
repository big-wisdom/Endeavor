import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/calendar/create_endeavor_block.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:endeavor/screens/planning/tasks/create_or_edit_task.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

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

    Stream<QuerySnapshot<Map<String, dynamic>>> taskStream = FirebaseFirestore
        .instance
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .snapshots();

    // Stream builder off that stream
    return StreamBuilder2(
      streams: StreamTuple2(endeavorBlocksStream, taskStream),
      builder: (context, snapshots) {
        List<Future<FlutterWeekViewEvent>>? endeavorBlocks;
        List<FlutterWeekViewEvent>? scheduledTasks;

        // convert the endeavorBlock docs into a list of FlutterWeekView futures
        if (snapshots.snapshot1.hasData) {
          endeavorBlocks = snapshots.snapshot1.data!.docs
              .map((docSnap) => EndeavorBlock.fromDocSnap(
                  docSnapData: docSnap.data(), id: docSnap.id))
              .map((block) async {
            String title = (await FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .collection('endeavors')
                        .doc(block.endeavorId)
                        .get())
                    .data()?['text'] ??
                "Loading...";
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
                      return CreateOrEditEndeavorBlock.edit(
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

        // make a list of FlutterWeekViewEvents for the scheduled tasks
        if (snapshots.snapshot2.hasData) {
          for (var taskDocSnap in snapshots.snapshot2.data!.docs) {
            final docData = taskDocSnap.data();
            if (docData['start'] != null && docData['duration'] != null) {
              final start = DateTime.fromMicrosecondsSinceEpoch(
                  (docData['start'] as Timestamp).microsecondsSinceEpoch);
              final end = DateTime.fromMicrosecondsSinceEpoch(
                      (docData['start'] as Timestamp).microsecondsSinceEpoch)
                  .add(Duration(minutes: docData['duration']));
              final event = FlutterWeekViewEvent(
                title: docData['title'],
                description: "",
                start: start,
                end: end,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CreateOrEditTask.edit(
                          task: Task.fromDocSnap(taskDocSnap),
                          uid: uid,
                        );
                      },
                    ),
                  );
                },
              );

              if (scheduledTasks != null) {
                scheduledTasks.add(event);
              } else {
                scheduledTasks = [event];
              }
            }
          }
        }

        // Wait for all the endeavorBlock futures then build the week view
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
              // add whatever is in snapshot data
              List<FlutterWeekViewEvent>? events = snapshot.data;

              if (events == null) {
                // if there was nothing, add scheduled tasks
                events = scheduledTasks;
              } else if (scheduledTasks != null) {
                // if there was something and there are scheduled tasks, append scheduled tasks
                events.addAll(scheduledTasks);
              }
              // else leave as null and no problem

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
                  events: events,
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
