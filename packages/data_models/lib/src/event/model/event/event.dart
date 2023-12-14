import 'package:data_models/data_models.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:server_data_models/server_data_models.dart';

class Event extends AbstractEvent {
  Event({required this.start, required this.end});

  factory Event.fromServerEvent(ServerEvent serverEvent) {
    return Event(
      start: serverEvent.start,
      end: serverEvent.end,
    );
  }

  final DateTime start;
  final DateTime end;

  Duration get duration {
    return end.difference(start);
  }

  Event.generic(Duration? duration)
      : start = DateTime.now(),
        end = DateTime.now().add(duration ?? const Duration(hours: 1));

  Map<String, dynamic> toDocData() {
    return {
      'start': start,
      'end': end,
    };
  }

  @override
  List<Object?> get props => [start, end];

  @override
  List<Event> get events => [this];

  String getDescription() {
    final buffer = StringBuffer();
    final now = DateTime.now();
    final days = ["mon", "tue", "wed", "thu", "fri", "sat", "sun"];

    // Write start time
    // Write today if today
    if (now.year == start.year &&
        now.month == start.month &&
        now.day == start.day) {
      buffer.write("Today ");
    } else {
      // write the day
      buffer.write("${days[start.weekday - 1]} ");

      if (!_thisWeek(start)) {
        // if not this week, write the date too
        buffer.write("${start.day} ");
      }
    }
    // Write start time
    _writeTime(start, buffer);

    buffer.write("- ");

    // if different day, write the day out
    if (end.year != start.year ||
        end.month != start.month ||
        end.day != start.day) {
      // write the day
      buffer.write("${days[end.weekday - 1]} ");

      if (!_thisWeek(end)) {
        // if not this week, write the date too
        buffer.write("${end.day} ");
      }
    }
    // Write end time
    _writeTime(end, buffer);

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

Validator<Event?> eventValidator() {
  return (Event? event) {
    if (event == null) {
      return "There must be an event";
    } else if (event.start.compareTo(event.end) >= 0) {
      return "Event must start before it ends";
    }
    return null;
  };
}
