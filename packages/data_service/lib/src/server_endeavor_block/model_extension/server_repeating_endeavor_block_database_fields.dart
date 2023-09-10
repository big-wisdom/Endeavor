enum ServerRepeatingEndeavorBlockDataFields {
  id,
  endeavorBlockIds,
}

extension ServerRepeatingEndeavorBlockStrings
    on ServerRepeatingEndeavorBlockDataFields {
  String text() {
    switch (this) {
      case ServerRepeatingEndeavorBlockDataFields.id:
        return "id";
      case ServerRepeatingEndeavorBlockDataFields.endeavorBlockIds:
        return "endeavorBlockIds";
    }
  }
}
