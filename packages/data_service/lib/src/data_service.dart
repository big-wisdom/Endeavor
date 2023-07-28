import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:authentication_repository/authentication_repository.dart';

// extension exports
export './user_document/user_document.dart';
export './server_endeavor/server_endeavor.dart';
export './server_task/server_task.dart';

class DataService {
  late final StreamSubscription _userStreamSubscription;
  DataService(Stream<User> userStream) {
    _userStreamSubscription = userStream.listen((user) async {
      if (user.isNotEmpty) {
        final docRef =
            FirebaseFirestore.instance.collection('users').doc(user.id);
        _userDataDoc = docRef;
      }
    });
  }
  static DocumentReference<Map<String, dynamic>>? _userDataDoc;
  static DocumentReference<Map<String, dynamic>> get userDataDoc {
    _checkUserDoc();
    return _userDataDoc!;
  }

  static void _checkUserDoc() {
    if (_userDataDoc == null) throw Exception("Yo, no user");
  }

  void close() {
    _userStreamSubscription.cancel();
  }
}
