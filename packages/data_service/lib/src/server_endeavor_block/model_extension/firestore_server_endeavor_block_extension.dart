import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_service/data_service.dart';
import 'package:server_data_models/server_data_models.dart';

extension FirestoreServerEndeavorBlockExtension on ServerEndeavorBlock {
  static ServerEndeavorBlock fromDocSnap(
      DocumentSnapshot<Map<String, dynamic>> docSnap) {
    final docSnapData = docSnap.data();
    if (docSnapData == null) throw Exception("Endeavor Block data is null!");

    return ServerEndeavorBlock(
      id: docSnap.id,
      endeavorId:
          docSnapData[ServerEndeavorBlockDataFields.endeavorId.string()],
      serverEvent: FirestoreServerEventExtension.fromDocSnapData(
        docSnapData[ServerEndeavorBlockDataFields.serverEvent.string()],
      ),
      repeatingEndeavorBlockId: docSnapData[
          ServerEndeavorBlockDataFields.repeatingEndeavorBlockId.string()],
    );
  }
}
