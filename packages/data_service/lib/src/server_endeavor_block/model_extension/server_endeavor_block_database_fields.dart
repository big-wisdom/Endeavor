enum ServerEndeavorBlockDataFields {
  endeavorId,
  serverEvent,
  repeatingEndeavorBlockId,
}

extension ServerEndeavorBlockStrings on ServerEndeavorBlockDataFields {
  String string() {
    switch (this) {
      case ServerEndeavorBlockDataFields.endeavorId:
        return "endeavorId";
      case ServerEndeavorBlockDataFields.serverEvent:
        return "serverEvent";
      case ServerEndeavorBlockDataFields.repeatingEndeavorBlockId:
        return "repeatingEndeavorBlockId";
    }
  }
}
