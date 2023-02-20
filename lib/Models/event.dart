class Event {
  DateTime? start;
  DateTime? end;

  Event({this.start, this.end});

  bool validate() {
    return start != null && end != null && end!.isAfter(start!);
  }
}
