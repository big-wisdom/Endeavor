import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  DataService(String userId) {
    _userDataDoc = FirebaseFirestore.instance.collection('users').doc(userId);
  }

  static DocumentReference<Map<String, dynamic>>? _userDataDoc;
  static DocumentReference<Map<String, dynamic>> get userDataDoc {
    _checkUserDoc();
    return _userDataDoc!;
  }

  static void _checkUserDoc() {
    if (_userDataDoc == null) throw Exception("Yo, no user");
  }
}
