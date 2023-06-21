import 'package:equatable/equatable.dart';

class Event extends Equatable {
  const Event({required this.start, required this.end});

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
}
