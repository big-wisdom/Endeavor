import 'package:cloud_firestore/cloud_firestore.dart';

class Endeavor {
  String? text;
  String? id;
  List<String>? subEndeavorIds;
  List<Endeavor>? subEndeavors;

  Endeavor({this.text, this.id, this.subEndeavorIds, this.subEndeavors});

  Endeavor.fromDocSnap(QueryDocumentSnapshot<Map<String, dynamic>> docSnap) {
    final data = docSnap.data();
    text = data['text'];
    id = docSnap.id;
    subEndeavorIds = data['subEndeavorIds'] == null
        ? null
        : (data['subEndeavorIds'] as List).map((id) => id as String).toList();
  }

  // takes in a list of all endeavors and adds children to parents recursively
  // Note that this is only for this endeavors sub-tree
  void constructTree(List<Endeavor> endeavors) {
    if (subEndeavorIds == null ||
        subEndeavorIds!.isEmpty ||
        endeavors.isEmpty) {
      return;
    }

    for (var e in endeavors) {
      if (subEndeavorIds!.contains(e.id)) {
        e.constructTree(endeavors);
        if (subEndeavors == null) {
          subEndeavors = [e];
        } else {
          subEndeavors!.add(e);
        }
      }
    }
  }
}
