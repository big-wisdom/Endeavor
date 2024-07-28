import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:grpc_data_service/grpc_data_service.dart';

class TasksDataService {
  Stream<QueryState<List<Task>>> get tasksStream =>
      GRPCDataService.instance.tasks.stream;

  void createTask(UnidentifiedTask task) {
    GRPCDataService.instance.tasks.create(task);
  }

  void deleteTask(TaskReference taskReference) {
    GRPCDataService.instance.tasks.delete(taskReference.id);
  }

  void updateTask(UnidentifiedTask unidentifiedTask, int id) {
    // TasksDataServiceExtension.updateTask(unidentifiedTask, id);
  }
}
