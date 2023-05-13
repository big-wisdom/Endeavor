import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/calendar_event/calendar_event.dart';
import 'package:endeavor/Models/endeavor_block/endeavor_block.dart';
import 'package:endeavor/Models/event/event.dart';
import 'package:endeavor/Models/task.dart';
import 'package:endeavor/screens/planning/calendar/create_endeavor_block.dart';
import 'package:endeavor/screens/planning/calendar/create_or_edit_event.dart';
import 'package:endeavor/screens/planning/planning_screen.dart';
import 'package:endeavor/screens/planning/tasks/create_or_edit_task.dart';
import 'package:endeavor/util.dart';
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
    // Endeavor blocks stream
    Stream<QuerySnapshot<Map<String, dynamic>>> endeavorBlocksStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('endeavorBlocks')
            .snapshots();

    // Tasks stream
    Stream<QuerySnapshot<Map<String, dynamic>>> taskStream = FirebaseFirestore
        .instance
        .collection('users')
        .doc(uid)
        .collection('tasks')
        .snapshots();

    // Calendar Events stream
    Stream<QuerySnapshot<Map<String, dynamic>>> calendarEventStream =
        FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('calendarEvents')
            .snapshots();

    // Stream builder off that stream
    return StreamBuilder3(
      streams:
          StreamTuple3(endeavorBlocksStream, taskStream, calendarEventStream),
      builder: (context, snapshots) {
        List<Future<FlutterWeekViewEvent>>? endeavorBlocks;
        List<FlutterWeekViewEvent>? scheduledTasks;
        List<FlutterWeekViewEvent>? calendarEvents;

        // convert the endeavorBlock docs into a list of FlutterWeekView futures
        if (snapshots.snapshot1.hasData) {
          endeavorBlocks = snapshots.snapshot1.data!.docs
              .map(
            (docSnap) => EndeavorBlock.fromDocSnap(
                docSnapData: docSnap.data(), id: docSnap.id),
          )
              .map((block) async {
            final endeavorDocSnapData = await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('endeavors')
                .doc(block.endeavorId)
                .get()
                .then((value) => value.data());

            String title = endeavorDocSnapData!['text'];

            Color? color = const Color(0xFF007AFF);
            if (endeavorDocSnapData['settings'] != null &&
                endeavorDocSnapData['settings']['color'] != null) {
              color = Color(
                int.parse("0xFF${endeavorDocSnapData['settings']['color']}"),
              );
            }
            String description = "";
            return FlutterWeekViewEvent(
              title: title,
              backgroundColor: color,
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
            if (docData["events"] != null) {
              List<FlutterWeekViewEvent> taskEvents =
                  (docData['events'] as List).map((e) {
                e as Map<String, dynamic>;
                return Event(
                  start: DateTime.fromMicrosecondsSinceEpoch(
                      (e["start"] as Timestamp).microsecondsSinceEpoch),
                  end: DateTime.fromMicrosecondsSinceEpoch(
                      (e["end"] as Timestamp).microsecondsSinceEpoch),
                );
              }).map((e) {
                return FlutterWeekViewEvent(
                  title: docData['title'],
                  description: "",
                  start: e.start!,
                  end: e.end!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateOrEditTask.edit(
                            uid: uid,
                            task: Task.fromDocSnap(taskDocSnap),
                          );
                        },
                      ),
                    );
                  },
                );
              }).toList();

              if (scheduledTasks != null) {
                scheduledTasks.addAll(taskEvents);
              } else {
                scheduledTasks = taskEvents;
              }
            }
          }
        }

        // Make a list of FlutterWeekViewEvents for the calendarEvents
        if (snapshots.snapshot3.hasData) {
          for (var calendarEventDocSnap in snapshots.snapshot3.data!.docs) {
            final docData = calendarEventDocSnap.data();
            if (docData['start'] != null && docData['end'] != null) {
              final start = DateTime.fromMicrosecondsSinceEpoch(
                  (docData['start'] as Timestamp).microsecondsSinceEpoch);
              final end = DateTime.fromMicrosecondsSinceEpoch(
                  (docData['end'] as Timestamp).microsecondsSinceEpoch);

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
                        return CreateOrEditCalendarEvent.edit(
                          calendarEvent:
                              CalendarEvent.fromDocSnap(calendarEventDocSnap),
                          uid: uid,
                        );
                      },
                    ),
                  );
                },
              );

              if (calendarEvents != null) {
                calendarEvents.add(event);
              } else {
                calendarEvents = [event];
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

              List<List<FlutterWeekViewEvent>?> additions = [
                scheduledTasks,
                calendarEvents
              ];
              for (var addition in additions) {
                if (events == null) {
                  events = addition;
                } else {
                  if (addition != null) {
                    events.addAll(addition);
                  }
                }
              }
              events ??= [];

              return LayoutBuilder(builder: (context, constraints) {
                return WeekView(
                  dayBarStyleBuilder: (date) {
                    return DayBarStyle(
                      dateFormatter: (year, month, day) {
                        return DateTime(year, month, day).toCustomString();
                      },
                    );
                  },
                  hoursColumnStyle: HoursColumnStyle(
                    timeFormatter: (time) =>
                        "${time.hour > 12 ? time.hour - 12 : time.hour}:${time.minute.toString().padLeft(2, '0')}",
                  ),
                  // generate a list of the days of the week for the selected date
                  dates: getMonthRange(),
                  events: events!,
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

  List<DateTime> getMonthRange() {
    List<DateTime> dates = [];

    // Start at 30 days ago
    DateTime date = DateTime.now().subtract(const Duration(days: 30));

    // Loop until 30 days from now
    while (date.isBefore(DateTime.now().add(const Duration(days: 30)))) {
      dates.add(DateTime.utc(date.year, date.month, date.day));
      date = date.add(const Duration(days: 1));
    }

    return dates;
  }
}
