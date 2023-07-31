import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_service/src/server_endeavor/model_extension/server_endeavor_database_fields.dart';
import 'package:server_data_models/server_data_models.dart';
import 'package:flutter/material.dart';

extension FirestoreServerEndeavorExtension on ServerEndeavor {
  static ServerEndeavor fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    final docSnapData = docSnap.data();
    if (docSnapData == null) throw Exception("No endeavor document data");

    // get subEndeavorIds out of document
    final subEndeavorIdData =
        docSnapData[ServerEndeavorDataFields.subEndeavorIds.string()];
    List<String> subEndeavorIds;
    if (subEndeavorIdData == null) {
      subEndeavorIds = [];
    } else {
      subEndeavorIds =
          (subEndeavorIdData as List).map((e) => e as String).toList();
    }

    // get taskIds out of document
    final taskIdData = docSnapData[ServerEndeavorDataFields.taskIds.string()];
    List<String> taskIds;
    if (taskIdData == null) {
      taskIds = [];
    } else {
      taskIds = (taskIdData as List).map((e) => e as String).toList();
    }

    // get color out of the document
    final colorData = docSnapData[ServerEndeavorDataFields.color.string()];
    Color? color;
    if (colorData != null) {
      color = Color(int.parse(colorData, radix: 16));
    }

    return ServerEndeavor(
      id: docSnap.id,
      title: docSnapData[ServerEndeavorDataFields.title.string()],
      subEndeavorIds: subEndeavorIds,
      taskIds: taskIds,
      parentEndeavorId:
          docSnapData[ServerEndeavorDataFields.parentEndeavorId.string()],
      color: color,
    );
  }

  Map<String, dynamic> toData() {
    return {
      ServerEndeavorDataFields.title.string(): title,
      ServerEndeavorDataFields.subEndeavorIds.string(): subEndeavorIds,
      ServerEndeavorDataFields.parentEndeavorId.string(): parentEndeavorId,
      ServerEndeavorDataFields.taskIds.string(): taskIds,
      ServerEndeavorDataFields.color.string(): color?.value.toRadixString(16),
    };
  }
}
