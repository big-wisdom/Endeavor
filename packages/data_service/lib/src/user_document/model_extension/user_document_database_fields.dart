enum UserDocumentDatabaseFields {
  primaryEndeavorIds,
}

extension UserDocumentStrings on UserDocumentDatabaseFields {
  String string() {
    switch (this) {
      case UserDocumentDatabaseFields.primaryEndeavorIds:
        return 'primaryEndeavorIds';
    }
  }
}
