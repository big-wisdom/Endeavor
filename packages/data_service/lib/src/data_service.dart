import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:authentication_repository/authentication_repository.dart';

class DataService {
  late final StreamSubscription _userStreamSubscription;
  DataService(Stream<User> userStream) {
    _userStreamSubscription = userStream.listen((user) async {
      if (user.isNotEmpty) {
        final docRef =
            FirebaseFirestore.instance.collection('users').doc(user.id);
        if ((await docRef.get()).exists) {
          userDataDoc = docRef;
        }
      }
    });
  }
  static DocumentReference<Map<String, dynamic>>? userDataDoc;

  static void checkUserDoc() {
    if (userDataDoc == null) throw Exception("Yo, no user");
  }

  void close() {
    _userStreamSubscription.cancel();
  }
}
