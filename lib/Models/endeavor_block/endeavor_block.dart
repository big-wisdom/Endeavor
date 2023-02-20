import 'package:cloud_firestore/cloud_firestore.dart';

abstract class EndeavorBlock {
  String? id;
  String? endeavorId;
  EndeavorBlockType? type;

  EndeavorBlock({this.id, this.type, this.endeavorId});

  EndeavorBlock.fromDocSnap(
      QueryDocumentSnapshot<Map<String, dynamic>> docSnap);

  bool validate();
}

enum EndeavorBlockType { single, repeating }
