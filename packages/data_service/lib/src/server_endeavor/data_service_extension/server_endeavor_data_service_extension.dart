import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_endeavor/model_extension/server_endeavor_database_fields.dart';
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

  static void createPrimaryEndeavor(String endeavorTitle) async {
    FirebaseFirestore.instance.runTransaction<bool>((transaction) async {
      // create endeavor document
      final newDocRef = DataService.userDataDoc.collection('endeavors').doc();
      transaction.set(
        newDocRef,
        {ServerEndeavorDataFields.title.string(): endeavorTitle},
      );

      // reference it under primaryEndeavorIds in the UserDocument
      transaction.update(DataService.userDataDoc, {
        UserDocumentDatabaseFields.primaryEndeavorIds.string():
            FieldValue.arrayUnion([newDocRef.id])
      });
      return true;
    });
  }

  static void reorderEndeavorTasks(
      String endeavorId, List<String> taskIds) async {
    DataService.userDataDoc
        .collection('endeavors')
        .doc(endeavorId)
        .update({'taskIds': taskIds});
  }

  static void reorderSubEndeavors(
      String endeavorId, List<String> subEndeavorIds) async {
    DataService.userDataDoc.collection('endeavors').doc(endeavorId).update(
        {ServerEndeavorDataFields.subEndeavorIds.string(): subEndeavorIds});
  }

  static void reorderPrimaryEndeavors(List<String> primaryEndeavorIds) async {
    DataService.userDataDoc.update({
      UserDocumentDatabaseFields.primaryEndeavorIds.string(): primaryEndeavorIds
    });
  }

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

  static void addSubEndeavor({
    required String parentEndeavorId,
    required String endeavorTitle,
  }) {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      // create new endeavor doc
      final newEndeavorDoc =
          DataService.userDataDoc.collection('endeavors').doc();
      transaction.set(newEndeavorDoc, {
        ServerEndeavorDataFields.title.string(): endeavorTitle,
        ServerEndeavorDataFields.parentEndeavorId.string(): parentEndeavorId,
      });
      // create reference to new endeavor doc in parent doc
      transaction.update(
        DataService.userDataDoc.collection('endeavors').doc(parentEndeavorId),
        {
          ServerEndeavorDataFields.subEndeavorIds.string():
              FieldValue.arrayUnion([newEndeavorDoc.id]),
        },
      );
    });
  }

  static Future<bool> deletePrimaryEndeavor(Endeavor endeavor) async {
    return FirebaseFirestore.instance.runTransaction<bool>((transaction) async {
      // delete the reference to the endeavor if it is primary
      if (endeavor.parentEndeavorId == null) {
        final userDocData =
            (await transaction.get(DataService.userDataDoc)).data();
        if (userDocData == null) {
          throw Exception("No user data!");
        }
        final primaryEndeavorIds =
            (userDocData[UserDocumentDatabaseFields.primaryEndeavorIds.string()]
                    as List)
                .map((e) => e as String)
                .toList();
        if (primaryEndeavorIds.remove(endeavor.id)) {
          transaction.update(DataService.userDataDoc,
              {'primaryEndeavorIds': primaryEndeavorIds});
        } else {
          throw Exception("this was not a primary endeavor!");
        }
      } else {
        throw Exception(
          "This is a non-primary endeavor. This function is constrained by name to primary endeavors",
        );
      }

      // delete the endeavor document itself
      transaction.delete(
          DataService.userDataDoc.collection("endeavors").doc(endeavor.id));

      return true;
      // all other associated data will be cleaned up by a cloud function
      // that responds when an endeavor is deleted
    });
  }

  static void deleteSubEndeavor(EndeavorReference endeavorReference) {
    DataService.userDataDoc
        .collection('endeavors')
        .doc(endeavorReference.id)
        .delete();
  }

  static void updateEndeavorColor({
    required String endeavorId,
    required Color color,
  }) {
    DataService.userDataDoc.collection('endeavors').doc(endeavorId).update({
      ServerEndeavorDataFields.color.string(): color.value.toRadixString(16)
    });
  }
}
