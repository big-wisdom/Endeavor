enum ServerEventDatabaseFields {
  start,
  end,
}

extension ServerEventStrings on ServerEventDatabaseFields {
  String string() {
    switch (this) {
      case ServerEventDatabaseFields.start:
        return "start";
      case ServerEventDatabaseFields.end:
        return "end";
    }
  }
}
