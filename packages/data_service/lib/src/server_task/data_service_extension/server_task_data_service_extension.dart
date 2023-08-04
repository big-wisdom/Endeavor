import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_models/data_models.dart';
import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_endeavor/model_extension/server_endeavor_database_fields.dart';
import 'package:data_service/src/server_task/model_extension/firestore_server_task_extension.dart';
import 'package:server_data_models/server_data_models.dart';

extension ServerTaskDataServiceExtension on DataService {
  static Stream<List<ServerTask>> get tasksStream =>
      DataService.userDataDoc.collection('tasks').snapshots().transform(
            FirestoreServerTaskExtension.querySnapToServerTasksTransformer,
          );

  static Stream<List<ServerTask>> get tasksWithNoEndeavorStream =>
      throw UnimplementedError();

  static void createTask(Task task) {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      // create task document
      final newTaskDoc = DataService.userDataDoc.collection('tasks').doc();
      transaction.set(
        newTaskDoc,
        ServerTask.fromTask(task).toData(),
      );

      // reference it in its endeavor if necessary
      if (task.endeavorId != null) {
        transaction.update(
          DataService.userDataDoc.collection('endeavors').doc(task.endeavorId),
          {
            ServerEndeavorDataFields.taskIds.string():
                FieldValue.arrayUnion([task.id])
          },
        );
      }
    });
  }
}
