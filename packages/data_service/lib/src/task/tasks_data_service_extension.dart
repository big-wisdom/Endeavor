import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_endeavor/model_extension/server_endeavor_database_fields.dart';
import 'package:data_service/src/task/server_task/firestore_server_task_extension.dart';
import 'package:server_data_models/server_data_models.dart';

extension TasksDataServiceExtension on DataService {
  static Stream<List<ServerTask>> get tasksStream =>
      DataService.userDataDoc.collection('tasks').snapshots().transform(
            FirestoreServerTaskExtension.querySnapToServerTasksTransformer,
          );

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

  static void deleteTask(TaskReference task) {
    throw UnimplementedError();
  }
}
