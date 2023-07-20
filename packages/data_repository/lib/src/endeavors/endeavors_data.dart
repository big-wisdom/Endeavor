import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:data_repository/data_repository.dart';
import 'package:rxdart/rxdart.dart';

extension EndeavorsData on DataRepository {
  Stream<List<String>> _orderedPrimaryEndeavorIdsStream() {
    if (firestore == null) throw Exception("No user dogg");
    return firestore!.snapshots().map<List<String>>(
      (userDocSnap) {
        final docSnapData = userDocSnap.data();
        if (docSnapData != null && docSnapData['primaryEndeavorIds'] != null) {
          return (docSnapData['primaryEndeavorIds'] as List)
              .map((e) => e as String)
              .toList();
        }
        return [];
      },
    );
  }

  Stream<TreeOfLife> treeOfLifeStream() {
    if (firestore == null) throw Exception("No user, don't call this yo");

    return CombineLatestStream.combine2(
      _orderedPrimaryEndeavorIdsStream(),
      firestore!
          .collection('endeavors')
          .snapshots()
          .transform(EndeavorFirestoreExtension.querySnapToEndeavorTransformer),
      (
        orderedPrimaryEndeavorIds,
        endeavors,
      ) =>
          _createTreeOfLife(orderedPrimaryEndeavorIds, endeavors),
    );
  }

  TreeOfLife _createTreeOfLife(
    List<String> orderedPrimaryEndeavorIds,
    List<Endeavor> endeavors,
  ) {
    if (firestore == null) throw Exception("No user silly");

    return TreeOfLife.fromEndeavorsList(orderedPrimaryEndeavorIds, endeavors);
  }

  // List<Endeavor> _createTreeOfLife(
  //   List<String> orderedPrimaryEndeavorIds,
  //   List<Task> tasks,
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> endeavorDocSnapList,
  // ) {

  //   // call recursive subtree function on each primary endeavor
  //   final List<Endeavor> treeOfLife = [];
  //   for (final e in primaryEndeavorDocSnaps) {
  //     treeOfLife.add(
  //       _getSubtreeFromDocSnapData(
  //         e,
  //         parentEndeavorIdToData,
  //         endeavorIdToTask,
  //       ),
  //     );
  //   }

  //   // order primary endeavors from orderedPrimaryEndeavorIds
  //   // Note: this will just pile up any not in the orderedPrimaryEndeavorIds
  //   // at the end. I may want to remove them if that becomes a problem
  //   treeOfLife.sort((e1, e2) {
  //     final index1 = orderedPrimaryEndeavorIds.indexOf(e1.id);
  //     final index2 = orderedPrimaryEndeavorIds.indexOf(e2.id);

  //     if (index1 == -1 && index2 == -1) {
  //       return 0;
  //     } else if (index1 == -1) {
  //       return 1;
  //     } else if (index2 == -1) {
  //       return -1;
  //     } else {
  //       return index1.compareTo(index2);
  //     }
  //   });

  //   return treeOfLife;
  // }

  // recursively build the tree of life from some sorted data
  // Endeavor _getSubtreeFromDocSnapData(
  //   QueryDocumentSnapshot<Map<String, dynamic>> docSnap,
  //   Map<String, List<QueryDocumentSnapshot<Map<String, dynamic>>>>
  //       parentIdToData,
  //   Map<String, List<Task>> endeavorIdToTask,
  // ) {
  //   final docSnapData = docSnap.data();
  //   return Endeavor(
  //     id: docSnap.id,
  //     title: docSnapData['title'],
  //     subEndeavors: parentIdToData[docSnap.id]
  //             ?.map(
  //               (subDocSnap) => _getSubtreeFromDocSnapData(
  //                 subDocSnap,
  //                 parentIdToData,
  //                 endeavorIdToTask,
  //               ),
  //             )
  //             .toList() ??
  //         [],
  //     tasks: endeavorIdToTask[docSnap.id] ?? [],
  //     color: docSnapData['color'],
  //   );
  // }

  Future<TreeOfLife> getEndeavorsTreeOfLife() async {
    if (firestore == null)
      throw Exception("Don't even try this without a user ,homie");

    return treeOfLifeStream().first;
  }

  void planEndeavor(Endeavor endeavor) async {
    if (firestore == null)
      throw Exception("No user?! Unthinkable! No Plan for you!");

    // call firebase plan cloud function on this endeavor
    HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('planEndeavor');
    await callable.call(<String, dynamic>{
      'userId': firestore!.id,
      'endeavorId': endeavor.id,
    });
  }

  Future<String> getEndeavorTitle() {
    throw UnimplementedError();
  }

  // Future<List<Task>> getEndeavorTasks(Endeavor endeavor) async {
  //   if (firestore == null) throw Exception("No user?! Unthinkable!");

  //   // query tasks for tasks with id in endeavor task ids
  //   final tasks = (await firestore!
  //           .collection('tasks')
  //           .where(FieldPath.documentId, arrayContains: endeavor.taskIds)
  //           .get())
  //       .docs
  //       .map((docSnap) =>
  //           TaskFirestoreExtension.fromDocData(docSnap.id, docSnap.data()))
  //       .toList();

  //   // sort tasks to be in the same order as the the task ids
  //   tasks.sort((a, b) => endeavor.taskIds!
  //       .indexOf(a.id!)
  //       .compareTo(endeavor.taskIds!.indexOf(b.id!)));

  //   return tasks;
  // }

  Stream<Endeavor> endeavorStreamFromReference(
    EndeavorReference endeavorReference,
  ) {
    if (firestore == null) throw Exception("There's no user bruh");

    return firestore!
        .collection('endeavors')
        .doc(endeavorReference.id)
        .snapshots()
        .transform(EndeavorFirestoreExtension.docSnapToEndeavorTransformer);
  }

  Stream<List<Endeavor>> primaryEndeavorStream() {
    if (firestore == null) throw Exception("No user bruh");

    return firestore!
        .collection('endeavors')
        .snapshots()
        .transform<List<Endeavor>>(
          EndeavorFirestoreExtension.querySnapToPrimaryEndeavorsTransformer,
        );
  }

  void deleteTask(TaskReference taskReference) {
    if (firestore == null)
      throw Exception("No shoes, no shirt, no user, no service.");

    // Delete task document
    firestore!.collection('tasks').doc(taskReference.id).delete();

    // Delete task from endeavor list if necessary
    if (taskReference.endeavorId != null) {
      FirebaseFirestore.instance.runTransaction(
        (t) async {
          // get endeavor document
          final endeavorDoc = await t.get(
              firestore!.collection('endeavors').doc(taskReference.endeavorId));
          // get current list
          final currentList = (endeavorDoc.data()!['taskIds'] as List)
              .map((taskId) => taskId as String)
              .toList(); // doc should have data

          // remove this tasks id from the list
          currentList.remove(taskReference.id);

          // update the list
          t.update(endeavorDoc.reference, {"taskIds": currentList});
        },
      );
    }
  }

  void reorderEndeavorTasks(
      Endeavor endeavor, int oldIndex, int newIndex) async {
    if (firestore == null) throw Exception("No User?! No way!");

    final taskIds =
        ((await firestore!.collection('endeavors').doc(endeavor.id).get())
                .data()?['taskIds'] as List)
            .map((taskId) => taskId as String)
            .toList();
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    // remove the item from its present index
    final String itemToMove = taskIds.removeAt(oldIndex);

    // insert it at the new index
    taskIds.insert(newIndex, itemToMove);

    firestore!
        .collection('endeavors')
        .doc(endeavor.id)
        .update({'taskIds': taskIds});
  }

  Stream<List<EndeavorDatabaseDocument>> allEndeavorsStream() {
    if (firestore == null) throw Exception("No user user user user user");

    return firestore!.collection('endeavors').snapshots().transform(
        EndeavorDatabaseDocumentFirestoreExtension
            .endeavorDatabaseDocumentTransformer);
  }

  // Stream<List<Endeavor>> subEndeavorStream(Endeavor endeavor) {
  //   if (firestore == null) {
  //     throw Exception("No user!?");
  //   }

  //   return firestore!
  //       .collection('endeavors')
  //       .where('parentEndeavorId', isEqualTo: endeavor.id)
  //       .snapshots()
  //       .map(
  //         (querySnap) => querySnap.docs
  //             .map(
  //               (docSnap) => EndeavorFirestoreExtension.fromDocData(
  //                 id: endeavor.id,
  //                 data: docSnap.data(),
  //               ),
  //             )
  //             .toList(),
  //       );
  // }

  // Stream<Endeavor> endeavorStream(Endeavor endeavor) {
  //   if (firestore != null) {
  //     return firestore!
  //         .collection('endeavors')
  //         .doc(endeavor.id)
  //         .snapshots()
  //         .map((docSnap) {
  //       if (docSnap.data() != null) {
  //         return EndeavorFirestoreExtension.fromDocData(
  //             id: docSnap.id, data: docSnap.data()!);
  //       } else {
  //         throw Exception("No Data!");
  //       }
  //     });
  //   } else {
  //     throw Exception("No user! Can't get data");
  //   }
  // }

  // Stream<List<Endeavor>> primaryEndeavorStream() async* {
  //   if (firestore == null) {
  //     throw Exception("No user dawg! go get one then we will talk");
  //   }

  //   final userDocStream = firestore!.snapshots();
  //   await for (var doc in userDocStream) {
  //     final docData = doc.data()?['primaryEndeavorIds'];
  //     if (docData != null) {
  //       final primaryEndeavorIds = (docData as List).map((e) => e as String);
  //       if (primaryEndeavorIds.isNotEmpty) {
  //         final querySnap = await firestore!
  //             .collection('endeavors')
  //             .where(FieldPath.documentId, whereIn: primaryEndeavorIds)
  //             .get();
  //         yield querySnap.docs
  //             .map((endeavorDocSnap) => EndeavorFirestoreExtension.fromDocData(
  //                 id: endeavorDocSnap.id, data: endeavorDocSnap.data()))
  //             .toList();
  //       } else {
  //         yield [];
  //       }
  //     } else {
  //       yield [];
  //     }
  //   }
  // }

  void addSubEndeavor({
    required Endeavor parentEndeavor,
    required String endeavorTitle,
  }) async {
    if (firestore == null)
      throw Exception("no use dummy. Dumby? Dummby?. No user idiot!");

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // get parent document data
      final parentDocSnapData = (await transaction
              .get(firestore!.collection('endeavors').doc(parentEndeavor.id)))
          .data();
      // create new endeavor doc
      final newEndeavorDoc = firestore!.collection('endeavors').doc();
      transaction.set(newEndeavorDoc, {
        "title": endeavorTitle,
        "parentEndeavorId": parentEndeavor.id,
      });
      // create reference to new endeavor doc in parent doc
      if (parentDocSnapData != null) {
        var subEndeavorsIdList;
        if (parentDocSnapData['subEndeavorReferences'] == null) {
          subEndeavorsIdList = [
            {
              "id": newEndeavorDoc.id,
              "title": endeavorTitle,
            }
          ];
        } else {
          subEndeavorsIdList =
              (parentDocSnapData['subEndeavorReferences'] as List)
                  .map((e) => e as Map<String, dynamic>)
                  .toList();
          subEndeavorsIdList.add({
            "id": newEndeavorDoc.id,
            "title": endeavorTitle,
          });
        }
        transaction.update(
          firestore!.collection('endeavors').doc(parentEndeavor.id),
          {'subEndeavorReferences': subEndeavorsIdList},
        );
      } else {
        throw Exception("provlem with the document");
      }
    });
  }

  void createPrimaryEndeavor(String endeavorTitle) async {
    if (firestore == null) {
      throw Exception("No user! Can't create endeavor.");
    }
    // Create endeavor document
    final endeavorDocRef =
        await firestore!.collection("endeavors").add({'title': endeavorTitle});
    await firestore!.collection('settings').doc(endeavorDocRef.id).set({});

    /// Reference it under primary endeavors in the user doc
    // get user doc
    final userDocSnap = await firestore!.get();
    // get current list
    final docData = userDocSnap.data()!;
    var primaryEndeavorIds = docData['primaryEndeavorIds'];
    Map<String, dynamic> newData;
    if (primaryEndeavorIds == null) {
      // if no list create one with one entry
      newData = {
        "primaryEndeavorIds": [endeavorDocRef.id]
      };
    } else {
      // if there is a list update it locally then on firebase
      primaryEndeavorIds =
          (primaryEndeavorIds as List).map((id) => id as String).toList();
      primaryEndeavorIds.add(endeavorDocRef.id);
      newData = {
        "primaryEndeavorIds": primaryEndeavorIds,
      };
    }
    firestore!.update(newData);
  }

  void updateEndeavor(Endeavor endeavor) async {
    if (firestore == null) {
      throw Exception("No user! Can't update endeavor.");
    }

    await firestore
        ?.collection("endeavors")
        .doc(endeavor.id)
        .update(endeavor.toData());
  }

  void deleteSubEndeavorFromReference(EndeavorReference endeavorReference) {
    if (firestore == null) throw Exception("User is empty empty empty");

    // delete the document itself, and the cloud functions will pick up the rest
    firestore!.collection('endeavors').doc(endeavorReference.id).delete();
  }

  Future<bool> deletePrimaryEndeavor(Endeavor endeavor) {
    if (firestore == null) {
      throw Exception("No user, dummy!");
    }

    return FirebaseFirestore.instance.runTransaction<bool>((transaction) async {
      // delete the reference to the endeavor if it is primary
      if (endeavor.parentEndeavorId == null) {
        final userDocData = (await transaction.get(firestore!)).data();
        if (userDocData == null) {
          throw Exception("this was not a primary endeavor!");
        }
        final primaryEndeavorIds = (userDocData['primaryEndeavorIds'] as List)
            .map((e) => e as String)
            .toList();
        if (primaryEndeavorIds.remove(endeavor.id)) {
          transaction
              .update(firestore!, {'primaryEndeavorIds': primaryEndeavorIds});
        } else {
          throw Exception("this was not a primary endeavor!");
        }
      } else {
        throw Exception(
          "This is a non-primary endeavor. This function is constrained by name to primary endeavors",
        );
      }

      // delete the endeavor document itself
      transaction.delete(firestore!.collection("endeavors").doc(endeavor.id));

      return true;
      // all other associated data will be cleaned up by a cloud function
      // that responds when an endeavor is deleted
    });
  }
}
