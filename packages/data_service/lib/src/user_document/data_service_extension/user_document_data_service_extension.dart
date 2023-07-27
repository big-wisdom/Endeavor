import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_service/data_service.dart';
import '../model_extension/firestore_user_document_extension.dart';
import 'package:server_data_models/server_data_models.dart';

extension UserDocumentDataServiceExtension on DataService {
  static Stream<UserDocument> get userDocStream {
    DataService.checkUserDoc();
    return DataService.userDataDoc!.snapshots().transform(
          _docSnapToUserDocumentTransformer,
        );
  }

  static final _docSnapToUserDocumentTransformer = StreamTransformer<
      DocumentSnapshot<Map<String, dynamic>>, UserDocument>.fromHandlers(
    handleData: (data, sink) =>
        sink.add(FirestoreUserDocumentExtension.fromDocSnap(data)),
  );
}
