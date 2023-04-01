import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:endeavor/Models/calendar_event/calendar_event.dart';
import 'package:endeavor/Models/calendar_event/repeating_calendar_event.dart';
import 'package:endeavor/Models/event/event.dart';
import 'package:endeavor/Models/event/repeating_event.dart';
import 'package:endeavor/widgets/change_for_this_or_all_dialogue.dart';
import 'package:endeavor/widgets/endeavor_dropdown_button.dart';
import 'package:endeavor/widgets/one_time_event_picker.dart';
import 'package:endeavor/widgets/repeating_event_picker.dart';
import 'package:flutter/material.dart';

class CreateOrEditCalendarEvent extends StatefulWidget {
  const CreateOrEditCalendarEvent._(
      {required this.uid, this.calendarEvent, super.key});

  factory CreateOrEditCalendarEvent.create({required String uid, key}) {
    return CreateOrEditCalendarEvent._(uid: uid, key: key);
  }

  factory CreateOrEditCalendarEvent.edit(
      {required String uid, required CalendarEvent calendarEvent, key}) {
    return CreateOrEditCalendarEvent._(
      uid: uid,
      calendarEvent: calendarEvent,
      key: key,
    );
  }

  final String uid;
  final CalendarEvent? calendarEvent;

  @override
  State<CreateOrEditCalendarEvent> createState() =>
      _CreateOrEditCalendarEventState();
}

class _CreateOrEditCalendarEventState extends State<CreateOrEditCalendarEvent> {
  late CalendarEvent calendarEvent;
  late CalendarEvent initialCalendarEvent;
  late RepeatingCalendarEvent repeatingCalendarEvent;
  late bool editing;
  bool changesMade = false;

  @override
  void initState() {
    // Initialize calendar event if there's not one
    editing = widget.calendarEvent != null ? true : false;
    calendarEvent = widget.calendarEvent ??
        CalendarEvent(
          event: Event.generic(const Duration(hours: 1)),
          type: CalendarEventType.single,
        );
    initialCalendarEvent = CalendarEvent(
      event: calendarEvent.event,
      title: calendarEvent.title,
      endeavorId: calendarEvent.endeavorId,
      type: calendarEvent.type,
      id: calendarEvent.id,
    );
    repeatingCalendarEvent = RepeatingCalendarEvent(
      repeatingEvent: RepeatingEvent(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        startTime: TimeOfDay.now(),
        endTime: TimeOfDay.fromDateTime(
          DateTime.now().add(
            const Duration(hours: 1),
          ),
        ),
        daysOfWeek: [false, false, false, false, false, false, false],
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Event"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Title field
                TextFormField(
                  initialValue: calendarEvent.title,
                  decoration: const InputDecoration(labelText: "Title"),
                  onChanged: (value) {
                    calendarEvent.title = value;
                    repeatingCalendarEvent.title = value;
                    setState(() {
                      changesMade = initialCalendarEvent != calendarEvent;
                    });
                  },
                ),
                // Endeavor Switcher
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Endeavor"),
                    EndeavorsDropdownButton(
                      firstValue: calendarEvent.endeavorId,
                      uid: widget.uid,
                      onChanged: (endeavorId) {
                        calendarEvent.endeavorId = endeavorId;
                        setState(() {
                          changesMade = initialCalendarEvent != calendarEvent;
                        });
                      },
                      nullOption: true,
                    ),
                  ],
                ),
                // Type picker
                if (!editing)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Type:'),
                      DropdownButton(
                        value: calendarEvent.type,
                        items: const [
                          DropdownMenuItem(
                            value: CalendarEventType.single,
                            child: Text("One Time"),
                          ),
                          DropdownMenuItem(
                            value: CalendarEventType.repeating,
                            child: Text("Repeated"),
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value != calendarEvent.type && value != null) {
                              // we are creating so we just need to switch the value
                              calendarEvent.type = value;
                              changesMade =
                                  initialCalendarEvent != calendarEvent;
                            }
                          });
                        },
                      )
                    ],
                  ),
                // One time event picker
                if (calendarEvent.type == CalendarEventType.single || editing)
                  OneTimeEventPicker(
                    event: calendarEvent.event!,
                    onChanged: (value) {
                      if (editing) {
                        setState(() {
                          changesMade = initialCalendarEvent != calendarEvent;
                        });
                      } else {
                        calendarEvent.event = value;
                      }
                    },
                  ),

                // repeating event picker
                if (calendarEvent.type == CalendarEventType.repeating &&
                    !editing)
                  RepeatingEventPicker(
                    repeatingEvent: repeatingCalendarEvent.repeatingEvent!,
                    onChanged: (repeatingEvent) {
                      repeatingCalendarEvent.repeatingEvent = repeatingEvent;
                    },
                  ),

                // Create button
                if (!editing)
                  ElevatedButton(
                    onPressed: () {
                      if (calendarEvent.type == CalendarEventType.single) {
                        _createSingleEvent();
                      } else {
                        _createRepeatingEvent();
                      }
                      // TODO: implement something to tell the user when they messed up
                      Navigator.pop(context);
                    },
                    child: const Text("Create"),
                  ),
                if (editing)
                  ElevatedButton(
                    onPressed: changesMade ? _saveChanges : null,
                    child: const Text("Save"),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveChanges() {
    if (calendarEvent.type == CalendarEventType.single) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(widget.uid)
          .collection('calendarEvents')
          .doc(calendarEvent.id)
          .update(calendarEvent.toDocData()!);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ChangeForThisOrAllDialogue(
            onThis: () {
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(widget.uid)
                  .collection('calendarEvents')
                  .doc(calendarEvent.id)
                  .update(calendarEvent.toDocData()!);
            },
            onFollowing: () {
              HttpsCallable callable = FirebaseFunctions.instance
                  .httpsCallable('editThisAndFollowingCalendarEvents');
              Map<String, dynamic> data = calendarEvent.toDocData()!;
              data["start"] =
                  (data["start"] as DateTime).millisecondsSinceEpoch;
              data["end"] = (data["end"] as DateTime).millisecondsSinceEpoch;
              callable.call(<String, dynamic>{
                'userId': widget.uid,
                'repeatingCalendarEventId':
                    calendarEvent.repeatingCalendarEventId,
                'selectedCalendarEventId': calendarEvent.id,
                'data': {}
              }).then((resp) {
                debugPrint("Result: ${resp.data}");
              });
              Navigator.pop(context);
              Navigator.pop(context);
            },
          );
        },
      );
    }
  }

  void _createSingleEvent() {
    final docData = calendarEvent.toDocData();
    if (docData != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .collection("calendarEvents")
          .add(docData);
    }
  }

  void _createRepeatingEvent() {
    List<CalendarEvent>? calendarEvents = repeatingCalendarEvent.calendarEvents;
    if (calendarEvents != null) {
      final batch = FirebaseFirestore.instance.batch();

      // Create a doc to connect all the repeated blocks
      final repeatingDocRef = FirebaseFirestore.instance
          .collection("users")
          .doc(widget.uid)
          .collection("repeatingCalendarEvents")
          .doc();

      repeatingCalendarEvent.calendarEventIds = [];
      // create a doc for each block
      for (CalendarEvent ce in calendarEvents) {
        final docRef = FirebaseFirestore.instance
            .collection("users")
            .doc(widget.uid)
            .collection("calendarEvents")
            .doc();

        // link new doc ref to repeating doc
        repeatingCalendarEvent.calendarEventIds!.add(docRef.id);
        // link repeating doc ref to new doc
        ce.repeatingCalendarEventId = repeatingDocRef.id;
        batch.set(docRef, ce.toDocData());
      }

      final rceDocData = repeatingCalendarEvent.toDocData();
      if (rceDocData != null) {
        batch.set(repeatingDocRef, rceDocData);
      }
      batch.commit();
    } else {
      throw Exception(
        "This repeating calendar event doesn't have any valid calendar events",
      );
    }
  }
}
