import 'package:data_repository/data_repository.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

extension TasksData on DataRepository {
  Stream<List<Task>> get tasksWithNoEndeavor {
    return tasksWithNoEndeavorController.stream;
  }

  Stream<List<Endeavor>> activeTreeOfLife() {
    if (firestore == null) throw Exception("No user, don't call this yo");

    return CombineLatestStream.combine2(
      firestore!.collection('tasks').snapshots().map<List<Task>>(
            (querySnap) => querySnap.docs
                .map(
                  (docSnap) => Task.fromDocData(
                    docSnap.id,
                    docSnap.data(),
                  ),
                )
                .toList(),
          ),
      firestore!.collection('endeavors').snapshots().map<List<Endeavor>>(
            (querySnap) => querySnap.docs
                .map(
                  (docSnap) => Endeavor.fromDocData(
                    id: docSnap.id,
                    data: docSnap.data(),
                  ),
                )
                .toList(),
          ),
      (tasks, endeavors) => _createTreeOfLife(tasks, endeavors),
    );
  }

  List<Endeavor> _createTreeOfLife(
    List<Task> tasks,
    List<Endeavor> endeavors,
  ) {
    List<Endeavor> workingTree = [];

    // put tasks into a dictionary by endeavorId
    Map<String, List<Task>> taskMap = {};
    List<Task> endeavorlessTasks = [];
    for (final task in tasks) {
      if (task.endeavorId != null) {
        if (taskMap[task.endeavorId!] != null) {
          taskMap[task.endeavorId!]!.add(task);
        } else {
          taskMap[task.endeavorId!] = [task];
        }
      } else {
        endeavorlessTasks.add(task);
      }
    }
    tasksWithNoEndeavorController.sink.add(endeavorlessTasks);

    // go through and add each endeavor to a dictionary by it's parent endeavor.
    //If no parent, add it straight to working tree
    // tac on tasks along the way
    Map<String, List<Endeavor>> parentEndeavorMap = {};
    for (final endeavor in endeavors) {
      // copy on any tasks it has
      final endeavorCopy = taskMap[endeavor.id] == null
          ? endeavor
          : endeavor.copyWith(tasks: taskMap[endeavor.id]);

      if (endeavorCopy.parentEndeavorId != null) {
        if (parentEndeavorMap[endeavorCopy.parentEndeavorId!] != null) {
          parentEndeavorMap[endeavorCopy.parentEndeavorId!]!.add(endeavorCopy);
        } else {
          parentEndeavorMap[endeavorCopy.parentEndeavorId!] = [endeavorCopy];
        }
      } else {
        workingTree.add(endeavorCopy);
      }
    }

    // Starting from the primary endeavors, construct the tree
    List<Endeavor> finalTree = [];
    for (final endeavor in workingTree) {
      finalTree.add(_recursiveConstructTree(endeavor, parentEndeavorMap));
    }
    return finalTree;
  }

  /// Construct tree from the leaves up so that the objects can all be const
  Endeavor _recursiveConstructTree(
    Endeavor treeNode,
    Map<String, List<Endeavor>> parentEndeavorMap,
  ) {
    if (parentEndeavorMap[treeNode.id] != null) {
      // make list of subEndeavors
      final subEndeavors = parentEndeavorMap[treeNode.id]!
          .map(
            (e) => _recursiveConstructTree(treeNode, parentEndeavorMap),
          )
          .toList();
      return treeNode.copyWith(subEndeavors: subEndeavors);
    } else {
      return treeNode;
    }
  }
}
