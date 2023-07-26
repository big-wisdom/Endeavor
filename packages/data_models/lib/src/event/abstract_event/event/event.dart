import 'package:data_models/data_models.dart';

class Event extends AbstractEvent {
  Event({required this.start, required this.end});

  final DateTime start;
  final DateTime end;

  Duration get duration {
    return start.difference(end);
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
