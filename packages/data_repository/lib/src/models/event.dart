import 'package:equatable/equatable.dart';

class Event extends Equatable {
  const Event({this.start, this.end});

  final DateTime? start;
  final DateTime? end;

  Duration? get duration {
    if (start != null && end != null) {
      return start!.difference(end!);
    }

    return null;
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

  bool validate() {
    return start != null && end != null && end!.isAfter(start!);
  }

  @override
  List<Object?> get props => [start, end];
}
