import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

extension EndeavorsData on DataRepository {
  Stream<List<Endeavor>> primaryEndeavorStream() async* {
    if (firestore != null) {
      final userDocSnap = await firestore!.get();
      final docSnapData = userDocSnap.data();
      if (docSnapData != null) {
        final primaryEndeavorIds = (docSnapData['primaryEndeavorIds'] as List)
            .map((primaryEndeavorId) => primaryEndeavorId as String);
        final primaryEndeavorsStream = await firestore!
            .collection('endeavors')
            .where(FieldPath.documentId, whereIn: primaryEndeavorIds)
            .snapshots()
            .map<List<Endeavor>>((querySnap) {
          return querySnap.docs.map((docSnap) {
            return Endeavor.fromDocData(id: docSnap.id, data: docSnap.data());
          }).toList();
        });
        yield* primaryEndeavorsStream;
      }
    }
  }

  void deleteEndeavor(Endeavor endeavor) {
    // get doc ref
    firestore?.collection('endeavors').doc(endeavor.id).delete();
  }
}
