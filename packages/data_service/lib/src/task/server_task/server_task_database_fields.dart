enum ServerTaskDatabaseFields {
  title,
  endeavorId,
  duration,
  minnimumSchedulingDuration,
  dueDate,
  divisible,
  events,
}

extension ServerTaskStrings on ServerTaskDatabaseFields {
  String string() {
    switch (this) {
      case ServerTaskDatabaseFields.title:
        return "title";
      case ServerTaskDatabaseFields.endeavorId:
        return "endeavorId";
      case ServerTaskDatabaseFields.duration:
        return "duration";
      case ServerTaskDatabaseFields.minnimumSchedulingDuration:
        return "minnimumSchedulingDuration";
      case ServerTaskDatabaseFields.dueDate:
        return "dueDate";
      case ServerTaskDatabaseFields.divisible:
        return "divisible";
      case ServerTaskDatabaseFields.events:
        return "events";
    }
  }
}
