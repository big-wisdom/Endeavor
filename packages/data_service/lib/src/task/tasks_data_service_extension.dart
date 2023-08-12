import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_endeavor/model_extension/server_endeavor_database_fields.dart';
import 'package:data_service/src/task/server_task/firestore_server_task_extension.dart';
import 'package:data_service/src/task/server_task/server_task_database_fields.dart';
import 'package:server_data_models/server_data_models.dart';

extension TasksDataServiceExtension on DataService {
  static Stream<List<ServerTask>> get tasksStream =>
      DataService.userDataDoc.collection('tasks').snapshots().transform(
            FirestoreServerTaskExtension.querySnapToServerTasksTransformer,
          );

  static Stream<List<WeekViewEvent>> get taskWeekViewEventsStream =>
      tasksStream.map((serverTask) => WeekViewEvent.listFromServerTask(
          serverTask: serverTask, backgroundColor: backgroundColor));

  static void createTask(UnidentifiedTask task) {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      // create task document
      final newTaskDoc = DataService.userDataDoc.collection('tasks').doc();
      transaction.set(
        newTaskDoc,
        task.toDocData(),
      );

      // reference it in its endeavor if necessary
      if (task.endeavorReference != null) {
        transaction.update(
          DataService.userDataDoc
              .collection('endeavors')
              .doc(task.endeavorReference!.id),
          {
            ServerEndeavorDataFields.taskIds.string():
                FieldValue.arrayUnion([newTaskDoc.id])
          },
        );
      }
    });
  }

  static void deleteTask(TaskReference taskReference) {
    // Delete task document
    DataService.userDataDoc.collection('tasks').doc(taskReference.id).delete();

    // Delete task from endeavor list if necessary
    if (taskReference.endeavorId != null) {
      FirebaseFirestore.instance.runTransaction(
        (t) async {
          // get endeavor document
          final endeavorDoc = await t.get(DataService.userDataDoc
              .collection('endeavors')
              .doc(taskReference.endeavorId));
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

  static void updateTask(UnidentifiedTask unidentifiedTask, String id) {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      // get current document
      final currentTaskDocData = (await transaction
              .get(DataService.userDataDoc.collection('tasks').doc(id)))
          .data();
      if (currentTaskDocData == null) throw Exception("Task doc data is null");

      //// check if unsafe fields have changed and update them in safe ways

      // endeavorId
      final oldEndeavorId =
          currentTaskDocData[ServerTaskDatabaseFields.endeavorId.string()];
      final newEndeavorId = unidentifiedTask.endeavorReference?.id;
      if (oldEndeavorId != newEndeavorId) {
        // remove old reference if there was one
        if (oldEndeavorId != null) {
          transaction.update(
            DataService.userDataDoc.collection('endeavors').doc(oldEndeavorId!),
            {
              ServerEndeavorDataFields.taskIds.string():
                  FieldValue.arrayRemove([id])
            },
          );
        }
        // create new reference if necessary
        if (newEndeavorId != null) {
          transaction.update(
            DataService.userDataDoc.collection('endeavors').doc(newEndeavorId),
            {
              ServerEndeavorDataFields.taskIds.string():
                  FieldValue.arrayUnion([id])
            },
          );
        }
      }
      transaction.update(DataService.userDataDoc.collection('tasks').doc(id),
          unidentifiedTask.toDocData());
    });
  }
}
