import 'package:data_repository/data_repository.dart';

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
  // TODO: implement events
  List<Event> get events => [this];
}
