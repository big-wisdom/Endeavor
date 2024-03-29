import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:data_service/data_service.dart';

class DataRepository {
  // User stuff
  Stream<User> _userStream;
  late StreamSubscription<User> _userStreamSubscription;
  User _user = User.empty;

  ////// UI Streams
  // endeavors screen
  Stream<List<Endeavor>> get orderedPrimaryEndeavorsStream {
    return CombineLatestStream.combine3(
      UserDocumentDataServiceExtension.userDocStream,
      ServerEndeavorDataServiceExtension.serverEndeavorsStream,
      TasksDataServiceExtension.tasksStream,
      (userDoc, serverEndeavors, serverTasks) =>
          EndeavorTransformers.primaryEndeavors(
        userDoc,
        serverEndeavors,
        serverTasks,
      ),
    );
  }

  // endeavor screen
  Stream<Endeavor> getEndeavorStream(String endeavorId) {
    return CombineLatestStream.combine2(
      ServerEndeavorDataServiceExtension.serverEndeavorsStream,
      TasksDataServiceExtension.tasksStream,
      (a, b) =>
          EndeavorTransformers.endeavorFromEndeavorsAndTasks(endeavorId, a, b),
    );
  }

  // Tasks screen
  Stream<TreeOfLife> get activeTreeOfLifeStream {
    return CombineLatestStream.combine3(
      UserDocumentDataServiceExtension.userDocStream,
      ServerEndeavorDataServiceExtension.serverEndeavorsStream,
      TasksDataServiceExtension.tasksStream,
      (a, b, c) => TreeOfLifeTransformers.activeTreeFromIngredients(a, b, c),
    );
  }

  Stream<TreeOfLife> get treeOfLifeStream {
    return CombineLatestStream.combine3(
      UserDocumentDataServiceExtension.userDocStream,
      ServerEndeavorDataServiceExtension.serverEndeavorsStream,
      TasksDataServiceExtension.tasksStream,
      (a, b, c) => TreeOfLifeTransformers.fromIngredients(a, b, c),
    );
  }

  Stream<List<Task>> get endeavorlessTasksStream =>
      CombineLatestStream.combine2(
        TasksDataServiceExtension.tasksStream,
        ServerEndeavorDataServiceExtension.serverEndeavorsStream,
        (a, b) => TaskTransformers.taskListFromIngredients(a, b),
      );

  // Task screen
  Stream<Task> getTaskStream(String taskId) => CombineLatestStream.combine2(
      ServerEndeavorDataServiceExtension.serverEndeavorsStream,
      TasksDataServiceExtension.tasksStream,
      (a, b) => TasksDataRepositoryExtension.taskFromStreams(a, b, taskId));

  // Calendar screen
  // Stream<CalendarEvent> get calendarEventStream => throw UnimplementedError();
  // Stream<EndeavorBlock> get endeavorBlockStream => throw UnimplementedError();

  Stream<List<WeekViewEvent>> get weekViewEventStream =>
      CombineLatestStream.combine4(
        TasksDataServiceExtension.tasksStream,
        ServerEndeavorBlockDataServiceExtension.serverEndeavorBlockStream,
        ServerEndeavorDataServiceExtension.serverEndeavorsStream,
        ServerCalendarEventDataServiceExtension.calendarEventStream,
        (serverTasks, serverEndeavorBlocks, serverEndeavors, calendarEvents) =>
            WeekViewEventTransformers.weekViewEventsFromIngredients(
          serverTasks,
          serverEndeavorBlocks,
          serverEndeavors,
          calendarEvents,
        ),
      );

  // INITIALIZATION
  DataRepository({required Stream<User> userStream})
      : _userStream = userStream {
    _userStreamSubscription = _userStream.listen((newUser) {
      _user = newUser;
      // create a new user document if it doesn't already exist
      firestore?.get().then((value) {
        if (!value.exists && firestore != null) {
          firestore!.set(
            {
              UserDocumentDatabaseFields.primaryEndeavorIds.string(): [],
            },
          );
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
