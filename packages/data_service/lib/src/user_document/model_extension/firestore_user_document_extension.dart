import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:server_data_models/server_data_models.dart';
import 'user_document_database_fields.dart';

extension FirestoreUserDocumentExtension on UserDocument {
  static UserDocument fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    final docSnapData = docSnap.data();
    if (docSnapData != null) {
      // get primary endeavorIds out of the document
      final idsData =
          docSnapData[UserDocumentDatabaseFields.primaryEndeavorIds.string()];
      List<String> ids;
      if (idsData != null) {
        ids = (idsData as List).map((e) => e as String).toList();
      } else {
        ids = [];
      }

      return UserDocument(
        primaryEndeavorIds: ids,
      );
    } else {
      throw Exception("No user doc data");
    }
  }

  Map<String, dynamic> toData() {
    return {
      UserDocumentDatabaseFields.primaryEndeavorIds.string():
          primaryEndeavorIds,
    };
  }
}
