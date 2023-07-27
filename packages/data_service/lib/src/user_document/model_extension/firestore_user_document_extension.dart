import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:server_data_models/server_data_models.dart';
import 'user_document_database_fields.dart';

extension FirestoreUserDocumentExtension on UserDocument {
  static UserDocument fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    final docSnapData = docSnap.data();
    if (docSnapData != null) {
      return UserDocument(
        primaryEndeavorIds:
            docSnapData[UserDocumentDatabaseFields.primaryEndeavorIds.string()],
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
