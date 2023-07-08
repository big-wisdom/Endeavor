import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data_repository.dart';

class DataRepository {
  Stream<User> _userStream;
  late StreamSubscription<User> _userStreamSubscription;
  User _user = User.empty;
  StreamController<List<Task>> tasksWithNoEndeavorController =
      StreamController();

  DataRepository({required Stream<User> userStream})
      : _userStream = userStream {
    _userStreamSubscription = _userStream.listen((newUser) {
      _user = newUser;
      // create a new user document if it doesn't already exist
      firestore?.get().then((value) {
        if (!value.exists && firestore != null) {
          firestore!.set({});
        }
      });
    });
  }

  /// get the document reference for the current user. If there is no user, return null
  DocumentReference<Map<String, dynamic>>? get firestore {
    if (_user.isNotEmpty) {
      return FirebaseFirestore.instance.collection("users").doc(_user.id);
    } else {
      return null;
    }
  }

  void close() {
    _userStreamSubscription.cancel();
  }
}
