import 'package:data_repository/data_repository.dart';
import 'dart:async';

extension TasksData on DataRepository {
  Stream<List<Endeavor>> activeTreeOfLife() async* {
    if (firestore == null) throw Exception("No user, don't call this yo");

    await firestore!.collection('tasks').snapshots();
    await firestore!.collection('endeavors').snapshots();
    StreamZip
  }

  List<Endeavor> createTreeOfLife(List<Endeavor> endeavors, List<Task> tasks) {}
}
