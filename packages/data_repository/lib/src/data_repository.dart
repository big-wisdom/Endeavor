import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:server_data_models/server_data_models.dart';

class DataRepository {
  // User stuff
  Stream<User> _userStream;
  late StreamSubscription<User> _userStreamSubscription;
  User _user = User.empty;

  ////// DataService streams
  final Stream<UserDocument> _userDocStream = Stream.empty();
  final Stream<List<ServerEndeavor>> _serverEndeavorsStream = Stream.empty();
  final Stream<List<ServerTask>> _serverTasksStream = Stream.empty();
  final Stream<ServerCalendarEvent> _serverCalendarEventsStream =
      Stream.empty();
  final Stream<ServerEndeavorBlock> _serverEndeavorBlocksStream =
      Stream.empty();

  ////// UI Streams
  // endeavors screen
  Stream<List<Endeavor>> get orderedPrimaryEndeavorsStream =>
      CombineLatestStream.combine3(_userDocStream, _serverEndeavorsStream,
          _serverTasksStream, (a, b, c) => _getPrimaryEndeavors(a, b, c));

  List<Endeavor> _getPrimaryEndeavors(
    UserDocument userDoc,
    List<ServerEndeavor> serverEndeavors,
    List<ServerTask> serverTasks,
  ) {
    // bin tasks
    Map<String, List<TaskReference>> idToTasks = {};
    for (final t in serverTasks) {
      if (t.endeavorId != null) {
        final ref = TaskReference(id: t.id, title: t.title);
        if (idToTasks[t.endeavorId] == null) {
          idToTasks[t.endeavorId!] = [ref];
        } else {
          idToTasks[t.endeavorId!]!.add(ref);
        }
      }
    }

    // bin server endeavors
    List<ServerEndeavor> primaryServerEndeavors = [];
    Map<String, List<EndeavorReference>> idToSubEndeavorReferences = {};
    for (final e in serverEndeavors) {
      if (e.parentEndeavorId == null) {
        primaryServerEndeavors.add(e);
      } else {
        final ref = EndeavorReference(title: e.title, id: e.id);
        if (idToSubEndeavorReferences[e.parentEndeavorId!] == null) {
          idToSubEndeavorReferences[e.parentEndeavorId!] = [ref];
        } else {
          idToSubEndeavorReferences[e.parentEndeavorId!]!.add(ref);
        }
      }
    }

    // Create primary endeavors
    List<Endeavor> primaryEndeavors = [];
    for (final e in primaryServerEndeavors) {
      primaryEndeavors.add(
        Endeavor(
          id: e.id,
          title: e.title,
          parentEndeavorId: e.parentEndeavorId,
          subEndeavorReferences: idToSubEndeavorReferences[e.id] ?? [],
          taskReferences: idToTasks[e.id] ?? [],
          color: e.color,
        ),
      );
    }

    // sort primary endeavors based on user document
    primaryEndeavors.sort((e1, e2) {
      final index1 = userDoc.primaryEndeavorIds.indexOf(e1.id);
      final index2 = userDoc.primaryEndeavorIds.indexOf(e2.id);

      if (index1 == -1 && index2 == -1) {
        return 0;
      } else if (index1 == -1) {
        return 1;
      } else if (index2 == -1) {
        return -1;
      } else {
        return index1.compareTo(index2);
      }
    });
    return primaryEndeavors;
  }

  // endeavor screen
  Stream<Endeavor> getEndeavorStream(EndeavorReference endeavorRef) =>
      Stream.empty();

  // Tasks screen
  Stream<TreeOfLife> treeOfLifeStream = Stream.empty();
  // Task screen
  Stream<ServerTask> getTaskStream() => throw UnimplementedError();
  // Calendar screen
  Stream<CalendarEvent> calendarEventStream = Stream.empty();
  Stream<EndeavorBlock> endeavorBlockStream = Stream.empty();

  // INITIALIZATION
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

  // FIRESTORE
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
