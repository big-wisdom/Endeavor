import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:endeavor/Models/calendar_event/calendar_event.dart';
import 'package:endeavor/Models/calendar_event/repeating_calendar_event.dart';
import 'package:endeavor/Models/event/event.dart';
import 'package:endeavor/Models/event/repeating_event.dart';
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
  late RepeatingCalendarEvent repeatingCalendarEvent;
  late bool editing;

  @override
  void initState() {
    // Initialize calendar event if there's not one
    editing = widget.calendarEvent != null ? true : false;
    calendarEvent = widget.calendarEvent ??
        CalendarEvent(
          event: Event.generic(const Duration(hours: 1)),
          type: CalendarEventType.single,
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
                    if (editing) {
                      throw UnimplementedError(
                        "Need to implement what happens when editing a calendar event",
                      );
                    } else {
                      calendarEvent.title = value;
                      repeatingCalendarEvent.title = value;
                    }
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
                      onChanged: (endeavorId) =>
                          calendarEvent.endeavorId = endeavorId,
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
                        throw UnimplementedError(
                          "Need to handle event change while editing",
                        );
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
              ],
            ),
          ),
        ),
      ),
    );
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
