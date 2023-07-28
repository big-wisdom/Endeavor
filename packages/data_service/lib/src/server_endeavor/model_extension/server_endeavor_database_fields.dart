enum ServerEndeavorDataFields {
  title,
  subEndeavorIds,
  taskIds,
  parentEndeavorId,
  color,
}

extension ServerEndeavorStrings on ServerEndeavorDataFields {
  String string() {
    switch (this) {
      case ServerEndeavorDataFields.title:
        return "title";
      case ServerEndeavorDataFields.subEndeavorIds:
        return "subEndeavorIds";
      case ServerEndeavorDataFields.taskIds:
        return "taskIds";
      case ServerEndeavorDataFields.parentEndeavorId:
        return "parentEndeavorId";
      case ServerEndeavorDataFields.color:
        return "color";
    }
  }
}
