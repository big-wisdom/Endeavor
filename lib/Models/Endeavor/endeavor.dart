import 'package:cloud_firestore/cloud_firestore.dart';

class Endeavor {
  String? text;
  String? id;
  List<String>? subEndeavorIds;

  Endeavor({this.text, this.id, this.subEndeavorIds});

  Endeavor.fromDocSnap(QueryDocumentSnapshot<Map<String, dynamic>> docSnap) {
    final data = docSnap.data();
    text = data['text'];
    id = docSnap.id;
    subEndeavorIds = data['subEndeavorIds'] == null
        ? null
        : (data['subEndeavorIds'] as List).map((id) => id as String).toList();
  }
}
