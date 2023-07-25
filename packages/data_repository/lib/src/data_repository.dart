import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

class DataRepository {
  // User stuff
  Stream<User> _userStream;
  late StreamSubscription<User> _userStreamSubscription;
  User _user = User.empty;

  ////// DataService streams
  final Stream<UserDocument> _userDocStream = Stream.empty();
  final Stream<ServerEndeavor> _serverEndeavorsStream = Stream.empty();
  final Stream<ServerTask> _serverTasksStream = Stream.empty();
  final Stream<ServerCalendarEvent> _serverCalendarEventsStream =
      Stream.empty();
  final Stream<ServerEndeavorBlock> _serverEndeavorBlocksStream =
      Stream.empty();

  ////// UI Streams
  // endeavors screen
  Stream<List<String>> orderedPrimaryEndeavorsStream = Stream.empty();
  Stream<List<Endeavor>> endeavorsStream = Stream.empty();
  // endeavor screen
  Stream<Endeavor> getEndeavorStream() => throw UnimplementedError();

  // Tasks screen
  Stream<TreeOfLife> treeOfLifeStream = Stream.empty();
  // Task screen
  Stream<Task> getTaskStream() => throw UnimplementedError();
  // Calendar screen
  Stream<CalendarEvent> calendarEventStream = Stream.empty();
  Stream<EndeavorBlock> endeavorBlockStream = Stream.empty();

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
