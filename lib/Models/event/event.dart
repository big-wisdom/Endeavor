class Event {
  DateTime? start;
  DateTime? end;

  Event({this.start, this.end});

  Event.generic(Duration? duration) {
    start = DateTime.now();
    end = DateTime.now().add(duration ?? const Duration(hours: 1));
  }

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
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;

    other as Event;

    // check start
    // if they don't both have a value, or if they're not at the same time
    if (!(other.start != null && start != null) ||
        !other.start!.isAtSameMomentAs(start!)) {
      return false;
    }

    // check end
    if (!(other.end != null && end != null) ||
        !other.end!.isAtSameMomentAs(end!)) {
      return false;
    }

    return true;
  }

  @override
  int get hashCode => start.hashCode + end.hashCode;
}
