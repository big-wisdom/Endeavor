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

    // check start
    bool startSame = false;
    if ((other as Event).start == null) {
      if (start == null) {
        startSame = true; // both are null
      } else {
        startSame = false; // other.start null but start isnt
      }
    } else {
      if (start == null) {
        return false; // other.start not null but start is
      } else {
        return other.start!
            .isAtSameMomentAs(start!); // neither are null so compare them
      }
    }

    // check end
    bool endSame = false;
    if (other.end == null) {
      if (end == null) {
        endSame = true; // both are null
      } else {
        endSame = false; // other.end null but end isnt
      }
    } else {
      if (end == null) {
        return false; // other.end not null but end is
      } else {
        return other.end!
            .isAtSameMomentAs(end!); // neither are null so compare them
      }
    }

    return startSame && endSame;
  }

  @override
  int get hashCode => start.hashCode + end.hashCode;
}
