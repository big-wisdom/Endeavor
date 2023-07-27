import 'package:data_service/data_service.dart';
import 'package:data_service/src/server_task/model_extension/firestore_server_task_extension.dart';
import 'package:server_data_models/server_data_models.dart';

extension ServerTaskDataServiceExtension on DataService {
  static Stream<List<ServerTask>> get tasksStream {
    DataService.checkUserDoc();
    return DataService.userDataDoc!.collection('tasks').snapshots().transform(
          FirestoreServerTaskExtension.querySnapToServerTasksTransformer,
        );
  }

  static Stream<List<ServerTask>> get tasksWithNoEndeavorStream =>
      throw UnimplementedError();
}
