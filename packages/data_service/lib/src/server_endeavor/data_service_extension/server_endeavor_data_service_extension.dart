import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';
import '../model_extension/firestore_server_endeavor_extension.dart';

extension ServerEndeavorDataServiceExtension on DataService {
  static Stream<List<ServerEndeavor>> get serverEndeavorsStream =>
      DataService.userDataDoc
          .collection('endeavors')
          .snapshots()
          .transform(_querySnapToServerEndeavorListTransformer);

  static final _querySnapToServerEndeavorListTransformer = StreamTransformer<
      QuerySnapshot<Map<String, dynamic>>, List<ServerEndeavor>>.fromHandlers(
    handleData: (querySnap, sink) => sink.add(querySnap.docs
        .map((docSnap) => FirestoreServerEndeavorExtension.fromDocSnap(docSnap))
        .toList()),
  );

  static void updateEndeavor(Endeavor endeavor) async {
    await DataService.userDataDoc
        .collection("endeavors")
        .doc(endeavor.id)
        .update(ServerEndeavor.fromEndeavor(endeavor).toData());
  }

  static void planEndeavor(Endeavor endeavor) async {
    // call firebase plan cloud function on this endeavor
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('planEndeavor');
    await callable.call(<String, dynamic>{
      'userId': DataService.userDataDoc.id,
      'endeavorId': endeavor.id,
    });
  }
}
