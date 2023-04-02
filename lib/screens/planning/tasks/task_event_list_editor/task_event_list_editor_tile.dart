import 'package:endeavor/Models/event/event.dart';
import 'package:flutter/material.dart';

class TaskEventListEditorTile extends StatelessWidget {
  const TaskEventListEditorTile({required this.event, super.key});
  final Event event;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${event.end!.difference(event.start!).inMinutes} minutes"),
      subtitle: Text(_getSubtitle()),
    );
  }

  String _getSubtitle() {
    final buffer = StringBuffer();
    final now = DateTime.now();
    final days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];

    // Write start time
    // Write today if today
    if (now.year == event.start!.year &&
        now.month == event.start!.month &&
        now.day == event.start!.day) {
      buffer.write("Today ");
    } else {
      // write the day
      buffer.write("${days[event.start!.weekday - 1]} ");

      if (!_thisWeek(event.start!)) {
        // if not this week, write the date too
        buffer.write("${event.start!.day} ");
      }
    }
    // Write start time
    _writeTime(event.start!, buffer);

    buffer.write("- ");

    // if different day, write the day out
    if (event.end!.year != event.start!.year ||
        event.end!.month != event.start!.month ||
        event.end!.day != event.start!.day) {
      // write the day
      buffer.write("${days[event.end!.weekday - 1]} ");

      if (!_thisWeek(event.end!)) {
        // if not this week, write the date too
        buffer.write("${event.end!.day} ");
      }
    }
    // Write end time
    _writeTime(event.end!, buffer);

    return buffer.toString();
  }

  void _writeTime(DateTime dateTime, StringBuffer buffer) {
    buffer.write("${dateTime.hour}:");
    if (dateTime.minute < 10) {
      buffer.write("0${dateTime.minute}");
    } else {
      buffer.write(dateTime.minute);
    }
    buffer.write(" ");
  }

  bool _thisWeek(DateTime dateTime) {
    final now = DateTime.now();
    final daysLeft = 8 - now.weekday;
    final diff = dateTime.day - now.day;
    return diff > 0 && diff < daysLeft;
  }
}
