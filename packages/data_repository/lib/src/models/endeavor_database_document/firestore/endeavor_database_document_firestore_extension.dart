import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension EndeavorDatabaseDocumentFirestoreExtension
    on EndeavorDatabaseDocument {
  static EndeavorDatabaseDocument fromDocData(
      String id, Map<String, dynamic> data) {
    return EndeavorDatabaseDocument(
      id: id,
      title: data['title'],
      color: Color(
        int.parse("0xFF${data['color']}"),
      ),
    );
  }

  static final endeavorDatabaseDocumentTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>,
      List<EndeavorDatabaseDocument>>.fromHandlers(
    handleData: (querySnapshot, sink) => querySnapshot.docs.map(
      (e) => fromDocData(e.id, e.data()),
    ),
  );

  static final listOfDatabaseDocToMapTransformer = StreamTransformer<
      List<EndeavorDatabaseDocument>,
      Map<String, EndeavorDatabaseDocument>>.fromHandlers(
    handleData: (data, sink) =>
        Map<String, EndeavorDatabaseDocument>.fromIterable(
      data,
      key: (element) => element.id,
      value: (element) => element,
    ),
  );
}
